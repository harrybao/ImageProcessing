create TRIGGER gyl_cw_cskzy_trg ---冲款单回写收款单
ON gyl_cw_cskzy  
AFTER INSERT ,update,delete AS   
DECLARE @CK_NO VARCHAR(50),@cus_no varchar(50)      
SELECT @CK_NO=CK_no,@cus_no=cus_no FROM inserted 
begin 
   update gyl_cw_skd set ckd=@CK_NO where com_no=@cus_no
end 
go
----冲销后标记付款单回写冲款单号
create TRIGGER gyl_cw_cfkzy_trg ---冲款单回写收款单
ON gyl_cw_cfkzy  
AFTER INSERT ,update,delete AS   
DECLARE @CK_NO VARCHAR(50),@cus_no varchar(50)      
SELECT @CK_NO=CK_no,@cus_no=cus_no FROM inserted 
begin 
   update gyl_cw_fkd set ckd=@CK_NO where com_no=@cus_no
end 
go