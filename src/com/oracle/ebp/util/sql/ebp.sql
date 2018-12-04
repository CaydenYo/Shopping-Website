-- MySQL dump 10.10
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	5.0.18-nt

drop database IF EXISTS ebp;
create database ebp;
use ebp;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) PRIMARY KEY auto_increment,
  `username` varchar(20) NOT NULL,	-- ��¼��
  `password` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,		-- ��ʵ����
  `gender` int NOT NULL,		-- 0ΪŮ,1Ϊ��
  `age` int NOT NULL,
  `idCard` varchar(18) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telno` varchar(15) NOT NULL,
  -- `regTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `regTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `balance` double(10,2) default 0.00,	-- �˻����
  `status` int(11) default 1		-- 0Ϊ����״̬,1Ϊ����״̬
)DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) PRIMARY KEY auto_increment,
  `commitTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `amount` double(10,2) NOT NULL ,
  `uid` int(11) NOT NULL,
  FOREIGN KEY(uid) REFERENCES user(uid)
)DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

--
-- Table structure for table `orderList`
--

DROP TABLE IF EXISTS `orderList`;
CREATE TABLE `orderList` (
  `lid` int(11) PRIMARY KEY auto_increment,
  `descs` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,		-- ��Ʊ����
  `amount` double(10,2) NOT NULL,
  `oid` int(11) NOT NULL,
   FOREIGN KEY(oid) REFERENCES orders(oid)
)DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

--
-- Table structure for table `adminUser`
--

DROP TABLE IF EXISTS `adminUser`;
CREATE TABLE `adminUser` (
  `aid` int(11) PRIMARY KEY auto_increment,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
)DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `tid` int(11) PRIMARY KEY auto_increment,
  `descs` varchar(255) NOT NULL,
  `startTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `amount` int(11) NOT NULL,		-- ��Ʊ��
  `balance` int(11) NOT NULL,		-- ʣ��Ʊ��
  `price` double(10,2) NOT NULL,	-- ����
  `status` int				-- 0Ϊ��ͣ��״̬,1Ϊ��Ʊ״̬
)DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `ticketdetail`;
CREATE TABLE `ticketdetail` (
  `tdid` int(11) PRIMARY KEY auto_increment,
  `tId` int(11) NOT NULL,					-- ��Ӧ��Ʊ��id
  `descs` varchar(255) NOT NULL,			-- �������ݣ����ض��ַ��ָ�
  `images` varchar(255) NOT NULL, 			-- ����ͼƬurl���Զ��ŷָ�
  FOREIGN KEY(tId) REFERENCES ticket(tid)   
)DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcart` (
  `scid` int(11) PRIMARY KEY auto_increment,			 -- ���ﳵid
  `addTime` timestamp NOT NULL default CURRENT_TIMESTAMP,-- ���ﳵ����ʱ��
  `userId` int(11) NOT NULL,
  FOREIGN KEY(userId) REFERENCES user(uid)
)DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `shoppingcardetail`;
CREATE TABLE `shoppingcartdetail` (
  `scdid` int(11) PRIMARY KEY auto_increment,			-- ���ﳵϸ��id
  `scid` int(11) NOT NULL,								-- ��Ӧ���ﳵid
  `tId` int(11) NOT NULL,								-- ��ӦƱ��id
  `quantity` int(11) NOT NULL,							-- ��Ʊ����
  FOREIGN KEY(scid) REFERENCES shoppingcart(scid),
  FOREIGN KEY(tId) REFERENCES ticket(tid)
)DEFAULT CHARSET=utf8;


-- Add Information for table `user`
insert into user values(1, 'jack', '123456', 'jack', 1, 21,'13648783263278847X', 'jbbjhkjl', '13801380000', '2012-09-09', 0, 1);

-- Add Information for table `adminUser`
insert into adminUser values(1, 'admin', '123456');

-- Add Information for table `orders`
insert into orders values(1, '2015-08-14 10:20:28', 200, 1);
insert into orders values(2, '2015-08-14 16:39:52', 300, 1);

-- Add Information for table `orderlist`
insert into orderlist values(1, 'addv', 100, 2, 200, 1);
insert into orderlist values(2, 'kjigh', 100, 2, 200, 2);
insert into orderlist values(3, 'dfasdf', 50, 2, 100, 2);

-- Add Information for table `ticket`
insert into ticket values(1, 'gdutyidg', '2015-08-13 08:30:00', 1200, 380, 86.00, 1);
insert into ticket values(2, 'kwegyhb', '2015-08-25 10:12:00', 200, 180, 186.00, 1);
insert into ticket values(3, 'ryg', '2015-05-26 10:56:00', 800, 320, 72.00, 1);
insert into ticket values(4, 'fgh', '2015-05-27 12:30:00', 300, 68, 65.00, 1);
insert into ticket values(5, 'ewrg', '2015-05-28 23:05:00', 650, 310, 90.00, 1);
insert into ticket values(6, 'asdvhg', '2015-08-12 01:22:00', 860, 120, 230.00, 1);
insert into ticket values(7, 'tdgf', '2015-08-13 06:15:00', 260, 30, 89.00, 1);
insert into ticket values(8, 'yre', '2015-08-29 22:30:00', 430, 10, 180.00, 0);
insert into ticket values(9, 'dvfb', '2015-08-14 21:38:00', 690, 62, 120.00, 1);
insert into ticket values(10, 'fbfb', '2015-08-15 15:29:00', 560, 120, 230.00, 1);
insert into ticket values(11, '3wds', '2015-08-16 17:32:00', 340, 0, 215.00, 0);
insert into ticket values(12, 'uyihg', '2015-08-17 13:00:00', 980, 620, 390.00, 1);
insert into ticket values(13, 'yufgv', '2015-08-18 16:03:00', 560, 80, 268.00, 1);
insert into ticket values(14, 'trgfvb', '2015-08-19 09:20:00', 268, 30, 32.00, 1);
insert into ticket values(15, 'ujhng', '2015-08-20 09:56:00', 128, 108, 67.00, 1);
insert into ticket values(16, 'edc', '2015-08-21 11:30:00', 120, 98, 53.00, 1);
insert into ticket values(17, 'nhju', '2015-08-11 14:23:00', 190, 36, 99.00, 1);
insert into ticket values(18, 'ytfd', '2015-08-23 17:48:00', 200, 8, 96.00, 1);
insert into ticket values(19, 'jmhngfvc', '2015-08-24 20:32:00', 330, 19, 196.00, 1);

--Add Information for table ticketdetail
insert into ticketdetail values(1,1, 'handsome','images/21.jpg');
insert into ticketdetail values(2,2, 'veryhandsome','images/22.jpg');
insert into ticketdetail values(3,3, 'wonderful','images/23.jpg');
insert into ticketdetail values(4,4, 'ohmygod', 'images/24.jpg');
insert into ticketdetail values(5,5, 'fenglao', 'images/25.jpg');
insert into ticketdetail values(6,6, 'MUMMY1', 'images/26.jpg');
insert into ticketdetail values(7,7, 'MUMMY2', 'images/27.jpg');
insert into ticketdetail values(8,8, 'GangRenBoQi', 'images/28.jpg');
insert into ticketdetail values(9,9, 'The 81', 'images/29.jpg');
insert into ticketdetail values(10,10, 'AngeryBird', 'images/30.jpg');