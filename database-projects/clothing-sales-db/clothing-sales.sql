Create database dress
GO

USE [dress]
GO

CREATE TABLE ck_info(
	[仓库编号] [char](6) NOT NULL,
	[仓库名称] [char](40) NOT NULL,
	[备份] [char](255) NULL,
 CONSTRAINT PK_ck_info PRIMARY KEY CLUSTERED ([仓库编号])
 )

USE [dress]
GO

insert  [ck_info] Values('0001','一号仓库','')
insert  [ck_info] Values('0002','二号仓库','')
insert  [ck_info] Values('0003','三号仓库','')
insert  [ck_info] Values('0004','四号仓库','')
insert  [ck_info] Values('0005','五号仓库','')

GO
CREATE TABLE g_info(
	[供应商编号] [char](8) NOT NULL,
	[供应商名称] [char](40) NOT NULL,
	[地址] [char](40) NOT NULL,
	[邮编] [char](6) NULL,
	[电话] [char](40) NULL,
	[电子邮箱] [char](50) NULL,
	[账号] [char](20) NOT NULL,
	[开户银行] [char](30) NOT NULL,
	[联系人] [char](8) NOT NULL,
	[备注] [char](255) NULL,
 CONSTRAINT [PK_g_info] PRIMARY KEY CLUSTERED ([供应商编号])
 )
 GO
 
insert  [g_info] Values('00001','东','浙江省杭州市嘉兴','314101','84958441','123456@qq.com','123456',' 工商 银行','小张','')
insert  [g_info] Values('00002','南','浙江省杭州市海宁','314102','84958442','456789@qq.com','456789',' 工商银行','小赵','')
insert  [g_info] Values('00003','西','浙江省杭州市嘉善','314100','84958443','123789@qq.com ','123789',' 中国人民银行','小易','')
insert  [g_info] Values('00004','北','浙江省杭州市宁波','314104','84958444','789123qq.com','789123',' 建设银行','小军','')  

CREATE TABLE goods(
	[商品编号] [numeric](9, 0) NOT NULL,
	[商品名称] [char](40) NOT NULL,
	[颜色] [char](10) NULL,
	[类别] [char](30) NOT NULL,
	[入库价格] [numeric](9, 0) NOT NULL,
	[分销价格] [numeric](9, 0) NOT NULL,
	[零售价格] [numeric](9, 0) NOT NULL,
	[生产厂家] [char](20) NOT NULL,
	[备注] [char](255) NULL,
 CONSTRAINT [PK_goods1] PRIMARY KEY CLUSTERED ([商品编号])
 )
 GO

 insert  [goods] Values('1001','卫衣','灰色','S','20','50','80','太平洋公司','成立1999年')
 insert  [goods] Values('1002','风衣','黑色','L','30','50','90','太子湖有限公司','成立于2000年')
 insert  [goods] Values('1003','运动服','红色','M','20','40','60','百事好有限公司','成立于1888年')
 insert  [goods] Values('1004','羊绒衫','褐色','L','50','80','120','杭州厘时有限公司','成立于2001年')
 insert  [goods] Values('1005','羽绒服','黄色','L','90','150','200','爱得米兰有限公司','成立于1999年')

 USE [dress]
GO


CREATE TABLE jh_info(
	[进货日期] [datetime] NOT NULL,
	[业务员] [char](20) NOT NULL,
	[进货单号] [char](8) NOT NULL,
	[供应商编号] [char](8) NOT NULL,
	[仓库编号] [char](6) NOT NULL,
	[商品编号] [numeric](9, 0) NOT NULL,
	[颜色] [char](10) NULL,
	[数量] [numeric](9, 0) NOT NULL,
	[单价] [numeric](9, 0) NOT NULL,
	[折扣] [numeric](5, 0) NOT NULL,
	[总金额] [numeric](9, 0) NOT NULL,
	[即时付款] [char](2) NULL,
	[是否付款] [char](2) NULL,
	[备注] [char](100) NULL,
 CONSTRAINT [PK_jh_info] PRIMARY KEY CLUSTERED ([进货单号]))
GO


insert  [jh_info] Values('2012-01-01 00:00:00.000','1','111','00001','0001','1001','灰色','100','20','5','2000','是','是','')
insert  [jh_info] Values('2012-01-02 00:00:00.000','2','112','00002','0002','1002','黑色','100','30','5','3000','是','是','')
insert  [jh_info] Values('2012-01-12 00:00:00.000','3','113','00003','0003','1003','红色','100','20','5','2000','是','是','')



USE [dress]
GO



CREATE TABLE kc_info(
	[更新日期] [datetime] NOT NULL,
	[业务员] [char](20) NOT NULL,
	[入库单号] [char](8) NOT NULL,
	[供应商编号] [char](8) NOT NULL,
	[仓库编号] [char](6) NOT NULL,
	[商品编号] [numeric](9, 0) NOT NULL,
	[颜色] [char](10) NULL,
	[数量] [numeric](9, 0) NOT NULL,
	[单价] [numeric](9, 0) NOT NULL,
	[折扣] [numeric](5, 0) NOT NULL,
	[总金额] [numeric](9, 0) NOT NULL,
	[备份] [char](100) NULL,
 CONSTRAINT [PK_kc_info] PRIMARY KEY CLUSTERED 
(
	[入库单号] ASC))

insert  [kc_info] Values('2012-01-01 00:00:00.000','10','1110','00001','0001','1001','灰色','100','20','5','2000','入库')
insert  [kc_info] Values('2010-01-02 00:00:00.000','11','1111','00002','0002','1002','黑色','100','30','5','3000','')
insert  [kc_info] Values('2012-01-03 00:00:00.000','12','1112','00003','0003','1003','红色','100','20','5','2000','')
insert  [kc_info] Values('2012-01-04 00:00:00.000','13','1113','00004','0004','1004','褐色','100','50','5','5000','')



USE [dress]
GO



CREATE TABLE kh_info(
	[客户编号] [char](8) NOT NULL,
	[客户名称] [char](40) NOT NULL,
	[地址] [char](40) NULL,
	[邮编] [char](6) NULL,
	[电话] [char](40) NULL,
	[联系人] [char](40) NOT NULL,
	[电子邮箱] [char](50) NULL,
	[账号] [char](30) NOT NULL,
	[银行] [char](30) NOT NULL,
	[备注] [char](255) NULL,
 CONSTRAINT [PK_k_info] PRIMARY KEY CLUSTERED 
(
	[客户编号] ASC))


GO

insert  [kh_info] Values('10001','小玉','浙江省嘉善县','314100','84958443','小玉','159753@qq.com','159753','工商','')
insert  [kh_info] Values('10002','小玲','浙江省金华','314101','84958445','小玲','951753@qq.com','951753','工商','')
insert  [kh_info] Values('10003','小连','浙江省平湖','314102','84958446','小连','456852@qq.com','456852','建设','')
insert  [kh_info] Values('10004','小婷','浙江省宁波','314103','84958447','小婷','123987@qq.com','123987','招商','')
insert  [kh_info] Values('10005','小丽','浙江省安吉','314104','84958448','小丽','147258@qq.com','147258','中国人民','')




USE [dress]
GO



CREATE TABLE outs(
	[提货日期] [datetime] NOT NULL,
	[业务员] [char](20) NOT NULL,
	[提货单号] [char](8) NOT NULL,
	[客户编号] [char](8) NOT NULL,
	[仓库编号] [char](6) NOT NULL,
	[商品编号] [numeric](9, 0) NOT NULL,
	[颜色] [char](10) NULL,
	[数量] [numeric](9, 0) NOT NULL,
	[单价] [numeric](9, 0) NOT NULL,
	[折扣] [numeric](5, 0) NOT NULL,
	[总金额] [numeric](9, 0) NOT NULL,
	[备注] [char](100) NULL,
 CONSTRAINT [PK_outs] PRIMARY KEY CLUSTERED 
(
	[提货单号] ASC))

insert  [outs] Values('2012-02-01 00:00:00.000','01','5000','10001','0001','1001','灰色','90','80','5','8000','')
insert  [outs] Values('2012-02-02 00:00:00.000','02','5001','10002','0002','1002','黑色','80','90','5','9000','')
insert  [outs] Values('2012-02-03 00:00:00.000','03','5002','10003','0003','1003','红色','90','60','5','6000','')
insert  [outs] Values('2012-02-04 00:00:00.000','04','5003','10004','0004','1004','褐色','70','120','5','84000','')
insert  [outs] Values('2012-02-05 00:00:00.000','05','5004','10005','0005','1005','黄色','90','200','5','18000','')


USE [dress]
GO


CREATE TABLE sell(
	[销售日期] [datetime] NOT NULL,
	[业务员] [char](20) NOT NULL,
	[销售单号] [char](8) NOT NULL,
	[客户编号] [char](8) NOT NULL,
	[仓库编号] [char](6) NOT NULL,
	[商品编号] [numeric](9, 0) NOT NULL,
	[颜色] [char](10) NULL,
	[数量] [numeric](9, 0) NOT NULL,
	[单价] [numeric](9, 0) NOT NULL,
	[折扣] [numeric](5, 0) NOT NULL,
	[总金额] [numeric](9, 0) NOT NULL,
	[即时付账] [char](2) NULL,
	[是否记账] [char](2) NULL,
	[备注] [char](100) NULL,
 CONSTRAINT [PK_sell] PRIMARY KEY CLUSTERED 
(
	[销售单号] ASC))


insert  [sell] Values('2012-02-01 00:00:00.000','01','0101','10001','0001','1001','灰色','90','80','5','7200','是','是','')
insert  [sell] Values('2012-02-02 00:00:00.000','02','0102','10002','0002','1002','黑色','80','90','5','7200','是','是','')
insert  [sell] Values('2012-02-03 00:00:00.000','03','0103','10003','0003','1003','红色','90','60','5','5400','是','是','')
insert  [sell] Values('2012-02-04 00:00:00.000','04','0104','10004','0004','1004','褐色','70','120','5','8400','是','是','')
insert  [sell] Values('2012-02-05 00:00:00.000','05','0105','10005','0005','1005','黄色','90','200','5','18000','是','是','')






USE [dress]
GO


CREATE TABLE [user](
	[用户名] [char](10) NOT NULL,
	[密码] [char](10) NOT NULL,
	[权限] [tinyint] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[用户名] ASC))



insert  [user] Values('0001','0001','1')
insert  [user] Values('0002','0002','2')
insert  [user] Values('0003','0003','3')
insert  [user] Values('0004','0004','4')
insert  [user] Values('0005','0005','5')
insert  [user] Values('0006','0006','6')



USE [dress]
GO



CREATE TABLE ywy_info(
	[业务员编号] [char](8) NOT NULL,
	[姓名] [char](20) NOT NULL,
	[性别] [char](4) NOT NULL,
	[电话] [char](40) NULL,
	[地址] [char](40) NULL,
	[身份证号码] [char](18) NOT NULL,
	[备份] [char](255) NULL,
 CONSTRAINT [PK_y_info] PRIMARY KEY CLUSTERED 
(
	[业务员编号] ASC))


insert  [ywy_info] Values('10','汪汪','男','4171291','浙江省杭州市','330421199302111234','')
insert  [ywy_info] Values('11','何灵','男','4171292','浙江省嘉兴市','330421199302112345','')
insert  [ywy_info] Values('12','美玲','女','4171293','浙江省宁波市','330421199302113456','')
insert  [ywy_info] Values('13','霄霄','女','4171294','浙江省温州市','330421199302115678','')
insert  [ywy_info] Values('14','徐菲','女','4171295','浙江省湖州市','330421199302116789','')



--视图4
Create view view_g_info
As 
Select g_info.供应商编号,g_info.供应商名称,kc_info.商品编号,kc_info.数量 From g_info 
JOIN kc_info
On g_info.仓库编号=kc_info.仓库编号

--执行
Select* From  view_g_info

--视图1
Create view view_kc_info
As 
Select kc_info.供应商编号,kc_info.仓库编号,kc_info.颜色 from kc_info
where kc_info.备份 is not null
--执行
use dress
select * from view_kc_info 



Create view view_out
As 
Select ck_info.仓库编号,outs.[商品编号],outs.提货日期,outs.总金额 From ck_info 
JOIN outs
On ck_info.仓库编号=outs.仓库编号
JOIN kc_info
On ck_info.仓库编号=kc_info.仓库编号

--视图2
Create view view_ck_info
As 
Select kc_info.商品编号,kc_info.数量,kc_info.单价,kc_info.入库单号,ck_info.仓库名称
From ck_info 
JOIN kc_info
On kc_info.仓库编号=ck_info.仓库编号
Where kc_info.单价>30
--执行
select * from view_ck_info


--视图3
Create view view_kh_info
As 
Select kh_info.客户编号,kh_info.客户名称,sell.商品编号,sell.销售单号,sell.数量,sell.颜色,kh_info.电子邮箱,kh_info.电话,kh_info.地址,kh_info.账号 From kh_info 
JOIN sell
On kh_info.客户编号=sell.客户编号
Where sell.单价>30
--执行
select * from view_kh_info


--check约束
Alter table sell with nocheck
Add constraint ck_sell
Check(单价>=30 and 单价<=200)

--Check约束:goods表中入库价格大于0
Alter table goods with nocheck
Add constraint good_info
Check(入库价格>0)

--多表查询
--查询1
Select goods.商品编号,goods.商品名称,sell.销售日期
 from goods,sell
where goods.商品编号=sell.商品编号

use dress
Go



--查询2
Select kh_info.客户编号,kh_info.客户名称,sell.商品编号,sell.销售单号,sell.数量,sell.颜色,kh_info.电话,kh_info.地址,kh_info.账号 From kh_info 
JOIN sell
On kh_info.客户编号=sell.客户编号
Where sell.数量=90

GO

--查询3
Select ywy_info.业务员编号,ywy_info.姓名,ywy_info.性别 from ywy_info where 姓名 like '美%'
GO

--存储过程
use dress
Go
--存储器1
create procedure up_g_info
(@no char(10))
AS
select g_info.供应商编号,g_info.供应商名称,g_info.地址,g_info.邮编,g_info.电子邮箱 
from g_info
where 供应商编号=@no
--执行
exec up_g_info '00003'
GO

--存储器2
create procedure up_goods
@no char(10)
as
select 商品编号,商品名称 from goods
where 商品编号=@no
--执行
exec up_goods @no='1002'
GO

--存储器3
create procedure up_goods1
@TypeID  CHAR(15)
AS
IF EXISTS (SELECT * FROM goods WHERE 商品编号=@TypeID)
Select * from goods where 商品编号=@TypeID order by 零售价格
else
PRINT '无该商品信息'
--执行
exec up_goods1 @TypeID='10000'
GO



GO

--触发器1
Create Trigger jh_info_delete
on jh_info
After Delete
AS
Begin
 Delete from jh_info
 Where jh_info.进货单号=(select 进货单号 from deleted)
 PRINT '以被删除'
End
--执行
delete from jh_info where 进货单号='111'


GO



USE [dress]
GO


--触发器2
create TRIGGER g_info_insert
ON g_info
for insert
as	
begin
    declare @xx char(100)
	declare @供应商编号 char(8)
	declare @供应商名称 char(40)
	select @供应商编号=供应商编号 from inserted
	select @供应商名称=供应商名称 from inserted
	set @xx='您好,'+ @供应商编号+@供应商名称+'感谢你为我们供货!'
	print @xx
end

GO
--执行
insert [g_info] values('00005','中','浙江省杭州市下沙','314105','84958445','777123qq.com','789123','建设银行','小李','')


GO

--触发器3
Create Trigger goods_update
On goods
For Update
As
Begin
Declare @Old varchar(20)
Declare @New varchar(20)
Select @New=入库价格 From inserted
Select @Old=入库价格 From deleted
Print '原入库价格为：'+@Old
Print '新入库价格为：'+@New
End


--执行
Update goods Set 入库价格='80' Where 入库价格='30'

GO



--触发器4
use dress
go
Create Trigger ck_info_instead
On ck_info
Instead of UPDATE,DELETE
AS
BEGIN
	PRINT '不允许修改或删除仓库！'
END
GO

--执行
UPDATE ck_info SET 仓库名称='一号仓库' WHERE 仓库名称='六号仓库'
GO