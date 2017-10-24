use wintex
-----------------------------采购---------------------------
----胚布申购申请单
create table gyl_cg_pbcgsq(
id int identity(1,1), --自增id
sqbh varchar(50) primary key not null, --申请编号,主键
sqrq datetime, --申请日期
sqr varchar(50), --申请人
sqbm nvarchar(50),  --申请部门
gysbh varchar(50),  --供应商编号
---供应商名称，从供应商编号带入
jhrq datetime,  --交货日期
yt nvarchar(50),  --用途
dah varchar(50),  --订单号
scdh varchar(50), --生产单号
zdr nvarchar(50),  --制单人
zdrq datetime,  --制单日期
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime--修改时间
)

----胚布申购申请单从表
create table gyl_cg_pbcgsqD(
Did int identity(1,1) primary key not null, --自增id，主键
pm varchar(50),  --品名
ys varchar(50),  --颜色
dw varchar(50),  --单位
zs int,  --支数
dj decimal(15,3),  --单价
sl decimal(15,3),  --数量
je decimal(15,3),  --金额
sqbh varchar(50) foreign key(sqbh) 
references gyl_cg_pbsgsq(sqbh) --申请编号，外键
	on update cascade  --级联修改
	on delete cascade  --级联删除
)
----采购合同主表
create table gyl_cg_cght(
id int identity(1,1),--自增id
cgdbh varchar(50) primary key not null, --采购单编号，主键
gysbh varchar(50), --供应商编号
gysmc varchar(50),  --供应商名称
lxr nvarchar(50), --联系人
dh varchar(50),  --电话
cz varchar(50),  --传真
jhrq datetime, --交货日期
cgrq datetime, --采购日期
dah varchar(50),  --订单号
scdh varchar(50), --生产单号
jgxz varchar(50), --价格选择
bz varchar(500), --备注
zdr nvarchar(50),  --制单人
zdrq datetime,  --制单日期
httk nvarchar(500),--合同条款
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)
alter table gyl_cg_cght add gysmc nvarchar(50) --供应商名称
alter table gyl_cg_cght add dh varchar(50)  --电话
alter table gyl_cg_cght add cz varchar(50)  --传真
--采购合同从表
create table gyl_cg_cghtD(
Did int identity(1,1) primary key not null, --自增id 主键
pm varchar(50),  --品名
hjl decimal(15,3), --含浆量
shdd nvarchar(100), --送货地点
dj decimal(15,3),  --单价
sl decimal(15,3),  --数量
dw varchar(50),  --单位
ewfy decimal(15,3), --额外费用
je decimal(15,3), --金额
fk varchar(50), --幅宽
kz varchar(50), --克重
zs int,  --支数
bz nvarchar(500), --备注
cgdbh varchar(50) foreign key(cgdbh) 
references  gyl_cg_cght(cgdbh) --采购单编号，外键
	on update cascade  --级联修改
	on delete cascade  --级联删除
)

----- 供应商客诉表主表
create table gyl_cg_gysksd(
id int identity(1,1),  --自增id
ksdbh varchar(50) primary key not null,  --客诉单编号，主键
pbs nvarchar(50),  --胚布商
rq datetime,     ---日期
zbr nvarchar(50),  --制表人
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)

----供应商客诉表从表
create table gyl_cg_gysksdD(
Did int identity(1,1) primary key not null,  --自增id ，主键
pm varchar(50),  --品名
pbdm varchar(50), --胚布代码
yczk varchar(50),  --异常状况
ycsl decimal(15,3),  --异常数量
pj decimal(15,3),  --胚价
pjje decimal(15,3), --胚价金额
rf decimal(15,3),  --染费
frje decimal(15,3), --染费金额
yckkje decimal(15,3),--异常扣款金额
clfs varchar(50), --处理方式
bz nvarchar(500), --备注
ksdbh varchar(50) foreign key(ksdbh) 
references gyl_cg_gysksd(ksdbh) --客诉单编号，外键
	on update cascade  --级联修改
	on delete cascade  --级联删除
)

-----理赔供应商
create table gyl_cg_lpgys(
id int identity(1,1),  --自增id
djbh varchar(50) primary key not null, --单据编号
lpbh varchar(50),  --理赔编号
djrq datetime,  -- 单据日期
gysbh varchar(50), --供应商编号
ywy varchar(50), --业务员
lpri datetime,  --理赔日期
hth varchar(50), --合同号
pm varchar(50),  --品名
sjsl decimal(15,3), --涉及数量
dj decimal(15,3), --单价
sjje decimal(15,3),  --涉及金额
ddh varchar(50),  --订单号
tsnr nvarchar(200), --投诉内容
slrq datetime, --受理日期
zrf varchar(50), --责任方
zrlx varchar(50),--责任类型
jdrq datetime,  --结单日期
jjbc varchar(50), --经济补偿
hsqk varchar(50),  --含税情况
hb varchar(50), --货币
hl decimal(15,3),  --汇率
cljg varchar(100), --处理结果
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)

