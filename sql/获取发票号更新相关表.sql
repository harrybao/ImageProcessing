exec sp_helptext Crm_CHMX_Insert_Erp1 
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: 应收款维护  
-- exec [dbo].[Crm_CHMX_Insert_Erp] '112','2','12345'  
-- exec [dbo].[Crm_CHMX_Insert_Erp] '出货单号','订单号','发票号'  
-- =============================================  
alter PROCEDURE [dbo].[Crm_CHMX_Insert_Erp1] @id varchar(20),@text varchar(30)  
AS  
BEGIN  
 UPDATE gyl_ck_hwjydD set fph=@text,kpsj=GETDATE() where Rtrim(Did)=@id --and cmx30 is null  
 update Efnc_prerevm set cmx30=@text where Rtrim(tid)=@id  
 update Efnc_CSKopDetail set cmx30=@text where Rtrim(tid)=@id  
END 


CREATE PROCEDURE [dbo].[Crm_CHMX_Insert_Erp1_Old] @id varchar(20),@text varchar(30)  
AS  
BEGIN  
 UPDATE Crm_JYDetail set cmx30=@text,kf_da=GETDATE() where Rtrim(id)=@id --and cmx30 is null  
 update Efnc_prerevm set cmx30=@text where Rtrim(tid)=@id  
 update Efnc_CSKopDetail set cmx30=@text where Rtrim(tid)=@id  
END 

select * from Efnc_CSKopDetail where ch01='CHTZ1709140002'-- where ck_no='CK17100032'
select * from Efnc_prerevm --where rev_no='CK17100032'
select a.tid,a.CH01,a.jy_no as JY_no,a.cmx03,a.cmx04,a.cmx07,a.ch03 as CH_da,a.CX27 as dol_no,a.cmx38 as cmx31,a.Rec_amt,a.dis_amt,a.Acc_days as YS_da,a.cmx05 as JY_qty,a.cmx30 from Efnc_prerevm a where a.rev_no='CK17100032' and isnull(a.Closeout,'N')='N' and a.dis_amt<>0