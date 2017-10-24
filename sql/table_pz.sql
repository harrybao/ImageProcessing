----=----------品质管理------------

--哥伦比亚APS表
create table gyl_pz_glbyAPS(
id int identity(1,1),     --自增id
djbh varchar(50) primary key not null,  --单据编号
gysbh varchar(50),  --供应商编号
tjsj datetime,    --提交时间
tjcs int,  --提交次数
pdm varchar(50),  --PDM
ghtjpc varchar(50), --缸号+提交批次
jjxy varchar(50),  --季节销样
ys varchar(50),   --样式
ywys varchar(50), --英文颜色
fzc varchar(50),  --服装厂
jjsk varchar(50),  --季节色块
mdd nvarchar(100), --目的地
sjdm varchar(50),  --实际代码
sl decimal(15,3),  --数量
tjpc varchar(50), --提交批次
tjpl varchar(100),  --提交评论
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)

---哥伦比亚APQS表
create table gyl_pz_glbyAPQS(
id int identity(1,1),   --自增id
djbh varchar(50) primary key not null, --单据编号
gysbh varchar(50), --供应商编号
tjsj datetime,  --提交时间
tjcs int, --提交次数
pdm varchar(50), --PDM
jj varchar(50),  --季节
ywys varchar(50), --英文颜色
sjfk varchar(50), --实际幅宽
sjkz varchar(50),  --实际克重
sjyp varchar(50), --实际样品
yqyp varchar(50), --要求样品
tjpc varchar(50), --提交批次
fg varchar(50),  --风格
fzc varchar(100), --服装厂
mdd varchar(100),  --目的地
sl decimal(15,3), --数量
njxy varchar(50),  --哪季销样
jysfs varchar(50), --检验是否是
apsjj varchar(50), --APS季节
apsgh varchar(50), --APS缸号
tbyc varchar(50),  --贴布样处
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)

---哥伦比亚BRS表
create table gyl_pz_glbyBRS(
id int identity(1,1),  --自增id
djbh varchar(50) primary key not null, --单据编号
rq datetime,   --日期
nyjqrys varchar(50), --哪一季确认颜色
wsmc varchar(100),  --我司名称
tjpc varchar(50),  --提交批次
pdm varchar(50),  --PDM
ywys varchar(50), --英文颜色
nyidd varchar(50), --哪一季订单
nyjxd varchar(50),  --哪一次下单
szc varchar(50),   --数值差
zgryqz varchar(50), --主管人员签字
gz varchar(50),   --盖章
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)

---质量异常反映单
create table gyl_pz_zlycfyd(
id int identity(1,1),  --自增id
fydh varchar(50)primary key not null, --反应单号
jgdw varchar(50),  --加工单位
pm varchar(50),  --品名
ys varchar(50), --颜色
fyrq datetime, --反应日期
ddh varchar(50), --订单号
gh varchar(50), --缸号
sh varchar(50), --色号
tpzl varchar(50),  --投胚总量
ph varchar(50), --批号
yczk varchar(100), --异常状态
jgb varchar(50),   --加工别
ycsl varchar(50), --异常数量
ycms_ycnr nvarchar(300), --异常描述：异常内容
ycms_bz nvarchar(300),  --异常描述：备注
pb_pbyj nvarchar(300), --品保：品保意见
pb_clfa varchar(300), --品保：处理方法
zr_scyj varchar(300), --责任单位：生产意见
zr_gscs varchar(300),  --责任单位：改善措施
sgdw_clyj nvarchar(300), --生管单位：处理意见
ziyj varchar(300),  ---总结意见
spjg varchar(300),  ---审批结果
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)

---品保重大异常追踪

create table gyl_pz_pbzdyczz(
id int identity(1,1),  --自增id
zzdh varchar(50) primary key not null,  ---单据编号，主键
fxrq datetime,  --发现日期
jbr varchar(50), --经办人
jbrq datetime,  ---经办日期
zrzgbh varchar(50), --责任主管编号
zrzg varchar(50),  --责任主管
ycl decimal(15,3), --异常率
bz varchar(50),  --布种
ksbh varchar(50), --客诉编号
cgc varchar(50), --呈高层
ycxm varchar(50), --异常项目
zjyy varchar(50), --直接原因
jcyy varchar(50), --检测原因
xtyy varchar(50), --系统原因
dc varchar(50),  --对策
zdr varchar(50), --主导人
ssrq datetime,  --实施日期
zzjg varchar(50), --追踪结果
gshzk varchar(50), --改善后状态
kfja varchar(50),  --可否结案
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)
----成品检验对比表
create table gyl_pz_cpjydbb(
id int identity(1,1),  --自增id
jybh varchar(50) primary key not null, --检验编号
khbh varchar(50), --客户编号
cpbh nvarchar(50),  --产品编号
tm varchar(50),  --条码
gg varchar(50),  --规格
jgc nvarchar(50), --加工厂
jgb varchar(50),  --加工别
sh varchar(50), --色号
ys varchar(50),  --颜色
gh varchar(50),  --缸号
srs varchar(50), --收入数
ajs varchar(50), --a级数
bjs varchar(50), --b级数
bl varchar(50),  --比例
yt varchar(50),  --用途
jyy varchar(50),  --检验员
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)

create table gyl_pz_ksd(
id int identity(1,1),  --自增id
ksbh varchar(50) primary key not null, --客诉单编号，主键
jgc nvarchar(100),  --加工厂
lrrq datetime,   --录入日期
zbr varchar(50),  --制表人
sh varchar(50),   --审核
sp varchar(50),  --审批
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)

create table gyl_pz_ksdD(
Did int identity(1,1) primary key not null,  --自增id，主键
xh int ,  --序号
rq datetime,  --日期
dh varchar(50),  --单号
cpbh varchar(50),  --产品编号
                 ----品名，从产品编号带出
ys varchar(50), --颜色
gh varchar(50),  --缸号
yczk nvarchar(50), --异常状况
jglb nvarchar(50),  --加工类别
ycsl decimal(15,3), --异常数量
pj decimal(15,3), --胚价
rf decimal(15,3), --染费
hz varchar(50),  --后整
ycje decimal(15,3),  --异常金额
clfs varchar(50),  --处理方式
bz nvarchar(300),  --备注
ksbh varchar(50) foreign key(ksbh)
references gyl_pz_ksd(ksbh)  --客诉编号，外键
  on update cascade
  on delete cascade
)

---客诉反馈单
--create table gyl_pz_ksfkd(
--id int identity(1,1),  --自增id
--fydh varchar(50)primary key not null, --反应单号
--jgdw varchar(50),  --加工单位
--pm varchar(50),  --品名
--ys varchar(50), --颜色
--fyrq datetime, --反应日期
--ddh varchar(50), --订单号
--gh varchar(50), --缸号
--sh varchar(50), --色号
--tpzl varchar(50),  --投胚总量
--ph varchar(50), --批号
--yczk varchar(100), --异常状态
--jgb varchar(50),   --加工别
--ycsl varchar(50), --异常数量
--ycms_ycnr nvarchar(300), --异常描述：异常内容
--ycms_bz nvarchar(300),  --异常描述：备注
--pb_pbyj nvarchar(300), --品保：品保意见
--pb_clfa varchar(300), --品保：处理方法
--zr_scyj varchar(300), --责任单位：生产意见
--zr_gscs varchar(300),  --责任单位：改善措施
--sgdw_clyj nvarchar(300), --生管单位：处理意见
--ziyj varchar(300),  ---总结意见
--spjg varchar(300),  ---审批结果
--hz varchar(50),  --核准
--shh varchar(50), --审核
--zbr varchar(50),  --制表人
--fir_user varchar(30),--创建人
--cre_da datetime,--创建时间
--las_user varchar(30),--修改人
--edit_da datetime  --修改时间
--)
---生管模块，加工厂增加色布表
create table gyl_sg_jgczjsbd(
id int identity(1,1), ---自增id
djbh varchar(50) primary key not null, ---单据编号，主键
djri datetime, ---单据日期
jgdw varchar(50), --加工单位，编号，关联带出加工厂
cpbh varchar(50), ---产品编号，关联带出品名
sh varchar(50), ---色号
ys varchar(50), ---颜色
ddh varchar(50), --订单号
gh varchar(50), ---缸号
tpzl  varchar(50), --投胚总量
ph varchar(50), ---批号
zjyy varchar(50), --增加原因
zjsl decimal(15,3), ---增加数量
fir_user varchar(30),--创建人
cre_da datetime,--创建时间
las_user varchar(30),--修改人
edit_da datetime  --修改时间
)