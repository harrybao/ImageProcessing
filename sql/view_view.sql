---获取发票号
alter view gyl_cw_hqfph_V
as
SELECT jyd.Did,ch.khdm as cus_no,cus.cus_name,jy.djbh as JY_no ,jyd.ddh as cmx03,jyd.sx as cmx04 ,jyd.dj1 as cmx07 , 
ch.chrq as CH_da,jyd.je as cmx31,jyd.se as ht09,jyd.jshj as cmx38, jyd.shje as Rec_amt ,jyd.wsje as dis_amt ,
jyd.kpsj,jyd.fph, ch.bb as cx27,'' as hl,ch.ywy, '' as btn from gyl_ck_hwjydD jyd
left join gyl_ck_hwjyd jy on jy.djbh=jyd.djbh
left join gyl_yw_chtzd ch on jy.chdh=ch.djbh
left join gyl_yw_chtzdD chd on ch.djbh=chd.djbh and jyd.ddh=chd.ddh and jyd.sx=chd.sx and jyd.dj1=chd.dj 
left join Ebasic_bcus cus on ch.khdm=cus.cus_no 
--where (isnull(jyd.CloseOut,'N')='N' OR CloseOut='')
--left join(select fauto_no,Flags from Ewf_Process_fn('gyl_yw_chtzd')) p on p.fauto_no=ch.djbh   
--WHERE (p.Flags=3) and isnull(jyd.CloseOut,'N')='N'
go
---获取发票号 
CREATE view [dbo].[V_YSKWH]  
as  
select d.id,'' as bt1,'' as btn,d.JY_no,d.cmx03,d.cmx04,d.cmx07,e.ch04,e.ch05,isnull(d.cmx38,0) cmx38,  
       isnull(d.ht90,0) ht90,isnull(d.cmx31,0) cmx31,isnull(d.Rec_amt,0) Rec_amt,isnull(d.dis_amt,0) dis_amt,  
       d.cmx30,e.ch03,e.CX27,e.Ch101,m.Sources,a.othername,e.ch11,d.kf_da  
from Crm_JYDetail d  
left join Crm_CHMX m on rtrim(d.CH01)=m.CH01 and d.cmx03=m.cmx03 and d.cmx04=m.cmx04 and d.cmx07=m.cmx07  
left join Crm_CHZB e on m.CH01=e.CH01  
left join Ebasic_other a on otherid='cwgllyb' and m.Sources=a.code  
left join(select fauto_no,Flags from Ewf_Process where pgid='Crm_CHZB') p on p.fauto_no=e.CH01  
where p.Flags=3 and e.Ch44 in ('1001','1002','1007','1011')   --正常单  
union all  
select d.id,'' as bt1,'' as btn,d.JY_no,d.cmx03,d.cmx04,d.cmx07,e.ch04,e.ch05,isnull(d.cmx38,0) cmx38,  
       isnull(d.ht90,0) ht90,isnull(d.cmx31,0) cmx31,isnull(d.Rec_amt,0) Rec_amt,isnull(d.dis_amt,0) dis_amt,  
       d.cmx30,e.ch03,e.CX27,e.Ch101,m.Sources,a.othername,e.ch11,d.kf_da  
from Crm_JYDetail d  
left join Crm_CHMX m on rtrim(d.CH01)=m.CH01 and d.cmx_xc=m.cmx02  
left join Crm_CHZB e on m.CH01=e.CH01  
left join Ebasic_other a on otherid='cwgllyb' and m.Sources=a.code  
left join(select fauto_no,Flags from Ewf_Process where pgid='Crm_CHZB') p on p.fauto_no=e.CH01  
where p.Flags=3 and e.Ch44 not in ('1001','1002','1007','1011')  --手工单  
union all  
select d.id,'' as bt1,'' as btn,d.JY_no,d.cmx03,d.cmx04,d.cmx07,d.cus_no ch04,e.cus_name ch05,isnull(d.cmx38,0) cmx38,  
       isnull(d.ht90,0) ht90,isnull(d.cmx31,0) cmx31,isnull(d.Rec_amt,0) Rec_amt,isnull(d.dis_amt,0) dis_amt,  
       d.cmx30,GETDATE() ch03,d.CX27,z.dol_rate Ch101,'' Sources,'' othername,'' ch11,d.kf_da  
from Crm_JYDetail d   
left join Ebasic_bcus e on d.cus_no=e.cus_no  
left join ZK_DOLset z on d.CX27=z.dol_no and YEAR(GETDATE())=YEAR(dol_da) and MONTH(GETDATE())=MONTH(dol_da)  
where JY_no='jytest'  
go
  