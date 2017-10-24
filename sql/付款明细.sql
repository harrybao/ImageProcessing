exec sp_helptext gyl_cw_fkmx go

alter view gyl_cw_fkmx  
as    
select A.fk_no,fk_da,o1.othername as FH_way,o2.othername as Rec_pay,Acc_name,b.vdr_name,a.Deposit,o3.othername as fklx,   
       Ent_date,a.dol_no,Cur_exc,rate,prerev_amt,A.Adv_pay,remark,a.group_no,com_no,a.sale_name,e.emp_no sale_no    
from gyl_cw_fkd a    
left join Ebasic_other o1 on a.FH_way=o1.code and o1.otherid='zkskfs'    
left join Ebasic_other o2 on a.Rec_pay=o2.code and o2.otherid='bank_type'  
left join Ebasic_other o3 on a.Deposit=o3.code and o3.otherid='cw_spay' 
left join Ebasic_bvdr b on a.com_no=b.vdr_no    
left join Ebasic_bemp e on a.sale_name=e.emp_name and e.dept_no IN('S','CS')    
left join(select fauto_no,Flags from Ewf_Process_fn('gyl_cw_fkd')) p on a.fk_no=p.fauto_no    
where p.Flags=3 --and CK.Adv_pay>0 