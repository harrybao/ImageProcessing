use wintex go
create view gyl_cg_gysksd_V
as ---��Ӧ�̿��߱���
select c.vdr_name,a.rq,a.zbr,d.pm,b.* from gyl_cg_gysksd a 
left join gyl_cg_gysksdD b on a.ksdbh=b.ksdbh  --��Ӧ�̿��ߵ�
left join Ebasic_bvdr c on a.pbs=c.vdr_no --��Ӧ�����ϱ�
left join gyl_jczl_cpzlb d on b.cpbh=d.dm --��Ʒ���ϱ�
go
----������ϸ��ͼ
create view gyl_cg_ksmx_V
as
select a.*,b.cus_name,c.pm as cpmc,d.ys as color from 
gyl_yw_kscld a left join  Ebasic_bcus b  --�ͻ����ϱ�
on a.kh=b.cus_no left join gyl_jczl_cpzlb c  --��Ʒ���ϱ�
on a.pm=c.dm left join gyl_yw_dstzdD d  --��ɫ������
on a.ys=d.sh
go

-----�������ȸ��ٱ�
create view gyl_wl_fhjdgzd_V
as 
select a.djrq,c.cus_name,e.dwqc,
d.address+'/'+d.enterpriser+'/'+d.tel as detial,
f.wldh,f.wldh2,f.djbh, b.* from gyl_wl_hyjjd a  --���˽��ӵ�
left join gyl_wl_hyjjdD b on a.jjbh=b.jjbh --���˽��ӵ�ϸ��
left join Ebasic_bcus  c on a.khbh=c.cus_no --�ͻ����ϱ�
left join Crm_Cusdetails d on a.khbh= d.cus_no --�ͻ�����ϸ��
left join gyl_gydj_jgchwlxx e on a.wtyh=e.bh --�ӹ���/������˾���ϱ�
left join gyl_ck_hwjyd  f on b.ddh=f.ddh  --���ｻ�˵�
go

------�������˵�
create view gyl_wl_wldzd_V
as 
select a.djrq,c.cus_name,d.address+'/'+d.enterpriser+'/'+d.tel as detail, 
b.* ,b.sl*b.dj as yf,b.fyhj/b.sl as cb  from gyl_wl_hyjjd a --���˽��ӵ�
left join gyl_wl_hyjjdD b on a.jjbh=b.jjbh --���˽��ӵ�ϸ��
left join Ebasic_bcus c on a.khbh=c.cus_no --�ͻ����ϱ�
left join Crm_Cusdetails d on a.khbh=d.cus_no --�ͻ�����ϸ��
 go

-------��Ʒ����Աȱ�
create view gyl_pz_cpjydbb_V
as
select e.cus_name,f.pm, '' as tm,'' as bl,a.*,b.ym,(case b.dj when '01' then b.jyms end)[adj],
(case b.dj when '02' then b.jyms end)[bdj],d.jgc from gyl_pz_cpwgjyb a ---��Ʒ��ۼ����
left join gyl_pz_cpwgjybD b on a.djbh=b.djbh ---��Ʒ��ۼ����ϸ��
left join gyl_sg_sctpdD  c on a.gh=c.gh    ---����Ͷ�ߵ�ϸ��
left join gyl_sg_sctpd d on c.djbh=d.djbh --����Ͷ�ߵ�
left join Ebasic_bcus e on a.khbh=e.cus_no  --�ͻ����ϱ�
left join gyl_jczl_cpzlb  f on a.cpbh =f.dm  --��Ʒ���ϱ�
go
------Ʒ���ش��쳣���ٱ�����ͼ
create view gyl_pz_pbzdycgz_V
as 
select * from gyl_pz_pbzdyczz ----Ʒ���ش��쳣׷�ٱ�
go
---�߲�׷�ٱ���
alter view gyl_sg_pbzzbb_V
as 
select i.jhrq, a.sqrq,c.djrq,b.*,j.pm,d.ph,d.shsl,a.gysbh,a.ddh,
e.vdr_name,'' as pdyl,'' as pbzt,'' as jhrc,c.bz,
f.sl as rckc from gyl_cg_pbcgsq a    --�߲��ɹ����뵥
left join gyl_cg_pbcgsqD b on a.sqbh=b.sqbh --�߲��ɹ����뵥ϸ��
left join gyl_ck_cgshrkd c on a.ddh=c.ddh --�ɹ��ջ���ⵥ
left join gyl_ck_cgshrkdD d on c.djbh=d.djbh --�ɹ��ջ���ⵥϸ��
left join Ebasic_bvdr  e on a.gysbh=e.vdr_no --��Ӧ�����ϱ�
left join gyl_ck_kcb  f on a.ddh=f.ddh  --����
left join gyl_yw_scdd  i on a.ddh=i.djbh  --��������
left join gyl_jczl_cpzlb j on b.cpbh=j.dm --��Ʒ���ϱ�
go

----����������ϸ
alter view gyl_sg_scddmx_V
as
select a.djbh, a.dm,a.jhrq,a.khbh,a.khdh,a.khpm,a.jgb,'' as qrrq,
a.jgdw1,b.sh,f.ys,c.djrq,b.ddsl,d.djrq as kkrq,e.jcph,e.gh,e.tpsl,
(case g.dengj when 'A'then g.sl end) [ajsl],(case  when g.dengj!='A'then g.sl end)[cpsl],'' as btgs,
i.fydh ,case when k.sh =(select sh from gyl_sg_sctpdD where djbh 
=(select djbh from gyl_sg_sctpd where djbh=j.tpdh)) then '��'
 else '��' end as sfzz from gyl_yw_scdd a  --��������
left join gyl_yw_scddD b on a.djbh=b.djbh  --��������ϸ��
left join gyl_ck_hwjyd c on a.ddh=c.ddh  --���ｻ�˵�
left join gyl_sg_sctpd  d on a.djbh=d.scdh  --����Ͷ�ߵ�
left join gyl_sg_sctpdD e on d.djbh=e.djbh --����Ͷ�ߵ�ϸ��
left join gyl_yw_dstzdD f on b.sh=f.sh  --��ɫ֪ͨ��ϸ��
left join gyl_ck_kcb g on a.djbh=g.ddh  --����
left join gyl_pz_zlycfyd  i on a.djbh=i.ddh  --�����쳣��Ӧ��
left join gyl_ck_wwshrkd j on a.djbh=j.tpdh --ί���ջ���ⵥ
left join gyl_ck_wwshrkdD k on j.djbh=k.djbh --ί���ջ���ⵥϸ��
go

-----���������·ݻ��ܱ�
create view gyl_sg_ddjdyfhz_V
as
select a.dm,a.jhrq,'' as qrrq,c.djrq,a.khbh,a.khdh,a.khpm,b.sh,h.ys,
a.jgb,a.jgdw1,b.ddsl,d.djrq as kkrq,e.ph,e.gh,e.tpsl,f.jhq,g.djrq as rccprq,
case when g.djrq-f.jhq>0 then '����'else 'δ����'end as sfyw,
g.cps,g.sl,b.bz  from gyl_yw_scdd a  --��������
left join gyl_yw_scddD b on a.djbh=b.djbh --��������ϸ��
left join gyl_ck_hwjyd  c on a.ddh=c.ddh --���ｻ�˵�
left join gyl_sg_sctpd d on a.djbh=d.scdh  --����Ͷ�ߵ�
left join gyl_sg_sctpdD e on d.djbh=e.djbh --����Ͷ�ߵ�ϸ��
left join gyl_yw_xshtD f on a.hth=f.hth   --���ۺ�ͬ��ϸ��
left join gyl_sg_rzjgyqqrd g on a.hth=g.htbh --Ⱦ���ӹ���
left join gyl_yw_dstzdD h on b.sh=h.sh   --��ɫ֪ͨϸ��
go
----Ⱦ���߲���ϸ��
create view gyl_sg_rcpbmxb_V
as
select a.djrq,b.ph,b.cpbh,c.pm,b.shsl,a.bz from gyl_ck_cgshrkd a --�ɹ��ջ���ⵥ
left join gyl_ck_cgshrkdD b on a.djbh=b.djbh  --�ɹ��ջ���ⵥϸ��
left join gyl_jczl_cpzlb c on b.cpbh=c.dm  --��Ʒ���ϱ�
go

----��׼ʵ�ʹ������ʱ���
alter view gyl_sg_bzsjgxhysjb_V
as
select a.zhj1,a.zhj2,a.zhj3,a.zhj4, b.*,c.dept_name, b.hysj1 as sjsj,
 b.hysj1/b.hysj1 as bl from gyl_sg_ddgx a   --��׼�������ʱ����Ϣ��
left join gyl_sg_ddgxD b on a.djbh=b.djbh   --��׼�������ʱ����Ϣ��ϸ��
left join Ebasic_dept c on b.bmbh=c.dept_no  ---������Ϣ��
go
-----��Ʒ����
alter view gyl_kf_ypkcb_V
as
select ROW_NUMBER()over (order by djbh) as xh, a.*,
b.pm,d.ys from gyl_kf_ypbhb a   ---��Ʒ��Ϣ��
left join gyl_jczl_cpzlb b on a.dm=b.dm  --��Ʒ���ϱ�
left join gyl_yw_dstzdD d on a.sh=d.sh --��ɫ֪ͨ��ϸ��
go

-----Ⱦ����ɫ���ͳ�Ʊ�
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
from gyl_yw_dstzd a  ---��ɫ֪ͨ��
left join gyl_yw_ypcdd b on a.dsdh=b.dybh --��Ʒ��Ϣ��
left join gyl_gydj_jgchwlxx c on a.dygc=c.bh --�ӹ���/�������ϱ�
left join gyl_yw_ypcddD d on b.djbh=d.djbh  --��Ʒ��Ϣ��ϸ��
group by c.dwjc
go
-----ҵ���Ŵ�ɫ����ͳ��
create view gyl_js_ywydssl_V
as
select a.ywfzr,b.emp_name, sum(convert(int,a.sktfs)+convert(int,a.rdfs)) as zgs 
from gyl_yw_dstzd a  --��ɫ֪ͨ��
left join Ebasic_bemp b on a.ywfzr=b.emp_no  --Ա����Ϣ��
group by a.ywfzr,b.emp_name
go
-----ҵ����ӡ������ͳ�Ʊ�
create view gyl_js_ywapyhgs_V
as
select yw ,b.emp_name,count(yhbh) as yhgs,count(dbys) as ysgs from gyl_yw_sgytzd a --�ֹ���֪ͨ��
left join Ebasic_bemp b on a.yw=b.emp_no  ---Ա����Ϣ��
group by yw,b.emp_name
go

-----�������������ͳ�Ʊ�
alter view gyl_sg_kczlysltj_V
as
select a.cpid,cpmc,sum(a.sl) as hz  from gyl_ck_kcb_V a  --����
where ddh not in(select ddh from gyl_ck_hwjyd)
and ddh not in(select ddh from gyl_ck_jgfhd)
group by a.cpid,a.cpmc
go

----�ֿ��Ű�������ͳ�Ʊ�
alter view gyl_sg_ckcfbpsltj_V
as
select case when a.ckmc='���ֿ߲�' then '�ڲ�' end [zc],
b.djrq,b.gysbh,c.vdr_name,'' as df,a.* from gyl_ck_kcb_V a --����
left join gyl_ck_cgshrkd b on a.ddh=b.ddh  --�ɹ��ջ���ⵥ
left join Ebasic_bvdr c on b.gysbh=c.vdr_no  --��Ӧ�����ϱ�
go
----�ֿ�ÿ�����ӿ������ͳ�Ʊ�
alter view gyl_sg_ckmrzjkcsl_V
as
select case when a.ckmc!='' then '�ڲ�' end [zc],'' as ja,
case when a.ckmc like '%��%' then 'ɫ��' else '��Ʒ' end [spcp],
b.djrq,b.gysbh,c.vdr_name,d.jgc,d.djrq as fhrq,e.fhsl,e.fhzs, a.* 
from gyl_ck_kcb_V a --����
left join gyl_ck_cgshrkd b on a.ddh=b.ddh --�ɹ��ջ���ⵥ
left join Ebasic_bvdr c on b.gysbh=c.vdr_no --��Ӧ�����ϱ�
left join gyl_ck_jgfhd d on a.ddh=d.ddh  --�ӹ�������
left join gyl_ck_jgfhdD e on d.djbh=e.djbh --�ӹ�������ϸ��
go
-----����������ϸ��
alter view gyl_sg_ddjdmibychz_V
as
select a.dm,a.jhrq,'' as qrrq,c.djrq,a.khbh,a.khdh,a.khpm,b.sh,h.ys,
a.jgb,a.jgdw1,b.ddsl,d.djrq as kkrq,e.ph,e.gh,e.tpsl,f.jhq,g.djrq as rccprq,
g.cps,g.sl,i.ycsl,'' as pbcc,'' as xp,''as lz,
'' as tj,''as pg,''as jg,''as cg,'' as qdhg,''as zj,''as cd,''as bz,
j.djrq as chrq,j.bz as scqkbz, '' as ywyy ,'' as ksdh from gyl_yw_scdd a --��������
left join gyl_yw_scddD b on a.djbh=b.djbh  --��������ϸ��
left join gyl_ck_hwjyd  c on a.ddh=c.ddh  --���ｻ�˵�
left join gyl_sg_sctpd d on a.djbh=d.scdh  --����Ͷ�ߵ�
left join gyl_sg_sctpdD e on d.djbh=e.djbh  --����Ͷ�ߵ�ϸ��
left join gyl_yw_xshtD f on a.hth=f.hth  --���ۺ�ͬϸ��
left join gyl_sg_rzjgyqqrd g on a.hth=g.htbh --Ⱦ���ӹ�
left join gyl_yw_dstzdD h on b.sh=h.sh  --��ɫ֪ͨ��ϸ��
left join gyl_pz_zlycfyd i on a.djbh=i.ddh --�����쳣��Ӧ��
left join gyl_ck_jgfhd j  on a.djbh=j.ddh --�ӹ�������
go

----�߲�Ԥռ��ϸ
create view gyl_sg_pbyzmx_V
as
select a.dm,a.jhrq,'' as qrrq,c.djrq,a.khbh,a.khdh,a.khpm,b.sh,h.ys,
a.jgb,a.jgdw1,b.ddsl ,b.tpsl ,''as sczq,''as jhjq,
''as jqwa,'' as ywyybz from gyl_yw_scdd a --�������� 
left join gyl_yw_scddD b on a.djbh=b.djbh  --��������ϸ��
left join gyl_ck_hwjyd  c on a.ddh=c.ddh --���ｻ�˵�
left join gyl_yw_dstzdD h on b.sh=h.sh  --��ɫ֪ͨ��ϸ��
go

----ҵ���µ�����ͳ�Ʊ�
alter view gyl_sg_ywxdsltj_V
as
select convert(varchar,month(a.djrq))+'�·�' as yuefen ,a.djrq,c.emp_name,sum(b.ddsl) shul from
gyl_yw_scdd a  --��������
left join gyl_yw_scddD b on a.djbh=b.djbh --��������ϸ��
left join Ebasic_bemp c on a.ywy=c.emp_no --Ա����Ϣ��
group by month(a.djrq),c.emp_name,a.djrq
go
------------------------��ת������ʾ��------------
declare @sql_str varchar(8000)
declare @sql_col varchar(8000)
select @sql_col = isnull(@sql_col + '','')+quotename(emp_name) from 
---���м���ʵ��������
(select month(a.jhrq) as yuefen ,c.emp_name,sum(b.ddsl) shul from
gyl_yw_scdd a --��������
left join gyl_yw_scddD b on a.djbh=b.djbh  --��������ϸ��
left join Ebasic_bemp c on a.ywy=c.emp_no  --Ա����Ϣ��
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
----��Ʒʵ�ʳ�������ͳ�Ʊ�
create view gyl_sg_cpsjchsltjb_V
as
select convert(varchar,month(a.djrq))+'�·�' as yuefen,a.ywy,d.emp_name,
sum(b.zms) as shul 
 from gyl_ck_hwjyd a  --���ｻ�˵�
left join gyl_ck_hwjydD b on a.djbh=b.djbh --���ｻ�˵�ϸ��
left join Ebasic_bemp d on a.ywy=d.emp_no --Ա����Ϣ��
group by month(a.djrq),a.ywy,d.emp_name
go
-----��Ⱦ��ÿ��ƽ���ز�����ͳ�Ʊ�
create view gyl_sg_grcpjmrhc_V
as
select convert(varchar,month(a.djrq))+'�·�' as yuefen,
c.jgdw,sum(b.shsl) shul from gyl_ck_wwshrkd a  --ί���ջ���ⵥ
left join gyl_ck_wwshrkdD b on a.djbh=b.djbh --ί���ջ���ⵥϸ��
left join gyl_sg_wwscd c on a.scdh=c.djbh  --ί��������
group by month(a.djrq),c.jgdw
go


-----�ӹ�������ɫ���������ͳ�Ʊ�
alter view gyl_sg_jgczjsbkctj_V
as
select convert(varchar,month(a.djri))+'�·�' as yuefen,a.zjyy,
b.othername,sum(a.zjsl) as shul,zlb.sl as  zsl
from gyl_sg_jgczjsbd a   --�ӹ�������ɫ����
left join Ebasic_other b on a.zjyy=b.code  ---�����ֵ��
left join (select month(a.djrq) as yuef,sum(convert(decimal(15,3),b.jyms)) 
as sl from gyl_pz_cpwgjyb a  --��Ʒ��ۼ����
left join gyl_pz_cpwgjybD b on a.djbh=b.djbh --��Ʒ��ۼ����ϸ��
group by month(a.djrq)
) as zlb on month(a.djri)=zlb.yuef
where b.otherid='gyl_sg_kcyy'
group by month(a.djri),a.zjyy,b.othername,zlb.sl
go

select * from gyl_ck_kcb  go
--pghandle8.aspx?pgid=gyl_sg_ddjdmibychz
--SELECT  I.PropertyID,'<a href=''#'' onclick=showModalDialog("
--RightIFram.aspx?pgid=FYKMangeLieBiao&gid=FYKMangeLieBiaof&PropertyID='''+
--Rtrim(I.PropertyID)+'''",''������'',''dialogWidth=768px;dialogHeight=508px'')>'
--+Rtrim(I.PropertyNo)+'</a>' PropertyNo, 
------Ⱦ���쳣ɫ������ͳ�Ʊ�
create view gyl_sg_rcycsbsltj_V
as
select convert(varchar,month(a.fyrq))+'�·�' as yuefen ,a.jgdw,b.dwjc,a.ycjg,c.othername,
case when ycjg='�ɸ�ɫ��' then sum(convert(decimal(15,3),a.ycsl)) 
else sum(convert(decimal(15,3),a.ycsl)) end as ycjgsl
from gyl_pz_zlycfyd a left join gyl_gydj_jgchwlxx b on a.jgdw=b.bh
left join Ebasic_other c on a.ycjg=c.code where c.otherid='gyl_pz_ycjg'
group by month(a.fyrq),a.jgdw,b.dwjc,a.ycjg,c.othername
go

-----Ⱦ���߲��������ͳ�Ʊ�
create view gyl_sg_rcpbkcsltj_V
as
select convert(varchar,month(a.djrq))+'�·�' as yuefen,a.zfjgc,c.dwjc,sum(b.sl) as zsl
 from gyl_ck_cgshrkd a
left join gyl_ck_kcb b on a.ddh=b.ddh
left join gyl_gydj_jgchwlxx c on a.zfjgc=c.bh
group by month(a.djrq),a.zfjgc,c.dwjc
go

  
  