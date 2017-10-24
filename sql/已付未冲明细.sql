alter view gyl_cw_yfwcmx_V
as  
select CASE  WHEN ISNULL(C.CK_no,'')='' THEN  '<a href=RightBody.aspx?npg=newload&gid=gyl_cw_cfkzyf&fk_no='''+e.fk_no+'''  target=''_blank''>'+e.fk_no+'</a>'  
             ELSE  '<a href=RightBody.aspx?gid=gyl_cw_cfkzyf&CK_no='''+C.CK_no+'''&fk_no='''+e.fk_no+''' target=''_blank''>'+e.fk_no+'</a>' END  fk_no,  
       ISNULL(C.Adv_pay,e.prerev_amt) Adv_pay,e.fk_da,e.prerev_amt,com_no,e.Ent_date,e.Deposit, o.othername,e.remark,e.dol_no,C.CK_no,e.sale_name,e.sale_no,e.emp_no emp_name, e.fir_user emp_no 
       --,case when ISNULL(C.Adv_pay,e.prerev_amt)>0 then 'Y' else 'N' end as KC_YorN --是否有交运明细可冲  
from gyl_cw_fkd e  LEFT JOIN gyl_cw_cfkzy C ON E.fk_no=C.fk_no  
left join (select code,othername from Ebasic_other where otherid='cw_spay') o on o.code=e.Deposit   
left join (select fauto_no,Flags from Ewf_Process_fn('gyl_cw_fkd')) p on p.fauto_no=e.fk_no  
where p.Flags=3  and isnull(ckd,'')=''

use wintex