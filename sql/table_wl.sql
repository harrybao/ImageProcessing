----------------------------物流---------------------------------
---发货整理单  use wintex
----未使用------
create table gyl_wl_fhzld(
id int identity(1,1),  --自增id
zlbh varchar(50) primary key not null,--发货整理单编号，主键
nrzy nvarchar(250),  --内容摘要
sj varchar(50),  --司机
rq datetime,   --日期
qd varchar(50), --起点
zd varchar(50),  --止点
rkph varchar(50), --入库批号
sl decimal(15,3), --数量
bz varchar(500), --备注
wcqk varchar(50), --完成情况
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)
----未使用----

--货运交接单
create table gyl_wl_hyjjd(
id int identity(1,1), --自增id
jjbh varchar(50) primary key not null,--货运交接单编号，主键
djrq datetime,  --单据日期
wtyh varchar(50), --委托运货
khbh varchar(50), --客户编号
                  --客户名称选择客户编号后带出
khshdz nvarchar(100),-- 客户送货地址
                     --联系人选择地址后带出
					 --联系电话选择地址后带出
hwxx varchar(100), --货物信息
wlxx varchar(100), ---物流信息
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)
---货运交接单从表——货物信息
create table gyl_wl_hyjjdD(
Did int identity(1,1) primary key not null, ---自增id，主键
ddh varchar(50), --订单号
zs varchar(50),  --支数
sl decimal(15,3), --数量
pz varchar(50),  --品种
hjg varchar(50), --后加工
mz decimal(15,3),  --码重
zzl decimal(15,3), --总重量
dj decimal(15,3), --单价
shf decimal(15,3), --送货费
qtsxf decimal(15,3), --其他手续费
fyhj decimal(15,3),  --费用合计
jffs varchar(50),  --计费方式
ddyjsj datetime,  --到达预计时间
bz nvarchar(300), --备注
cg varchar(50),  --仓管
wlzy varchar(50), --物流专员
sj varchar(50),  --司机
jjbh varchar(50) foreign key(jjbh) 
references gyl_wl_hyjjd(jjbh) 
   on update cascade
   on delete cascade
)
---客户物流路线
create table gyl_wl_khwllx(
id int identity(1,1),  --自增id
djbh varchar(50) primary key not null,--单据编号，主键
khbh varchar(50),  --客户编号
khdzlx nvarchar(500), --客户地址
bz nvarchar(300),  --备注
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)
---客户物流路线从表
create table gyl_wl_khwllxD(
Did int identity(1,1) primary key not null,  --自增id，主键
wlgs varchar(100), --物流公司
fy varchar(50),  --费用
lxdh varchar(50), --联系电话
sx varchar(50),   --时效
bz nvarchar(300), --备注
djbh varchar(50) foreign key(djbh) 
references gyl_wl_khwllx(djbh) --单据编号，外键
  on update cascade
  on delete cascade
)
---客户物流路线从从表
create table gyl_wl_khwllxDD(
DDid int identity(1,1) primary key not null, --自增id，主键
fymc varchar(50), --费用名称
dj decimal(15,3), --单价
fydw varchar(50),  --费用单位
fyxzsl decimal(15,3),  --费用限制数量
xzdw varchar(50), --限制单位
bz nvarchar(300),  --备注
Did int foreign key(Did) 
references gyl_wl_khwllxD(Did) --物流路线从表编号，外键
  on update cascade
  on delete cascade
)

create table gyl_wl_pctzd(
id int identity(1,1),  --自增id
djbh varchar(50) primary key not null, --单据编号，主键
nrzy nvarchar(250),  --内容摘要
sj varchar(50),  --司机
rq datetime,   --日期
ccsj datetime,  --出车时间
pcr varchar(50),  --派车人
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)

create table gyl_wl_pctzdD(
Did int identity(1,1) primary key not null, ---自增id，主键
qd varchar(50), --起点
zd varchar(50),  --止点
rq datetime,   --日期
cpbh varchar(50),  --产品编号
ys varchar(50), --颜色
hjg varchar(50),  --后加工
kh varchar(50), --款号
sl decimal(15,3), --数量
dw varchar(50),  --单位
dh varchar(50),-- 单号
yggh varchar(50),  --永固缸号
gh_ph varchar(50), --缸号/批号
bmy varchar(50), --半码样
bz nvarchar(500), --备注
wcqk varchar(50),  --完成情况
djbh varchar(50) foreign key(djbh) 
references gyl_wl_pctzd(djbh) --单据编号，外键
  on update cascade
  on delete cascade
)