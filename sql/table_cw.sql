--Ԥ�տ
create table gyl_cw_yskd(
id int identity(1,1),  --��ˮ��
djbh varchar(50) primary key not null,  --Ԥ�տ��
djrq datetime, --Ԥ�տ�����
jbr varchar(50), --������
xsdd varchar(50), --���۶���
skfs varchar(50), --�տʽ
khdm varchar(50), --�ͻ����
bb varchar(50), --�ұ�
hl varchar(50), --����
je decimal(15,3), --���
fknr varchar(50), --��������
bz nvarchar(300), --��ע
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime--�޸�ʱ��cskzy
)

--����Ӧ��
create table gyl_cw_qtys(
id int identity(1,1),  --����id
djbh varchar(50) primary key not null, --���ݱ�ţ�����
djrq datetime,  --��������
ddh varchar(50), --������
khbh varchar(50), --�ͻ����
jbrbh varchar(50), --�����˱��
hb varchar(50), --����
hl decimal(15,3), --����
je decimal(15,3), --���
hsqk varchar(50), --��˰���
cp varchar(50),  --��Ʒ
ys varchar(50),  --��ɫ
gy varchar(50), --���� 
ps varchar(50),--ƥ��
sl decimal(15,3), --����
dj decimal(15,3), --����
lx varchar(50),  --����
zy nvarchar(50), --ɹҪ
shr varchar(50), --�����
shsj datetime,  --���ʱ��
fileid int,  --ͼƬ�ϴ�
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime--�޸�ʱ��
)
---���տ���ҵ����
CREATE TABLE gyl_cw_cskzy(
    id int identity(1,1),---��ˮ��
	[CK_no] [varchar](50) primary key NOT NULL, --����
	[cus_no] [varchar](20) NULL, --�ͻ����
	[cus_name] [varchar](50) NULL, --�ͻ�����
	[rev_no] [varchar](20) NULL, --�տ��
	[rev_da] [datetime] NULL, --ʱ��
	[SH_way] [varchar](20) NULL, ---�ջ㷽ʽ
	[Rec_pay] [varchar](50) NULL, --�б�
	[Acc_name] [varchar](50) NULL, --����
	[Ent_date] [datetime] NULL, --����ʱ��
	[dol_no] [varchar](20) NULL, --�ұ�
	[rate] [decimal](18, 4) NULL, --�һ���
	[Cur_exc] [varchar](20) NULL, --����
	[prerev_amt] [decimal](15,3) NULL, --�տ���
	[Adv_pay] [decimal](15,3) NULL, --ʣ����
	yszkmx decimal(15,3),--Ӧ���˿���ϸ
	yskye decimal(15,3), --Ԥ�տ����
	bcckhj decimal(15,3), --���γ��˺ϼ�
	pkje decimal(15,3), --�����
	bcpk decimal(15,3), --�������
	qyysk decimal(15,3), --ȡ��Ԥ�տ�
	yszje decimal(15,3), --Ӧ���ܽ��
	[remark] [varchar](1000) NULL, --��ע
	[group_no] [varchar](50) NULL, --��������
	[fir_user] [varchar](20) NULL, --������ 
	[las_user] [varchar](20) NULL, --�޸���
	[cre_da] [datetime] NULL,   --����ʱ��
	[edit_da] [datetime] NULL, --�޸�ʱ��
	[CK_user] [varchar](20) NULL, --�����
	[sale_name] [varchar](20) NULL, --���۴���
) 
---���տ���ҵϸ��
CREATE TABLE gyl_cw_cskzyD(
	[id] [int] IDENTITY(1,1) primary key  NOT NULL,--id����
	[CH01] [varchar](20) NULL, --��������
	[JY_no] [varchar](20) NULL, --���˵���
	[cmx03] [varchar](20) NULL, --������
	[cmx04] [varchar](10) NULL, --ɫ��
	[cmx07] [varchar](10) NULL, --�ȼ�
	[CH_da] [datetime] NULL, --��������
	[dol_no] [varchar](20) NULL, --�ұ�
	[cmx31] [decimal](15,3) NULL,--Ӧ�ս��
	[Rec_amt] [decimal](15,3) NULL, --���ս��
	[dis_amt] [decimal](15,3) NULL, --δ�ս��
	qyysk decimal(15,3),  --ȡ��Ԥ�տ�
	pcf decimal(15,3), --�⳥��
	qtfy decimal(15,3), --��������
	[YS_da] [datetime] NULL, --Ӧ��ʱ��
	[JY_qty] [decimal](15,3) NULL, --����
	[cmx30] [varchar](20) NULL,  --��Ʊ��
	[fc_amt] [decimal](15,3) NULL, --�����տ���
	[tid] [varchar](50) NULL, --�Ƴ��������id
	[sale_name] [varchar](20) NULL,--���۴���
    [CK_no] [varchar](50) foreign key(CK_no) 
references gyl_cw_cskzy(CK_no) --�տ�ţ����
	on update cascade  --�����޸�
	on delete cascade  --����ɾ��
)
-----�տ
CREATE TABLE gyl_cw_skd(
    id int identity(1,1),     ---��ˮ��
	[rev_no] [varchar](50)  primary key NOT NULL,--�տ��
	[rev_da] [datetime] NULL,       --�տ�ʱ��
	[com_no] [nvarchar](50) NULL,   --�ͻ�����
	[emp_no] [nvarchar](50) NULL,   --�տ���
	[somecontent] [nvarchar](1500) NULL,---��������
	[dol_no] [nvarchar](50) NULL,--�ұ�
	[rate] [decimal](12, 4) NULL,--����
	[prerev_amt] [decimal](18, 2) NULL,--�տ���
	[remark] [nvarchar](1000) NULL,--��ע
	[Adv_pay] [decimal](18, 2) NULL,--ʣ����
	[Rec_pay] [varchar](50) NULL,--�б�
	[Deposit] [varchar](50) NULL, ---����
	[Acc_name] [varchar](50) NULL, --����
	[Cur_exc] [varchar](50) NULL, --�һ���
	[Ent_date] [datetime] NULL,  --����ʱ��
	[group_no] [varchar](50) NULL, --��������
	[JZ_money] [decimal](18, 2) NULL, --���˽��
	[poundage] [decimal](18, 2) NULL, --������
	[SH_way] [varchar](20) NULL,  --�ջ㷽ʽ
	[sale_name] [varchar](20) NULL, --���۴���
	[sale_no] [varchar](20) NULL, --���۹���
    [fir_user] [varchar](38) NULL,--������
	[las_user] [varchar](38) NULL,--�޸���
	[cre_da] [datetime] NULL,--����ʱ��
	[edit_da] [datetime] NULL,--�޸�ʱ��
	[fileid] [int] NULL, --�ļ��ϴ�
) 

---�帶����ҵ����
CREATE TABLE gyl_cw_cfkzy(
    id int identity(1,1),---��ˮ��
	[CK_no] [varchar](50) primary key NOT NULL, --����
	[cus_no] [varchar](20) NULL, --�ͻ����
	[cus_name] [varchar](50) NULL, --�ͻ�����
	fk_no varchar(50)  ,--�����
	fk_da datetime NULL,       --����ʱ��
	[FH_way] [varchar](20) NULL, ---���㷽ʽ
	[Rec_pay] [varchar](50) NULL, --�б�
	[Acc_name] [varchar](50) NULL, --����
	[Ent_date] [datetime] NULL, --����ʱ��
	[dol_no] [varchar](20) NULL, --�ұ�
	[rate] [decimal](18, 4) NULL, --�һ���
	[Cur_exc] [varchar](20) NULL, --����
	[prerev_amt] [decimal](15,3) NULL, --�տ���
	[Adv_pay] [decimal](15,3) NULL, --ʣ����
	yszkmx decimal(15,3),--Ӧ���˿���ϸ
	yskye decimal(15,3), --Ԥ�տ����
	bcckhj decimal(15,3), --���γ��˺ϼ�
	pkje decimal(15,3), --�����
	bcpk decimal(15,3), --�������
	qyysk decimal(15,3), --ȡ��Ԥ�տ�
	yszje decimal(15,3), --Ӧ���ܽ��
	[remark] [varchar](1000) NULL, --��ע
	[group_no] [varchar](50) NULL, --��������
	[fir_user] [varchar](20) NULL, --������ 
	[las_user] [varchar](20) NULL, --�޸���
	[cre_da] [datetime] NULL,   --����ʱ��
	[edit_da] [datetime] NULL, --�޸�ʱ��
	[CK_user] [varchar](20) NULL, --�����
	[sale_name] [varchar](20) NULL, --���۴���
) 

---�帶����ҵϸ��
CREATE TABLE gyl_cw_cfkzyD(
	[id] [int] IDENTITY(1,1) primary key  NOT NULL,--id����
	[CH01] [varchar](20) NULL, --���ⵥ��
	[cp_no] [varchar](20) NULL, --��Ʒ���
	[cmx03] [varchar](20) NULL, --������
	[cmx04] [varchar](10) NULL, --����ͺ�
	[cmx07] [varchar](10) NULL, --��λ
	[jk_da] [datetime] NULL, --��������
	[cmx31] [decimal](15,3) NULL,--Ӧ�����
	[Rec_amt] [decimal](15,3) NULL, --�Ѹ����
	[dis_amt] [decimal](15,3) NULL, --δ�����
	qyysk decimal(15,3),  --ȡ��Ԥ�տ�
	pcf decimal(15,3), --�⳥��
	qtfy decimal(15,3), --��������
	[JY_qty] [decimal](15,3) NULL, --����
	[cmx30] [varchar](20) NULL,  --��Ʊ��
	[fc_amt] [decimal](15,3) NULL, --�����տ���
	[tid] [varchar](50) NULL, --�Ƴ��������id
    [CK_no] [varchar](50) foreign key(CK_no) 
references gyl_cw_cfkzy(CK_no) --�տ�ţ����
	on update cascade  --�����޸�
	on delete cascade  --����ɾ��
)

---���
CREATE TABLE gyl_cw_fkd(
    id int identity(1,1),     ---��ˮ��
	fk_no varchar(50)  primary key NOT NULL,--�����
	fk_da datetime NULL,       --����ʱ��
	[com_no] [nvarchar](50) NULL,   --���λ
	[emp_no] [nvarchar](50) NULL,   --������
	[somecontent] [nvarchar](1500) NULL,---��������
	[dol_no] [nvarchar](50) NULL,--�ұ�
	[rate] [decimal](12, 4) NULL,--����
	[prerev_amt] [decimal](18, 2) NULL,--������
	[remark] [nvarchar](1000) NULL,--��ע
	[Adv_pay] [decimal](18, 2) NULL,--ʣ����
	[Rec_pay] [varchar](50) NULL,--�б�
	[Deposit] [varchar](50) NULL, ---����
	[Acc_name] [varchar](50) NULL, --����
	[Cur_exc] [varchar](50) NULL, --�һ���
	[Ent_date] [datetime] NULL,  --����ʱ��
	[group_no] [varchar](50) NULL, --��������
	[JZ_money] [decimal](18, 2) NULL, --���˽��
	[poundage] [decimal](18, 2) NULL, --������
	[FH_way] [varchar](20) NULL,  --���㷽ʽ
	[sale_name] [varchar](20) NULL, --���۴���
	[sale_no] [varchar](20) NULL, --���۹���
    [fir_user] [varchar](38) NULL,--������
	[las_user] [varchar](38) NULL,--�޸���
	[cre_da] [datetime] NULL,--����ʱ��
	[edit_da] [datetime] NULL,--�޸�ʱ��
	[fileid] [int] NULL, --�ļ��ϴ�
) 

--����Ӧ��
create table gyl_cw_qtyf(
id int identity(1,1),  --����id
djbh varchar(50) primary key not null, --���ݱ�ţ�����
djrq datetime,  --��������
ddh varchar(50), --������
khbh varchar(50), --�ͻ����
jbrbh varchar(50), --�����˱��
hb varchar(50), --����
hl decimal(15,3), --����
je decimal(15,3), --���
hsqk varchar(50), --��˰���
cp varchar(50),  --��Ʒ
ys varchar(50),  --��ɫ
gy varchar(50), --���� 
ps varchar(50),--ƥ��
sl decimal(15,3), --����
dj decimal(15,3), --����
lx varchar(50),  --����
zy nvarchar(50), --ɹҪ
shr varchar(50), --�����
shsj datetime,  --���ʱ��
fileid int,  --ͼƬ�ϴ�
fir_user varchar(30),--������
cre_da datetime,--����ʱ��
las_user varchar(30),--�޸���
edit_da datetime--�޸�ʱ��
)

