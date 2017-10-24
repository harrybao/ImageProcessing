---------------����
create table test_zgr_Usertb(
userid char(10) primary key not null,--���
userName nvarchar(12) not null,--����
Gender char(1), --�Ա�
Nation nvarchar(50) not null,--����
Birthday datetime not null, --����
BirthPlace nvarchar(50), --������
EntranceTime datetime, --��ѧʱ��
IDNumber char(18) not null,--���֤��
HomeAddress nvarchar(50),--��ͥסַ
University nvarchar(50),--��ҵԺУ
UnAddress nvarchar(50),--ԺУ��ַ
Education nvarchar(50),--ѧ������
Email varchar(30),--�����ʼ�
PhoneNumber char(12),--�ֻ�����
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
-------------------------�޸ı�
alter table test_zgr_Usertb add UserTuition decimal(5,2)
ALTER TABLE test_zgr_Usertb ADD CONSTRAINT DEFAUL_SEX DEFAULT '��'
ALTER TABLE test_zgr_Usertb ADD DEFAULT('��') FOR Gender 
alter table test_zgr_Usertb add  Personality nvarchar(50) 
alter table test_zgr_Usertb add Hobby varchar(50)
alter table test_zgr_Usertb add fir_user varchar(12)
alter table test_zgr_Usertb add cre_da datetime
alter table test_zgr_Usertb add las_user varchar(12)
alter table test_zgr_Usertb add edit_da datetime
alter table test_zgr_Usertb alter column Nation nvarchar(50)
alter table test_zgr_Usertb alter  column Gender char(2) 
ALTER TABLE test_zgr_Usertb ADD CONSTRAINT CHECK_SEX CHECK(Gender ='��' OR Gender='Ů')
ALTER TABLE test_zgr_Usertb ADD Province NVARCHAR(50)
ALTER TABLE test_zgr_Usertb ADD Citys NVARCHAR(50)
alter table test_zgr_Usertb add UserPic int
-------------------------��ѯ����
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
