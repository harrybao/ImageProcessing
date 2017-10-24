alter view gyl_cw_jyckmx_V  ---交运冲款明细====待修改
AS  
SELECT jyd.Did,cast(jyd.Did as varchar(50)) as tid,ch.khdm as cus_no,cus.cus_name,ch.djbh as CH01,
jy.djbh as JY_no ,jyd.ddh as cmx03,jyd.sx as cmx04 ,jyd.dj1 as cmx07 , ch.chrq as CH_da  ,ch.bb as dol_no,
jyd.je as cmx31 ,jyd.shje as Rec_amt ,jyd.wsje as dis_amt ,ch.ysrq as YS_da, jyd.zms as JY_qty ,chd.fph as cmx30 from gyl_ck_hwjydD jyd
left join gyl_ck_hwjyd jy on jy.djbh=jyd.djbh
left join gyl_yw_chtzd ch on jy.chdh=ch.djbh
left join gyl_yw_chtzdD chd on ch.djbh=chd.djbh and jyd.ddh=chd.ddh and jyd.sx=chd.sx and jyd.dj1=chd.dj --===待修改部分 ===
left join Ebasic_bcus cus on ch.khdm=cus.cus_no 
where (isnull(jyd.CloseOut,'N')='N' OR CloseOut='')
--left join(select fauto_no,Flags from Ewf_Process_fn('gyl_yw_chtzd')) p on p.fauto_no=ch.djbh   
--WHERE (p.Flags=3) and isnull(jyd.CloseOut,'N')='N'

UNION ALL    
  
SELECT id,a.op_no as tid,a.cus_no,a.cus_name,a.CH01,a.JY_no,a.cmx03,a.cmx04,a.cmx07,a.CH_da,  
       a.dol_no,a.all_money as cmx31,a.Rec_amt,a.dis_amt,a.YS_da,a.CH_qty as JY_qty,a.fp_no as cmx30 
      -- ,a.sale_name,a.group_no,ISNULL(remark,'其它') DType,'' dept_no  
 FROM  ZK_YSWHMX a WHERE isnull(a.CloseOut,'N')='N' and ISNULL(dis_amt,0)<>0   
union all
----其它应收
select a.id,a.djbh as tid ,a.khbh ,b.cus_name,'其他应收' as CH01,'' as JY_no,a.ddh,'' as cmx04,
'' as cmx07,a.djrq,a.hb,a.je,0 as Rec_amt,0 as dis_amt, '' as YS_da,a.sl,'' as fph from gyl_cw_qtys a
left join Ebasic_bcus b on a.khbh=b.cus_no


