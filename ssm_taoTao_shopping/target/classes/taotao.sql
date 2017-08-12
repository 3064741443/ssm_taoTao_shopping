create database taotaoshop;
use taotaoshop;




--管理员信息表
create table admin(
  aid int primary key auto_increment,  --管理员编号
  aname varchar(100) unique not null,  --管理员用户名
  apwd varchar(50)                     --管理员密码
);

select * from admin;
insert into admin(aname,apwd) values('a','6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2');
commit;


-- ----------------------------
-- Table structure for tb_content
--bigint(20) 决定存储需要占用20个字节，存储范围比int更广，防止发生溢出
--创建表的时候写注释
--create table test1 ( 
--    field_name int comment '字段的注释' 
--)comment='表的注释';
--加 是为了使用mysql的保留字和关键字。比如要创建表select，但是select是关键字，系统不会让你创建，但加上 你就可以创建了，当然用的时候也要加上 的。
--如果使用了   ， 那么在查询数据时，表名必须为 tb_content 这种格式，列名可以使用 id , category_id 或者是id，category_id
--ENGINE=InnoDB使用innodb引擎
--DEFAULT CHARSET=utf8 数据库默认编码为utf-8
--AUTO_INCREMENT=32 自增键的起始序号为32,是设定该字段为自增字段，每次增加1
--扩展：
--1.InnoDB，是MySQL的数据库引擎之一，为MySQL AB发布binary的标准之一。
--2.AUTO_INCREMENT会在新记录插入表中时生成一个唯一的数字。希望在每次插入新记录时，自动地创建主键字段的值，可以在表中创建一个 auto-increment 字段。

--mysql字段varchar区分大小写utf8_bin、utf8_general_ci编码区别
--
--在mysql中存在着各种utf8编码格式：
--utf8_bin将字符串中的每一个字符用二进制数据存储，区分大小写。
--utf8_genera_ci不区分大小写，ci为case insensitive的缩写，即大小写不敏感。
--utf8_general_cs区分大小写，cs为case sensitive的缩写，即大小写敏感。
--
--用utf8_genera_ci没有区分大小写，导致这个字段的内容区分大小写时出问题，比如作为区分大小写的code或者验证码时就出问题了。
--utf8_general_cs这个选项一般没有，所以只能用utf8_bin区分大小写
--mysql对于类型为varchar数据默认不区分大小写，字段以“utf8_bin”编码使其区分大小写。
--对于
--`code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '唯一码'
-- ----------------------------
CREATE TABLE  tb_content (
 id  bigint(20) NOT NULL primary key AUTO_INCREMENT,
 category_id  bigint(20) NOT NULL COMMENT '内容类目ID'
)ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8
insert into  tb_content (category_id) values(1)
select  id , category_id   from  tb_content 
drop table  tb_content ;

DROP TABLE IF EXISTS  tb_content ;
CREATE TABLE  tb_content  (
   id  bigint(20) NOT NULL AUTO_INCREMENT,
   category_id  bigint(20) NOT NULL COMMENT '内容类目ID',
   title  varchar(200) DEFAULT NULL COMMENT '内容标题',
   sub_title  varchar(100) DEFAULT NULL COMMENT '子标题',
   title_desc  varchar(500) DEFAULT NULL COMMENT '标题描述',
   url  varchar(500) DEFAULT NULL COMMENT '链接',
   pic  varchar(300) DEFAULT NULL COMMENT '图片绝对路径',
   pic2  varchar(300) DEFAULT NULL COMMENT '图片2',
   content  text COMMENT '内容',
   created  datetime DEFAULT NULL,
   updated  datetime DEFAULT NULL,
  PRIMARY KEY ( id ),
  KEY  category_id  ( category_id ),
  KEY  updated  ( updated )
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

select * from tb_content;


-- ----------------------------
-- Table structure for tb_content_category
-- ----------------------------
DROP TABLE IF EXISTS  tb_content_category ;
CREATE TABLE  tb_content_category  (
   id  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
   parent_id  bigint(20) DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
   name  varchar(50) DEFAULT NULL COMMENT '分类名称',
   status  int(1) DEFAULT '1' COMMENT '状态。可选值:1(正常),2(删除)',
   sort_order  int(4) DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
   is_parent  tinyint(1) DEFAULT '1' COMMENT '该类目是否为父类目，1为true，0为false',
   created  datetime DEFAULT NULL COMMENT '创建时间',
   updated  datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY ( id ),
  KEY  parent_id  ( parent_id , status ) USING BTREE,
  KEY  sort_order  ( sort_order )
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COMMENT='内容分类';


-- ----------------------------
-- Table structure for tb_item
-- ----------------------------
DROP TABLE IF EXISTS  tb_item ;
CREATE TABLE  tb_item  (
   id  bigint(20) NOT NULL COMMENT '商品id，同时也是商品编号',
   title  varchar(100) NOT NULL COMMENT '商品标题',
   sell_point  varchar(500) DEFAULT NULL COMMENT '商品卖点',
   price  bigint(20) NOT NULL COMMENT '商品价格，单位为：分',
   num  int(10) NOT NULL COMMENT '库存数量',
   barcode  varchar(30) DEFAULT NULL COMMENT '商品条形码',
   image  varchar(500) DEFAULT NULL COMMENT '商品图片',
   cid  bigint(10) NOT NULL COMMENT '所属类目，叶子类目',
   status  tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品状态，1-正常，2-下架，3-删除',
   created  datetime NOT NULL COMMENT '创建时间',
   updated  datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY ( id ),
  KEY  cid  ( cid ),
  KEY  status  ( status ),
  KEY  updated  ( updated )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';



-- ----------------------------
-- Table structure for tb_item_cat
-- ----------------------------
DROP TABLE IF EXISTS  tb_item_cat ;
CREATE TABLE  tb_item_cat  (
   id  bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
   parent_id  bigint(20) DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
   name  varchar(50) DEFAULT NULL COMMENT '类目名称',
   status  int(1) DEFAULT '1' COMMENT '状态。可选值:1(正常),2(删除)',
   sort_order  int(4) DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
   is_parent  tinyint(1) DEFAULT '1' COMMENT '该类目是否为父类目，1为true，0为false',
   created  datetime DEFAULT NULL COMMENT '创建时间',
   updated  datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY ( id ),
  KEY  parent_id  ( parent_id , status ) USING BTREE,
  KEY  sort_order  ( sort_order )
) ENGINE=InnoDB AUTO_INCREMENT=1183 DEFAULT CHARSET=utf8 COMMENT='商品类目';



-- ----------------------------
-- Table structure for tb_item_desc
-- ----------------------------
DROP TABLE IF EXISTS  tb_item_desc ;
CREATE TABLE  tb_item_desc  (
   item_id  bigint(20) NOT NULL COMMENT '商品ID',
   item_desc  text COMMENT '商品描述',
   created  datetime DEFAULT NULL COMMENT '创建时间',
   updated  datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY ( item_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述表';


-- ----------------------------
-- Table structure for tb_item_param
--bigint(20) 决定存储需要占用20个字节，存储范围比int更广，防止发生溢出
-- ----------------------------
DROP TABLE IF EXISTS  tb_item_param ;
CREATE TABLE  tb_item_param  (
   id  bigint(20) NOT NULL AUTO_INCREMENT,
   item_cat_id  bigint(20) DEFAULT NULL COMMENT '商品类目ID',
   param_data  text COMMENT '参数数据，格式为json格式',
   created  datetime DEFAULT NULL,
   updated  datetime DEFAULT NULL,
  PRIMARY KEY ( id ),
  KEY  item_cat_id  ( item_cat_id )
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='商品规则参数';



-- ----------------------------
-- Table structure for tb_item_param_item
-- ----------------------------
DROP TABLE IF EXISTS  tb_item_param_item ;
CREATE TABLE  tb_item_param_item  (
   id  bigint(20) NOT NULL AUTO_INCREMENT,
   item_id  bigint(20) DEFAULT NULL COMMENT '商品ID',
   param_data  text COMMENT '参数数据，格式为json格式',
   created  datetime DEFAULT NULL,
   updated  datetime DEFAULT NULL,
  PRIMARY KEY ( id ),
  KEY  item_id  ( item_id ) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商品规格和商品的关系表';




-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS  tb_order ;
CREATE TABLE  tb_order  (
   order_id  varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单id',
   payment  varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
   payment_type  int(2) DEFAULT NULL COMMENT '支付类型，1、在线支付，2、货到付款',
   post_fee  varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分',
   status  int(10) DEFAULT NULL COMMENT '状态：1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭',
   create_time  datetime DEFAULT NULL COMMENT '订单创建时间',
   update_time  datetime DEFAULT NULL COMMENT '订单更新时间',
   payment_time  datetime DEFAULT NULL COMMENT '付款时间',
   consign_time  datetime DEFAULT NULL COMMENT '发货时间',
   end_time  datetime DEFAULT NULL COMMENT '交易完成时间',
   close_time  datetime DEFAULT NULL COMMENT '交易关闭时间',
   shipping_name  varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
   shipping_code  varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流单号',
   user_id  bigint(20) DEFAULT NULL COMMENT '用户id',
   buyer_message  varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家留言',
   buyer_nick  varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
   buyer_rate  int(2) DEFAULT NULL COMMENT '买家是否已经评价',
  PRIMARY KEY ( order_id ),
  KEY  create_time  ( create_time ),
  KEY  buyer_nick  ( buyer_nick ),
  KEY  status  ( status ),
  KEY  payment_type  ( payment_type )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- ----------------------------
-- Records of tb_order
-- ----------------------------

-- ----------------------------
-- Table structure for tb_order_item
-- ----------------------------
DROP TABLE IF EXISTS  tb_order_item ;
CREATE TABLE  tb_order_item  (
   id  varchar(20) COLLATE utf8_bin NOT NULL,
   item_id  varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品id',
   order_id  varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单id',
   num  int(10) DEFAULT NULL COMMENT '商品购买数量',
   title  varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标题',
   price  bigint(50) DEFAULT NULL COMMENT '商品单价',
   total_fee  bigint(50) DEFAULT NULL COMMENT '商品总金额',
   pic_path  varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片地址',
  PRIMARY KEY ( id ),
  KEY  item_id  ( item_id ),
  KEY  order_id  ( order_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




-- ----------------------------
-- Table structure for tb_order_shipping
-- ----------------------------
DROP TABLE IF EXISTS  tb_order_shipping ;
CREATE TABLE  tb_order_shipping  (
   order_id  varchar(50) NOT NULL COMMENT '订单ID',
   receiver_name  varchar(20) DEFAULT NULL COMMENT '收货人全名',
   receiver_phone  varchar(20) DEFAULT NULL COMMENT '固定电话',
   receiver_mobile  varchar(30) DEFAULT NULL COMMENT '移动电话',
   receiver_state  varchar(10) DEFAULT NULL COMMENT '省份',
   receiver_city  varchar(10) DEFAULT NULL COMMENT '城市',
   receiver_district  varchar(20) DEFAULT NULL COMMENT '区/县',
   receiver_address  varchar(200) DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
   receiver_zip  varchar(6) DEFAULT NULL COMMENT '邮政编码,如：310001',
   created  datetime DEFAULT NULL,
   updated  datetime DEFAULT NULL,
  PRIMARY KEY ( order_id )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS  tb_user ;
CREATE TABLE  tb_user  (
   id  bigint(20) NOT NULL AUTO_INCREMENT,
   username  varchar(50) NOT NULL COMMENT '用户名',
   password  varchar(32) NOT NULL COMMENT '密码，加密存储',
   phone  varchar(20) DEFAULT NULL COMMENT '注册手机号',
   email  varchar(50) DEFAULT NULL COMMENT '注册邮箱',
   created  datetime NOT NULL,
   updated  datetime NOT NULL,
  PRIMARY KEY ( id ),
  UNIQUE KEY  username  ( username ) USING BTREE,
  UNIQUE KEY  phone  ( phone ) USING BTREE,
  UNIQUE KEY  email  ( email ) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='用户表';






