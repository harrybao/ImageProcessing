--客户档案表use demo
create table test_zgr_CustomFiletb(
id int identity(1,1),--自增
CustomId varchar(14) primary key not null,--客户编码
FianlCustom nvarchar(50) not null,--最终客户
CustomFullName nvarchar(100) not null,--客户全称
CustAddress nvarchar(100),-- 地址
PostalCode varchar(6),-- 邮政编码
CustomTel varchar(14),--电话
CustomFax varchar(14),--传真
CustEmail varchar(50),--Email
CustomURL varchar(50),--网址
CompanySize nvarchar(50),--公司规模
EnterPriseCapital decimal(12,2),--企业资本
AnnualSales decimal(12,2),--年销售额
CompanyNum int,--公司人数
EstablishTime datetime,--成立时间
CompanyNature nvarchar(50),--企业性质
Industry nvarchar(50),--行业
CustomOwner nvarchar(50),--归属人
CustomClassify nvarchar(50) not null,--客户分类
CustomState nvarchar(50),--客户状态
CustomGrade nvarchar(50),--客户等级
ExtensionGrade nvarchar(50),--推广等级
ContNextTime datetime,--下次联系时间
Region nvarchar(50),--区域
Country nvarchar(50),--国家
City nvarchar(50),--城市
CustomSource nvarchar(50),--客户来源
Hobby nvarchar(50), --兴趣爱好
CustomTaboo nvarchar(50),--客户禁忌
SpeRequirement nvarchar(50),--特殊要求
ExpressAccount varchar(50),--快递账号
Remarks nvarchar(500), -- 备注
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime--修改时间
)
--客户档案细表--客户联系人
create table test_zgr_CustomFiletbD(
id int identity(1,1),  --自增
ContactName nvarchar(50),--姓名
ContactSex char(1),--性别
ContDepartment nvarchar(50),--部门
ContPosition nvarchar(50),--职位
ContTel varchar(14),--电话
ContFax varchar(14),--传真
ContMobile varchar(14),--手机
ContEmail1 varchar(50),--邮箱1
ContEmail2 varchar(50),--邮箱2
ContEmail3 varchar(50),--邮箱3
CustomId varchar(14) foreign key(CustomId) 
references test_zgr_CustomFiletb(CustomId)
	on update cascade  --级联修改
	on delete cascade  --级联删除
)

--商品档案表
create table test_zgr_GoodsArchivestb(
id int identity(100,1),--自增
GoodsId varchar(14) primary key not null,--商品号
CustomsCode varchar(30),--海关编码
GoodsNameCn nvarchar(50) not null,--中文名称
RebateRate varchar(20),--退税率
PackingUnit nvarchar(50) not null,--包装单位
GoodsNameEn varchar(50),--英文名称
GoodsColor nvarchar(20),--颜色
GoodsCate nvarchar(50) not null,--商品类别
GoodsNature nvarchar(50) not null,--商品性质
GoodsSize varchar(50),--商品尺寸
Company nvarchar(50) not null,--单位
EnterPriCurrency nvarchar(30),--进价币别
EnterPrice decimal(12,2),--目前进价
SoldPriCurrency nvarchar(30),--售价币别
SoldPrice decimal(12,2),--目前售价
GoodsBasePrice decimal(12,2),--商品基价
EachBoxNum decimal(12,2),--每箱数量
BoxNetWeight decimal(8,2),--箱净重
BoxGrossWeight decimal(8,2),--箱毛重
BoxLong decimal(8,2),--箱长
BoxWide decimal(8,2),--箱宽
Boxheight decimal(8,2),--箱高
BoxVolume decimal(8,2),--箱体积
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime--修改时间
)


--报价单表
create table test_zgr_Offertb(
id int identity(1,1),-- 自增字段
OfferId varchar(20) primary key not null,--报价单号
OfferDate datetime not null,--报价日期
CustomDate datetime,--客户交期
BusinessNum varchar(20),--商机单号
BusinessPer nvarchar(30),--业务人员
CustomId varchar(20) not null,--客户编码
CustomFullName nvarchar(50),--客户全称
OffAddress nvarchar(100),--地址
ContName nvarchar(30),--联系人
ContTel varchar(14),--联系人电话
ContFax varchar(14),--联系人传真
PayMode nvarchar(50) not null,--付款方式
ShipMode nvarchar(50) not null,--出货方式
PriceClause nvarchar(30),--价格条款
Currency nvarchar(20) not null,--币别
ExchangeRate decimal(5,2),--汇率
Remaker nvarchar(250),--备注
CompanyName nvarchar(50),--公司抬头
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime--修改时间
)

--报价单细表

create table test_zgr_OffertbD(
id int identity(1,1) , --自增字段
GoodsId varchar(20) primary key not null,--商品编号
GoodsNameCn nvarchar(50),--中文名称
GoodsNameEn varchar(200),--英文名称
GoodsUnit nvarchar(20),--单位
GoodsNum decimal(12,2),--数量
GoodsPrice decimal(12,2),--单价
OfferCal varchar(50),  --报价计算
Amount decimal(12,2),-- 金额
OfferId varchar(20) foreign key(OfferId) 
references test_zgr_Offertb(OfferId)--客户编码
)



--销售订单
create table test_zgr_Saletb(
id int identity(1,1),--自增id
SaleId varchar(20) primary key not null,--订单号
SaleDate datetime not null,--日期
OfferId varchar(20),--报价单
CustomConId varchar(30),--客户合同号
CustomDate datetime not null,--客户交期
FactoryDate datetime,--厂内交期
CustomeName nvarchar(30),--业务人员
CustomId varchar(20) not null,--客户编号
CustomFullName nvarchar(100),--客户全称
CustomAdd nvarchar(100),-- 地址
ContName nvarchar(30),--联系人
ContTel varchar(14),--联系人电话
ContFax varchar(14),--联系人传真
PayMode nvarchar(30),--付款方式
Currency nvarchar(20) ,--币别
ExchangeRate decimal(5,2),--汇率
ShipMode nvarchar(50) not null,--出货方式
PriceClause nvarchar(30),--价格条款
StartHarbor nvarchar(100),--启运港
ArriveCountry nvarchar(100),--运抵国
EndHarbor nvarchar(100),--目的港
TranHarbor nvarchar(100),--转运港
CompanyName nvarchar(50),--公司抬头
DeliveryDate varchar(100),--交货期
PayClause varchar(100),--付款条款
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime--修改时间
)
--销售订单细档
create table test_zgr_SaletbD(
id int identity(1,1),
GoodsId varchar(20) primary key not null,--商品编号
GoodsNameCn nvarchar(50),--中文名称
GoodsNameEn varchar(200),--英文名称
GoodsUnit nvarchar(20),--单位
GoodsColor varchar(30),--颜色
OfferNum int, --订单数量
GoodsPrice decimal(12,2),--单价
Amount decimal(12,2),-- 金额
Discount decimal(5,2),--折扣
Discountmoney decimal(12,2), --折扣金额
SaleId varchar(20) foreign key(SaleId)
references test_zgr_Saletb(SaleId)
)


--发票管理表
create table test_zgr_Invoicetb(
id int identity(1,1), --自增id
InvoId varchar(20) primary key not null,--发票单号
InvoDate datetime not null,--发票日期
SettlExc nvarchar(30),--结汇方式
SaleId varchar(20),--销售订单
WriteNum varchar(20),--核销单号
LicenseKey varchar(30),--许可证号
ExcemptNat varchar(30),--征免性质
TradeNat nvarchar(50),--贸易性质
CustomId varchar(20),--客户编号
CustomFullName nvarchar(100), --客户全称
CustomAdd nvarchar(100),-- 地址
ContName nvarchar(30),--联系人
ContTel varchar(14),--联系人电话
ContFax varchar(14),--联系人传真
Remarks nvarchar(500),--备注
CompanyName nvarchar(100),--公司抬头
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime--修改时间
)

--发票管理细档表
create table test_zgr_InvoicetbD(
id int identity(1,1) primary key not null, --自增id 主键
GoodsId varchar(20),--商品编号
GoodsNameCn nvarchar(100),--中文名称
GoodsNameEn varchar(50),--英文名称
Company nvarchar(30),-- 单位
SoldPrice decimal(12,2),--单价
SoldNum int,--数量
SoldAmount decimal(12,2),--总金额
InvoId varchar(20) foreign key(InvoId) 
references test_zgr_Invoicetb(InvoId) --单号，外键
)

---销售机会表
create table test_zgr_SaleOpportb(
id int identity(1,1),--自增id
SaleopId varchar(20) primary key not null,--商机单号
SalopDate datetime,--商机日期
CustomDeli datetime,--客户交期
CustomId varchar(20),--客户编号
CustomFullName nvarchar(100),--客户全称
CustomAdd nvarchar(100),--地址
ContName nvarchar(50),--联系人
ContTel varchar(14),--联系人电话
ContFax varchar(14),--联系人传真
PriceClause nvarchar(30),--价格条款
Currency nvarchar(20) ,--币别
BusinessPer nvarchar(30),--业务人员
ExchangeRate decimal(5,2),--汇率
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime--修改时间
)

--销售机会细档
create table test_zgr_SaleOpportbD(
id int identity(1,1) primary key not null, --自增id 主键
GoodsId varchar(20) ,--商品编号
GoodsNameCn nvarchar(50),--中文名称
GoodsNameEn varchar(200),--英文名称
GoodsUnit nvarchar(20),--单位
GoodsNum decimal(12,2),--数量
GoodsPrice decimal(12,2),--单价
Amount decimal(12,2),-- 金额
SaleopId varchar(20) foreign key(SaleopId) 
references test_zgr_SaleOpportb(SaleopId) --单号，外键
)

create  table test_zgr_Leavetb(
id int identity(1,1), --自增id
lea_id varchar(14) primary key not null,--假单编号
lea_name nvarchar(30) not null,  --姓名
lea_depart nvarchar(30) not null, ---部门
lea_post nvarchar(30) not null, --职位
lea_cate nvarchar(30)  not null, --请假类别
lea_type nvarchar(30) not null,  --请假种类
lea_reason nvarchar(500) not null,  --请假缘由
lea_start datetime not null,  --开始时间
lea_end datetime not null,  --结束时间
lea_dnum int,   --请假天数
manger_depart nvarchar(250),  --部门经理特殊说明
manager_vice nvarchar(250),  --副总经理特殊说明
manager_gen nvarchar(250),  --总经理特殊说明
sig_approv nvarchar(30) , --批准人签字
approv_date datetime,--批准人日期
sig_leave nvarchar(30),  --请假人签字
leave_date datetime,  --请假时间
fir_user varchar(30), --创建人
cre_da datetime, --创建时间
las_user varchar(30), --修改人
edit_da datetime    --修改时间
)

