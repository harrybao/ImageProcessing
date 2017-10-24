create TRIGGER gyl_cw_cfkzyD_trg ---插入冲收款作业细档，回写货物交运单，应收款维护触发器
ON gyl_cw_cfkzyD  
AFTER INSERT,UPDATE,DELETE AS   
DECLARE @ID INT,@CH01 VARCHAR(20),@tid  VARCHAR(50),@CK_NO VARCHAR(20),  
        @Rec_amt decimal(15,3), @dis_amt decimal(15,3),@CloseOut VARCHAR(10)  
SELECT @ID=id,@CH01=CH01,@Rec_amt=ISNULL(Rec_amt,0),@dis_amt=ISNULL(dis_amt,0),@tid=tid,  
      @CloseOut=CASE WHEN ISNULL(dis_amt,0)=0 THEN 'Y' ELSE 'N' END FROM inserted  
 ---插入操作        
IF exists(select * from inserted) and (not exists(select * from deleted))  
  BEGIN  
   UPDATE gyl_ck_cgshrkdD SET CloseOut=@CloseOut,yfje=@Rec_amt,wfje=@dis_amt WHERE djbh=@CH01 and CAST(Did AS VARCHAR(50))=@tid  
   UPDATE gyl_ck_wwshrkdD SET CloseOut=@CloseOut,yfje=@Rec_amt,wfje=@dis_amt WHERE djbh=@CH01 and CAST(Did AS VARCHAR(50))=@tid  
   
  END  
   ----修改操作      
ELSE IF (exists(select * from inserted))  and (exists(select * from deleted))   
BEGIN   
   UPDATE gyl_ck_cgshrkdD SET CloseOut=@CloseOut,yfje=@Rec_amt,wfje=@dis_amt WHERE djbh=@CH01 and CAST(Did AS VARCHAR(50))=@tid  
   UPDATE gyl_ck_wwshrkdD SET CloseOut=@CloseOut,yfje=@Rec_amt,wfje=@dis_amt WHERE djbh=@CH01 and CAST(Did AS VARCHAR(50))=@tid   
   
END  ----删除操作
ELSE IF (exists(select * from deleted)) and (not exists (select  * from inserted))  
BEGIN  
   SELECT @ID=id,@CH01=CH01,@Rec_amt=ISNULL(fc_amt,0),@dis_amt=ISNULL(dis_amt,0),@tid=tid,@CK_NO=CK_no,  
          @CloseOut=CASE WHEN ISNULL(Rec_amt,0)>0 OR ISNULL(dis_amt,0)>0 THEN 'N' ELSE 'Y' END FROM deleted  
   UPDATE gyl_ck_cgshrkdD SET CloseOut=@CloseOut,yfje=yfje-@Rec_amt,wfje=wfje+@Rec_amt WHERE djbh=@CH01 and CAST(Did AS VARCHAR(50))=@tid  
   UPDATE gyl_ck_wwshrkdD SET CloseOut=@CloseOut,yfje=yfje-@Rec_amt,wfje=wfje+@Rec_amt WHERE djbh=@CH01 and CAST(Did AS VARCHAR(50))=@tid  
   UPDATE gyl_cw_cfkzy   SET Adv_pay=Adv_pay+@Rec_amt WHERE CK_no=@CK_NO  
  
END  
