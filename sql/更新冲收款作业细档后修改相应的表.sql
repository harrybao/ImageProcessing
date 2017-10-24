alter TRIGGER gyl_cw_cskzyD_TRG ---插入冲收款作业细档，回写货物交运单，应收款维护触发器
ON gyl_cw_cskzyD  
AFTER INSERT,UPDATE,DELETE AS   
DECLARE @ID INT,@JY_NO VARCHAR(20),@CH01 VARCHAR(20),@tid  VARCHAR(50),@CK_NO VARCHAR(20),  
        @Rec_amt decimal(15,3), @dis_amt decimal(15,3),@CloseOut VARCHAR(10)  
SELECT @ID=id,@JY_NO=JY_no,@CH01=CH01,@Rec_amt=ISNULL(Rec_amt,0),@dis_amt=ISNULL(dis_amt,0),@tid=tid,  
      @CloseOut=CASE WHEN ISNULL(dis_amt,0)=0 THEN 'Y' ELSE 'N' END FROM inserted  
 ---插入操作        
IF exists(select * from inserted) and (not exists(select * from deleted))  
  BEGIN  
   UPDATE gyl_ck_hwjydD SET CloseOut=@CloseOut,shje=@Rec_amt,wsje=@dis_amt WHERE djbh=@JY_no and CAST(Did AS VARCHAR(50))=@tid  
   UPDATE ZK_YSWHMX    SET Closeout=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE JY_no=@JY_no  
   
  END  
   ----修改操作      
ELSE IF (exists(select * from inserted))  and (exists(select * from deleted))   
BEGIN   
   UPDATE gyl_ck_hwjydD SET CloseOut=@CloseOut,shje=@Rec_amt,wsje=@dis_amt WHERE djbh=@JY_no and CAST(Did AS VARCHAR(50))=@tid  
   UPDATE ZK_YSWHMX    SET Closeout=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE JY_no=@JY_no  
   
END  ----删除操作
ELSE IF (exists(select * from deleted)) and (not exists (select  * from inserted))  
BEGIN  
   SELECT @ID=id,@JY_NO=JY_no,@CH01=CH01,@Rec_amt=ISNULL(fc_amt,0),@dis_amt=ISNULL(dis_amt,0),@tid=tid,@CK_NO=CK_no,  
          @CloseOut=CASE WHEN ISNULL(Rec_amt,0)>0 OR ISNULL(dis_amt,0)>0 THEN 'N' ELSE 'Y' END FROM deleted  
   UPDATE gyl_ck_hwjydD SET CloseOut=@CloseOut,shje=shje-@Rec_amt,wsje=wsje+@Rec_amt WHERE djbh=@JY_no and CAST(Did AS VARCHAR(50))=@tid  
   UPDATE ZK_YSWHMX    SET Closeout=@CloseOut,Rec_amt=Rec_amt-@Rec_amt,dis_amt=dis_amt+@Rec_amt WHERE JY_no=@JY_no  
   UPDATE gyl_cw_cskzy   SET Adv_pay=Adv_pay+@Rec_amt WHERE CK_no=@CK_NO  
  
END  

--冲款作业主档
alter TRIGGER Trg_gyl_cw_cskzy
   ON gyl_cw_cskzy
   AFTER UPDATE,INSERT
AS 
BEGIN 
	DECLARE @rev_no varchar(20),@CK_no varchar(20),@Adv_pay DECIMAL(15,3),@SH_way varchar(50)
	       ,@CloseOut VARCHAR(10),@prerev_amt DECIMAL(15,3)	            
	SELECT  @CK_no =CK_no,@rev_no=rev_no,@Adv_pay=ISNULL(Adv_pay,0),@SH_way=SH_way,@prerev_amt=prerev_amt from inserted 
	SET @CloseOut=CASE WHEN @Adv_pay=0 THEN 'Y' ELSE 'N' END
    IF @SH_way='客诉'
      BEGIN 
        UPDATE Ecc_Complain SET Closeout=@CloseOut,Rec_amt=@prerev_amt-@Adv_pay,dis_amt=@Adv_pay WHERE ComplaintNo=@rev_no
      END
    ELSE IF @SH_way='退运'
      BEGIN 
        UPDATE Ecc_backproduct SET Closeout=@CloseOut,Rec_amt=@prerev_amt-@Adv_pay,dis_amt=@Adv_pay WHERE Backprd_no=@rev_no
      END
    ELSE
      BEGIN
        UPDATE gyl_cw_skd set Adv_pay=@Adv_pay where Rtrim(rev_no)=@rev_no
      END
END
GO
--======================================================================================
--====================================================================================
---------原来写的内容-----------------------------
exec sp_helptext Efnc_CSKopDetail_TRG
  
-- =============================================  
-- Author:  <Fancy>  
-- Create date: <2013-05-24>  
-- Description: <财务帐款管理冲款明细>  
-- =============================================  
CREATE TRIGGER [dbo].[Efnc_CSKopDetail_TRG]  ---插入冲收款作业细档，回写货物交运单，应收款维护触发器
ON [dbo].[Efnc_CSKopDetail]  
AFTER INSERT,UPDATE,DELETE AS  
  
DECLARE @ID INT,@JY_NO VARCHAR(20),@CH01 VARCHAR(20),@tid  VARCHAR(50),@CK_NO VARCHAR(20),  
        @Rec_amt decimal(18,2), @dis_amt decimal(18,2),@CloseOut VARCHAR(10)  
SELECT @ID=id,@JY_NO=JY_no,@CH01=CH01,@Rec_amt=ISNULL(Rec_amt,0),@dis_amt=ISNULL(dis_amt,0),@tid=tid,  
      @CloseOut=CASE WHEN ISNULL(dis_amt,0)=0 THEN 'Y' ELSE 'N' END FROM inserted  
 ---插入操作        
IF exists(select * from inserted) and (not exists(select * from deleted))  
  BEGIN  
   UPDATE Crm_JYDetail SET CloseOut=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE JY_no=@JY_no and CAST(id AS VARCHAR(50))=@tid  
   UPDATE Efnc_prerev  SET Adv_pay=@dis_amt WHERE rev_no=@CH01 AND Deposit='040'  
   UPDATE Efnc_prerevm SET CloseOut=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE CH01=@CH01 and CAST(tid AS VARCHAR(50))=@tid  
   UPDATE ZK_YSWHMX    SET Closeout=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE JY_no=@JY_no  
   --UPDATE Ecc_Complain SET Closeout=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE ComplaintNo=@CH01  
   --UPDATE Ecc_backproduct SET  Closeout=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE Backprd_no=@CH01  
  END  
   ----修改操作      
ELSE IF (exists(select * from inserted))  and (exists(select * from deleted))   
BEGIN   
   UPDATE Crm_JYDetail SET CloseOut=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE JY_no=@JY_no and CAST(id AS VARCHAR(50))=@tid  
   UPDATE Efnc_prerev  SET Adv_pay=@dis_amt WHERE rev_no=@CH01 AND Deposit='040'  
   UPDATE Efnc_prerevm SET CloseOut=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE CH01=@CH01 and CAST(tid AS VARCHAR(50))=@tid  
   UPDATE ZK_YSWHMX    SET Closeout=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE JY_no=@JY_no  
   --UPDATE Ecc_Complain SET Closeout=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE ComplaintNo=@CH01  
   --UPDATE Ecc_backproduct SET Closeout=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE Backprd_no=@CH01  
END  ----删除操作
ELSE IF (exists(select * from deleted)) and (not exists (select  * from inserted))  
BEGIN  
   SELECT @ID=id,@JY_NO=JY_no,@CH01=CH01,@Rec_amt=ISNULL(fc_amt,0),@dis_amt=ISNULL(dis_amt,0),@tid=tid,@CK_NO=CK_no,  
          @CloseOut=CASE WHEN ISNULL(Rec_amt,0)>0 OR ISNULL(dis_amt,0)>0 THEN 'N' ELSE 'Y' END FROM deleted  
   UPDATE Crm_JYDetail SET CloseOut=@CloseOut,Rec_amt=Rec_amt-@Rec_amt,dis_amt=dis_amt+@Rec_amt WHERE JY_no=@JY_no and CAST(id AS VARCHAR(50))=@tid  
   UPDATE Efnc_prerev  SET Adv_pay=Adv_pay+@Rec_amt WHERE rev_no=@CH01 AND Deposit='040'  
   UPDATE Efnc_prerevm SET CloseOut=@CloseOut,Rec_amt=Rec_amt-@Rec_amt,dis_amt=dis_amt+@Rec_amt WHERE CH01=@CH01 and CAST(tid AS VARCHAR(50))=@tid  
   UPDATE ZK_YSWHMX    SET Closeout=@CloseOut,Rec_amt=Rec_amt-@Rec_amt,dis_amt=dis_amt+@Rec_amt WHERE JY_no=@JY_no  
   UPDATE Efnc_CSKop   SET Adv_pay=Adv_pay+@Rec_amt WHERE CK_no=@CK_NO  
   --UPDATE Ecc_Complain SET Closeout=@CloseOut,Rec_amt=Rec_amt-@Rec_amt,dis_amt=dis_amt+@Rec_amt WHERE ComplaintNo=@CH01  
   --UPDATE Ecc_backproduct SET Closeout=@CloseOut,Rec_amt=Rec_amt-@Rec_amt,dis_amt=dis_amt+@Rec_amt WHERE Backprd_no=@CH01   
END  

   
  
ALTER TRIGGER [dbo].[Efnc_CSKopDetail_TRG]  
ON [dbo].[Efnc_CSKopDetail]  
AFTER INSERT,UPDATE,DELETE AS  
  
DECLARE @ID INT,@JY_NO VARCHAR(20),@CH01 VARCHAR(20),@tid  VARCHAR(50),@CK_NO VARCHAR(20),  
        @Rec_amt decimal(18,2), @dis_amt decimal(18,2),@CloseOut VARCHAR(10)  
SELECT @ID=id,@JY_NO=JY_no,@CH01=CH01,@Rec_amt=ISNULL(Rec_amt,0),@dis_amt=ISNULL(dis_amt,0),@tid=tid,  
      @CloseOut=CASE WHEN ISNULL(dis_amt,0)=0 THEN 'Y' ELSE 'N' END FROM inserted  
 ---插入操作        
IF exists(select * from inserted) and (not exists(select * from deleted))  
  BEGIN  
   UPDATE gyl_ck_hwjydD SET CloseOut=@CloseOut,shje=@Rec_amt,wsje=@dis_amt WHERE djbh=@JY_no and CAST(Did AS VARCHAR(50))=@tid  
   UPDATE Efnc_prerev  SET Adv_pay=@dis_amt WHERE rev_no=@CH01 AND Deposit='040'  
   UPDATE Efnc_prerevm SET CloseOut=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE CH01=@CH01 and CAST(tid AS VARCHAR(50))=@tid  
   UPDATE ZK_YSWHMX    SET Closeout=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE JY_no=@JY_no  
   
  END  
   ----修改操作      
ELSE IF (exists(select * from inserted))  and (exists(select * from deleted))   
BEGIN   
   UPDATE gyl_ck_hwjydD SET CloseOut=@CloseOut,shje=@Rec_amt,wsje=@dis_amt WHERE djbh=@JY_no and CAST(Did AS VARCHAR(50))=@tid  
   UPDATE Efnc_prerev  SET Adv_pay=@dis_amt WHERE rev_no=@CH01 AND Deposit='040'  
   UPDATE Efnc_prerevm SET CloseOut=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE CH01=@CH01 and CAST(tid AS VARCHAR(50))=@tid  
   UPDATE ZK_YSWHMX    SET Closeout=@CloseOut,Rec_amt=@Rec_amt,dis_amt=@dis_amt WHERE JY_no=@JY_no  
   
END  ----删除操作
ELSE IF (exists(select * from deleted)) and (not exists (select  * from inserted))  
BEGIN  
   SELECT @ID=id,@JY_NO=JY_no,@CH01=CH01,@Rec_amt=ISNULL(fc_amt,0),@dis_amt=ISNULL(dis_amt,0),@tid=tid,@CK_NO=CK_no,  
          @CloseOut=CASE WHEN ISNULL(Rec_amt,0)>0 OR ISNULL(dis_amt,0)>0 THEN 'N' ELSE 'Y' END FROM deleted  
   UPDATE gyl_ck_hwjydD SET CloseOut=@CloseOut,shje=shje-@Rec_amt,wsje=wsje+@Rec_amt WHERE djbh=@JY_no and CAST(Did AS VARCHAR(50))=@tid  
   UPDATE Efnc_prerev  SET Adv_pay=Adv_pay+@Rec_amt WHERE rev_no=@CH01 AND Deposit='040'  
   UPDATE Efnc_prerevm SET CloseOut=@CloseOut,Rec_amt=Rec_amt-@Rec_amt,dis_amt=dis_amt+@Rec_amt WHERE CH01=@CH01 and CAST(tid AS VARCHAR(50))=@tid  
   UPDATE ZK_YSWHMX    SET Closeout=@CloseOut,Rec_amt=Rec_amt-@Rec_amt,dis_amt=dis_amt+@Rec_amt WHERE JY_no=@JY_no  
   UPDATE Efnc_CSKop   SET Adv_pay=Adv_pay+@Rec_amt WHERE CK_no=@CK_NO  
  
END  