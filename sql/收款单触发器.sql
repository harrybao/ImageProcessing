/*===================================================
 Author  	: Fancy
 Create date: 2013-05-24
 Description: 修改记录
 测试数据: 该触发器主要更新收款单余额,如果余额
           为0,还有未冲款的明细,将会在本单上面删除
 ====================================================*/
CREATE TRIGGER trg_gyl_cw_skd
   ON gyl_cw_skd
   AFTER UPDATE,INSERT
AS 
BEGIN 
	DECLARE @rev_no varchar(20),@CK_no varchar(20),@Adv_pay DECIMAL(18,2),@SH_way varchar(50)
	       ,@CloseOut VARCHAR(10),@prerev_amt DECIMAL(18,2),@newprerev_amt DECIMAL(18,2),@oldprerev_amt DECIMAL(18,2)	
	       ,@lasuser varchar(20)            
	SELECT  @rev_no=rev_no,@SH_way=SH_way,@newprerev_amt=prerev_amt,@lasuser=las_user from inserted  
	select @oldprerev_amt=prerev_amt from deleted
	IF EXISTS (SELECT * FROM Efnc_CSKop WHERE rev_no=@rev_no)
	 BEGIN
	 SELECT  @Adv_pay=ISNULL(Adv_pay,0),@CK_no=CK_no,@prerev_amt=ISNULL(prerev_amt,0)  FROM gyl_cw_cskzy WHERE rev_no=@rev_no
      IF(@prerev_amt=@Adv_pay AND @newprerev_amt<>@prerev_amt)
        BEGIN 
          UPDATE gyl_cw_cskzy SET prerev_amt=@newprerev_amt,Adv_pay=@newprerev_amt WHERE CK_no=@CK_no
        END
    END
END
GO




