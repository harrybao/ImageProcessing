-----收款单汇总报表查询
alter view gyl_cw_skdhzbb_V
as
select b.cus_no,b.rev_no,b.rev_da,b.dol_no,b.prerev_amt,c.cus_name as group_no,
a.CH01,a.cmx03,a.cmx04,a.cmx07,a.cmx31,a.Rec_amt,a.dis_amt,b.remark from gyl_cw_cskzyD a 
left join gyl_cw_cskzy b on a.CK_no=b.CK_no
left join Ebasic_bcus c on b.group_no =c.cus_no
go
---月贷款收入日记帐
CREATE view gyl_cw_ydksrjz_V
as  
select cast(e.rev_da as DATE) as rev_da,e.rev_no as rev_no,b.cus_name as cus_name,b.cus_no,e.dol_no as dol_no,  
       o.othername as o_othername,o1.othername as o1_othername,e.Acc_name as Acc_name,o2.othername as o2_othername,  
       cast(e.Ent_date as DATE) as Ent_date,e.prerev_amt as prerev_amt,e.remark as remark  
from gyl_cw_skd e  
left join Ebasic_bcus b on e.com_no=b.cus_no  
left join Ebasic_other o on o.code=e.SH_way and o.otherid='zkskfs'  
left join Ebasic_other o1 on o1.code=e.Rec_pay and o1.otherid='bank_type'  
left join Ebasic_other o2 on o2.code=e.Deposit and o2.otherid='skdlx'  
left join(select fauto_no,Flags from Ewf_Process_fn('gyl_cw_skd')) p on p.fauto_no=e.rev_no  
where p.Flags=3 --and month(rev_da)=MONTH(GETDATE())  
go
------货款回笼预计时间表
CREATE view gyl_cw_dkhlTime_V  
as  
select e.ysrq as YS_da,cus.cus_name,m.ddh as order_no,e.bb as dol_no,d.wsje as zk_amt  
from gyl_ck_hwjydD d 
left join gyl_ck_hwjyd jy on jy.djbh=d.djbh
left join gyl_yw_chtzd e on jy.chdh=e.djbh  
left join gyl_yw_chtzdD m on e.djbh=m.djbh and d.ddh=m.ddh and d.sx=m.sx and d.dj1=m.dj --===待修改部分 ===
left join Ebasic_bcus cus on e.khdm=cus.cus_no
left join(select fauto_no,Flags from Ewf_Process_fn('gyl_yw_chtzd')) p on e.djbh=p.fauto_no  
where p.Flags=3  and d.wsje<>0  
go
-----逾期明细
alter view gyl_cw_yqmx_V 
as    
select ch.khdm as ch04,cus.cus_name,g.group_name as group_no,ch.bb,sum(d.wsje) as d_amt ,'' as cmx03  
from gyl_ck_hwjydD d   
left join gyl_ck_hwjyd jy on jy.djbh=d.djbh
left join gyl_yw_chtzd ch on jy.chdh=ch.djbh
left join gyl_yw_chtzdD chd on ch.djbh=chd.djbh and d.ddh=chd.ddh and d.sx=chd.sx and d.dj1=chd.dj 
left join Ebasic_bcus cus on ch.khdm=cus.cus_no 
left join(select distinct cus_no,group_no,group_name from Ebasic_bcusgroup) g on ch.khdm=g.group_no 
--left join(select fauto_no,Flags from Ewf_Process_fn('Crm_CHZB')) p on e.CH01=p.fauto_no   
where ch.ysrq<GETDATE()  and isnull(d.Closeout,'N')='N' and ISNULL(d.wsje,0)<>0  
group by ch.khdm,cus.cus_name,g.group_name,ch.bb
go
-------客户未收款明细
CREATE view gyl_cw_khwskmx_V
as
select ch.khdm,cus.cus_name ,d.djbh,d.ddh,ch.bb,ch.chrq,ch.ysrq,d.je,isnull(d.shje,0) as Rec_amt,
       isnull(d.wsje,0) as dis_amt,'' as dicamt,DATEDIFF(day,ch.ysrq,GETDATE()) as ZL,
       isnull(d.Closeout,'N') Closeout,ch.ywy as YW_user,
(case when 0<datediff(dd,ch.ysrq,getdate()) and datediff(dd,ch.ysrq,getdate())<=30 
then d.wsje else 0 end) as due30,

(case when 30<datediff(dd,ch.ysrq,getdate()) and datediff(dd,ch.ysrq,getdate())<=60 
then d.wsje else 0 end) as due60,

(case when 60<datediff(dd,ch.ysrq,getdate()) and datediff(dd,ch.ysrq,getdate())<=180 
then d.wsje else 0 end) as due180,

(case when 180<datediff(dd,ch.ysrq,getdate()) and datediff(dd,ch.ysrq,getdate())<=365 
then d.wsje else 0 end) as due365,

(case when 1<datediff(YY,ch.ysrq,getdate()) and datediff(YY,ch.ysrq,getdate())<=2
then d.wsje else 0 end) as dueY2,

(case when 2<datediff(YY,ch.ysrq,getdate()) and datediff(YY,ch.ysrq,getdate())<=3
then d.wsje else 0 end) as dueY3,

(case when 3<datediff(YY,ch.ysrq,getdate()) then d.wsje else 0 end) as dueYY
from gyl_ck_hwjydD d   
left join gyl_ck_hwjyd jy on jy.djbh=d.djbh
left join gyl_yw_chtzd ch on jy.chdh=ch.djbh
left join gyl_yw_chtzdD chd on ch.djbh=chd.djbh and d.ddh=chd.ddh and d.sx=chd.sx and d.dj1=chd.dj 
left join Ebasic_bcus cus on ch.khdm=cus.cus_no 
--left join(select fauto_no,Flags from Ewf_Process_fn('Crm_CHZB') WHERE Flags=3) p on p.fauto_no=e.CH01
where d.wsje>0 and ch.ysrq<GETDATE() 
go
----客户账龄分析表
create view gyl_cw_khzlfxb_V
as
SELECT jy.khbh as khdm,cus.cus_name,'' as xyqx,'' as xyed,ch.bb,sum(jyd.wsje) as yue,
(case when 0<datediff(dd,ch.ysrq,getdate()) and datediff(dd,ch.ysrq,getdate())<=30 
then sum(jyd.wsje) else 0 end) as due30,

(case when 30<datediff(dd,ch.ysrq,getdate()) and datediff(dd,ch.ysrq,getdate())<=60 
then sum(jyd.wsje) else 0 end) as due60,

(case when 60<datediff(dd,ch.ysrq,getdate()) and datediff(dd,ch.ysrq,getdate())<=180 
then sum(jyd.wsje) else 0 end) as due180,

(case when 180<datediff(dd,ch.ysrq,getdate()) and datediff(dd,ch.ysrq,getdate())<=365 
then sum(jyd.wsje) else 0 end) as due365,

(case when 1<datediff(YY,ch.ysrq,getdate()) and datediff(YY,ch.ysrq,getdate())<=2
then sum(jyd.wsje) else 0 end) as dueY2,

(case when 2<datediff(YY,ch.ysrq,getdate()) and datediff(YY,ch.ysrq,getdate())<=3
then sum(jyd.wsje) else 0 end) as dueY3,

(case when 3<datediff(YY,ch.ysrq,getdate()) then sum(jyd.wsje) else 0 end) as dueYY
from gyl_ck_hwjydD jyd
left join gyl_ck_hwjyd jy on jy.djbh=jyd.djbh
left join gyl_yw_chtzd ch on jy.chdh=ch.djbh
left join gyl_yw_chtzdD chd on ch.djbh=chd.djbh and jyd.ddh=chd.ddh and jyd.sx=chd.sx and jyd.dj1=chd.dj --===待修改部分 ===
left join Ebasic_bcus cus on ch.khdm=cus.cus_no 
where (isnull(jyd.CloseOut,'N')='N' OR CloseOut='')
and jyd.wsje>0 and ch.ysrq<GETDATE() 
group by jy.khbh,cus.cus_name,ch.bb,ch.ysrq
go
----供应商账龄分析表
create view gyl_cw_gyszlfxb_V
as

SELECT jy.khbh as khdm,cus.cus_name,'' as xyqx,'' as xyed,ch.bb,sum(jyd.wsje) as yue,
(case when 0<datediff(dd,ch.ysrq,getdate()) and datediff(dd,ch.ysrq,getdate())<=30 
then sum(jyd.wsje) else 0 end) as due30,

(case when 30<datediff(dd,ch.ysrq,getdate()) and datediff(dd,ch.ysrq,getdate())<=60 
then sum(jyd.wsje) else 0 end) as due60,

(case when 60<datediff(dd,ch.ysrq,getdate()) and datediff(dd,ch.ysrq,getdate())<=180 
then sum(jyd.wsje) else 0 end) as due180,

(case when 180<datediff(dd,ch.ysrq,getdate()) and datediff(dd,ch.ysrq,getdate())<=365 
then sum(jyd.wsje) else 0 end) as due365,

(case when 1<datediff(YY,ch.ysrq,getdate()) and datediff(YY,ch.ysrq,getdate())<=2
then sum(jyd.wsje) else 0 end) as dueY2,

(case when 2<datediff(YY,ch.ysrq,getdate()) and datediff(YY,ch.ysrq,getdate())<=3
then sum(jyd.wsje) else 0 end) as dueY3,

(case when 3<datediff(YY,ch.ysrq,getdate()) then sum(jyd.wsje) else 0 end) as dueYY
from gyl_ck_hwjydD jyd
left join gyl_ck_hwjyd jy on jy.djbh=jyd.djbh
left join gyl_yw_chtzd ch on jy.chdh=ch.djbh
left join gyl_yw_chtzdD chd on ch.djbh=chd.djbh and jyd.ddh=chd.ddh and jyd.sx=chd.sx and jyd.dj1=chd.dj --===待修改部分 ===
left join Ebasic_bcus cus on ch.khdm=cus.cus_no 
where (isnull(jyd.CloseOut,'N')='N' OR CloseOut='')
and jyd.wsje>0 and ch.ysrq<GETDATE() 
group by jy.khbh,cus.cus_name,ch.bb,ch.ysrq
go

----月销售日记账
CREATE VIEW gyl_cw_yxsrjz_V    
AS    
SELECT jy.khbh,cus.cus_ab,jy.djrq ch03,jy.djbh as JY_no,'' as pzh,d.fph,
     d.htdh as hth,d.ddh,'' as guige, ch.ywy,f.emp_name, f.emp_name ch12, 
	 f.CRM_deptid as Families,ch.chlx as Saway,ch.ysrq as accdate , d.zms as sl,    
     chd.dw,'' as zs,'' as zl,ch.bb Ch100,'' as hl,d.dj, d.je as cmx31,0 as shuie,d.je as jshj,
	 '' as xsb,jy.bz         
from gyl_ck_hwjydD d     ----交运单
left join gyl_ck_hwjyd jy on jy.djbh=d.djbh
left join gyl_yw_chtzd ch on jy.chdh=ch.djbh
left join gyl_yw_chtzdD chd on ch.djbh=chd.djbh and d.ddh=chd.ddh and d.sx=chd.sx and d.dj1=chd.dj --===待修改部分 ===
left join Ebasic_bcus cus on ch.khdm=cus.cus_no       
left join (select * from Ebasic_bemp where dept_no in ('s','cs') ) f on f.emp_no=ch.ywy  
go 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  