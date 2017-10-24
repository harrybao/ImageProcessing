use wintex go
create view gyl_cg_gysksd_V
as ---供应商客诉表报表
select c.vdr_name,a.rq,a.zbr,d.pm,b.* from gyl_cg_gysksd a 
left join gyl_cg_gysksdD b on a.ksdbh=b.ksdbh  --供应商客诉单
left join Ebasic_bvdr c on a.pbs=c.vdr_no --供应商资料表
left join gyl_jczl_cpzlb d on b.cpbh=d.dm --产品资料表
go
----客诉明细视图
create view gyl_cg_ksmx_V
as
select a.*,b.cus_name,c.pm as cpmc,d.ys as color from 
gyl_yw_kscld a left join  Ebasic_bcus b  --客户资料表
on a.kh=b.cus_no left join gyl_jczl_cpzlb c  --产品资料表
on a.pm=c.dm left join gyl_yw_dstzdD d  --颜色关联表
on a.ys=d.sh
go

-----发货进度跟踪表
create view gyl_wl_fhjdgzd_V
as 
select a.djrq,c.cus_name,e.dwqc,
d.address+'/'+d.enterpriser+'/'+d.tel as detial,
f.wldh,f.wldh2,f.djbh, b.* from gyl_wl_hyjjd a  --货运交接单
left join gyl_wl_hyjjdD b on a.jjbh=b.jjbh --货运交接单细档
left join Ebasic_bcus  c on a.khbh=c.cus_no --客户资料表
left join Crm_Cusdetails d on a.khbh= d.cus_no --客户资料细档
left join gyl_gydj_jgchwlxx e on a.wtyh=e.bh --加工厂/物流公司资料表
left join gyl_ck_hwjyd  f on b.ddh=f.ddh  --货物交运单
go

------物流对账单
create view gyl_wl_wldzd_V
as 
select a.djrq,c.cus_name,d.address+'/'+d.enterpriser+'/'+d.tel as detail, 
b.* ,b.sl*b.dj as yf,b.fyhj/b.sl as cb  from gyl_wl_hyjjd a --货运交接单
left join gyl_wl_hyjjdD b on a.jjbh=b.jjbh --货运交接单细档
left join Ebasic_bcus c on a.khbh=c.cus_no --客户资料表
left join Crm_Cusdetails d on a.khbh=d.cus_no --客户资料细档
 go

-------成品检验对比表
create view gyl_pz_cpjydbb_V
as
select e.cus_name,f.pm, '' as tm,'' as bl,a.*,b.ym,(case b.dj when '01' then b.jyms end)[adj],
(case b.dj when '02' then b.jyms end)[bdj],d.jgc from gyl_pz_cpwgjyb a ---成品外观检验表
left join gyl_pz_cpwgjybD b on a.djbh=b.djbh ---成品外观检验表细档
left join gyl_sg_sctpdD  c on a.gh=c.gh    ---生产投胚单细档
left join gyl_sg_sctpd d on c.djbh=d.djbh --生产投胚单
left join Ebasic_bcus e on a.khbh=e.cus_no  --客户资料表
left join gyl_jczl_cpzlb  f on a.cpbh =f.dm  --产品资料表
go
------品保重大异常跟踪报表视图
create view gyl_pz_pbzdycgz_V
as 
select * from gyl_pz_pbzdyczz ----品保重大异常追踪表
go
---胚布追踪报表
alter view gyl_sg_pbzzbb_V
as 
select i.jhrq, a.sqrq,c.djrq,b.*,j.pm,d.ph,d.shsl,a.gysbh,a.ddh,
e.vdr_name,'' as pdyl,'' as pbzt,'' as jhrc,c.bz,
f.sl as rckc from gyl_cg_pbcgsq a    --胚布采购申请单
left join gyl_cg_pbcgsqD b on a.sqbh=b.sqbh --胚布采购申请单细档
left join gyl_ck_cgshrkd c on a.ddh=c.ddh --采购收货入库单
left join gyl_ck_cgshrkdD d on c.djbh=d.djbh --采购收货入库单细档
left join Ebasic_bvdr  e on a.gysbh=e.vdr_no --供应商资料表
left join gyl_ck_kcb  f on a.ddh=f.ddh  --库存表
left join gyl_yw_scdd  i on a.ddh=i.djbh  --生产订单
left join gyl_jczl_cpzlb j on b.cpbh=j.dm --产品资料表
go

----生产订单明细
alter view gyl_sg_scddmx_V
as
select a.djbh, a.dm,a.jhrq,a.khbh,a.khdh,a.khpm,a.jgb,'' as qrrq,
a.jgdw1,b.sh,f.ys,c.djrq,b.ddsl,d.djrq as kkrq,e.jcph,e.gh,e.tpsl,
(case g.dengj when 'A'then g.sl end) [ajsl],(case  when g.dengj!='A'then g.sl end)[cpsl],'' as btgs,
i.fydh ,case when k.sh =(select sh from gyl_sg_sctpdD where djbh 
=(select djbh from gyl_sg_sctpd where djbh=j.tpdh)) then '是'
 else '否' end as sfzz from gyl_yw_scdd a  --生产订单
left join gyl_yw_scddD b on a.djbh=b.djbh  --生产订单细档
left join gyl_ck_hwjyd c on a.ddh=c.ddh  --货物交运单
left join gyl_sg_sctpd  d on a.djbh=d.scdh  --生产投胚单
left join gyl_sg_sctpdD e on d.djbh=e.djbh --生产投胚单细档
left join gyl_yw_dstzdD f on b.sh=f.sh  --打色通知单细档
left join gyl_ck_kcb g on a.djbh=g.ddh  --库存表
left join gyl_pz_zlycfyd  i on a.djbh=i.ddh  --质量异常反应单
left join gyl_ck_wwshrkd j on a.djbh=j.tpdh --委外收货入库单
left join gyl_ck_wwshrkdD k on j.djbh=k.djbh --委外收货入库单细档
go

-----订单进度月份汇总表
create view gyl_sg_ddjdyfhz_V
as
select a.dm,a.jhrq,'' as qrrq,c.djrq,a.khbh,a.khdh,a.khpm,b.sh,h.ys,
a.jgb,a.jgdw1,b.ddsl,d.djrq as kkrq,e.ph,e.gh,e.tpsl,f.jhq,g.djrq as rccprq,
case when g.djrq-f.jhq>0 then '延误'else '未延误'end as sfyw,
g.cps,g.sl,b.bz  from gyl_yw_scdd a  --生产订单
left join gyl_yw_scddD b on a.djbh=b.djbh --生产订单细档
left join gyl_ck_hwjyd  c on a.ddh=c.ddh --货物交运单
left join gyl_sg_sctpd d on a.djbh=d.scdh  --生产投胚单
left join gyl_sg_sctpdD e on d.djbh=e.djbh --生产投胚单细档
left join gyl_yw_xshtD f on a.hth=f.hth   --销售合同单细档
left join gyl_sg_rzjgyqqrd g on a.hth=g.htbh --染整加工单
left join gyl_yw_dstzdD h on b.sh=h.sh   --打色通知细档
go
----染厂胚布明细表
create view gyl_sg_rcpbmxb_V
as
select a.djrq,b.ph,b.cpbh,c.pm,b.shsl,a.bz from gyl_ck_cgshrkd a --采购收货入库单
left join gyl_ck_cgshrkdD b on a.djbh=b.djbh  --采购收货入库单细档
left join gyl_jczl_cpzlb c on b.cpbh=c.dm  --产品资料表
go

----标准实际工序耗用时间表
alter view gyl_sg_bzsjgxhysjb_V
as
select a.zhj1,a.zhj2,a.zhj3,a.zhj4, b.*,c.dept_name, b.hysj1 as sjsj,
 b.hysj1/b.hysj1 as bl from gyl_sg_ddgx a   --标准工序耗用时间信息表
left join gyl_sg_ddgxD b on a.djbh=b.djbh   --标准工序耗用时间信息表细档
left join Ebasic_dept c on b.bmbh=c.dept_no  ---部门信息表
go
-----样品库存表
alter view gyl_kf_ypkcb_V
as
select ROW_NUMBER()over (order by djbh) as xh, a.*,
b.pm,d.ys from gyl_kf_ypbhb a   ---样品信息表
left join gyl_jczl_cpzlb b on a.dm=b.dm  --产品资料表
left join gyl_yw_dstzdD d on a.sh=d.sh --打色通知单细档
go

-----染厂打色情况统计表
alter view gyl_js_rcdstjb_V
as
select c.dwjc,sum(convert(int,a.sktfs)+convert(int,a.rdfs)) as zgs,
sum(case when a.jysj-a.xsyrq=1 then convert(int,a.sktfs)+convert(int,a.rdfs) end)[oneday],
sum(case when a.jysj-a.xsyrq=2 then convert(int,a.sktfs)+convert(int,a.rdfs) end)[twoday],
sum(case when a.jysj-a.xsyrq=3 then convert(int,a.sktfs)+convert(int,a.rdfs)  end)[threeday],
sum(case when a.jysj-a.xsyrq=4 then convert(int,a.sktfs)+convert(int,a.rdfs)  end)[fourday],
sum(case when a.jysj-a.xsyrq=5 then convert(int,a.sktfs)+convert(int,a.rdfs)  end)[fiveday],
sum(case when a.jysj-a.xsyrq=6 then convert(int,a.sktfs)+convert(int,a.rdfs)  end)[sixday],
sum(case when a.jysj-a.xsyrq=7 then convert(int,a.sktfs)+convert(int,a.rdfs)  end)[sevenday],
sum(case when a.jysj-a.xsyrq=8 then convert(int,a.sktfs)+convert(int,a.rdfs)  end)[eightday],
sum(case when a.jysj-a.xsyrq>8 then convert(int,a.sktfs)+convert(int,a.rdfs)  end)[eighttys],
sum(case when d.cdcs=1 then d.dyfs end)[oneccdgs],
sum(case when d.cdcs=1 then d.dyfs end)/sum(convert(int,a.sktfs)+convert(int,a.rdfs)) as yccdl,
sum(case when d.cdcs=2 then d.dyfs end)[twoccdgs],
sum(case when d.cdcs=2 then d.dyfs end)/sum(convert(int,a.sktfs)+convert(int,a.rdfs)) as lccdl,
sum(case when d.cdcs=3 then d.dyfs end)[threeccdgs],
sum(case when d.cdcs=3 then d.dyfs end)/sum(convert(int,a.sktfs)+convert(int,a.rdfs)) as sccdl,
1-sum (d.dyfs)/sum(convert(int,a.sktfs)+convert(int,a.rdfs)) as yccgl
from gyl_yw_dstzd a  ---打色通知单
left join gyl_yw_ypcdd b on a.dsdh=b.dybh --样品信息表
left join gyl_gydj_jgchwlxx c on a.dygc=c.bh --加工厂/物流资料表
left join gyl_yw_ypcddD d on b.djbh=d.djbh  --样品信息表细档
group by c.dwjc
go
-----业务安排打色个数统计
create view gyl_js_ywydssl_V
as
select a.ywfzr,b.emp_name, sum(convert(int,a.sktfs)+convert(int,a.rdfs)) as zgs 
from gyl_yw_dstzd a  --打色通知单
left join Ebasic_bemp b on a.ywfzr=b.emp_no  --员工信息表
group by a.ywfzr,b.emp_name
go
-----业务安排印花个数统计表
create view gyl_js_ywapyhgs_V
as
select yw ,b.emp_name,count(yhbh) as yhgs,count(dbys) as ysgs from gyl_yw_sgytzd a --手刮样通知单
left join Ebasic_bemp b on a.yw=b.emp_no  ---员工信息表
group by yw,b.emp_name
go

-----库存再利用数量统计表
alter view gyl_sg_kczlysltj_V
as
select a.cpid,cpmc,sum(a.sl) as hz  from gyl_ck_kcb_V a  --库存表
where ddh not in(select ddh from gyl_ck_hwjyd)
and ddh not in(select ddh from gyl_ck_jgfhd)
group by a.cpid,a.cpmc
go

----仓库存放白胚数量统计表
alter view gyl_sg_ckcfbpsltj_V
as
select case when a.ckmc='白胚仓库' then '在仓' end [zc],
b.djrq,b.gysbh,c.vdr_name,'' as df,a.* from gyl_ck_kcb_V a --库存表
left join gyl_ck_cgshrkd b on a.ddh=b.ddh  --采购收货入库单
left join Ebasic_bvdr c on b.gysbh=c.vdr_no  --供应商资料表
go
----仓库每日增加库存数量统计表
alter view gyl_sg_ckmrzjkcsl_V
as
select case when a.ckmc!='' then '在仓' end [zc],'' as ja,
case when a.ckmc like '%胚%' then '色胚' else '成品' end [spcp],
b.djrq,b.gysbh,c.vdr_name,d.jgc,d.djrq as fhrq,e.fhsl,e.fhzs, a.* 
from gyl_ck_kcb_V a --库存表
left join gyl_ck_cgshrkd b on a.ddh=b.ddh --采购收货入库单
left join Ebasic_bvdr c on b.gysbh=c.vdr_no --供应商资料表
left join gyl_ck_jgfhd d on a.ddh=d.ddh  --加工发货表
left join gyl_ck_jgfhdD e on d.djbh=e.djbh --加工发货表细档
go
-----订单进度明细表
alter view gyl_sg_ddjdmibychz_V
as
select a.dm,a.jhrq,'' as qrrq,c.djrq,a.khbh,a.khdh,a.khpm,b.sh,h.ys,
a.jgb,a.jgdw1,b.ddsl,d.djrq as kkrq,e.ph,e.gh,e.tpsl,f.jhq,g.djrq as rccprq,
g.cps,g.sl,i.ycsl,'' as pbcc,'' as xp,''as lz,
'' as tj,''as pg,''as jg,''as cg,'' as qdhg,''as zj,''as cd,''as bz,
j.djrq as chrq,j.bz as scqkbz, '' as ywyy ,'' as ksdh from gyl_yw_scdd a --生产订单
left join gyl_yw_scddD b on a.djbh=b.djbh  --生产订单细档
left join gyl_ck_hwjyd  c on a.ddh=c.ddh  --货物交运单
left join gyl_sg_sctpd d on a.djbh=d.scdh  --生产投胚单
left join gyl_sg_sctpdD e on d.djbh=e.djbh  --生产投胚单细档
left join gyl_yw_xshtD f on a.hth=f.hth  --销售合同细档
left join gyl_sg_rzjgyqqrd g on a.hth=g.htbh --染整加工
left join gyl_yw_dstzdD h on b.sh=h.sh  --打色通知单细档
left join gyl_pz_zlycfyd i on a.djbh=i.ddh --质量异常反应单
left join gyl_ck_jgfhd j  on a.djbh=j.ddh --加工发货单
go

----胚布预占明细
create view gyl_sg_pbyzmx_V
as
select a.dm,a.jhrq,'' as qrrq,c.djrq,a.khbh,a.khdh,a.khpm,b.sh,h.ys,
a.jgb,a.jgdw1,b.ddsl ,b.tpsl ,''as sczq,''as jhjq,
''as jqwa,'' as ywyybz from gyl_yw_scdd a --生产订单 
left join gyl_yw_scddD b on a.djbh=b.djbh  --生产订单细档
left join gyl_ck_hwjyd  c on a.ddh=c.ddh --货物交运单
left join gyl_yw_dstzdD h on b.sh=h.sh  --打色通知单细档
go

----业务下单数量统计表
alter view gyl_sg_ywxdsltj_V
as
select convert(varchar,month(a.djrq))+'月份' as yuefen ,a.djrq,c.emp_name,sum(b.ddsl) shul from
gyl_yw_scdd a  --生产订单
left join gyl_yw_scddD b on a.djbh=b.djbh --生产订单细档
left join Ebasic_bemp c on a.ywy=c.emp_no --员工信息表
group by month(a.djrq),c.emp_name,a.djrq
go
------------------------行转列例子示范------------
declare @sql_str varchar(8000)
declare @sql_col varchar(8000)
select @sql_col = isnull(@sql_col + '','')+quotename(emp_name) from 
---这中间是实表或者虚表
(select month(a.jhrq) as yuefen ,c.emp_name,sum(b.ddsl) shul from
gyl_yw_scdd a --生产订单
left join gyl_yw_scddD b on a.djbh=b.djbh  --生产订单细档
left join Ebasic_bemp c on a.ywy=c.emp_no  --员工信息表
group by month(a.jhrq),c.emp_name) as a group by emp_name
-----------------------
set @sql_str='select * from (select yuefen ,
emp_name,shul from  (select month(a.jhrq) as yuefen ,c.emp_name,sum(b.ddsl) shul from
gyl_yw_scdd a
left join gyl_yw_scddD b on a.djbh=b.djbh
left join Ebasic_bemp c on a.ywy=c.emp_no
group by month(a.jhrq),c.emp_name) as b
) p pivot(sum(shul) for emp_name in
('+@sql_col+')) as pvt order by pvt.yuefen'
print(@sql_str)
exec(@sql_str)
go
------------------------------------------------------------------------------
----成品实际出货数量统计表
create view gyl_sg_cpsjchsltjb_V
as
select convert(varchar,month(a.djrq))+'月份' as yuefen,a.ywy,d.emp_name,
sum(b.zms) as shul 
 from gyl_ck_hwjyd a  --货物交运单
left join gyl_ck_hwjydD b on a.djbh=b.djbh --货物交运单细档
left join Ebasic_bemp d on a.ywy=d.emp_no --员工信息表
group by month(a.djrq),a.ywy,d.emp_name
go
-----各染厂每日平均回仓数量统计表
create view gyl_sg_grcpjmrhc_V
as
select convert(varchar,month(a.djrq))+'月份' as yuefen,
c.jgdw,sum(b.shsl) shul from gyl_ck_wwshrkd a  --委外收货入库单
left join gyl_ck_wwshrkdD b on a.djbh=b.djbh --委外收货入库单细档
left join gyl_sg_wwscd c on a.scdh=c.djbh  --委外生产单
group by month(a.djrq),c.jgdw
go


-----加工厂增加色布库存数量统计表
alter view gyl_sg_jgczjsbkctj_V
as
select convert(varchar,month(a.djri))+'月份' as yuefen,a.zjyy,
b.othername,sum(a.zjsl) as shul,zlb.sl as  zsl
from gyl_sg_jgczjsbd a   --加工厂增加色布表
left join Ebasic_other b on a.zjyy=b.code  ---数据字典表
left join (select month(a.djrq) as yuef,sum(convert(decimal(15,3),b.jyms)) 
as sl from gyl_pz_cpwgjyb a  --成品外观检验表
left join gyl_pz_cpwgjybD b on a.djbh=b.djbh --成品外观检验表细档
group by month(a.djrq)
) as zlb on month(a.djri)=zlb.yuef
where b.otherid='gyl_sg_kcyy'
group by month(a.djri),a.zjyy,b.othername,zlb.sl
go

select * from gyl_ck_kcb  go
--pghandle8.aspx?pgid=gyl_sg_ddjdmibychz
--SELECT  I.PropertyID,'<a href=''#'' onclick=showModalDialog("
--RightIFram.aspx?pgid=FYKMangeLieBiao&gid=FYKMangeLieBiaof&PropertyID='''+
--Rtrim(I.PropertyID)+'''",''弹出框'',''dialogWidth=768px;dialogHeight=508px'')>'
--+Rtrim(I.PropertyNo)+'</a>' PropertyNo, 
------染厂异常色布数量统计表
create view gyl_sg_rcycsbsltj_V
as
select convert(varchar,month(a.fyrq))+'月份' as yuefen ,a.jgdw,b.dwjc,a.ycjg,c.othername,
case when ycjg='可改色用' then sum(convert(decimal(15,3),a.ycsl)) 
else sum(convert(decimal(15,3),a.ycsl)) end as ycjgsl
from gyl_pz_zlycfyd a left join gyl_gydj_jgchwlxx b on a.jgdw=b.bh
left join Ebasic_other c on a.ycjg=c.code where c.otherid='gyl_pz_ycjg'
group by month(a.fyrq),a.jgdw,b.dwjc,a.ycjg,c.othername
go

-----染厂胚布库存数量统计表
create view gyl_sg_rcpbkcsltj_V
as
select convert(varchar,month(a.djrq))+'月份' as yuefen,a.zfjgc,c.dwjc,sum(b.sl) as zsl
 from gyl_ck_cgshrkd a
left join gyl_ck_kcb b on a.ddh=b.ddh
left join gyl_gydj_jgchwlxx c on a.zfjgc=c.bh
group by month(a.djrq),a.zfjgc,c.dwjc
go

  
  