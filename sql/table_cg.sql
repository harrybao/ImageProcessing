use wintex
-----------------------------�ɹ�---------------------------
----�߲��깺���뵥
create table gyl_cg_pbcgsq(
id int identity(1,1), --����id
sqbh varchar(50) primary key not null, --������,����
sqrq datetime, --��������
sqr varchar(50), --������
sqbm nvarchar(50),  --���벿��
gysbh varchar(50),  --��Ӧ�̱��
---��Ӧ�����ƣ��ӹ�Ӧ�̱�Ŵ���
jhrq datetime,  --��������
yt nvarchar(50),  --��;
dah varchar(50),  --������
scdh varchar(50), --��������
zdr nvarchar(50),  --�Ƶ���
zdrq datetime,  --�Ƶ�����
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime--�޸�ʱ��
)

----�߲��깺���뵥�ӱ�
create table gyl_cg_pbcgsqD(
Did int identity(1,1) primary key not null, --����id������
pm varchar(50),  --Ʒ��
ys varchar(50),  --��ɫ
dw varchar(50),  --��λ
zs int,  --֧��
dj decimal(15,3),  --����
sl decimal(15,3),  --����
je decimal(15,3),  --���
sqbh varchar(50) foreign key(sqbh) 
references gyl_cg_pbsgsq(sqbh) --�����ţ����
	on update cascade  --�����޸�
	on delete cascade  --����ɾ��
)
----�ɹ���ͬ����
create table gyl_cg_cght(
id int identity(1,1),--����id
cgdbh varchar(50) primary key not null, --�ɹ�����ţ�����
gysbh varchar(50), --��Ӧ�̱��
gysmc varchar(50),  --��Ӧ������
lxr nvarchar(50), --��ϵ��
dh varchar(50),  --�绰
cz varchar(50),  --����
jhrq datetime, --��������
cgrq datetime, --�ɹ�����
dah varchar(50),  --������
scdh varchar(50), --��������
jgxz varchar(50), --�۸�ѡ��
bz varchar(500), --��ע
zdr nvarchar(50),  --�Ƶ���
zdrq datetime,  --�Ƶ�����
httk nvarchar(500),--��ͬ����
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)
alter table gyl_cg_cght add gysmc nvarchar(50) --��Ӧ������
alter table gyl_cg_cght add dh varchar(50)  --�绰
alter table gyl_cg_cght add cz varchar(50)  --����
--�ɹ���ͬ�ӱ�
create table gyl_cg_cghtD(
Did int identity(1,1) primary key not null, --����id ����
pm varchar(50),  --Ʒ��
hjl decimal(15,3), --������
shdd nvarchar(100), --�ͻ��ص�
dj decimal(15,3),  --����
sl decimal(15,3),  --����
dw varchar(50),  --��λ
ewfy decimal(15,3), --�������
je decimal(15,3), --���
fk varchar(50), --����
kz varchar(50), --����
zs int,  --֧��
bz nvarchar(500), --��ע
cgdbh varchar(50) foreign key(cgdbh) 
references  gyl_cg_cght(cgdbh) --�ɹ�����ţ����
	on update cascade  --�����޸�
	on delete cascade  --����ɾ��
)

----- ��Ӧ�̿��߱�����
create table gyl_cg_gysksd(
id int identity(1,1),  --����id
ksdbh varchar(50) primary key not null,  --���ߵ���ţ�����
pbs nvarchar(50),  --�߲���
rq datetime,     ---����
zbr nvarchar(50),  --�Ʊ���
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)

----��Ӧ�̿��߱�ӱ�
create table gyl_cg_gysksdD(
Did int identity(1,1) primary key not null,  --����id ������
pm varchar(50),  --Ʒ��
pbdm varchar(50), --�߲�����
yczk varchar(50),  --�쳣״��
ycsl decimal(15,3),  --�쳣����
pj decimal(15,3),  --�߼�
pjje decimal(15,3), --�߼۽��
rf decimal(15,3),  --Ⱦ��
frje decimal(15,3), --Ⱦ�ѽ��
yckkje decimal(15,3),--�쳣�ۿ���
clfs varchar(50), --����ʽ
bz nvarchar(500), --��ע
ksdbh varchar(50) foreign key(ksdbh) 
references gyl_cg_gysksd(ksdbh) --���ߵ���ţ����
	on update cascade  --�����޸�
	on delete cascade  --����ɾ��
)

-----���⹩Ӧ��
create table gyl_cg_lpgys(
id int identity(1,1),  --����id
djbh varchar(50) primary key not null, --���ݱ��
lpbh varchar(50),  --������
djrq datetime,  -- ��������
gysbh varchar(50), --��Ӧ�̱��
ywy varchar(50), --ҵ��Ա
lpri datetime,  --��������
hth varchar(50), --��ͬ��
pm varchar(50),  --Ʒ��
sjsl decimal(15,3), --�漰����
dj decimal(15,3), --����
sjje decimal(15,3),  --�漰���
ddh varchar(50),  --������
tsnr nvarchar(200), --Ͷ������
slrq datetime, --��������
zrf varchar(50), --���η�
zrlx varchar(50),--��������
jdrq datetime,  --�ᵥ����
jjbc varchar(50), --���ò���
hsqk varchar(50),  --��˰���
hb varchar(50), --����
hl decimal(15,3),  --����
cljg varchar(100), --������
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)

