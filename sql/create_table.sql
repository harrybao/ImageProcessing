--�ͻ�������use demo
create table test_zgr_CustomFiletb(
id int identity(1,1),--����
CustomId varchar(14) primary key not null,--�ͻ�����
FianlCustom nvarchar(50) not null,--���տͻ�
CustomFullName nvarchar(100) not null,--�ͻ�ȫ��
CustAddress nvarchar(100),-- ��ַ
PostalCode varchar(6),-- ��������
CustomTel varchar(14),--�绰
CustomFax varchar(14),--����
CustEmail varchar(50),--Email
CustomURL varchar(50),--��ַ
CompanySize nvarchar(50),--��˾��ģ
EnterPriseCapital decimal(12,2),--��ҵ�ʱ�
AnnualSales decimal(12,2),--�����۶�
CompanyNum int,--��˾����
EstablishTime datetime,--����ʱ��
CompanyNature nvarchar(50),--��ҵ����
Industry nvarchar(50),--��ҵ
CustomOwner nvarchar(50),--������
CustomClassify nvarchar(50) not null,--�ͻ�����
CustomState nvarchar(50),--�ͻ�״̬
CustomGrade nvarchar(50),--�ͻ��ȼ�
ExtensionGrade nvarchar(50),--�ƹ�ȼ�
ContNextTime datetime,--�´���ϵʱ��
Region nvarchar(50),--����
Country nvarchar(50),--����
City nvarchar(50),--����
CustomSource nvarchar(50),--�ͻ���Դ
Hobby nvarchar(50), --��Ȥ����
CustomTaboo nvarchar(50),--�ͻ�����
SpeRequirement nvarchar(50),--����Ҫ��
ExpressAccount varchar(50),--����˺�
Remarks nvarchar(500), -- ��ע
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime--�޸�ʱ��
)
--�ͻ�����ϸ��--�ͻ���ϵ��
create table test_zgr_CustomFiletbD(
id int identity(1,1),  --����
ContactName nvarchar(50),--����
ContactSex char(1),--�Ա�
ContDepartment nvarchar(50),--����
ContPosition nvarchar(50),--ְλ
ContTel varchar(14),--�绰
ContFax varchar(14),--����
ContMobile varchar(14),--�ֻ�
ContEmail1 varchar(50),--����1
ContEmail2 varchar(50),--����2
ContEmail3 varchar(50),--����3
CustomId varchar(14) foreign key(CustomId) 
references test_zgr_CustomFiletb(CustomId)
	on update cascade  --�����޸�
	on delete cascade  --����ɾ��
)

--��Ʒ������
create table test_zgr_GoodsArchivestb(
id int identity(100,1),--����
GoodsId varchar(14) primary key not null,--��Ʒ��
CustomsCode varchar(30),--���ر���
GoodsNameCn nvarchar(50) not null,--��������
RebateRate varchar(20),--��˰��
PackingUnit nvarchar(50) not null,--��װ��λ
GoodsNameEn varchar(50),--Ӣ������
GoodsColor nvarchar(20),--��ɫ
GoodsCate nvarchar(50) not null,--��Ʒ���
GoodsNature nvarchar(50) not null,--��Ʒ����
GoodsSize varchar(50),--��Ʒ�ߴ�
Company nvarchar(50) not null,--��λ
EnterPriCurrency nvarchar(30),--���۱ұ�
EnterPrice decimal(12,2),--Ŀǰ����
SoldPriCurrency nvarchar(30),--�ۼ۱ұ�
SoldPrice decimal(12,2),--Ŀǰ�ۼ�
GoodsBasePrice decimal(12,2),--��Ʒ����
EachBoxNum decimal(12,2),--ÿ������
BoxNetWeight decimal(8,2),--�侻��
BoxGrossWeight decimal(8,2),--��ë��
BoxLong decimal(8,2),--�䳤
BoxWide decimal(8,2),--���
Boxheight decimal(8,2),--���
BoxVolume decimal(8,2),--�����
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime--�޸�ʱ��
)


--���۵���
create table test_zgr_Offertb(
id int identity(1,1),-- �����ֶ�
OfferId varchar(20) primary key not null,--���۵���
OfferDate datetime not null,--��������
CustomDate datetime,--�ͻ�����
BusinessNum varchar(20),--�̻�����
BusinessPer nvarchar(30),--ҵ����Ա
CustomId varchar(20) not null,--�ͻ�����
CustomFullName nvarchar(50),--�ͻ�ȫ��
OffAddress nvarchar(100),--��ַ
ContName nvarchar(30),--��ϵ��
ContTel varchar(14),--��ϵ�˵绰
ContFax varchar(14),--��ϵ�˴���
PayMode nvarchar(50) not null,--���ʽ
ShipMode nvarchar(50) not null,--������ʽ
PriceClause nvarchar(30),--�۸�����
Currency nvarchar(20) not null,--�ұ�
ExchangeRate decimal(5,2),--����
Remaker nvarchar(250),--��ע
CompanyName nvarchar(50),--��˾̧ͷ
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime--�޸�ʱ��
)

--���۵�ϸ��

create table test_zgr_OffertbD(
id int identity(1,1) , --�����ֶ�
GoodsId varchar(20) primary key not null,--��Ʒ���
GoodsNameCn nvarchar(50),--��������
GoodsNameEn varchar(200),--Ӣ������
GoodsUnit nvarchar(20),--��λ
GoodsNum decimal(12,2),--����
GoodsPrice decimal(12,2),--����
OfferCal varchar(50),  --���ۼ���
Amount decimal(12,2),-- ���
OfferId varchar(20) foreign key(OfferId) 
references test_zgr_Offertb(OfferId)--�ͻ�����
)



--���۶���
create table test_zgr_Saletb(
id int identity(1,1),--����id
SaleId varchar(20) primary key not null,--������
SaleDate datetime not null,--����
OfferId varchar(20),--���۵�
CustomConId varchar(30),--�ͻ���ͬ��
CustomDate datetime not null,--�ͻ�����
FactoryDate datetime,--���ڽ���
CustomeName nvarchar(30),--ҵ����Ա
CustomId varchar(20) not null,--�ͻ����
CustomFullName nvarchar(100),--�ͻ�ȫ��
CustomAdd nvarchar(100),-- ��ַ
ContName nvarchar(30),--��ϵ��
ContTel varchar(14),--��ϵ�˵绰
ContFax varchar(14),--��ϵ�˴���
PayMode nvarchar(30),--���ʽ
Currency nvarchar(20) ,--�ұ�
ExchangeRate decimal(5,2),--����
ShipMode nvarchar(50) not null,--������ʽ
PriceClause nvarchar(30),--�۸�����
StartHarbor nvarchar(100),--���˸�
ArriveCountry nvarchar(100),--�˵ֹ�
EndHarbor nvarchar(100),--Ŀ�ĸ�
TranHarbor nvarchar(100),--ת�˸�
CompanyName nvarchar(50),--��˾̧ͷ
DeliveryDate varchar(100),--������
PayClause varchar(100),--��������
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime--�޸�ʱ��
)
--���۶���ϸ��
create table test_zgr_SaletbD(
id int identity(1,1),
GoodsId varchar(20) primary key not null,--��Ʒ���
GoodsNameCn nvarchar(50),--��������
GoodsNameEn varchar(200),--Ӣ������
GoodsUnit nvarchar(20),--��λ
GoodsColor varchar(30),--��ɫ
OfferNum int, --��������
GoodsPrice decimal(12,2),--����
Amount decimal(12,2),-- ���
Discount decimal(5,2),--�ۿ�
Discountmoney decimal(12,2), --�ۿ۽��
SaleId varchar(20) foreign key(SaleId)
references test_zgr_Saletb(SaleId)
)


--��Ʊ�����
create table test_zgr_Invoicetb(
id int identity(1,1), --����id
InvoId varchar(20) primary key not null,--��Ʊ����
InvoDate datetime not null,--��Ʊ����
SettlExc nvarchar(30),--��㷽ʽ
SaleId varchar(20),--���۶���
WriteNum varchar(20),--��������
LicenseKey varchar(30),--���֤��
ExcemptNat varchar(30),--��������
TradeNat nvarchar(50),--ó������
CustomId varchar(20),--�ͻ����
CustomFullName nvarchar(100), --�ͻ�ȫ��
CustomAdd nvarchar(100),-- ��ַ
ContName nvarchar(30),--��ϵ��
ContTel varchar(14),--��ϵ�˵绰
ContFax varchar(14),--��ϵ�˴���
Remarks nvarchar(500),--��ע
CompanyName nvarchar(100),--��˾̧ͷ
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime--�޸�ʱ��
)

--��Ʊ����ϸ����
create table test_zgr_InvoicetbD(
id int identity(1,1) primary key not null, --����id ����
GoodsId varchar(20),--��Ʒ���
GoodsNameCn nvarchar(100),--��������
GoodsNameEn varchar(50),--Ӣ������
Company nvarchar(30),-- ��λ
SoldPrice decimal(12,2),--����
SoldNum int,--����
SoldAmount decimal(12,2),--�ܽ��
InvoId varchar(20) foreign key(InvoId) 
references test_zgr_Invoicetb(InvoId) --���ţ����
)

---���ۻ����
create table test_zgr_SaleOpportb(
id int identity(1,1),--����id
SaleopId varchar(20) primary key not null,--�̻�����
SalopDate datetime,--�̻�����
CustomDeli datetime,--�ͻ�����
CustomId varchar(20),--�ͻ����
CustomFullName nvarchar(100),--�ͻ�ȫ��
CustomAdd nvarchar(100),--��ַ
ContName nvarchar(50),--��ϵ��
ContTel varchar(14),--��ϵ�˵绰
ContFax varchar(14),--��ϵ�˴���
PriceClause nvarchar(30),--�۸�����
Currency nvarchar(20) ,--�ұ�
BusinessPer nvarchar(30),--ҵ����Ա
ExchangeRate decimal(5,2),--����
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime--�޸�ʱ��
)

--���ۻ���ϸ��
create table test_zgr_SaleOpportbD(
id int identity(1,1) primary key not null, --����id ����
GoodsId varchar(20) ,--��Ʒ���
GoodsNameCn nvarchar(50),--��������
GoodsNameEn varchar(200),--Ӣ������
GoodsUnit nvarchar(20),--��λ
GoodsNum decimal(12,2),--����
GoodsPrice decimal(12,2),--����
Amount decimal(12,2),-- ���
SaleopId varchar(20) foreign key(SaleopId) 
references test_zgr_SaleOpportb(SaleopId) --���ţ����
)

create  table test_zgr_Leavetb(
id int identity(1,1), --����id
lea_id varchar(14) primary key not null,--�ٵ����
lea_name nvarchar(30) not null,  --����
lea_depart nvarchar(30) not null, ---����
lea_post nvarchar(30) not null, --ְλ
lea_cate nvarchar(30)  not null, --������
lea_type nvarchar(30) not null,  --�������
lea_reason nvarchar(500) not null,  --���Ե��
lea_start datetime not null,  --��ʼʱ��
lea_end datetime not null,  --����ʱ��
lea_dnum int,   --�������
manger_depart nvarchar(250),  --���ž�������˵��
manager_vice nvarchar(250),  --���ܾ�������˵��
manager_gen nvarchar(250),  --�ܾ�������˵��
sig_approv nvarchar(30) , --��׼��ǩ��
approv_date datetime,--��׼������
sig_leave nvarchar(30),  --�����ǩ��
leave_date datetime,  --���ʱ��
fir_user varchar(30), --������
cre_da datetime, --����ʱ��
las_user varchar(30), --�޸���
edit_da datetime    --�޸�ʱ��
)

