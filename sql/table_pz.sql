----=----------Ʒ�ʹ���------------

--���ױ���APS��
create table gyl_pz_glbyAPS(
id int identity(1,1),     --����id
djbh varchar(50) primary key not null,  --���ݱ��
gysbh varchar(50),  --��Ӧ�̱��
tjsj datetime,    --�ύʱ��
tjcs int,  --�ύ����
pdm varchar(50),  --PDM
ghtjpc varchar(50), --�׺�+�ύ����
jjxy varchar(50),  --��������
ys varchar(50),   --��ʽ
ywys varchar(50), --Ӣ����ɫ
fzc varchar(50),  --��װ��
jjsk varchar(50),  --����ɫ��
mdd nvarchar(100), --Ŀ�ĵ�
sjdm varchar(50),  --ʵ�ʴ���
sl decimal(15,3),  --����
tjpc varchar(50), --�ύ����
tjpl varchar(100),  --�ύ����
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)

---���ױ���APQS��
create table gyl_pz_glbyAPQS(
id int identity(1,1),   --����id
djbh varchar(50) primary key not null, --���ݱ��
gysbh varchar(50), --��Ӧ�̱��
tjsj datetime,  --�ύʱ��
tjcs int, --�ύ����
pdm varchar(50), --PDM
jj varchar(50),  --����
ywys varchar(50), --Ӣ����ɫ
sjfk varchar(50), --ʵ�ʷ���
sjkz varchar(50),  --ʵ�ʿ���
sjyp varchar(50), --ʵ����Ʒ
yqyp varchar(50), --Ҫ����Ʒ
tjpc varchar(50), --�ύ����
fg varchar(50),  --���
fzc varchar(100), --��װ��
mdd varchar(100),  --Ŀ�ĵ�
sl decimal(15,3), --����
njxy varchar(50),  --�ļ�����
jysfs varchar(50), --�����Ƿ���
apsjj varchar(50), --APS����
apsgh varchar(50), --APS�׺�
tbyc varchar(50),  --��������
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)

---���ױ���BRS��
create table gyl_pz_glbyBRS(
id int identity(1,1),  --����id
djbh varchar(50) primary key not null, --���ݱ��
rq datetime,   --����
nyjqrys varchar(50), --��һ��ȷ����ɫ
wsmc varchar(100),  --��˾����
tjpc varchar(50),  --�ύ����
pdm varchar(50),  --PDM
ywys varchar(50), --Ӣ����ɫ
nyidd varchar(50), --��һ������
nyjxd varchar(50),  --��һ���µ�
szc varchar(50),   --��ֵ��
zgryqz varchar(50), --������Աǩ��
gz varchar(50),   --����
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)

---�����쳣��ӳ��
create table gyl_pz_zlycfyd(
id int identity(1,1),  --����id
fydh varchar(50)primary key not null, --��Ӧ����
jgdw varchar(50),  --�ӹ���λ
pm varchar(50),  --Ʒ��
ys varchar(50), --��ɫ
fyrq datetime, --��Ӧ����
ddh varchar(50), --������
gh varchar(50), --�׺�
sh varchar(50), --ɫ��
tpzl varchar(50),  --Ͷ������
ph varchar(50), --����
yczk varchar(100), --�쳣״̬
jgb varchar(50),   --�ӹ���
ycsl varchar(50), --�쳣����
ycms_ycnr nvarchar(300), --�쳣�������쳣����
ycms_bz nvarchar(300),  --�쳣��������ע
pb_pbyj nvarchar(300), --Ʒ����Ʒ�����
pb_clfa varchar(300), --Ʒ����������
zr_scyj varchar(300), --���ε�λ���������
zr_gscs varchar(300),  --���ε�λ�����ƴ�ʩ
sgdw_clyj nvarchar(300), --���ܵ�λ���������
ziyj varchar(300),  ---�ܽ����
spjg varchar(300),  ---�������
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)

---Ʒ���ش��쳣׷��

create table gyl_pz_pbzdyczz(
id int identity(1,1),  --����id
zzdh varchar(50) primary key not null,  ---���ݱ�ţ�����
fxrq datetime,  --��������
jbr varchar(50), --������
jbrq datetime,  ---��������
zrzgbh varchar(50), --�������ܱ��
zrzg varchar(50),  --��������
ycl decimal(15,3), --�쳣��
bz varchar(50),  --����
ksbh varchar(50), --���߱��
cgc varchar(50), --�ʸ߲�
ycxm varchar(50), --�쳣��Ŀ
zjyy varchar(50), --ֱ��ԭ��
jcyy varchar(50), --���ԭ��
xtyy varchar(50), --ϵͳԭ��
dc varchar(50),  --�Բ�
zdr varchar(50), --������
ssrq datetime,  --ʵʩ����
zzjg varchar(50), --׷�ٽ��
gshzk varchar(50), --���ƺ�״̬
kfja varchar(50),  --�ɷ�᰸
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)
----��Ʒ����Աȱ�
create table gyl_pz_cpjydbb(
id int identity(1,1),  --����id
jybh varchar(50) primary key not null, --������
khbh varchar(50), --�ͻ����
cpbh nvarchar(50),  --��Ʒ���
tm varchar(50),  --����
gg varchar(50),  --���
jgc nvarchar(50), --�ӹ���
jgb varchar(50),  --�ӹ���
sh varchar(50), --ɫ��
ys varchar(50),  --��ɫ
gh varchar(50),  --�׺�
srs varchar(50), --������
ajs varchar(50), --a����
bjs varchar(50), --b����
bl varchar(50),  --����
yt varchar(50),  --��;
jyy varchar(50),  --����Ա
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)

create table gyl_pz_ksd(
id int identity(1,1),  --����id
ksbh varchar(50) primary key not null, --���ߵ���ţ�����
jgc nvarchar(100),  --�ӹ���
lrrq datetime,   --¼������
zbr varchar(50),  --�Ʊ���
sh varchar(50),   --���
sp varchar(50),  --����
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)

create table gyl_pz_ksdD(
Did int identity(1,1) primary key not null,  --����id������
xh int ,  --���
rq datetime,  --����
dh varchar(50),  --����
cpbh varchar(50),  --��Ʒ���
                 ----Ʒ�����Ӳ�Ʒ��Ŵ���
ys varchar(50), --��ɫ
gh varchar(50),  --�׺�
yczk nvarchar(50), --�쳣״��
jglb nvarchar(50),  --�ӹ����
ycsl decimal(15,3), --�쳣����
pj decimal(15,3), --�߼�
rf decimal(15,3), --Ⱦ��
hz varchar(50),  --����
ycje decimal(15,3),  --�쳣���
clfs varchar(50),  --����ʽ
bz nvarchar(300),  --��ע
ksbh varchar(50) foreign key(ksbh)
references gyl_pz_ksd(ksbh)  --���߱�ţ����
  on update cascade
  on delete cascade
)

---���߷�����
--create table gyl_pz_ksfkd(
--id int identity(1,1),  --����id
--fydh varchar(50)primary key not null, --��Ӧ����
--jgdw varchar(50),  --�ӹ���λ
--pm varchar(50),  --Ʒ��
--ys varchar(50), --��ɫ
--fyrq datetime, --��Ӧ����
--ddh varchar(50), --������
--gh varchar(50), --�׺�
--sh varchar(50), --ɫ��
--tpzl varchar(50),  --Ͷ������
--ph varchar(50), --����
--yczk varchar(100), --�쳣״̬
--jgb varchar(50),   --�ӹ���
--ycsl varchar(50), --�쳣����
--ycms_ycnr nvarchar(300), --�쳣�������쳣����
--ycms_bz nvarchar(300),  --�쳣��������ע
--pb_pbyj nvarchar(300), --Ʒ����Ʒ�����
--pb_clfa varchar(300), --Ʒ����������
--zr_scyj varchar(300), --���ε�λ���������
--zr_gscs varchar(300),  --���ε�λ�����ƴ�ʩ
--sgdw_clyj nvarchar(300), --���ܵ�λ���������
--ziyj varchar(300),  ---�ܽ����
--spjg varchar(300),  ---�������
--hz varchar(50),  --��׼
--shh varchar(50), --���
--zbr varchar(50),  --�Ʊ���
--fir_user varchar(30),--������
--cre_da datetime,--����ʱ��
--las_user varchar(30),--�޸���
--edit_da datetime  --�޸�ʱ��
--)
---����ģ�飬�ӹ�������ɫ����
create table gyl_sg_jgczjsbd(
id int identity(1,1), ---����id
djbh varchar(50) primary key not null, ---���ݱ�ţ�����
djri datetime, ---��������
jgdw varchar(50), --�ӹ���λ����ţ����������ӹ���
cpbh varchar(50), ---��Ʒ��ţ���������Ʒ��
sh varchar(50), ---ɫ��
ys varchar(50), ---��ɫ
ddh varchar(50), --������
gh varchar(50), ---�׺�
tpzl  varchar(50), --Ͷ������
ph varchar(50), ---����
zjyy varchar(50), --����ԭ��
zjsl decimal(15,3), ---��������
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime  --�޸�ʱ��
)