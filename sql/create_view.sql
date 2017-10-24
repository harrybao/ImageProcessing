------用户报表视图_1use demo
create view test_zgr_Usertb_V
as 
select tb.userid,tb.userName,tb.Birthday,tb.BirthPlace,tb.Education,tb.Email,
tb.EntranceTime,tb.Gender,tb.Hobby,tb.HomeAddress,tb.IDNumber,tb.PhoneNumber,
tb.Nation,tb.UnAddress,tb.University,tb1.healthDate,tb1.healthHeight,
tb1.healthWeight,tb1.healthVision
from test_zgr_Usertb tb left join test_zgr_UsertbD tb1
on tb.userid=tb1.userid
go 
-------用户报表视图_2
create view test_zgr_Usertb_V2
as 
select tb.userid,tb.userName,tb.Birthday,tb.BirthPlace,tb.Education,tb.Email,
tb.EntranceTime,etb.othername,tb.Hobby,tb.HomeAddress,tb.IDNumber,tb.PhoneNumber,
tb.Nation,tb.UnAddress,tb.University,tb2.FamilyCall,tb2.FamilyCompanyPhone,
tb2.FamilyName,tb2.FamilyPhone,tb2.FamilyWorkUnit
from test_zgr_Usertb tb left join test_zgr_UsertbD2 tb2
on tb.userid = tb2.userid right join Ebasic_other etb 
on tb.Gender in(select code from Ebasic_other where otherid='SEX')
go
-------销售订单视图_2
create view test_zgr_Saletb_V2 as
select top 10 b.SaleId,b.SaleDate,b.Currency,payMode,b.CustomFullName,b.ShipMode,
 sum(tb.Amount) as 总金额 from test_zgr_Saletb b, test_zgr_SaletbD  tb where 
b.SaleId=tb.SaleId group by b.SaleId,b.SaleDate,PayMode,b.CustomFullName,
b.Currency,b.ShipMode order by b.Currency
go

-------销售订单视图_1
create view test_zgr_Saletb_V
as 
select  s.SaleId,s.SaleDate,s.ArriveCountry,s.CompanyName,s.ContFax,s.ContName,
s.ContTel,s.Currency,s.CustomAdd,s.CustomConId,s.CustomDate,s.CustomeName,
s.CustomFullName,s.CustomId,s.DeliveryDate,s.EndHarbor,s.ExchangeRate,s.OfferId,
s.PayMode,s.ShipMode,sd.Amount,sd.Discount,sd.Discountmoney,
sd.GoodsColor,sd.GoodsId,sd.GoodsNameCn,sd.GoodsNameEn,sd.GoodsPrice,
sd.GoodsUnit,sd.OfferNum 
from test_zgr_Saletb s left join test_zgr_SaletbD sd
on s.SaleId=sd.SaleId
go
-------发票管理视图
create view test_zgr_Invoicetb_V
as
select tib.CompanyName,tib.ContFax,tib.ContName,tib.ContTel,tib.CustomAdd,
tib.CustomFullName,tib.CustomId,tib.ExcemptNat,tib.InvoDate,tib.InvoId,
tib.LicenseKey,tib.Remarks,tib.SaleId,tib.SettlExc,tib.TradeNat,tib.WriteNum,
tsb.Company,tsb.GoodsId,tsb.GoodsNameCn,tsb.GoodsNameEn,tsb.SoldAmount,
tsb.SoldNum,tsb.SoldPrice
from test_zgr_Invoicetb tib left join test_zgr_InvoicetbD tsb 
on tib.InvoId=tsb.InvoId
go

-----销售机会报表视图
create view test_zgr_SaleOpportb_V
as
select tsd.SaleopId,tsb.BusinessPer,tsb.ContFax,tsb.ContName,
tsb.ContTel,tsb.Currency,tsb.CustomAdd,tsb.CustomDeli,tsb.CustomFullName,
tsb.CustomId,tsb.ExchangeRate,tsb.PriceClause,tsb.SalopDate,
tsd.Amount,tsd.GoodsId,tsd.GoodsNameCn,tsd.GoodsNameEn,tsd.GoodsNum,
tsd.GoodsPrice,tsd.GoodsUnit from test_zgr_SaleOpportb tsb 
left join test_zgr_SaleOpportbD tsd
on tsb.SaleopId=tsd.SaleopId
go