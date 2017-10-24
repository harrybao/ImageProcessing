exec sp_helptext ZM_YSWC go
/*******************************************  
 CRATER: Fancy   
 DATE:   2013-09-16  
 RMARK:  SELECT * FROM ZM_YSWC  
*******************************************/
create view gyl_cw_yswcmx_V---已收未冲明细
as  
select CASE  WHEN ISNULL(C.CK_no,'')='' THEN  '<a href=RightBody.aspx?npg=newload&gid=gyl_cw_cskzyf&rev_no='''+e.rev_no+'''  target=''_blank''>'+e.rev_no+'</a>'  
             ELSE  '<a href=RightBody.aspx?gid=gyl_cw_cskzyf&CK_no='''+C.CK_no+'''&rev_no='''+e.rev_no+''' target=''_blank''>'+e.rev_no+'</a>' END  rev_no,  
       ISNULL(C.Adv_pay,e.prerev_amt) Adv_pay,e.rev_da,e.prerev_amt,com_no,e.Ent_date,o.othername,e.remark,e.dol_no,C.CK_no,e.sale_name,e.sale_no,e.emp_no emp_name, e.fir_user emp_no,  
       case when ISNULL(C.Adv_pay,e.prerev_amt)>0 then 'Y' else 'N' end as KC_YorN --是否有交运明细可冲  
from gyl_cw_skd e  LEFT JOIN gyl_cw_cskzy C ON E.rev_no=C.rev_no  
left join (select code,othername from Ebasic_other where otherid='skdlx') o on o.code=e.Deposit   
left join (select fauto_no,Flags from Ewf_Process_fn('gyl_cw_skd')) p on p.fauto_no=e.rev_no   
where p.Flags=3 AND Deposit<>'040' 
go

alter view gyl_cw_yswcmx_V
as
select CASE  WHEN ISNULL(C.CK_no,'')='' THEN  '<a href=RightBody.aspx?npg=newload&gid=gyl_cw_cskzyf&rev_no='''+e.rev_no+'''  target=''_blank''>'+e.rev_no+'</a>'  
             ELSE  '<a href=RightBody.aspx?gid=gyl_cw_cskzyf&CK_no='''+C.CK_no+'''&rev_no='''+e.rev_no+''' target=''_blank''>'+e.rev_no+'</a>' END  rev_no,  
       ISNULL(C.Adv_pay,e.Adv_pay) Adv_pay,e.rev_da,e.prerev_amt,com_no,e.Ent_date,e.Deposit, o.othername,e.remark,e.dol_no,C.CK_no,e.sale_name,e.sale_no,e.emp_no emp_name, e.fir_user emp_no  
       --,case when ISNULL(C.Adv_pay,e.prerev_amt)>0 then 'Y' else 'N' end as KC_YorN --是否有交运明细可冲  
from gyl_cw_skd e  LEFT JOIN gyl_cw_cskzy C ON E.rev_no=C.rev_no  
left join (select code,othername from Ebasic_other where otherid='skdlx') o on o.code=e.Deposit   
left join (select fauto_no,Flags from Ewf_Process_fn('gyl_cw_skd')) p on p.fauto_no=e.rev_no   
where p.Flags=3 AND Deposit<>'040' and isnull(ckd,'')=''
go


-------------------------------------------------------------------------------原来单










ALTER view [dbo].[ZM_YSWC]  
as  
select CASE  WHEN ISNULL(C.CK_no,'')='' THEN  '<a href=RightBody.aspx?npg=newload&gid=gyl_cw_cskzyf&rev_no='''+e.rev_no+'''  target=''_blank''>'+e.rev_no+'</a>'  
             ELSE  '<a href=RightBody.aspx?gid=gyl_cw_cskzyf&CK_no='''+C.CK_no+'''&rev_no='''+e.rev_no+''' target=''_blank''>'+e.rev_no+'</a>' END  rev_no,  
       ISNULL(C.Adv_pay,e.prerev_amt) Adv_pay,e.rev_da,e.prerev_amt,com_no,e.Ent_date,o.othername,e.remark,e.dol_no,C.CK_no,e.sale_name,e.sale_no,e.dept_no,e.emp_no emp_name, e.fir_user emp_no,  
       case when ISNULL(C.Adv_pay,e.prerev_amt)>0 then 'Y' else 'N' end as KC_YorN --是否有交运明细可冲  
from Efnc_prerev e  LEFT JOIN gyl_cw_cskzy C ON E.rev_no=C.rev_no  
left join (select code,othername from Ebasic_other where otherid='skdlx') o on o.code=e.Deposit   
left join (select fauto_no,Flags from Ewf_Process_fn('Efnc_prerev')) p on p.fauto_no=e.rev_no   
where p.Flags=3 AND Deposit<>'040' AND ISNULL(E.dept_no,'')<>'W'  
  
UNION ALL  
  
SELECT CASE  WHEN ISNULL(C.CK_no,'')='' THEN  '<a href=RightBody.aspx?npg=newload&gid=gyl_cw_cskzyf&rev_no='''+T.ComplaintNo+'''  target=''_blank''>'+T.ComplaintNo+'</a>'  
             ELSE  '<a href=RightBody.aspx?gid=gyl_cw_cskzyf&CK_no='''+C.CK_no+'''&rev_no='''+T.ComplaintNo+''' target=''_blank''>'+T.ComplaintNo+'</a>' END  rev_no,  
       T.dis_amt Adv_pay, T.CH_da  rev_da,T.cmx31 prerev_amt,T.cus_no com_no,T.CH_da Ent_date,T.DType othername,NULL remark,T.dol_no,C.CK_no,T.sale_name,T.sale_no, '' dept_no,T.sale_name emp_name,T.sale_no emp_no,  
       case when T.dis_amt>0 then 'Y' else 'N' end as KC_YorN  
FROM (SELECT D.ID,K.NewNo  ComplaintNo,k.CustomerNo cus_no,bc.cus_name,K.ComplaintNo CH01,K.ComplaintNo JY_no,d.OrderNo cmx03,NULL cmx04,NULL cmx07, K.PreparedDate CH_da,  
       k.cmoney dol_no,isnull(k.fines_money,0) as cmx31,K.Rec_amt,ISNULL(dis_amt,fines_money) dis_amt,ISNULL(K.PreparedDate,P.ConfDate) YS_da,  
       K.C_Count JY_qty,NULL cmx30,f.emp_name sale_name,NULL group_no,'客诉' DType,k.PreparedBy sale_no  
FROM (SELECT ComplaintNo NewNo, ComplaintNo,CONVERT(VARCHAR(10),CW_DATE,120) PreparedDate,cmoney,crate,C_Count,tax_count,fines_money,sale_count,PreparedBy,CustomerNo,Rec_amt,dis_amt,Closeout FROM Ecc_Complain WHERE company_no='XM' UNION ALL   
      SELECT ComplaintNo NewNo,ComplaintNoOld ComplaintNo,zd_date PreparedDate,cmoney,crate,C_Count,tax_count,fines_money,sale_count,PreparedBy,CustomerNo,Rec_amt,dis_amt,Closeout FROM Ecc_Complained WHERE company_no='XM' )k  
left join (select * from (select ID,ComplaintNo,OrderNo, G_NAME ,ItemNo, row_number() over(partition by ComplaintNo order by ComplaintNo desc)  
           as sequence from Ecc_ComplainInfo ) a where sequence =1)d on k.ComplaintNo=d.ComplaintNo  
--left join crm_ORDER_ERP_detail od on  d.OrderNo=od.A_ORDER
  
left join Ebasic_bemp as f on f.emp_no=k.PreparedBy   
left join Ebasic_bcus as bc on bc.cus_no=k.CustomerNo  
join(select fauto_no,Flags,activeNodes,confdate from Ewf_Process_fn ('Customer_Complaint') WHERE Flags=3 ) p on p.fauto_no=k.ComplaintNo  
WHERE  K.PreparedDate>='2013-05-01'   
  
UNION ALL   
  
SELECT d.ID,K.NewNo Backprd_no,k.CustomerNo cus_no,bc.cus_name,k.Backprd_no CH01,k.Backprd_no JY_no,d.OrderNo cmx03,NULL cmx04,NULL cmx07,k.back_date CH_da,   
       k.Bmoney dol_no,isnull(k.TY_Money,0) as cmx31,Rec_amt,ISNULL(dis_amt,TY_Money) dis_amt,back_date  YS_da,  
       K.TY_Count JY_qty,NULL cmx30,k.emp_name sale_name,NULL group_no,'退运' DType,k.emp_no sale_no  
FROM (SELECT Backprd_no NewNo,Backprd_no,CONVERT(VARCHAR(10),CW_DATE,120) back_date,CustomerNo,emp_no,emp_name,Bmoney,Brate,TY_Count,Ttax_count,TY_Money,Tsale_count,Rec_amt,dis_amt,Closeout  FROM Ecc_backproduct WHERE company_no='XM' UNION ALL  
      SELECT Backprd_no NewNo,Backprd_noOld Backprd_no,back_date,CustomerNo,emp_no,emp_name,Bmoney,Brate,TY_Count,Ttax_count,TY_Money,Tsale_count,Rec_amt,dis_amt,Closeout FROM Ecc_backproducted WHERE company_no='XM'  ) k  
left join (select * from (select ID,Backprd_no,OrderNo,ItemNo,row_number() over(partition by Backprd_no order by Backprd_no desc) as sequence   
           from Ecc_backproductDetail ) a where sequence =1  ) d on k.Backprd_no=d.Backprd_no  
--left join crm_ORDER_ERP_detail od on  d.OrderNo=od.A_ORDER  
left join Ebasic_bcus as bc on bc.cus_no=k.CustomerNo  
join ( select fauto_no,Flags,activeNodes,ConfDate from Ewf_Process_fn('Customer_backproduct') WHERE Flags=3 ) p on p.fauto_no=k.Backprd_no  
WHERE  K.back_date>='2013-05-01') T  
LEFT JOIN gyl_cw_cskzy C ON T.ComplaintNo=C.rev_no  WHERE ISNULL(T.cmx31,0)>0  


/*ALTER view [dbo].[ZM_YSWC]  
as  
select CASE  WHEN ISNULL(C.CK_no,'')='' THEN  '<a href=RightBody.aspx?npg=newload&gid=ZK_cksopf&rev_no='''+e.rev_no+'''  target=''_blank''>'+e.rev_no+'</a>'  
             ELSE  '<a href=RightBody.aspx?gid=ZK_cksopf&CK_no='''+C.CK_no+'''&rev_no='''+e.rev_no+''' target=''_blank''>'+e.rev_no+'</a>' END  rev_no,  
       ISNULL(C.Adv_pay,e.prerev_amt) Adv_pay,e.rev_da,e.prerev_amt,com_no,e.Ent_date,o.othername,e.remark,e.dol_no,C.CK_no,e.sale_name,e.sale_no,e.dept_no,e.emp_no emp_name, e.fir_user emp_no,  
       case when ISNULL(C.Adv_pay,e.prerev_amt)>0 then 'Y' else 'N' end as KC_YorN --是否有交运明细可冲  
from Efnc_prerev e  LEFT JOIN gyl_cw_cskzy C ON E.rev_no=C.rev_no  
left join (select code,othername from Ebasic_other where otherid='skdlx') o on o.code=e.Deposit   
left join (select fauto_no,Flags from Ewf_Process_fn('Efnc_prerev')) p on p.fauto_no=e.rev_no   
where p.Flags=3 AND Deposit<>'040' AND ISNULL(E.dept_no,'')<>'W'  
  
UNION ALL  
  
SELECT CASE  WHEN ISNULL(C.CK_no,'')='' THEN  '<a href=RightBody.aspx?npg=newload&gid=ZK_cksopf&rev_no='''+T.ComplaintNo+'''  target=''_blank''>'+T.ComplaintNo+'</a>'  
             ELSE  '<a href=RightBody.aspx?gid=ZK_cksopf&CK_no='''+C.CK_no+'''&rev_no='''+T.ComplaintNo+''' target=''_blank''>'+T.ComplaintNo+'</a>' END  rev_no,  
       T.dis_amt Adv_pay, T.CH_da  rev_da,T.cmx31 prerev_amt,T.cus_no com_no,T.CH_da Ent_date,T.DType othername,NULL remark,T.dol_no,C.CK_no,T.sale_name,T.sale_no, '' dept_no,T.sale_name emp_name,T.sale_no emp_no,  
       case when T.dis_amt>0 then 'Y' else 'N' end as KC_YorN  
FROM (SELECT D.ID,K.NewNo  ComplaintNo,k.CustomerNo cus_no,bc.cus_name,K.ComplaintNo CH01,K.ComplaintNo JY_no,d.OrderNo cmx03,NULL cmx04,NULL cmx07, K.PreparedDate CH_da,  
       k.cmoney dol_no,isnull(k.fines_money,0) as cmx31,K.Rec_amt,ISNULL(dis_amt,fines_money) dis_amt,ISNULL(K.PreparedDate,P.ConfDate) YS_da,  
       K.C_Count JY_qty,NULL cmx30,f.emp_name sale_name,NULL group_no,'客诉' DType,k.PreparedBy sale_no  
FROM (SELECT ComplaintNo NewNo, ComplaintNo,CONVERT(VARCHAR(10),CW_DATE,120) PreparedDate,cmoney,crate,C_Count,tax_count,fines_money,sale_count,PreparedBy,CustomerNo,Rec_amt,dis_amt,Closeout FROM Ecc_Complain WHERE company_no='XM' UNION ALL   
      SELECT ComplaintNo NewNo,ComplaintNoOld ComplaintNo,zd_date PreparedDate,cmoney,crate,C_Count,tax_count,fines_money,sale_count,PreparedBy,CustomerNo,Rec_amt,dis_amt,Closeout FROM Ecc_Complained WHERE company_no='XM' )k  
left join (select * from (select ID,ComplaintNo,OrderNo, G_NAME ,ItemNo, row_number() over(partition by ComplaintNo order by ComplaintNo desc)  
           as sequence from Ecc_ComplainInfo ) a where sequence =1)d on k.ComplaintNo=d.ComplaintNo  
--left join crm_ORDER_ERP_detail od on  d.OrderNo=od.A_ORDER
  
left join Ebasic_bemp as f on f.emp_no=k.PreparedBy   
left join Ebasic_bcus as bc on bc.cus_no=k.CustomerNo  
join(select fauto_no,Flags,activeNodes,confdate from Ewf_Process_fn ('Customer_Complaint') WHERE Flags=3 ) p on p.fauto_no=k.ComplaintNo  
WHERE  K.PreparedDate>='2013-05-01'   
  
UNION ALL   
  
SELECT d.ID,K.NewNo Backprd_no,k.CustomerNo cus_no,bc.cus_name,k.Backprd_no CH01,k.Backprd_no JY_no,d.OrderNo cmx03,NULL cmx04,NULL cmx07,k.back_date CH_da,   
       k.Bmoney dol_no,isnull(k.TY_Money,0) as cmx31,Rec_amt,ISNULL(dis_amt,TY_Money) dis_amt,back_date  YS_da,  
       K.TY_Count JY_qty,NULL cmx30,k.emp_name sale_name,NULL group_no,'退运' DType,k.emp_no sale_no  
FROM (SELECT Backprd_no NewNo,Backprd_no,CONVERT(VARCHAR(10),CW_DATE,120) back_date,CustomerNo,emp_no,emp_name,Bmoney,Brate,TY_Count,Ttax_count,TY_Money,Tsale_count,Rec_amt,dis_amt,Closeout  FROM Ecc_backproduct WHERE company_no='XM' UNION ALL  
      SELECT Backprd_no NewNo,Backprd_noOld Backprd_no,back_date,CustomerNo,emp_no,emp_name,Bmoney,Brate,TY_Count,Ttax_count,TY_Money,Tsale_count,Rec_amt,dis_amt,Closeout FROM Ecc_backproducted WHERE company_no='XM'  ) k  
left join (select * from (select ID,Backprd_no,OrderNo,ItemNo,row_number() over(partition by Backprd_no order by Backprd_no desc) as sequence   
           from Ecc_backproductDetail ) a where sequence =1  ) d on k.Backprd_no=d.Backprd_no  
--left join crm_ORDER_ERP_detail od on  d.OrderNo=od.A_ORDER  
left join Ebasic_bcus as bc on bc.cus_no=k.CustomerNo  
join ( select fauto_no,Flags,activeNodes,ConfDate from Ewf_Process_fn('Customer_backproduct') WHERE Flags=3 ) p on p.fauto_no=k.Backprd_no  
WHERE  K.back_date>='2013-05-01') T  
LEFT JOIN Efnc_CSKop C ON T.ComplaintNo=C.rev_no  WHERE ISNULL(T.cmx31,0)>0  */
  