select * from Ebasic_bvdr
select * from Ebasic_bvdr_contact
select b.vdr_name,a.* from 
gyl_cg_lpgys a left join Ebasic_bvdr b
 on a.gysbh=b.vdr_no

select a.*,b.vdr_name,c.Tel,c.Fax from 
gyl_cg_cght a left join Ebasic_bvdr b 
on a.gysbh=b.vdr_no 
left join Ebasic_bvdr_contact c 
on a.gysbh=c.vdr_no
select * from gyl_cg_pbcgsqD
select * from gyl_cg_cghtD
select * from gyl_cg_lpgys 

select * from Ebasic_other
use wintex
select * from Ebasic_bcus
select a.* ,b.cus_name ,c.address,c.enterpriser,c.tel 
from gyl_wl_hyjjd a left join Ebasic_bcus b 
on a.khbh=b.cus_no left join Crm_Cusdetails c 
on a.khbh=c.cus_no
select vdr_no,vdr_name from Ebasic_bvdr 
where vdr_no ='GC005'
select * from gyl_ck_cgshrkdD
select * from gyl_wl_khwllxDD
select a.*,b.cus_name from
 gyl_wl_khwllx a left join Ebasic_bcus b
  on a.khbh=b.cus_no

select a.cgrq,a.jhrq,a.ddh,a.gysbh,b.cpbh,b.sl 
from gyl_cg_cght a left join gyl_cg_cghtD  b 
on a.cgdbh=b.cgdbh

select a.cgdbh,a.cgrq,a.jhrq,a.gysmc,c.pm,b.sl,
'' as yss,''as rks,''as zt,b.dw,a.cgy,b.bz 
from gyl_cg_cght a left join gyl_cg_cghtD b 
on a.cgdbh=b.cgdbh left join gyl_jczl_cpzlb c 
on b.cpbh=c.dm

use wintex
select a.wtyh,a.hwxx,a.wlxx,a.khshdz,a.lx,
 b.ddh,b.pz,b.zs,b.sl,b.zzl,b.jffs,b.fyhj,
 b.ddyjsj,b.sjdasj, c.cus_name,d.enterpriser,
 d.tel from gyl_wl_hyjjd a left join 
 gyl_wl_hyjjdD b on a.jjbh=b.jjbh 
 left join Ebasic_bcus c on a.khbh=c.cus_no 
 left join Crm_Cusdetails d on a.khbh=d.cus_no
 select * from Ebasic_bemp where emp_name='≥¨º∂”√ªß'
 select * from ebasic_dept
 select * from gyl_yw_dstzdD
 select * from Crm_Cusdetails
 select * from Ebasic_bvdr_contact
update Ebasic_bvdr_contact set Contact_name='harry' where vdr_no='GC001'
 select a.djbh,a.ddh,a.djrq,a.khbh, c.cus_name,d.pm, a.ywy,a.kpr,a.fhzt,a.wldh,a.wldh2,a.wlgs,a.sj,a.ch,a.khqs,a.bz,a.hth,a.kh,b.bhdm,b.ys,b.sh,b.gh,b.md,b.zs, b.zms,b.dj,b.je from gyl_ck_hwjyd a left join gyl_ck_hwjydD b on a.djbh=b.djbh left join Ebasic_bcus c on a.khbh=c.cus_no left join gyl_jczl_cpzlb d on b.cpbh=d.dm 
 select Tel,Fax from Ebasic_bvdr_contact where id ='harry' and vdr_no = 'GC001'
select b.djbh,a.cgdbh,a.ddh,e.pm,a.gysbh,a.gysmc,c.sl,a.cgy,a.cgrq,b.rkck,a.zdr,a.bz,b.djrq,d.cgsl,d.shsl from gyl_cg_cght a left join gyl_ck_cgshrkd b  on a.cgdbh=b.cgddh left join gyl_cg_cghtD c on a.cgdbh=c.cgdbh left join gyl_ck_cgshrkdD  d on b.djbh=d.djbh  left join gyl_jczl_cpzlb e on c.cpbh=e.dm


select dept_name from ebasic_dept where dept_id in(select dept_id from Ebasic_bemp where emp_no='01015')