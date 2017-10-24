--预收款单
create table gyl_cw_yskd(
id int identity(1,1),  --流水号
djbh varchar(50) primary key not null,  --预收款单号
djrq datetime, --预收款日期
jbr varchar(50), --经办人
xsdd varchar(50), --销售订单
skfs varchar(50), --收款方式
khdm varchar(50), --客户编号
bb varchar(50), --币别
hl varchar(50), --汇率
je decimal(15,3), --金额
fknr varchar(50), --付款内容
bz nvarchar(300), --备注
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime--修改时间cskzy
)

--其他应收
create table gyl_cw_qtys(
id int identity(1,1),  --自增id
djbh varchar(50) primary key not null, --单据编号，主键
djrq datetime,  --单据日期
ddh varchar(50), --订单号
khbh varchar(50), --客户编号
jbrbh varchar(50), --经办人编号
hb varchar(50), --货币
hl decimal(15,3), --汇率
je decimal(15,3), --金额
hsqk varchar(50), --含税情况
cp varchar(50),  --产品
ys varchar(50),  --颜色
gy varchar(50), --工艺 
ps varchar(50),--匹数
sl decimal(15,3), --数量
dj decimal(15,3), --单价
lx varchar(50),  --类型
zy nvarchar(50), --晒要
shr varchar(50), --审核人
shsj datetime,  --审核时间
fileid int,  --图片上传
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime--修改时间
)
---冲收款作业主档
CREATE TABLE gyl_cw_cskzy(
    id int identity(1,1),---流水号
	[CK_no] [varchar](50) primary key NOT NULL, --冲款单号
	[cus_no] [varchar](20) NULL, --客户编号
	[cus_name] [varchar](50) NULL, --客户名称
	[rev_no] [varchar](20) NULL, --收款单号
	[rev_da] [datetime] NULL, --时间
	[SH_way] [varchar](20) NULL, ---收汇方式
	[Rec_pay] [varchar](50) NULL, --行别
	[Acc_name] [varchar](50) NULL, --户名
	[Ent_date] [datetime] NULL, --入账时间
	[dol_no] [varchar](20) NULL, --币别
	[rate] [decimal](18, 4) NULL, --兑换币
	[Cur_exc] [varchar](20) NULL, --汇率
	[prerev_amt] [decimal](15,3) NULL, --收款金额
	[Adv_pay] [decimal](15,3) NULL, --剩余金额
	yszkmx decimal(15,3),--应收账款明细
	yskye decimal(15,3), --预收款余额
	bcckhj decimal(15,3), --本次冲账合计
	pkje decimal(15,3), --赔款金额
	bcpk decimal(15,3), --本次赔款
	qyysk decimal(15,3), --取用预收款
	yszje decimal(15,3), --应收总金额
	[remark] [varchar](1000) NULL, --备注
	[group_no] [varchar](50) NULL, --所属集团
	[fir_user] [varchar](20) NULL, --创建人 
	[las_user] [varchar](20) NULL, --修改人
	[cre_da] [datetime] NULL,   --创建时间
	[edit_da] [datetime] NULL, --修改时间
	[CK_user] [varchar](20) NULL, --冲款人
	[sale_name] [varchar](20) NULL, --销售代表
) 
---冲收款作业细档
CREATE TABLE gyl_cw_cskzyD(
	[id] [int] IDENTITY(1,1) primary key  NOT NULL,--id主键
	[CH01] [varchar](20) NULL, --出货单号
	[JY_no] [varchar](20) NULL, --交运单号
	[cmx03] [varchar](20) NULL, --订单号
	[cmx04] [varchar](10) NULL, --色序
	[cmx07] [varchar](10) NULL, --等级
	[CH_da] [datetime] NULL, --出货日期
	[dol_no] [varchar](20) NULL, --币别
	[cmx31] [decimal](15,3) NULL,--应收金额
	[Rec_amt] [decimal](15,3) NULL, --已收金额
	[dis_amt] [decimal](15,3) NULL, --未收金额
	qyysk decimal(15,3),  --取用预收款
	pcf decimal(15,3), --赔偿费
	qtfy decimal(15,3), --其他费用
	[YS_da] [datetime] NULL, --应收时间
	[JY_qty] [decimal](15,3) NULL, --数量
	[cmx30] [varchar](20) NULL,  --发票号
	[fc_amt] [decimal](15,3) NULL, --本次收款金额
	[tid] [varchar](50) NULL, --唐初框带下来id
	[sale_name] [varchar](20) NULL,--销售代表
    [CK_no] [varchar](50) foreign key(CK_no) 
references gyl_cw_cskzy(CK_no) --收款单号，外键
	on update cascade  --级联修改
	on delete cascade  --级联删除
)
-----收款单
CREATE TABLE gyl_cw_skd(
    id int identity(1,1),     ---流水号
	[rev_no] [varchar](50)  primary key NOT NULL,--收款单号
	[rev_da] [datetime] NULL,       --收款时间
	[com_no] [nvarchar](50) NULL,   --客户代码
	[emp_no] [nvarchar](50) NULL,   --收款人
	[somecontent] [nvarchar](1500) NULL,---付款内容
	[dol_no] [nvarchar](50) NULL,--币别
	[rate] [decimal](12, 4) NULL,--汇率
	[prerev_amt] [decimal](18, 2) NULL,--收款金额
	[remark] [nvarchar](1000) NULL,--备注
	[Adv_pay] [decimal](18, 2) NULL,--剩余金额
	[Rec_pay] [varchar](50) NULL,--行别
	[Deposit] [varchar](50) NULL, ---类型
	[Acc_name] [varchar](50) NULL, --户名
	[Cur_exc] [varchar](50) NULL, --兑换币
	[Ent_date] [datetime] NULL,  --入账时间
	[group_no] [varchar](50) NULL, --集团名称
	[JZ_money] [decimal](18, 2) NULL, --进账金额
	[poundage] [decimal](18, 2) NULL, --手续费
	[SH_way] [varchar](20) NULL,  --收汇方式
	[sale_name] [varchar](20) NULL, --销售代表
	[sale_no] [varchar](20) NULL, --销售工号
    [fir_user] [varchar](38) NULL,--创建人
	[las_user] [varchar](38) NULL,--修改人
	[cre_da] [datetime] NULL,--创建时间
	[edit_da] [datetime] NULL,--修改时间
	[fileid] [int] NULL, --文件上传
) 

---冲付款作业主档
CREATE TABLE gyl_cw_cfkzy(
    id int identity(1,1),---流水号
	[CK_no] [varchar](50) primary key NOT NULL, --冲款单号
	[cus_no] [varchar](20) NULL, --客户编号
	[cus_name] [varchar](50) NULL, --客户名称
	fk_no varchar(50)  ,--付款单号
	fk_da datetime NULL,       --付款时间
	[FH_way] [varchar](20) NULL, ---付汇方式
	[Rec_pay] [varchar](50) NULL, --行别
	[Acc_name] [varchar](50) NULL, --户名
	[Ent_date] [datetime] NULL, --入账时间
	[dol_no] [varchar](20) NULL, --币别
	[rate] [decimal](18, 4) NULL, --兑换币
	[Cur_exc] [varchar](20) NULL, --汇率
	[prerev_amt] [decimal](15,3) NULL, --收款金额
	[Adv_pay] [decimal](15,3) NULL, --剩余金额
	yszkmx decimal(15,3),--应收账款明细
	yskye decimal(15,3), --预收款余额
	bcckhj decimal(15,3), --本次冲账合计
	pkje decimal(15,3), --赔款金额
	bcpk decimal(15,3), --本次赔款
	qyysk decimal(15,3), --取用预收款
	yszje decimal(15,3), --应收总金额
	[remark] [varchar](1000) NULL, --备注
	[group_no] [varchar](50) NULL, --所属集团
	[fir_user] [varchar](20) NULL, --创建人 
	[las_user] [varchar](20) NULL, --修改人
	[cre_da] [datetime] NULL,   --创建时间
	[edit_da] [datetime] NULL, --修改时间
	[CK_user] [varchar](20) NULL, --冲款人
	[sale_name] [varchar](20) NULL, --销售代表
) 

---冲付款作业细档
CREATE TABLE gyl_cw_cfkzyD(
	[id] [int] IDENTITY(1,1) primary key  NOT NULL,--id主键
	[CH01] [varchar](20) NULL, --进库单号
	[cp_no] [varchar](20) NULL, --产品编号
	[cmx03] [varchar](20) NULL, --订单号
	[cmx04] [varchar](10) NULL, --规格型号
	[cmx07] [varchar](10) NULL, --单位
	[jk_da] [datetime] NULL, --进库日期
	[cmx31] [decimal](15,3) NULL,--应付金额
	[Rec_amt] [decimal](15,3) NULL, --已付金额
	[dis_amt] [decimal](15,3) NULL, --未付金额
	qyysk decimal(15,3),  --取用预收款
	pcf decimal(15,3), --赔偿费
	qtfy decimal(15,3), --其他费用
	[JY_qty] [decimal](15,3) NULL, --数量
	[cmx30] [varchar](20) NULL,  --发票号
	[fc_amt] [decimal](15,3) NULL, --本次收款金额
	[tid] [varchar](50) NULL, --唐初框带下来id
    [CK_no] [varchar](50) foreign key(CK_no) 
references gyl_cw_cfkzy(CK_no) --收款单号，外键
	on update cascade  --级联修改
	on delete cascade  --级联删除
)

---付款单
CREATE TABLE gyl_cw_fkd(
    id int identity(1,1),     ---流水号
	fk_no varchar(50)  primary key NOT NULL,--付款单号
	fk_da datetime NULL,       --付款时间
	[com_no] [nvarchar](50) NULL,   --付款单位
	[emp_no] [nvarchar](50) NULL,   --付款人
	[somecontent] [nvarchar](1500) NULL,---付款内容
	[dol_no] [nvarchar](50) NULL,--币别
	[rate] [decimal](12, 4) NULL,--汇率
	[prerev_amt] [decimal](18, 2) NULL,--付款金额
	[remark] [nvarchar](1000) NULL,--备注
	[Adv_pay] [decimal](18, 2) NULL,--剩余金额
	[Rec_pay] [varchar](50) NULL,--行别
	[Deposit] [varchar](50) NULL, ---类型
	[Acc_name] [varchar](50) NULL, --户名
	[Cur_exc] [varchar](50) NULL, --兑换币
	[Ent_date] [datetime] NULL,  --入账时间
	[group_no] [varchar](50) NULL, --集团名称
	[JZ_money] [decimal](18, 2) NULL, --进账金额
	[poundage] [decimal](18, 2) NULL, --手续费
	[FH_way] [varchar](20) NULL,  --付汇方式
	[sale_name] [varchar](20) NULL, --销售代表
	[sale_no] [varchar](20) NULL, --销售工号
    [fir_user] [varchar](38) NULL,--创建人
	[las_user] [varchar](38) NULL,--修改人
	[cre_da] [datetime] NULL,--创建时间
	[edit_da] [datetime] NULL,--修改时间
	[fileid] [int] NULL, --文件上传
) 

--其他应付
create table gyl_cw_qtyf(
id int identity(1,1),  --自增id
djbh varchar(50) primary key not null, --单据编号，主键
djrq datetime,  --单据日期
ddh varchar(50), --订单号
khbh varchar(50), --客户编号
jbrbh varchar(50), --经办人编号
hb varchar(50), --货币
hl decimal(15,3), --汇率
je decimal(15,3), --金额
hsqk varchar(50), --含税情况
cp varchar(50),  --产品
ys varchar(50),  --颜色
gy varchar(50), --工艺 
ps varchar(50),--匹数
sl decimal(15,3), --数量
dj decimal(15,3), --单价
lx varchar(50),  --类型
zy nvarchar(50), --晒要
shr varchar(50), --审核人
shsj datetime,  --审核时间
fileid int,  --图片上传
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime--修改时间
)

