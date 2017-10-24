alter view gyl_cw_skmx
as  
select A.rev_no,rev_da,o1.othername as SH_way,o2.othername as Rec_pay,Acc_name,b.cus_name,a.Deposit,o3.othername as Depositname,  
       Ent_date,a.dol_no,Cur_exc,rate,prerev_amt,A.Adv_pay,remark,a.group_no,com_no,a.sale_name,e.emp_no sale_no  
from gyl_cw_skd a  
left join Ebasic_other o1 on a.SH_way=o1.code and o1.otherid='zkskfs'  
left join Ebasic_other o2 on a.Rec_pay=o2.code and o2.otherid='bank_type' 
left join Ebasic_other o3 on a.Deposit=o3.code and o3.otherid='skdlx'
left join Ebasic_bcus b on a.com_no=b.cus_no  
left join Ebasic_bemp e on a.sale_name=e.emp_name and e.dept_no IN('S','CS')  
left join(select fauto_no,Flags from Ewf_Process_fn('gyl_cw_skd')) p on a.rev_no=p.fauto_no  
where p.Flags=3 --and CK.Adv_pay>0 



---------------------------------本视图未用-----------------------
UNION ALL   
SELECT T.ComplaintNo rev_no,T.CH_da rev_da,T.DType Rec_pay,NULL Rec_pay,NULL Acc_name,T.cus_name,T.CH_da Ent_date,  
       T.dol_no,T.dol_no Cur_exc,1 rate,T.cmx31 prerev_amt,T.dis_amt Adv_pay,DType remark,T.group_no,T.cus_no com_no,T.sale_name,T.sale_no    FROM   
(SELECT D.ID,K.NewNo ComplaintNo,k.CustomerNo cus_no,bc.cus_name,K.ComplaintNo CH01,K.ComplaintNo JY_no,d.OrderNo cmx03,NULL cmx04,NULL cmx07, K.PreparedDate CH_da,  
       k.cmoney dol_no,isnull(k.fines_money,0) as cmx31,K.Rec_amt,ISNULL(dis_amt,fines_money) dis_amt,ISNULL(K.PreparedDate,P.ConfDate) YS_da,  
       K.C_Count JY_qty,NULL cmx30,f.emp_name sale_name,od.group_no,'客诉' DType,k.PreparedBy sale_no  
FROM (SELECT ComplaintNo NewNo, ComplaintNo,CONVERT(VARCHAR(10),CW_DATE,120) PreparedDate,cmoney,crate,C_Count,tax_count,fines_money,sale_count,PreparedBy,CustomerNo,Rec_amt,dis_amt,Closeout FROM Ecc_Complain WHERE company_no='XM' UNION ALL   
      SELECT ComplaintNo NewNo,ComplaintNoOld ComplaintNo,zd_date PreparedDate,cmoney,crate,C_Count,tax_count,fines_money,sale_count,PreparedBy,CustomerNo,Rec_amt,dis_amt,Closeout FROM Ecc_Complained WHERE company_no='XM' )k  
left join (select * from (select ID,ComplaintNo,OrderNo, G_NAME ,ItemNo, row_number() over(partition by ComplaintNo order by ComplaintNo desc)  
           as sequence from Ecc_ComplainInfo ) a where sequence =1)d on k.ComplaintNo=d.ComplaintNo  
left join crm_ORDER_ERP_detail od on  d.OrderNo=od.A_ORDER  
left join Ebasic_bemp as f on f.emp_no=k.PreparedBy   
left join Ebasic_bcus as bc on bc.cus_no=k.CustomerNo  
join(select fauto_no,Flags,activeNodes,confdate from Ewf_Process_fn('Customer_Complaint') where Flags=3 ) p on p.fauto_no=k.ComplaintNo  
WHERE ISNULL(k.Closeout,'N')='N' AND K.PreparedDate>='2013-05-01'  
  
UNION ALL   
  
SELECT d.ID,k.Backprd_no,k.CustomerNo cus_no,bc.cus_name,k.Backprd_no CH01,k.Backprd_no JY_no,d.OrderNo cmx03,NULL cmx04,NULL cmx07,k.back_date CH_da,   
       k.Bmoney dol_no,isnull(k.TY_Money,0) as cmx31,Rec_amt,ISNULL(dis_amt,TY_Money) dis_amt,back_date  YS_da,  
       K.TY_Count JY_qty,NULL cmx30,f.emp_name sale_name,od.group_no,'退运' DType,k.CustomerNo sale_no  
FROM (SELECT Backprd_no NewNo,Backprd_no,CONVERT(VARCHAR(10),CW_DATE,120) back_date,CustomerNo,emp_name,Bmoney,Brate,TY_Count,Ttax_count,TY_Money,Tsale_count,Rec_amt,dis_amt,Closeout  FROM Ecc_backproduct WHERE company_no='XM' UNION ALL  
      SELECT Backprd_no NewNo,Backprd_noOld Backprd_no,back_date,CustomerNo,emp_name,Bmoney,Brate,TY_Count,Ttax_count,TY_Money,Tsale_count,Rec_amt,dis_amt,Closeout FROM Ecc_backproducted WHERE company_no='XM'  ) k  
left join (select * from (select ID,Backprd_no,OrderNo,ItemNo,row_number() over(partition by Backprd_no order by Backprd_no desc) as sequence   
           from Ecc_backproductDetail ) a where sequence =1  ) d on k.Backprd_no=d.Backprd_no  
left join crm_ORDER_ERP_detail od on  d.OrderNo=od.A_ORDER  
left join Ebasic_bcus as bc on bc.cus_no=k.CustomerNo  
left join Ebasic_bemp as f on f.emp_name=k.emp_name   
join ( select fauto_no,Flags,activeNodes,ConfDate from Ewf_Process_fn('Customer_backproduct') where Flags=3 ) p on p.fauto_no=k.Backprd_no  
WHERE ISNULL(k.Closeout,'N')='N' AND  K.back_date>='2013-05-01') T  
WHERE ISNULL(T.dis_amt,0)>0  
GO


-------付款明细
create view gyl_cw_fkmx
as  
select A.fk_no,fk_da,o1.othername as FH_way,o2.othername as Rec_pay,Acc_name,b.vdr_name,  
       Ent_date,a.dol_no,Cur_exc,rate,prerev_amt,A.Adv_pay,remark,a.group_no,com_no,a.sale_name,e.emp_no sale_no  
from gyl_cw_fkd a  
left join Ebasic_other o1 on a.FH_way=o1.code and o1.otherid='zkskfs'  
left join Ebasic_other o2 on a.Rec_pay=o2.code and o2.otherid='bank_type' 
left join Ebasic_bvdr b on a.com_no=b.vdr_no  
left join Ebasic_bemp e on a.sale_name=e.emp_name and e.dept_no IN('S','CS')  
left join(select fauto_no,Flags from Ewf_Process_fn('gyl_cw_fkd')) p on a.fk_no=p.fauto_no  
where p.Flags=3 --and CK.Adv_pay>0 