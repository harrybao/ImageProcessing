create TRIGGER gyl_cw_cskzy_trg ---����д�տ
ON gyl_cw_cskzy  
AFTER INSERT ,update,delete AS   
DECLARE @CK_NO VARCHAR(50),@cus_no varchar(50)      
SELECT @CK_NO=CK_no,@cus_no=cus_no FROM inserted 
begin 
   update gyl_cw_skd set ckd=@CK_NO where com_no=@cus_no
end 
go
----�������Ǹ����д����
create TRIGGER gyl_cw_cfkzy_trg ---����д�տ
ON gyl_cw_cfkzy  
AFTER INSERT ,update,delete AS   
DECLARE @CK_NO VARCHAR(50),@cus_no varchar(50)      
SELECT @CK_NO=CK_no,@cus_no=cus_no FROM inserted 
begin 
   update gyl_cw_fkd set ckd=@CK_NO where com_no=@cus_no
end 
go