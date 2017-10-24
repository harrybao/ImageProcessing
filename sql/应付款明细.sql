---应付款明细
alter view gyl_cw_yfkmx_V
as
select a.Did,cast(a.Did as varchar(50)) as tid,b.djrq as jk_da,b.gysbh,a.djbh as CH01,b.ddh as cmx03,
a.kw,a.cpbh as cp_no,cp.pm,a.gg as cmx04,a.sjdw as cmx07, a.yfje as Rec_amt,a.wfje as dis_amt,
a.shsl,a.sjsl as JY_qty,a.dj,a.je as cmx31,a.ph,0 as tpsl,0 as ssll from gyl_ck_cgshrkdD a
left join gyl_ck_cgshrkd b on a.djbh=b.djbh
left join gyl_jczl_cpzlb  cp on a.cpbh=cp.dm
where (isnull(a.CloseOut,'N')='N' OR CloseOut='')
union all
select a.Did,cast(a.Did as varchar(50)) as tid, b.djrq as jk_da, '' as gysbh,a.djbh as CH01,b.scdh as cmx03,
a.kwid,a.cpbh as cp_no,cp.pm,'' as cmx04,a.dw as cmx07,a.yfje as Rec_amt,a.wfje as dis_amt,
a.shsl,a.sssl as JY_qty,a.cbdj,a.ewje+ a.jgje as yfje,a.phgh,a.tpsl,a.[ssl] from gyl_ck_wwshrkdD a 
left join gyl_ck_wwshrkd b on a.djbh=b.djbh
left join gyl_jczl_cpzlb  cp on a.cpbh=cp.dm
where (isnull(a.CloseOut,'N')='N' OR CloseOut='')
union all
------------其他应付
select a.id,a.djbh as tid,a.djrq,a.khbh,a.djbh,a.ddh,'' as ck,a.cp,'' as pm,'' as cmx04,'' as dw,
a.je,0 as Rec_amt,0 as dis_amt,a.sl,a.sl as shsl,a.dj,'' as phgh,0 as tps,0 as ssll from gyl_cw_qtyf a
left join Ebasic_bemp b on a.khbh=b.emp_no

