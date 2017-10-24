---------------建表
create table test_zgr_Usertb(
userid char(10) primary key not null,--编号
userName nvarchar(12) not null,--姓名
Gender char(1), --性别
Nation nvarchar(50) not null,--民族
Birthday datetime not null, --生日
BirthPlace nvarchar(50), --出生地
EntranceTime datetime, --入学时间
IDNumber char(18) not null,--身份证号
HomeAddress nvarchar(50),--家庭住址
University nvarchar(50),--毕业院校
UnAddress nvarchar(50),--院校地址
Education nvarchar(50),--学历类型
Email varchar(30),--电子邮件
PhoneNumber char(12),--手机号码
)

create table test_zgr_UsertbD(
healthId int identity(1,1) primary key not null,
healthDate datetime,
healthHeight varchar(10),
healthWeight varchar(10),
healthVision varchar(10),
UserId char(10) foreign key(UserId)references test_zgr_Usertb(UserId),
)

create table test_zgr_UsertbD2(
FamilyId int identity(1,1)  primary key not null,
FamilyCall varchar(12) not null,
FamilyName varchar(12) not null,
FamilyWorkUnit varchar(50) ,
FamilyCompanyPhone char(12),
FamilyPhone char(12),
UserId char(10) foreign key(UserId)references test_zgr_Usertb(UserId),
)



CREATE TABLE test_zgr_UsertbD3(
id int identity(1,1)  primary key not null,
walkday datetime,
numsteps decimal(8,2),
userid char(10) foreign key(userid)references test_zgr_Usertb(userid),
)
-------------------------修改表
alter table test_zgr_Usertb add UserTuition decimal(5,2)
ALTER TABLE test_zgr_Usertb ADD CONSTRAINT DEFAUL_SEX DEFAULT '男'
ALTER TABLE test_zgr_Usertb ADD DEFAULT('男') FOR Gender 
alter table test_zgr_Usertb add  Personality nvarchar(50) 
alter table test_zgr_Usertb add Hobby varchar(50)
alter table test_zgr_Usertb add fir_user varchar(12)
alter table test_zgr_Usertb add cre_da datetime
alter table test_zgr_Usertb add las_user varchar(12)
alter table test_zgr_Usertb add edit_da datetime
alter table test_zgr_Usertb alter column Nation nvarchar(50)
alter table test_zgr_Usertb alter  column Gender char(2) 
ALTER TABLE test_zgr_Usertb ADD CONSTRAINT CHECK_SEX CHECK(Gender ='男' OR Gender='女')
ALTER TABLE test_zgr_Usertb ADD Province NVARCHAR(50)
ALTER TABLE test_zgr_Usertb ADD Citys NVARCHAR(50)
alter table test_zgr_Usertb add UserPic int
-------------------------查询操作
select * from test_zgr_Usertb
select * from test_zgr_UsertbD2
select * from test_zgr_UsertbD3

select ProvinceCode,ProvinceName from Test_Yg_Province
select code,othername from Ebasic_other where otherid='minzu'
select (select othername from Ebasic_other where otherid='SEX' and Gender=code) as sexName,* from test_zgr_Usertb
SELECT code,othername from Ebasic_other where otherid='test_wrs_khda_gj'
SELECT code,othername from Ebasic_other where otherid='ywfsqy'

select top 3 code,othername from Ebasic_other where code='"+code+"' order by item desc
SELECT code,othername from Ebasic_other where otherid='test_wrs_khda_qy'
SELECT code,othername from Ebasic_other where otherid='test_wrs_khda_gj'
select code,othername from Ebasic_other where code='Ah'
select lianxiren as value,lianxiren as test from Test_Ebasic_bcus_Detail1 where CustomId='CUS20160718002'
select id,xm from test_wrs_khdaD
select EmergencyPhone as Mobile,Fax from Test_Ebasic_bcus_Detail1 where CustomId='CUS20160718002' and lianxiren='33'
select code,othername from Ebasic_other where otherid='pay_moneytype'
select othername from Ebasic_other where code='AS' and otherid= 'test_wrs_khda_qy'
