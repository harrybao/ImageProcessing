----------------------------����---------------------------------
---��������  use wintex
----δʹ��------
create table gyl_wl_fhzld(
id int identity(1,1),  --����id
zlbh varchar(50) primary key not null,--����������ţ�����
nrzy nvarchar(250),  --����ժҪ
sj varchar(50),  --˾��
rq datetime,   --����
qd varchar(50), --���
zd varchar(50),  --ֹ��
rkph varchar(50), --�������
sl decimal(15,3), --����
bz varchar(500), --��ע
wcqk varchar(50), --������
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)
----δʹ��----

--���˽��ӵ�
create table gyl_wl_hyjjd(
id int identity(1,1), --����id
jjbh varchar(50) primary key not null,--���˽��ӵ���ţ�����
djrq datetime,  --��������
wtyh varchar(50), --ί���˻�
khbh varchar(50), --�ͻ����
                  --�ͻ�����ѡ��ͻ���ź����
khshdz nvarchar(100),-- �ͻ��ͻ���ַ
                     --��ϵ��ѡ���ַ�����
					 --��ϵ�绰ѡ���ַ�����
hwxx varchar(100), --������Ϣ
wlxx varchar(100), ---������Ϣ
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)
---���˽��ӵ��ӱ���������Ϣ
create table gyl_wl_hyjjdD(
Did int identity(1,1) primary key not null, ---����id������
ddh varchar(50), --������
zs varchar(50),  --֧��
sl decimal(15,3), --����
pz varchar(50),  --Ʒ��
hjg varchar(50), --��ӹ�
mz decimal(15,3),  --����
zzl decimal(15,3), --������
dj decimal(15,3), --����
shf decimal(15,3), --�ͻ���
qtsxf decimal(15,3), --����������
fyhj decimal(15,3),  --���úϼ�
jffs varchar(50),  --�Ʒѷ�ʽ
ddyjsj datetime,  --����Ԥ��ʱ��
bz nvarchar(300), --��ע
cg varchar(50),  --�ֹ�
wlzy varchar(50), --����רԱ
sj varchar(50),  --˾��
jjbh varchar(50) foreign key(jjbh) 
references gyl_wl_hyjjd(jjbh) 
   on update cascade
   on delete cascade
)
---�ͻ�����·��
create table gyl_wl_khwllx(
id int identity(1,1),  --����id
djbh varchar(50) primary key not null,--���ݱ�ţ�����
khbh varchar(50),  --�ͻ����
khdzlx nvarchar(500), --�ͻ���ַ
bz nvarchar(300),  --��ע
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)
---�ͻ�����·�ߴӱ�
create table gyl_wl_khwllxD(
Did int identity(1,1) primary key not null,  --����id������
wlgs varchar(100), --������˾
fy varchar(50),  --����
lxdh varchar(50), --��ϵ�绰
sx varchar(50),   --ʱЧ
bz nvarchar(300), --��ע
djbh varchar(50) foreign key(djbh) 
references gyl_wl_khwllx(djbh) --���ݱ�ţ����
  on update cascade
  on delete cascade
)
---�ͻ�����·�ߴӴӱ�
create table gyl_wl_khwllxDD(
DDid int identity(1,1) primary key not null, --����id������
fymc varchar(50), --��������
dj decimal(15,3), --����
fydw varchar(50),  --���õ�λ
fyxzsl decimal(15,3),  --������������
xzdw varchar(50), --���Ƶ�λ
bz nvarchar(300),  --��ע
Did int foreign key(Did) 
references gyl_wl_khwllxD(Did) --����·�ߴӱ��ţ����
  on update cascade
  on delete cascade
)

create table gyl_wl_pctzd(
id int identity(1,1),  --����id
djbh varchar(50) primary key not null, --���ݱ�ţ�����
nrzy nvarchar(250),  --����ժҪ
sj varchar(50),  --˾��
rq datetime,   --����
ccsj datetime,  --����ʱ��
pcr varchar(50),  --�ɳ���
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)

create table gyl_wl_pctzdD(
Did int identity(1,1) primary key not null, ---����id������
qd varchar(50), --���
zd varchar(50),  --ֹ��
rq datetime,   --����
cpbh varchar(50),  --��Ʒ���
ys varchar(50), --��ɫ
hjg varchar(50),  --��ӹ�
kh varchar(50), --���
sl decimal(15,3), --����
dw varchar(50),  --��λ
dh varchar(50),-- ����
yggh varchar(50),  --���̸׺�
gh_ph varchar(50), --�׺�/����
bmy varchar(50), --������
bz nvarchar(500), --��ע
wcqk varchar(50),  --������
djbh varchar(50) foreign key(djbh) 
references gyl_wl_pctzd(djbh) --���ݱ�ţ����
  on update cascade
  on delete cascade
)