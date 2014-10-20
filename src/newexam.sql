/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : newexam

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2014-06-17 22:22:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_b_bj`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_bj`;
CREATE TABLE `t_b_bj` (
  `BH` int(11) NOT NULL AUTO_INCREMENT COMMENT '学校自编',
  `NJBH` int(11) NOT NULL,
  `BJMC` varchar(20) NOT NULL,
  `JBNY` varchar(15) DEFAULT NULL,
  `BJSM` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BH`),
  KEY `FK_Reference_56` (`NJBH`),
  CONSTRAINT `FK_Reference_56` FOREIGN KEY (`NJBH`) REFERENCES `t_b_nj` (`NJBH`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_b_bj
-- ----------------------------
INSERT INTO `t_b_bj` VALUES ('15', '4', '13计本', '2014/5/30', '');

-- ----------------------------
-- Table structure for `t_b_jg`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_jg`;
CREATE TABLE `t_b_jg` (
  `JGBH` int(11) NOT NULL AUTO_INCREMENT,
  `JGMC` varchar(60) NOT NULL,
  `JGSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`JGBH`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='机构、院系';

-- ----------------------------
-- Records of t_b_jg
-- ----------------------------
INSERT INTO `t_b_jg` VALUES ('1', '软件职业技术学院', null);
INSERT INTO `t_b_jg` VALUES ('2', '信息工程学院', null);
INSERT INTO `t_b_jg` VALUES ('3', '电子信息工程实验与实训中心', null);
INSERT INTO `t_b_jg` VALUES ('4', '法政系', null);
INSERT INTO `t_b_jg` VALUES ('5', '历史系', null);
INSERT INTO `t_b_jg` VALUES ('6', '化学系', null);
INSERT INTO `t_b_jg` VALUES ('7', '生物科学系', null);
INSERT INTO `t_b_jg` VALUES ('8', '数学系', null);
INSERT INTO `t_b_jg` VALUES ('9', '外国语学院', null);
INSERT INTO `t_b_jg` VALUES ('10', '中文系', null);
INSERT INTO `t_b_jg` VALUES ('11', '艺术与传媒学院', null);
INSERT INTO `t_b_jg` VALUES ('12', '地理与旅游系', null);
INSERT INTO `t_b_jg` VALUES ('13', '教育学院', null);

-- ----------------------------
-- Table structure for `t_b_km`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_km`;
CREATE TABLE `t_b_km` (
  `KMBH` int(11) NOT NULL AUTO_INCREMENT,
  `XKZYBH` int(11) NOT NULL,
  `KMMC` varchar(40) NOT NULL,
  `KMSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`KMBH`),
  KEY `FK_Reference_20` (`XKZYBH`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`XKZYBH`) REFERENCES `t_b_xkzy` (`XKZYBH`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_b_km
-- ----------------------------
INSERT INTO `t_b_km` VALUES ('1', '1', 'Java面向对象基础', null);
INSERT INTO `t_b_km` VALUES ('2', '1', 'C#程序设计基础', null);
INSERT INTO `t_b_km` VALUES ('3', '1', 'oracle数据库应用', null);
INSERT INTO `t_b_km` VALUES ('4', '1', '计算机网络', null);
INSERT INTO `t_b_km` VALUES ('5', '1', '计算机组成原理', null);
INSERT INTO `t_b_km` VALUES ('6', '1', 'JavaScript应用', null);
INSERT INTO `t_b_km` VALUES ('7', '1', '软件测试', null);

-- ----------------------------
-- Table structure for `t_b_ksxz`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_ksxz`;
CREATE TABLE `t_b_ksxz` (
  `XZBH` int(11) NOT NULL AUTO_INCREMENT,
  `XZMC` varchar(25) NOT NULL,
  `XZSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`XZBH`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_b_ksxz
-- ----------------------------
INSERT INTO `t_b_ksxz` VALUES ('1', '正常考试', '');
INSERT INTO `t_b_ksxz` VALUES ('2', '缓考', '指因特殊原因未能参加正常考试的学生再给其一次考试机会');
INSERT INTO `t_b_ksxz` VALUES ('3', '旷考', '指无因特殊原因请假而没能参加正常考试的');
INSERT INTO `t_b_ksxz` VALUES ('4', '补考一', '指学生正常考试成绩未合格，再给一次补考机会');
INSERT INTO `t_b_ksxz` VALUES ('5', '补考二', '指第一次补考仍未及格，再给第二次补考机会');
INSERT INTO `t_b_ksxz` VALUES ('6', '重修', '指有关课程考试未通过，必须重修（参加下一年级的听课、学习）后，在参加考试');
INSERT INTO `t_b_ksxz` VALUES ('7', '免修', '指有特殊原因，经教务部门认定可以不修某一（或一些）课程，不影响毕业');
INSERT INTO `t_b_ksxz` VALUES ('8', '结业后返校补考', '');
INSERT INTO `t_b_ksxz` VALUES ('9', '国家级考试', '');
INSERT INTO `t_b_ksxz` VALUES ('10', '其他', '');

-- ----------------------------
-- Table structure for `t_b_nj`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_nj`;
CREATE TABLE `t_b_nj` (
  `NJBH` int(11) NOT NULL AUTO_INCREMENT,
  `NJMC` varchar(10) NOT NULL,
  `NJSM` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NJBH`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_b_nj
-- ----------------------------
INSERT INTO `t_b_nj` VALUES ('1', '2010级', null);
INSERT INTO `t_b_nj` VALUES ('2', '2011级', null);
INSERT INTO `t_b_nj` VALUES ('3', '2012级', null);
INSERT INTO `t_b_nj` VALUES ('4', '2013级', null);
INSERT INTO `t_b_nj` VALUES ('5', '2014级', null);

-- ----------------------------
-- Table structure for `t_b_nldm`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_nldm`;
CREATE TABLE `t_b_nldm` (
  `NLBH` int(11) NOT NULL AUTO_INCREMENT,
  `NLFW` varchar(50) NOT NULL,
  `NLSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NLBH`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_b_nldm
-- ----------------------------
INSERT INTO `t_b_nldm` VALUES ('1', '25-30岁', null);

-- ----------------------------
-- Table structure for `t_b_xkly`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_xkly`;
CREATE TABLE `t_b_xkly` (
  `XKLYBH` varchar(10) NOT NULL,
  `XKMLBH` int(11) NOT NULL,
  `XKLYMC` varchar(50) NOT NULL,
  `XKLYSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`XKLYBH`),
  KEY `FK_Reference_44` (`XKMLBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_b_xkly
-- ----------------------------
INSERT INTO `t_b_xkly` VALUES ('0301', '6', '法学类', null);
INSERT INTO `t_b_xkly` VALUES ('030101', '6', '法学', null);
INSERT INTO `t_b_xkly` VALUES ('030102', '6', '知识产权法', null);
INSERT INTO `t_b_xkly` VALUES ('030103', '6', '知识产权', null);
INSERT INTO `t_b_xkly` VALUES ('030120', '6', '监狱学', null);
INSERT INTO `t_b_xkly` VALUES ('030199', '6', '法学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0302', '6', '马克思主义理论类', null);
INSERT INTO `t_b_xkly` VALUES ('030201', '6', '科学社会主义与国际共产主义运动', null);
INSERT INTO `t_b_xkly` VALUES ('030202', '6', '中国革命史与中国共产党党史', null);
INSERT INTO `t_b_xkly` VALUES ('030299', '6', '马克思主义理论类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0303', '6', '社会学类', null);
INSERT INTO `t_b_xkly` VALUES ('030301', '6', '社会学', null);
INSERT INTO `t_b_xkly` VALUES ('030302', '6', '社会工作', null);
INSERT INTO `t_b_xkly` VALUES ('030303', '6', '家政学', null);
INSERT INTO `t_b_xkly` VALUES ('030304', '6', '人类学', null);
INSERT INTO `t_b_xkly` VALUES ('030305', '6', '女性学', null);
INSERT INTO `t_b_xkly` VALUES ('030399', '6', '社会学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0304', '6', '政治学类', null);
INSERT INTO `t_b_xkly` VALUES ('030401', '6', '政治学与行政学', null);
INSERT INTO `t_b_xkly` VALUES ('030402', '6', '国际政治', null);
INSERT INTO `t_b_xkly` VALUES ('030403', '6', '外交学', null);
INSERT INTO `t_b_xkly` VALUES ('030404', '6', '思想政治教育', null);
INSERT INTO `t_b_xkly` VALUES ('030405', '6', '国际文化交流', null);
INSERT INTO `t_b_xkly` VALUES ('030406', '6', '国际政治经济学', null);
INSERT INTO `t_b_xkly` VALUES ('030407', '6', '国际事务', null);
INSERT INTO `t_b_xkly` VALUES ('030408', '6', '国际事务与国际关系', null);
INSERT INTO `t_b_xkly` VALUES ('030409', '6', '欧洲事务与欧洲关系', null);
INSERT INTO `t_b_xkly` VALUES ('030410', '6', '东亚事务与东亚关系', null);
INSERT INTO `t_b_xkly` VALUES ('030411', '6', '政治学、经济学与哲学', null);
INSERT INTO `t_b_xkly` VALUES ('030499', '6', '政治学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0305', '6', '公安学类', null);
INSERT INTO `t_b_xkly` VALUES ('030501', '6', '治安学', null);
INSERT INTO `t_b_xkly` VALUES ('030502', '6', '侦查学', null);
INSERT INTO `t_b_xkly` VALUES ('030503', '6', '边防管理', null);
INSERT INTO `t_b_xkly` VALUES ('030504', '6', '火灾勘查', null);
INSERT INTO `t_b_xkly` VALUES ('030505', '6', '禁毒学', null);
INSERT INTO `t_b_xkly` VALUES ('030506', '6', '警犬技术', null);
INSERT INTO `t_b_xkly` VALUES ('030507', '6', '经济犯罪侦查', null);
INSERT INTO `t_b_xkly` VALUES ('030508', '6', '边防指挥', null);
INSERT INTO `t_b_xkly` VALUES ('030509', '6', '消防指挥', null);
INSERT INTO `t_b_xkly` VALUES ('030510', '6', '警卫学', null);
INSERT INTO `t_b_xkly` VALUES ('030511', '6', '公安情报学', null);
INSERT INTO `t_b_xkly` VALUES ('030512', '6', '犯罪学', null);
INSERT INTO `t_b_xkly` VALUES ('030513', '6', '公安管理学', null);
INSERT INTO `t_b_xkly` VALUES ('030514', '6', '涉外警务', null);
INSERT INTO `t_b_xkly` VALUES ('030515', '6', '国内安全保卫', null);
INSERT INTO `t_b_xkly` VALUES ('030516', '6', '警务指挥与战术', null);
INSERT INTO `t_b_xkly` VALUES ('030599', '6', '公安学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0401', '4', '教育学类', null);
INSERT INTO `t_b_xkly` VALUES ('040101', '4', '教育学', null);
INSERT INTO `t_b_xkly` VALUES ('040102', '4', '学前教育', null);
INSERT INTO `t_b_xkly` VALUES ('040103', '4', '特殊教育', null);
INSERT INTO `t_b_xkly` VALUES ('040104', '4', '教育技术学', null);
INSERT INTO `t_b_xkly` VALUES ('040105', '4', '小学教育', null);
INSERT INTO `t_b_xkly` VALUES ('040106', '4', '艺术教育', null);
INSERT INTO `t_b_xkly` VALUES ('040107', '4', '人文教育', null);
INSERT INTO `t_b_xkly` VALUES ('040108', '4', '科学教育', null);
INSERT INTO `t_b_xkly` VALUES ('040109', '4', '言语听觉科学', null);
INSERT INTO `t_b_xkly` VALUES ('040110', '4', '华文教育', null);
INSERT INTO `t_b_xkly` VALUES ('040199', '4', '教育学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0402', '4', '体育学类', null);
INSERT INTO `t_b_xkly` VALUES ('040201', '4', '体育教育', null);
INSERT INTO `t_b_xkly` VALUES ('040202', '4', '运动训练', null);
INSERT INTO `t_b_xkly` VALUES ('040203', '4', '社会体育', null);
INSERT INTO `t_b_xkly` VALUES ('040204', '4', '运动人体科学', null);
INSERT INTO `t_b_xkly` VALUES ('040205', '4', '民族传统体育', null);
INSERT INTO `t_b_xkly` VALUES ('040206', '4', '运动康复与健康', null);
INSERT INTO `t_b_xkly` VALUES ('040207', '4', '休闲体育', null);
INSERT INTO `t_b_xkly` VALUES ('040299', '4', '体育学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0403', '4', '职业技术教育类', null);
INSERT INTO `t_b_xkly` VALUES ('040301', '4', '农艺教育', null);
INSERT INTO `t_b_xkly` VALUES ('040302', '4', '园艺教育', null);
INSERT INTO `t_b_xkly` VALUES ('040303', '4', '特用作物教育', null);
INSERT INTO `t_b_xkly` VALUES ('040304', '4', '林木生产教育', null);
INSERT INTO `t_b_xkly` VALUES ('040305', '4', '特用动物教育', null);
INSERT INTO `t_b_xkly` VALUES ('040306', '4', '畜禽生产教育', null);
INSERT INTO `t_b_xkly` VALUES ('040307', '4', '水产养殖教育', null);
INSERT INTO `t_b_xkly` VALUES ('040308', '4', '应用生物教育', null);
INSERT INTO `t_b_xkly` VALUES ('040309', '4', '农业机械教育', null);
INSERT INTO `t_b_xkly` VALUES ('040310', '4', '农业建筑与环境控制教育', null);
INSERT INTO `t_b_xkly` VALUES ('040311', '4', '农产品储运与加工教育', null);
INSERT INTO `t_b_xkly` VALUES ('040312', '4', '农业经营管理教育', null);
INSERT INTO `t_b_xkly` VALUES ('040313', '4', '机械制造工艺教育', null);
INSERT INTO `t_b_xkly` VALUES ('040314', '4', '机械维修及检测技术教育', null);
INSERT INTO `t_b_xkly` VALUES ('040315', '4', '机电技术教育', null);
INSERT INTO `t_b_xkly` VALUES ('040316', '4', '电气技术教育', null);
INSERT INTO `t_b_xkly` VALUES ('040317', '4', '汽车维修工程教育', null);
INSERT INTO `t_b_xkly` VALUES ('040318', '4', '应用电子技术教育', null);
INSERT INTO `t_b_xkly` VALUES ('040319', '4', '制浆造纸工艺教育', null);
INSERT INTO `t_b_xkly` VALUES ('040320', '4', '印刷工艺教育', null);
INSERT INTO `t_b_xkly` VALUES ('040321', '4', '橡塑制品成型工艺教育', null);
INSERT INTO `t_b_xkly` VALUES ('040322', '4', '食品工艺教育', null);
INSERT INTO `t_b_xkly` VALUES ('040323', '4', '纺织工艺教育', null);
INSERT INTO `t_b_xkly` VALUES ('040324', '4', '染整工艺教育', null);
INSERT INTO `t_b_xkly` VALUES ('040325', '4', '化工工艺教育', null);
INSERT INTO `t_b_xkly` VALUES ('040326', '4', '化工分析与检测技术教育', null);
INSERT INTO `t_b_xkly` VALUES ('040327', '4', '建筑材料工程教育', null);
INSERT INTO `t_b_xkly` VALUES ('040328', '4', '建筑工程教育', null);
INSERT INTO `t_b_xkly` VALUES ('040329', '4', '服装设计与工艺教育', null);
INSERT INTO `t_b_xkly` VALUES ('040330', '4', '装潢设计与工艺教育', null);
INSERT INTO `t_b_xkly` VALUES ('040331', '4', '旅游管理与服务教育', null);
INSERT INTO `t_b_xkly` VALUES ('040332', '4', '食品营养与检验教育', null);
INSERT INTO `t_b_xkly` VALUES ('040333', '4', '烹饪与营养教育', null);
INSERT INTO `t_b_xkly` VALUES ('040334', '4', '财务会计教育', null);
INSERT INTO `t_b_xkly` VALUES ('040335', '4', '文秘教育', null);
INSERT INTO `t_b_xkly` VALUES ('040336', '4', '市场营销教育', null);
INSERT INTO `t_b_xkly` VALUES ('040337', '4', '职业技术教育管理', null);
INSERT INTO `t_b_xkly` VALUES ('040399', '4', '职业技术教育类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0501', '1', '中国语言文学类', null);
INSERT INTO `t_b_xkly` VALUES ('050101', '1', '汉语言文学', null);
INSERT INTO `t_b_xkly` VALUES ('050102', '1', '汉语言', null);
INSERT INTO `t_b_xkly` VALUES ('050103', '1', '对外汉语', null);
INSERT INTO `t_b_xkly` VALUES ('050104', '1', '中国少数民族语言文学', null);
INSERT INTO `t_b_xkly` VALUES ('050105', '1', '古典文献', null);
INSERT INTO `t_b_xkly` VALUES ('050106', '1', '中国语言文化', null);
INSERT INTO `t_b_xkly` VALUES ('050107', '1', '应用语言学', null);
INSERT INTO `t_b_xkly` VALUES ('050108', '1', '中国学', null);
INSERT INTO `t_b_xkly` VALUES ('050199', '1', '中国语言文学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0502', '1', '外国语言文学类', null);
INSERT INTO `t_b_xkly` VALUES ('050201', '1', '英语', null);
INSERT INTO `t_b_xkly` VALUES ('050202', '1', '俄语', null);
INSERT INTO `t_b_xkly` VALUES ('050203', '1', '德语', null);
INSERT INTO `t_b_xkly` VALUES ('050204', '1', '法语', null);
INSERT INTO `t_b_xkly` VALUES ('050205', '1', '西班牙语', null);
INSERT INTO `t_b_xkly` VALUES ('050206', '1', '阿拉伯语', null);
INSERT INTO `t_b_xkly` VALUES ('050207', '1', '日语', null);
INSERT INTO `t_b_xkly` VALUES ('050208', '1', '波斯语', null);
INSERT INTO `t_b_xkly` VALUES ('050209', '1', '朝鲜语', null);
INSERT INTO `t_b_xkly` VALUES ('050210', '1', '菲律宾语', null);
INSERT INTO `t_b_xkly` VALUES ('050211', '1', '梵语巴利语', null);
INSERT INTO `t_b_xkly` VALUES ('050212', '1', '印度尼西亚语', null);
INSERT INTO `t_b_xkly` VALUES ('050213', '1', '印地语', null);
INSERT INTO `t_b_xkly` VALUES ('050214', '1', '柬埔寨语', null);
INSERT INTO `t_b_xkly` VALUES ('050215', '1', '老挝语', null);
INSERT INTO `t_b_xkly` VALUES ('050216', '1', '缅甸语', null);
INSERT INTO `t_b_xkly` VALUES ('050217', '1', '马来语', null);
INSERT INTO `t_b_xkly` VALUES ('050218', '1', '蒙古语', null);
INSERT INTO `t_b_xkly` VALUES ('050219', '1', '僧加罗语', null);
INSERT INTO `t_b_xkly` VALUES ('050220', '1', '泰语', null);
INSERT INTO `t_b_xkly` VALUES ('050221', '1', '乌尔都语', null);
INSERT INTO `t_b_xkly` VALUES ('050222', '1', '希伯莱语', null);
INSERT INTO `t_b_xkly` VALUES ('050223', '1', '越南语', null);
INSERT INTO `t_b_xkly` VALUES ('050224', '1', '豪萨语', null);
INSERT INTO `t_b_xkly` VALUES ('050225', '1', '斯瓦希里语', null);
INSERT INTO `t_b_xkly` VALUES ('050226', '1', '阿尔巴尼亚语', null);
INSERT INTO `t_b_xkly` VALUES ('050227', '1', '保加利亚语', null);
INSERT INTO `t_b_xkly` VALUES ('050228', '1', '波兰语', null);
INSERT INTO `t_b_xkly` VALUES ('050229', '1', '捷克语', null);
INSERT INTO `t_b_xkly` VALUES ('050230', '1', '罗马尼亚语', null);
INSERT INTO `t_b_xkly` VALUES ('050231', '1', '葡萄牙语', null);
INSERT INTO `t_b_xkly` VALUES ('050232', '1', '瑞典语', null);
INSERT INTO `t_b_xkly` VALUES ('050233', '1', '塞尔维亚—克罗地亚语', null);
INSERT INTO `t_b_xkly` VALUES ('050234', '1', '土耳其语', null);
INSERT INTO `t_b_xkly` VALUES ('050235', '1', '希腊语', null);
INSERT INTO `t_b_xkly` VALUES ('050236', '1', '匈牙利语', null);
INSERT INTO `t_b_xkly` VALUES ('050237', '1', '意大利语', null);
INSERT INTO `t_b_xkly` VALUES ('050238', '1', '捷克语—斯洛伐克语', null);
INSERT INTO `t_b_xkly` VALUES ('050239', '1', '泰米尔语', null);
INSERT INTO `t_b_xkly` VALUES ('050240', '1', '普什图语', null);
INSERT INTO `t_b_xkly` VALUES ('050241', '1', '世界语', null);
INSERT INTO `t_b_xkly` VALUES ('050242', '1', '孟加拉语', null);
INSERT INTO `t_b_xkly` VALUES ('050243', '1', '尼泊尔语', null);
INSERT INTO `t_b_xkly` VALUES ('050244', '1', '塞尔维亚语—克罗地亚语', null);
INSERT INTO `t_b_xkly` VALUES ('050245', '1', '荷兰语', null);
INSERT INTO `t_b_xkly` VALUES ('050246', '1', '芬兰语', null);
INSERT INTO `t_b_xkly` VALUES ('050247', '1', '乌克兰语', null);
INSERT INTO `t_b_xkly` VALUES ('050248', '1', '韩国语', null);
INSERT INTO `t_b_xkly` VALUES ('050249', '1', '商务英语', null);
INSERT INTO `t_b_xkly` VALUES ('050250', '1', '塞尔维亚语', null);
INSERT INTO `t_b_xkly` VALUES ('050251', '1', '克罗地亚语', null);
INSERT INTO `t_b_xkly` VALUES ('050252', '1', '挪威语', null);
INSERT INTO `t_b_xkly` VALUES ('050253', '1', '丹麦语', null);
INSERT INTO `t_b_xkly` VALUES ('050254', '1', '冰岛语', null);
INSERT INTO `t_b_xkly` VALUES ('050255', '1', '翻译', null);
INSERT INTO `t_b_xkly` VALUES ('050256', '1', '爱尔兰语', null);
INSERT INTO `t_b_xkly` VALUES ('050257', '1', '拉脱维亚语', null);
INSERT INTO `t_b_xkly` VALUES ('050258', '1', '立陶宛语', null);
INSERT INTO `t_b_xkly` VALUES ('050259', '1', '斯洛文尼亚语', null);
INSERT INTO `t_b_xkly` VALUES ('050260', '1', '爱沙尼亚语', null);
INSERT INTO `t_b_xkly` VALUES ('050261', '1', '马耳他语', null);
INSERT INTO `t_b_xkly` VALUES ('050299', '1', '外国语言文学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0503', '1', '新闻传播学类', null);
INSERT INTO `t_b_xkly` VALUES ('050301', '1', '新闻学', null);
INSERT INTO `t_b_xkly` VALUES ('050302', '1', '广播电视新闻学', null);
INSERT INTO `t_b_xkly` VALUES ('050303', '1', '广告学', null);
INSERT INTO `t_b_xkly` VALUES ('050304', '1', '编辑出版学', null);
INSERT INTO `t_b_xkly` VALUES ('050305', '1', '传播学', null);
INSERT INTO `t_b_xkly` VALUES ('050306', '1', '媒体创意', null);
INSERT INTO `t_b_xkly` VALUES ('050307', '1', '新媒体与信息网络', null);
INSERT INTO `t_b_xkly` VALUES ('050399', '1', '新闻传播学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0504', '1', '艺术类', null);
INSERT INTO `t_b_xkly` VALUES ('050401', '1', '音乐学', null);
INSERT INTO `t_b_xkly` VALUES ('050402', '1', '作曲与作曲技术理论', null);
INSERT INTO `t_b_xkly` VALUES ('050403', '1', '音乐表演', null);
INSERT INTO `t_b_xkly` VALUES ('050404', '1', '绘画', null);
INSERT INTO `t_b_xkly` VALUES ('050405', '1', '雕塑', null);
INSERT INTO `t_b_xkly` VALUES ('050406', '1', '美术学', null);
INSERT INTO `t_b_xkly` VALUES ('050407', '1', '艺术设计学', null);
INSERT INTO `t_b_xkly` VALUES ('050408', '1', '艺术设计', null);
INSERT INTO `t_b_xkly` VALUES ('050409', '1', '舞蹈学', null);
INSERT INTO `t_b_xkly` VALUES ('050410', '1', '舞蹈编导', null);
INSERT INTO `t_b_xkly` VALUES ('050411', '1', '戏剧学', null);
INSERT INTO `t_b_xkly` VALUES ('050412', '1', '表演', null);
INSERT INTO `t_b_xkly` VALUES ('050413', '1', '导演', null);
INSERT INTO `t_b_xkly` VALUES ('050414', '1', '戏剧影视文学', null);
INSERT INTO `t_b_xkly` VALUES ('050415', '1', '戏剧影视美术设计', null);
INSERT INTO `t_b_xkly` VALUES ('050416', '1', '摄影', null);
INSERT INTO `t_b_xkly` VALUES ('050417', '1', '录音艺术', null);
INSERT INTO `t_b_xkly` VALUES ('050418', '1', '动画', null);
INSERT INTO `t_b_xkly` VALUES ('050419', '1', '播音与主持艺术', null);
INSERT INTO `t_b_xkly` VALUES ('050420', '1', '广播电视编导', null);
INSERT INTO `t_b_xkly` VALUES ('050421', '1', '影视教育', null);
INSERT INTO `t_b_xkly` VALUES ('050422', '1', '艺术学', null);
INSERT INTO `t_b_xkly` VALUES ('050423', '1', '影视学', null);
INSERT INTO `t_b_xkly` VALUES ('050424', '1', '广播影视编导', null);
INSERT INTO `t_b_xkly` VALUES ('050425', '1', '书法学', null);
INSERT INTO `t_b_xkly` VALUES ('050426', '1', '照明艺术', null);
INSERT INTO `t_b_xkly` VALUES ('050427', '1', '会展艺术与技术', null);
INSERT INTO `t_b_xkly` VALUES ('050428', '1', '音乐科技与艺术', null);
INSERT INTO `t_b_xkly` VALUES ('050429', '1', '中国画', null);
INSERT INTO `t_b_xkly` VALUES ('050430', '1', '公共艺术', null);
INSERT INTO `t_b_xkly` VALUES ('050431', '1', '数字游戏设计', null);
INSERT INTO `t_b_xkly` VALUES ('050432', '1', '数字电影技术', null);
INSERT INTO `t_b_xkly` VALUES ('050499', '1', '艺术类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0601', '7', '历史学类', null);
INSERT INTO `t_b_xkly` VALUES ('060101', '7', '历史学', null);
INSERT INTO `t_b_xkly` VALUES ('060102', '7', '世界历史', null);
INSERT INTO `t_b_xkly` VALUES ('060103', '7', '考古学', null);
INSERT INTO `t_b_xkly` VALUES ('060104', '7', '博物馆学', null);
INSERT INTO `t_b_xkly` VALUES ('060105', '7', '民族学', null);
INSERT INTO `t_b_xkly` VALUES ('060106', '7', '文物保护技术', null);
INSERT INTO `t_b_xkly` VALUES ('060199', '7', '历史学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0701', '2', '数学类', null);
INSERT INTO `t_b_xkly` VALUES ('070101', '2', '数学与应用数学', null);
INSERT INTO `t_b_xkly` VALUES ('070102', '2', '信息与计算科学', null);
INSERT INTO `t_b_xkly` VALUES ('070103', '2', '数理基础科学', null);
INSERT INTO `t_b_xkly` VALUES ('070199', '2', '数学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0702', '2', '物理学类', null);
INSERT INTO `t_b_xkly` VALUES ('070201', '2', '物理学', null);
INSERT INTO `t_b_xkly` VALUES ('070202', '2', '应用物理学', null);
INSERT INTO `t_b_xkly` VALUES ('070203', '2', '声学', null);
INSERT INTO `t_b_xkly` VALUES ('070204', '2', '核物理', null);
INSERT INTO `t_b_xkly` VALUES ('070299', '2', '物理学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0703', '2', '化学类', null);
INSERT INTO `t_b_xkly` VALUES ('070301', '2', '化学', null);
INSERT INTO `t_b_xkly` VALUES ('070302', '2', '应用化学', null);
INSERT INTO `t_b_xkly` VALUES ('070303', '2', '化学生物学', null);
INSERT INTO `t_b_xkly` VALUES ('070304', '2', '分子科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('070399', '2', '化学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0704', '2', '生物科学类', null);
INSERT INTO `t_b_xkly` VALUES ('070401', '2', '生物科学', null);
INSERT INTO `t_b_xkly` VALUES ('070402', '2', '生物技术', null);
INSERT INTO `t_b_xkly` VALUES ('070403', '2', '生物信息学', null);
INSERT INTO `t_b_xkly` VALUES ('070404', '2', '生物信息技术', null);
INSERT INTO `t_b_xkly` VALUES ('070405', '2', '生物科学与生物技术', null);
INSERT INTO `t_b_xkly` VALUES ('070406', '2', '动植物检疫', null);
INSERT INTO `t_b_xkly` VALUES ('070407', '2', '生物化学与分子生物学', null);
INSERT INTO `t_b_xkly` VALUES ('070408', '2', '医学信息学', null);
INSERT INTO `t_b_xkly` VALUES ('070409', '2', '植物生物技术', null);
INSERT INTO `t_b_xkly` VALUES ('070410', '2', '动物生物技术', null);
INSERT INTO `t_b_xkly` VALUES ('070411', '2', '生物资源科学', null);
INSERT INTO `t_b_xkly` VALUES ('070412', '2', '生物安全', null);
INSERT INTO `t_b_xkly` VALUES ('070413', '2', '生物医学英语', null);
INSERT INTO `t_b_xkly` VALUES ('070499', '2', '生物科学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0705', '2', '天文学类', null);
INSERT INTO `t_b_xkly` VALUES ('070501', '2', '天文学', null);
INSERT INTO `t_b_xkly` VALUES ('070599', '2', '天文学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0706', '2', '地质学类', null);
INSERT INTO `t_b_xkly` VALUES ('070601', '2', '地质学', null);
INSERT INTO `t_b_xkly` VALUES ('070602', '2', '地球化学', null);
INSERT INTO `t_b_xkly` VALUES ('070603', '2', '古生物学', null);
INSERT INTO `t_b_xkly` VALUES ('070699', '2', '地质学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0707', '2', '地理科学类', null);
INSERT INTO `t_b_xkly` VALUES ('070701', '2', '地理科学', null);
INSERT INTO `t_b_xkly` VALUES ('070702', '2', '资源环境与城乡规划管理', null);
INSERT INTO `t_b_xkly` VALUES ('070703', '2', '地理信息系统', null);
INSERT INTO `t_b_xkly` VALUES ('070704', '2', '地球信息科学与技术', null);
INSERT INTO `t_b_xkly` VALUES ('070799', '2', '地理科学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0708', '2', '地球物理学类', null);
INSERT INTO `t_b_xkly` VALUES ('070801', '2', '地球物理学', null);
INSERT INTO `t_b_xkly` VALUES ('070802', '2', '地球与空间科学', null);
INSERT INTO `t_b_xkly` VALUES ('070803', '2', '空间科学与技术', null);
INSERT INTO `t_b_xkly` VALUES ('070899', '2', '地球物理学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0709', '2', '大气科学类', null);
INSERT INTO `t_b_xkly` VALUES ('070901', '2', '大气科学', null);
INSERT INTO `t_b_xkly` VALUES ('070902', '2', '应用气象学', null);
INSERT INTO `t_b_xkly` VALUES ('070999', '2', '大气科学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0710', '2', '海洋科学类', null);
INSERT INTO `t_b_xkly` VALUES ('071001', '2', '海洋科学', null);
INSERT INTO `t_b_xkly` VALUES ('071002', '2', '海洋技术', null);
INSERT INTO `t_b_xkly` VALUES ('071003', '2', '海洋管理', null);
INSERT INTO `t_b_xkly` VALUES ('071004', '2', '军事海洋学', null);
INSERT INTO `t_b_xkly` VALUES ('071005', '2', '海洋生物资源与环境', null);
INSERT INTO `t_b_xkly` VALUES ('071099', '2', '海洋科学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0711', '2', '力学类', null);
INSERT INTO `t_b_xkly` VALUES ('071101', '2', '理论与应用力学', null);
INSERT INTO `t_b_xkly` VALUES ('071199', '2', '力学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0712', '2', '电子信息科学类', null);
INSERT INTO `t_b_xkly` VALUES ('071201', '2', '电子信息科学与技术', null);
INSERT INTO `t_b_xkly` VALUES ('071202', '2', '微电子学', null);
INSERT INTO `t_b_xkly` VALUES ('071203', '2', '光信息科学与技术', null);
INSERT INTO `t_b_xkly` VALUES ('071204', '2', '科技防卫', null);
INSERT INTO `t_b_xkly` VALUES ('071205', '2', '信息安全', null);
INSERT INTO `t_b_xkly` VALUES ('071206', '2', '信息科学技术', null);
INSERT INTO `t_b_xkly` VALUES ('071207', '2', '光电子技术科学', null);
INSERT INTO `t_b_xkly` VALUES ('071299', '2', '电子信息科学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0713', '2', '材料科学类', null);
INSERT INTO `t_b_xkly` VALUES ('071301', '2', '材料物理', null);
INSERT INTO `t_b_xkly` VALUES ('071302', '2', '材料化学', null);
INSERT INTO `t_b_xkly` VALUES ('071399', '2', '材料科学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0714', '2', '环境科学类', null);
INSERT INTO `t_b_xkly` VALUES ('071401', '2', '环境科学', null);
INSERT INTO `t_b_xkly` VALUES ('071402', '2', '生态学', null);
INSERT INTO `t_b_xkly` VALUES ('071403', '2', '资源环境科学', null);
INSERT INTO `t_b_xkly` VALUES ('071404', '2', '地球环境科学', null);
INSERT INTO `t_b_xkly` VALUES ('071499', '2', '环境科学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0715', '2', '心理学类', null);
INSERT INTO `t_b_xkly` VALUES ('071501', '2', '心理学', null);
INSERT INTO `t_b_xkly` VALUES ('071502', '2', '应用心理学', null);
INSERT INTO `t_b_xkly` VALUES ('071599', '2', '心理学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0716', '2', '统计学类', null);
INSERT INTO `t_b_xkly` VALUES ('071601', '2', '统计学', null);
INSERT INTO `t_b_xkly` VALUES ('071699', '2', '统计学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0717', '2', '系统理论类', null);
INSERT INTO `t_b_xkly` VALUES ('071701', '2', '系统理论', null);
INSERT INTO `t_b_xkly` VALUES ('071702', '2', '系统科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('071799', '2', '系统理论类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0801', '3', '地矿类', null);
INSERT INTO `t_b_xkly` VALUES ('080101', '3', '采矿工程', null);
INSERT INTO `t_b_xkly` VALUES ('080102', '3', '石油工程', null);
INSERT INTO `t_b_xkly` VALUES ('080103', '3', '矿物加工工程', null);
INSERT INTO `t_b_xkly` VALUES ('080104', '3', '勘查技术与工程', null);
INSERT INTO `t_b_xkly` VALUES ('080105', '3', '资源勘查工程', null);
INSERT INTO `t_b_xkly` VALUES ('080106', '3', '地质工程', null);
INSERT INTO `t_b_xkly` VALUES ('080107', '3', '矿物资源工程', null);
INSERT INTO `t_b_xkly` VALUES ('080108', '3', '煤及煤层气工程', null);
INSERT INTO `t_b_xkly` VALUES ('080109', '3', '地下水科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('080110', '3', '能源与资源工程', null);
INSERT INTO `t_b_xkly` VALUES ('080111', '3', '海洋油气工程', null);
INSERT INTO `t_b_xkly` VALUES ('080199', '3', '地矿类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0802', '3', '材料类', null);
INSERT INTO `t_b_xkly` VALUES ('080201', '3', '冶金工程', null);
INSERT INTO `t_b_xkly` VALUES ('080202', '3', '金属材料工程', null);
INSERT INTO `t_b_xkly` VALUES ('080203', '3', '无机非金属材料工程', null);
INSERT INTO `t_b_xkly` VALUES ('080204', '3', '高分子材料与工程', null);
INSERT INTO `t_b_xkly` VALUES ('080205', '3', '材料科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('080206', '3', '复合材料与工程', null);
INSERT INTO `t_b_xkly` VALUES ('080207', '3', '焊接技术与工程', null);
INSERT INTO `t_b_xkly` VALUES ('080208', '3', '宝石及材料工艺学', null);
INSERT INTO `t_b_xkly` VALUES ('080209', '3', '粉体材料科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('080210', '3', '再生资源科学与技术', null);
INSERT INTO `t_b_xkly` VALUES ('080211', '3', '稀土工程', null);
INSERT INTO `t_b_xkly` VALUES ('080212', '3', '高分子材料加工工程', null);
INSERT INTO `t_b_xkly` VALUES ('080213', '3', '生物功能材料', null);
INSERT INTO `t_b_xkly` VALUES ('080214', '3', '电子封装技术', null);
INSERT INTO `t_b_xkly` VALUES ('080215', '3', '功能材料', null);
INSERT INTO `t_b_xkly` VALUES ('080216', '3', '纳米材料与技术', null);
INSERT INTO `t_b_xkly` VALUES ('080217', '3', '新能源材料与器件', null);
INSERT INTO `t_b_xkly` VALUES ('080218', '3', '资源循环科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('080299', '3', '材料类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0803', '3', '机械类', null);
INSERT INTO `t_b_xkly` VALUES ('080301', '3', '机械设计制造及其自动化', null);
INSERT INTO `t_b_xkly` VALUES ('080302', '3', '材料成型及控制工程', null);
INSERT INTO `t_b_xkly` VALUES ('080303', '3', '工业设计', null);
INSERT INTO `t_b_xkly` VALUES ('080304', '3', '过程装备与控制工程', null);
INSERT INTO `t_b_xkly` VALUES ('080305', '3', '机械工程及自动化', null);
INSERT INTO `t_b_xkly` VALUES ('080306', '3', '车辆工程', null);
INSERT INTO `t_b_xkly` VALUES ('080307', '3', '机械电子工程', null);
INSERT INTO `t_b_xkly` VALUES ('080308', '3', '汽车服务工程', null);
INSERT INTO `t_b_xkly` VALUES ('080309', '3', '制造自动化与测控技术', null);
INSERT INTO `t_b_xkly` VALUES ('080310', '3', '微机电系统工程', null);
INSERT INTO `t_b_xkly` VALUES ('080311', '3', '制造工程', null);
INSERT INTO `t_b_xkly` VALUES ('080312', '3', '体育装备工程', null);
INSERT INTO `t_b_xkly` VALUES ('080313', '3', '工程机械', null);
INSERT INTO `t_b_xkly` VALUES ('080399', '3', '机械类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0804', '3', '仪器仪表类', null);
INSERT INTO `t_b_xkly` VALUES ('080401', '3', '测控技术与仪器', null);
INSERT INTO `t_b_xkly` VALUES ('080402', '3', '电子信息技术及仪器', null);
INSERT INTO `t_b_xkly` VALUES ('080499', '3', '仪器仪表类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0805', '3', '能源动力类', null);
INSERT INTO `t_b_xkly` VALUES ('080501', '3', '热能与动力工程', null);
INSERT INTO `t_b_xkly` VALUES ('080502', '3', '核工程与核技术', null);
INSERT INTO `t_b_xkly` VALUES ('080503', '3', '工程物理', null);
INSERT INTO `t_b_xkly` VALUES ('080504', '3', '能源与环境系统工程', null);
INSERT INTO `t_b_xkly` VALUES ('080505', '3', '能源工程及自动化', null);
INSERT INTO `t_b_xkly` VALUES ('080506', '3', '能源动力系统及自动化', null);
INSERT INTO `t_b_xkly` VALUES ('080507', '3', '风能与动力工程', null);
INSERT INTO `t_b_xkly` VALUES ('080508', '3', '核技术', null);
INSERT INTO `t_b_xkly` VALUES ('080509', '3', '辐射防护与环境工程', null);
INSERT INTO `t_b_xkly` VALUES ('080510', '3', '核化工与核燃料工程', null);
INSERT INTO `t_b_xkly` VALUES ('080511', '3', '核反应堆工程', null);
INSERT INTO `t_b_xkly` VALUES ('080512', '3', '新能源科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('080599', '3', '能源动力类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0806', '3', '电气信息类', null);
INSERT INTO `t_b_xkly` VALUES ('080601', '3', '电气工程及其自动化', null);
INSERT INTO `t_b_xkly` VALUES ('080602', '3', '自动化', null);
INSERT INTO `t_b_xkly` VALUES ('080603', '3', '电子信息工程', null);
INSERT INTO `t_b_xkly` VALUES ('080604', '3', '通信工程', null);
INSERT INTO `t_b_xkly` VALUES ('080605', '3', '计算机科学与技术', null);
INSERT INTO `t_b_xkly` VALUES ('080606', '3', '电子科学与技术', null);
INSERT INTO `t_b_xkly` VALUES ('080607', '3', '生物医学工程', null);
INSERT INTO `t_b_xkly` VALUES ('080608', '3', '电气工程与自动化', null);
INSERT INTO `t_b_xkly` VALUES ('080609', '3', '信息工程', null);
INSERT INTO `t_b_xkly` VALUES ('080610', '3', '光源与照明', null);
INSERT INTO `t_b_xkly` VALUES ('080611', '3', '软件工程', null);
INSERT INTO `t_b_xkly` VALUES ('080612', '3', '影视艺术技术', null);
INSERT INTO `t_b_xkly` VALUES ('080613', '3', '网络工程', null);
INSERT INTO `t_b_xkly` VALUES ('080614', '3', '信息显示与光电技术', null);
INSERT INTO `t_b_xkly` VALUES ('080615', '3', '集成电路设计与集成系统', null);
INSERT INTO `t_b_xkly` VALUES ('080616', '3', '光电信息工程', null);
INSERT INTO `t_b_xkly` VALUES ('080617', '3', '广播电视工程', null);
INSERT INTO `t_b_xkly` VALUES ('080618', '3', '电气信息工程', null);
INSERT INTO `t_b_xkly` VALUES ('080619', '3', '计算机软件', null);
INSERT INTO `t_b_xkly` VALUES ('080620', '3', '电力工程与管理', null);
INSERT INTO `t_b_xkly` VALUES ('080621', '3', '微电子制造工程', null);
INSERT INTO `t_b_xkly` VALUES ('080622', '3', '假肢矫形工程', null);
INSERT INTO `t_b_xkly` VALUES ('080623', '3', '数字媒体艺术', null);
INSERT INTO `t_b_xkly` VALUES ('080624', '3', '医学信息工程', null);
INSERT INTO `t_b_xkly` VALUES ('080625', '3', '信息物理工程', null);
INSERT INTO `t_b_xkly` VALUES ('080626', '3', '医疗器械工程', null);
INSERT INTO `t_b_xkly` VALUES ('080627', '3', '智能科学与技术', null);
INSERT INTO `t_b_xkly` VALUES ('080628', '3', '数字媒体技术', null);
INSERT INTO `t_b_xkly` VALUES ('080629', '3', '医学影像工程', null);
INSERT INTO `t_b_xkly` VALUES ('080630', '3', '真空电子技术', null);
INSERT INTO `t_b_xkly` VALUES ('080631', '3', '电磁场与无线技术', null);
INSERT INTO `t_b_xkly` VALUES ('080632', '3', '电信工程及管理', null);
INSERT INTO `t_b_xkly` VALUES ('080633', '3', '电气工程与智能控制', null);
INSERT INTO `t_b_xkly` VALUES ('080634', '3', '信息与通信工程', null);
INSERT INTO `t_b_xkly` VALUES ('080635', '3', '电波传播与天线', null);
INSERT INTO `t_b_xkly` VALUES ('080636', '3', '船舶电子电气工程', null);
INSERT INTO `t_b_xkly` VALUES ('080637', '3', '电子与计算机工程', null);
INSERT INTO `t_b_xkly` VALUES ('080638', '3', '仿真科学与技术', null);
INSERT INTO `t_b_xkly` VALUES ('080639', '3', '电机电器智能化', null);
INSERT INTO `t_b_xkly` VALUES ('080640', '3', '物联网工程', null);
INSERT INTO `t_b_xkly` VALUES ('080641', '3', '传感网技术', null);
INSERT INTO `t_b_xkly` VALUES ('080642', '3', '微电子材料与器件', null);
INSERT INTO `t_b_xkly` VALUES ('080643', '3', '光电子材料与器件', null);
INSERT INTO `t_b_xkly` VALUES ('080644', '3', '水声工程', null);
INSERT INTO `t_b_xkly` VALUES ('080645', '3', '智能电网信息工程', null);
INSERT INTO `t_b_xkly` VALUES ('080699', '3', '电气信息类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0807', '3', '土建类', null);
INSERT INTO `t_b_xkly` VALUES ('080701', '3', '建筑学', null);
INSERT INTO `t_b_xkly` VALUES ('080702', '3', '城市规划', null);
INSERT INTO `t_b_xkly` VALUES ('080703', '3', '土木工程', null);
INSERT INTO `t_b_xkly` VALUES ('080704', '3', '建筑环境与设备工程', null);
INSERT INTO `t_b_xkly` VALUES ('080705', '3', '给水排水工程', null);
INSERT INTO `t_b_xkly` VALUES ('080706', '3', '城市地下空间工程', null);
INSERT INTO `t_b_xkly` VALUES ('080707', '3', '历史建筑保护工程', null);
INSERT INTO `t_b_xkly` VALUES ('080708', '3', '景观建筑设计', null);
INSERT INTO `t_b_xkly` VALUES ('080709', '3', '水务工程', null);
INSERT INTO `t_b_xkly` VALUES ('080710', '3', '建筑设施智能技术', null);
INSERT INTO `t_b_xkly` VALUES ('080711', '3', '给排水科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('080712', '3', '建筑电气与智能化', null);
INSERT INTO `t_b_xkly` VALUES ('080713', '3', '景观学', null);
INSERT INTO `t_b_xkly` VALUES ('080714', '3', '风景园林', null);
INSERT INTO `t_b_xkly` VALUES ('080715', '3', '总图设计与工业运输', null);
INSERT INTO `t_b_xkly` VALUES ('080716', '3', '建筑节能技术与工程', null);
INSERT INTO `t_b_xkly` VALUES ('080724', '3', '道路桥梁与渡河工程', null);
INSERT INTO `t_b_xkly` VALUES ('080799', '3', '土建类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0808', '3', '水利类', null);
INSERT INTO `t_b_xkly` VALUES ('080801', '3', '水利水电工程', null);
INSERT INTO `t_b_xkly` VALUES ('080802', '3', '水文与水资源工程', null);
INSERT INTO `t_b_xkly` VALUES ('080803', '3', '港口航道与海岸工程', null);
INSERT INTO `t_b_xkly` VALUES ('080804', '3', '港口海岸及治河工程', null);
INSERT INTO `t_b_xkly` VALUES ('080805', '3', '水资源与海洋工程', null);
INSERT INTO `t_b_xkly` VALUES ('080899', '3', '水利类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0809', '3', '测绘类', null);
INSERT INTO `t_b_xkly` VALUES ('080901', '3', '测绘工程', null);
INSERT INTO `t_b_xkly` VALUES ('080902', '3', '遥感科学与技术', null);
INSERT INTO `t_b_xkly` VALUES ('080903', '3', '空间信息与数字技术', null);
INSERT INTO `t_b_xkly` VALUES ('080999', '3', '测绘类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0810', '3', '环境与安全类', null);
INSERT INTO `t_b_xkly` VALUES ('081001', '3', '环境工程', null);
INSERT INTO `t_b_xkly` VALUES ('081002', '3', '安全工程', null);
INSERT INTO `t_b_xkly` VALUES ('081003', '3', '水质科学与技术', null);
INSERT INTO `t_b_xkly` VALUES ('081004', '3', '灾害防治工程', null);
INSERT INTO `t_b_xkly` VALUES ('081005', '3', '环境科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('081006', '3', '环境监察', null);
INSERT INTO `t_b_xkly` VALUES ('081007', '3', '雷电防护科学与技术', null);
INSERT INTO `t_b_xkly` VALUES ('081008', '3', '核安全工程', null);
INSERT INTO `t_b_xkly` VALUES ('081009', '3', '环保设备工程', null);
INSERT INTO `t_b_xkly` VALUES ('081099', '3', '环境与安全类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0811', '3', '化工与制药类', null);
INSERT INTO `t_b_xkly` VALUES ('081101', '3', '化学工程与工艺', null);
INSERT INTO `t_b_xkly` VALUES ('081102', '3', '制药工程', null);
INSERT INTO `t_b_xkly` VALUES ('081103', '3', '化工与制药', null);
INSERT INTO `t_b_xkly` VALUES ('081104', '3', '化学工程与工业生物工程', null);
INSERT INTO `t_b_xkly` VALUES ('081105', '3', '资源科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('081106', '3', '能源化学工程', null);
INSERT INTO `t_b_xkly` VALUES ('081107', '3', '生物制药', null);
INSERT INTO `t_b_xkly` VALUES ('081199', '3', '化工与制药类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0812', '3', '交通运输类', null);
INSERT INTO `t_b_xkly` VALUES ('081201', '3', '交通运输', null);
INSERT INTO `t_b_xkly` VALUES ('081202', '3', '交通工程', null);
INSERT INTO `t_b_xkly` VALUES ('081203', '3', '油气储运工程', null);
INSERT INTO `t_b_xkly` VALUES ('081204', '3', '飞行技术', null);
INSERT INTO `t_b_xkly` VALUES ('081205', '3', '航海技术', null);
INSERT INTO `t_b_xkly` VALUES ('081206', '3', '轮机工程', null);
INSERT INTO `t_b_xkly` VALUES ('081207', '3', '物流工程', null);
INSERT INTO `t_b_xkly` VALUES ('081208', '3', '海事管理', null);
INSERT INTO `t_b_xkly` VALUES ('081209', '3', '交通设备信息工程', null);
INSERT INTO `t_b_xkly` VALUES ('081210', '3', '交通建设与装备', null);
INSERT INTO `t_b_xkly` VALUES ('081211', '3', '救助与打捞工程', null);
INSERT INTO `t_b_xkly` VALUES ('081212', '3', '航空器适航技术', null);
INSERT INTO `t_b_xkly` VALUES ('081213', '3', '交通信息与控制工程', null);
INSERT INTO `t_b_xkly` VALUES ('081299', '3', '交通运输类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0813', '3', '海洋工程类', null);
INSERT INTO `t_b_xkly` VALUES ('081301', '3', '船舶与海洋工程', null);
INSERT INTO `t_b_xkly` VALUES ('081302', '3', '海洋工程与技术', null);
INSERT INTO `t_b_xkly` VALUES ('081303', '3', '海洋资源开发技术', null);
INSERT INTO `t_b_xkly` VALUES ('081399', '3', '海洋工程类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0814', '3', '轻工纺织食品类', null);
INSERT INTO `t_b_xkly` VALUES ('081401', '3', '食品科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('081402', '3', '轻化工程', null);
INSERT INTO `t_b_xkly` VALUES ('081403', '3', '包装工程', null);
INSERT INTO `t_b_xkly` VALUES ('081404', '3', '印刷工程', null);
INSERT INTO `t_b_xkly` VALUES ('081405', '3', '纺织工程', null);
INSERT INTO `t_b_xkly` VALUES ('081406', '3', '服装设计与工程', null);
INSERT INTO `t_b_xkly` VALUES ('081407', '3', '食品质量与安全', null);
INSERT INTO `t_b_xkly` VALUES ('081408', '3', '酿酒工程', null);
INSERT INTO `t_b_xkly` VALUES ('081409', '3', '葡萄与葡萄酒工程', null);
INSERT INTO `t_b_xkly` VALUES ('081410', '3', '轻工生物技术', null);
INSERT INTO `t_b_xkly` VALUES ('081411', '3', '农产品质量与安全', null);
INSERT INTO `t_b_xkly` VALUES ('081412', '3', '非织造材料与工程', null);
INSERT INTO `t_b_xkly` VALUES ('081413', '3', '数字印刷', null);
INSERT INTO `t_b_xkly` VALUES ('081414', '3', '植物资源工程', null);
INSERT INTO `t_b_xkly` VALUES ('081415', '3', '粮食工程', null);
INSERT INTO `t_b_xkly` VALUES ('081416', '3', '乳品工程', null);
INSERT INTO `t_b_xkly` VALUES ('081499', '3', '轻工纺织食品类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0815', '3', '航空航天类', null);
INSERT INTO `t_b_xkly` VALUES ('081501', '3', '飞行器设计与工程', null);
INSERT INTO `t_b_xkly` VALUES ('081502', '3', '飞行器动力工程', null);
INSERT INTO `t_b_xkly` VALUES ('081503', '3', '飞行器制造工程', null);
INSERT INTO `t_b_xkly` VALUES ('081504', '3', '飞行器环境与生命保障工程', null);
INSERT INTO `t_b_xkly` VALUES ('081505', '3', '航空航天工程', null);
INSERT INTO `t_b_xkly` VALUES ('081506', '3', '工程力学与航天航空工程', null);
INSERT INTO `t_b_xkly` VALUES ('081507', '3', '航天运输与控制', null);
INSERT INTO `t_b_xkly` VALUES ('081508', '3', '质量与可靠性工程', null);
INSERT INTO `t_b_xkly` VALUES ('081599', '3', '航空航天类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0816', '3', '武器类', null);
INSERT INTO `t_b_xkly` VALUES ('081601', '3', '武器系统与发射工程', null);
INSERT INTO `t_b_xkly` VALUES ('081602', '3', '探测制导与控制技术', null);
INSERT INTO `t_b_xkly` VALUES ('081603', '3', '弹药工程与爆炸技术', null);
INSERT INTO `t_b_xkly` VALUES ('081604', '3', '特种能源工程与烟火技术', null);
INSERT INTO `t_b_xkly` VALUES ('081605', '3', '地面武器机动工程', null);
INSERT INTO `t_b_xkly` VALUES ('081606', '3', '信息对抗技术', null);
INSERT INTO `t_b_xkly` VALUES ('081607', '3', '武器系统与工程', null);
INSERT INTO `t_b_xkly` VALUES ('081699', '3', '武器类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0817', '3', '工程力学类', null);
INSERT INTO `t_b_xkly` VALUES ('081701', '3', '工程力学', null);
INSERT INTO `t_b_xkly` VALUES ('081702', '3', '工程结构分析', null);
INSERT INTO `t_b_xkly` VALUES ('081799', '3', '工程力学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0818', '3', '生物工程类', null);
INSERT INTO `t_b_xkly` VALUES ('081801', '3', '生物工程', null);
INSERT INTO `t_b_xkly` VALUES ('081899', '3', '生物工程类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0819', '3', '农业工程类', null);
INSERT INTO `t_b_xkly` VALUES ('081901', '3', '农业机械化及其自动化', null);
INSERT INTO `t_b_xkly` VALUES ('081902', '3', '农业电气化与自动化', null);
INSERT INTO `t_b_xkly` VALUES ('081903', '3', '农业建筑环境与能源工程', null);
INSERT INTO `t_b_xkly` VALUES ('081904', '3', '农业水利工程', null);
INSERT INTO `t_b_xkly` VALUES ('081905', '3', '农业工程', null);
INSERT INTO `t_b_xkly` VALUES ('081906', '3', '生物系统工程', null);
INSERT INTO `t_b_xkly` VALUES ('081999', '3', '农业工程类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0820', '3', '林业工程类', null);
INSERT INTO `t_b_xkly` VALUES ('082001', '3', '森林工程', null);
INSERT INTO `t_b_xkly` VALUES ('082002', '3', '木材科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('082003', '3', '林产化工', null);
INSERT INTO `t_b_xkly` VALUES ('082099', '3', '林业工程类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('0821', '3', '公安技术类', null);
INSERT INTO `t_b_xkly` VALUES ('082101', '3', '刑事科学技术', null);
INSERT INTO `t_b_xkly` VALUES ('082102', '3', '消防工程', null);
INSERT INTO `t_b_xkly` VALUES ('082103', '3', '安全防范工程', null);
INSERT INTO `t_b_xkly` VALUES ('082104', '3', '交通管理工程', null);
INSERT INTO `t_b_xkly` VALUES ('082105', '3', '核生化消防', null);
INSERT INTO `t_b_xkly` VALUES ('082106', '3', '公安视听技术', null);
INSERT INTO `t_b_xkly` VALUES ('082107', '3', '网络安全与执法', null);
INSERT INTO `t_b_xkly` VALUES ('082108', '3', '抢险救援指挥与技术', null);
INSERT INTO `t_b_xkly` VALUES ('082199', '3', '公安技术类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('1101', '5', '管理科学与工程类', null);
INSERT INTO `t_b_xkly` VALUES ('110101', '5', '管理科学', null);
INSERT INTO `t_b_xkly` VALUES ('110102', '5', '信息管理与信息系统', null);
INSERT INTO `t_b_xkly` VALUES ('110103', '5', '工业工程', null);
INSERT INTO `t_b_xkly` VALUES ('110104', '5', '工程管理', null);
INSERT INTO `t_b_xkly` VALUES ('110105', '5', '工程造价', null);
INSERT INTO `t_b_xkly` VALUES ('110106', '5', '房地产经营管理', null);
INSERT INTO `t_b_xkly` VALUES ('110107', '5', '产品质量工程', null);
INSERT INTO `t_b_xkly` VALUES ('110108', '5', '项目管理', null);
INSERT INTO `t_b_xkly` VALUES ('110109', '5', '管理科学与工程', null);
INSERT INTO `t_b_xkly` VALUES ('110110', '5', '标准化工程', null);
INSERT INTO `t_b_xkly` VALUES ('110199', '5', '管理科学与工程类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('1102', '5', '工商管理类', null);
INSERT INTO `t_b_xkly` VALUES ('110201', '5', '工商管理', null);
INSERT INTO `t_b_xkly` VALUES ('110202', '5', '市场营销', null);
INSERT INTO `t_b_xkly` VALUES ('110203', '5', '会计学', null);
INSERT INTO `t_b_xkly` VALUES ('110204', '5', '财务管理', null);
INSERT INTO `t_b_xkly` VALUES ('110205', '5', '人力资源管理', null);
INSERT INTO `t_b_xkly` VALUES ('110206', '5', '旅游管理', null);
INSERT INTO `t_b_xkly` VALUES ('110207', '5', '商品学', null);
INSERT INTO `t_b_xkly` VALUES ('110208', '5', '审计学', null);
INSERT INTO `t_b_xkly` VALUES ('110209', '5', '电子商务', null);
INSERT INTO `t_b_xkly` VALUES ('110210', '5', '物流管理', null);
INSERT INTO `t_b_xkly` VALUES ('110211', '5', '国际商务', null);
INSERT INTO `t_b_xkly` VALUES ('110212', '5', '物业管理', null);
INSERT INTO `t_b_xkly` VALUES ('110213', '5', '特许经营管理', null);
INSERT INTO `t_b_xkly` VALUES ('110214', '5', '连锁经营管理', null);
INSERT INTO `t_b_xkly` VALUES ('110215', '5', '资产评估', null);
INSERT INTO `t_b_xkly` VALUES ('110216', '5', '电子商务及法律', null);
INSERT INTO `t_b_xkly` VALUES ('110217', '5', '商务策划管理', null);
INSERT INTO `t_b_xkly` VALUES ('110218', '5', '酒店管理', null);
INSERT INTO `t_b_xkly` VALUES ('110219', '5', '采购管理', null);
INSERT INTO `t_b_xkly` VALUES ('110299', '5', '工商管理类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('1103', '5', '公共管理类', null);
INSERT INTO `t_b_xkly` VALUES ('110301', '5', '行政管理', null);
INSERT INTO `t_b_xkly` VALUES ('110302', '5', '公共事业管理', null);
INSERT INTO `t_b_xkly` VALUES ('110303', '5', '劳动与社会保障', null);
INSERT INTO `t_b_xkly` VALUES ('110304', '5', '土地资源管理', null);
INSERT INTO `t_b_xkly` VALUES ('110305', '5', '公共关系学', null);
INSERT INTO `t_b_xkly` VALUES ('110306', '5', '高等教育管理', null);
INSERT INTO `t_b_xkly` VALUES ('110307', '5', '公共政策学', null);
INSERT INTO `t_b_xkly` VALUES ('110308', '5', '城市管理', null);
INSERT INTO `t_b_xkly` VALUES ('110309', '5', '公共管理', null);
INSERT INTO `t_b_xkly` VALUES ('110310', '5', '文化产业管理', null);
INSERT INTO `t_b_xkly` VALUES ('110311', '5', '会展经济与管理', null);
INSERT INTO `t_b_xkly` VALUES ('110312', '5', '国防教育与管理', null);
INSERT INTO `t_b_xkly` VALUES ('110313', '5', '航运管理', null);
INSERT INTO `t_b_xkly` VALUES ('110314', '5', '劳动关系', null);
INSERT INTO `t_b_xkly` VALUES ('110315', '5', '公共安全管理', null);
INSERT INTO `t_b_xkly` VALUES ('110316', '5', '体育产业管理', null);
INSERT INTO `t_b_xkly` VALUES ('110317', '5', '食品经济管理', null);
INSERT INTO `t_b_xkly` VALUES ('110318', '5', '应急管理', null);
INSERT INTO `t_b_xkly` VALUES ('110319', '5', '海关管理', null);
INSERT INTO `t_b_xkly` VALUES ('110399', '5', '公共管理类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('1104', '5', '农业经济管理类', null);
INSERT INTO `t_b_xkly` VALUES ('110401', '5', '农林经济管理', null);
INSERT INTO `t_b_xkly` VALUES ('110402', '5', '农村区域发展', null);
INSERT INTO `t_b_xkly` VALUES ('110499', '5', '农业经济管理类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('1105', '5', '图书档案学类', null);
INSERT INTO `t_b_xkly` VALUES ('110501', '5', '图书馆学', null);
INSERT INTO `t_b_xkly` VALUES ('110502', '5', '档案学', null);
INSERT INTO `t_b_xkly` VALUES ('110503', '5', '信息资源管理', null);
INSERT INTO `t_b_xkly` VALUES ('110599', '5', '图书档案学类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('5901', '8', '计算机类', null);
INSERT INTO `t_b_xkly` VALUES ('590101', '8', '计算机应用技术', null);
INSERT INTO `t_b_xkly` VALUES ('590102', '8', '计算机网络技术', null);
INSERT INTO `t_b_xkly` VALUES ('590103', '8', '计算机多媒体技术', null);
INSERT INTO `t_b_xkly` VALUES ('590104', '8', '计算机系统维护', null);
INSERT INTO `t_b_xkly` VALUES ('590105', '8', '计算机硬件与外设', null);
INSERT INTO `t_b_xkly` VALUES ('590106', '8', '计算机信息管理', null);
INSERT INTO `t_b_xkly` VALUES ('590107', '8', '网络系统管理', null);
INSERT INTO `t_b_xkly` VALUES ('590108', '8', '软件技术', null);
INSERT INTO `t_b_xkly` VALUES ('590109', '8', '图形图像制作', null);
INSERT INTO `t_b_xkly` VALUES ('590110', '8', '动漫设计与制作', null);
INSERT INTO `t_b_xkly` VALUES ('590111', '8', '计算机网络与安全管理', null);
INSERT INTO `t_b_xkly` VALUES ('590112', '8', '网站规划与开发技术', null);
INSERT INTO `t_b_xkly` VALUES ('590113', '8', '游戏软件', null);
INSERT INTO `t_b_xkly` VALUES ('590114', '8', '数据通信与网络系统', null);
INSERT INTO `t_b_xkly` VALUES ('590115', '8', '航空计算机技术与应用', null);
INSERT INTO `t_b_xkly` VALUES ('590116', '8', '软件开发与项目管理', null);
INSERT INTO `t_b_xkly` VALUES ('590117', '8', '广告媒体开发', null);
INSERT INTO `t_b_xkly` VALUES ('590118', '8', '三维动画设计', null);
INSERT INTO `t_b_xkly` VALUES ('590119', '8', '计算机音乐制作', null);
INSERT INTO `t_b_xkly` VALUES ('590120', '8', '软件测试技术', null);
INSERT INTO `t_b_xkly` VALUES ('590121', '8', '嵌入式技术与应用', null);
INSERT INTO `t_b_xkly` VALUES ('590123', '8', '网络数字媒体', null);
INSERT INTO `t_b_xkly` VALUES ('590124', '8', '网络软件开发技术', null);
INSERT INTO `t_b_xkly` VALUES ('590125', '8', '软件外包服务', null);
INSERT INTO `t_b_xkly` VALUES ('590126', '8', '物流信息技术', null);
INSERT INTO `t_b_xkly` VALUES ('590127', '8', '信息技术开发与服务', null);
INSERT INTO `t_b_xkly` VALUES ('590128', '8', '数码音效设计', null);
INSERT INTO `t_b_xkly` VALUES ('590129', '8', '物联网应用技术', null);
INSERT INTO `t_b_xkly` VALUES ('590131', '8', '智能监控技术', null);
INSERT INTO `t_b_xkly` VALUES ('590155', '8', '网络营销', null);
INSERT INTO `t_b_xkly` VALUES ('590168', '8', '数据库管理与开发', null);
INSERT INTO `t_b_xkly` VALUES ('590199', '8', '计算机类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('5902', '8', '电子信息类', null);
INSERT INTO `t_b_xkly` VALUES ('590201', '8', '电子信息工程技术', null);
INSERT INTO `t_b_xkly` VALUES ('590202', '8', '应用电子技术', null);
INSERT INTO `t_b_xkly` VALUES ('590203', '8', '电子测量技术与仪器', null);
INSERT INTO `t_b_xkly` VALUES ('590204', '8', '电子仪器仪表与维修', null);
INSERT INTO `t_b_xkly` VALUES ('590205', '8', '电子设备与运行管理', null);
INSERT INTO `t_b_xkly` VALUES ('590206', '8', '电子声像技术', null);
INSERT INTO `t_b_xkly` VALUES ('590207', '8', '电子工艺与管理', null);
INSERT INTO `t_b_xkly` VALUES ('590208', '8', '信息安全技术', null);
INSERT INTO `t_b_xkly` VALUES ('590209', '8', '图文信息技术', null);
INSERT INTO `t_b_xkly` VALUES ('590210', '8', '微电子技术', null);
INSERT INTO `t_b_xkly` VALUES ('590211', '8', '无线电技术', null);
INSERT INTO `t_b_xkly` VALUES ('590212', '8', '广播电视网络技术', null);
INSERT INTO `t_b_xkly` VALUES ('590213', '8', '有线电视工程技术', null);
INSERT INTO `t_b_xkly` VALUES ('590214', '8', '光电子技术', null);
INSERT INTO `t_b_xkly` VALUES ('590215', '8', '智能产品开发', null);
INSERT INTO `t_b_xkly` VALUES ('590216', '8', '信息技术应用', null);
INSERT INTO `t_b_xkly` VALUES ('590217', '8', '音响工程', null);
INSERT INTO `t_b_xkly` VALUES ('590218', '8', '电光源技术', null);
INSERT INTO `t_b_xkly` VALUES ('590219', '8', '电子产品质量检测', null);
INSERT INTO `t_b_xkly` VALUES ('590220', '8', '飞行器电子装配技术', null);
INSERT INTO `t_b_xkly` VALUES ('590221', '8', '新能源电子技术', null);
INSERT INTO `t_b_xkly` VALUES ('590222', '8', '数字媒体技术', null);
INSERT INTO `t_b_xkly` VALUES ('590223', '8', '无损检测技术', null);
INSERT INTO `t_b_xkly` VALUES ('590224', '8', '电子信息技术及产品营销', null);
INSERT INTO `t_b_xkly` VALUES ('590225', '8', '电子组装技术与设备', null);
INSERT INTO `t_b_xkly` VALUES ('590226', '8', '嵌入式系统工程', null);
INSERT INTO `t_b_xkly` VALUES ('590227', '8', '电子电路设计与工艺', null);
INSERT INTO `t_b_xkly` VALUES ('590228', '8', '单片机与应用电子技术', null);
INSERT INTO `t_b_xkly` VALUES ('590231', '8', '液晶显示与光电技术', null);
INSERT INTO `t_b_xkly` VALUES ('590240', '8', '计算机速录', null);
INSERT INTO `t_b_xkly` VALUES ('590298', '8', '光伏应用技术', null);
INSERT INTO `t_b_xkly` VALUES ('590299', '8', '电子信息类其他专业', null);
INSERT INTO `t_b_xkly` VALUES ('5903', '8', '通信类', null);
INSERT INTO `t_b_xkly` VALUES ('590301', '8', '通信技术', null);
INSERT INTO `t_b_xkly` VALUES ('590302', '8', '移动通信技术', null);
INSERT INTO `t_b_xkly` VALUES ('590303', '8', '计算机通信', null);
INSERT INTO `t_b_xkly` VALUES ('590304', '8', '程控交换技术', null);
INSERT INTO `t_b_xkly` VALUES ('590305', '8', '通信网络与设备', null);
INSERT INTO `t_b_xkly` VALUES ('590306', '8', '通信系统运行管理', null);
INSERT INTO `t_b_xkly` VALUES ('590307', '8', '卫星数字技术', null);
INSERT INTO `t_b_xkly` VALUES ('590308', '8', '通信线路', null);
INSERT INTO `t_b_xkly` VALUES ('590309', '8', '光纤通信', null);
INSERT INTO `t_b_xkly` VALUES ('590310', '8', '邮政通信', null);
INSERT INTO `t_b_xkly` VALUES ('590318', '8', '通信工程设计与施工', null);
INSERT INTO `t_b_xkly` VALUES ('590319', '8', '呼叫中心服务与管理', null);
INSERT INTO `t_b_xkly` VALUES ('590350', '8', '通讯工程设计与管理', null);
INSERT INTO `t_b_xkly` VALUES ('590351', '8', '电信商务', null);
INSERT INTO `t_b_xkly` VALUES ('590352', '8', '移动通信运营与服务', null);
INSERT INTO `t_b_xkly` VALUES ('590353', '8', '电信服务与管理', null);
INSERT INTO `t_b_xkly` VALUES ('590355', '8', '手机检测与维护', null);
INSERT INTO `t_b_xkly` VALUES ('590356', '8', '通信工程监理', null);
INSERT INTO `t_b_xkly` VALUES ('590399', '8', '通信类其他专业', null);

-- ----------------------------
-- Table structure for `t_b_xkml`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_xkml`;
CREATE TABLE `t_b_xkml` (
  `XKMLBH` int(11) NOT NULL AUTO_INCREMENT,
  `XKMLMC` varchar(40) NOT NULL,
  `XKMLSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`XKMLBH`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_b_xkml
-- ----------------------------
INSERT INTO `t_b_xkml` VALUES ('1', '文学', null);
INSERT INTO `t_b_xkml` VALUES ('2', '理学', null);
INSERT INTO `t_b_xkml` VALUES ('3', '工学', null);
INSERT INTO `t_b_xkml` VALUES ('4', '教育学', null);
INSERT INTO `t_b_xkml` VALUES ('5', '管理学', null);
INSERT INTO `t_b_xkml` VALUES ('6', '法学', null);
INSERT INTO `t_b_xkml` VALUES ('7', '历史学', null);
INSERT INTO `t_b_xkml` VALUES ('8', '电子信息大类', '专科');

-- ----------------------------
-- Table structure for `t_b_xkzy`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_xkzy`;
CREATE TABLE `t_b_xkzy` (
  `XKZYBH` int(11) NOT NULL AUTO_INCREMENT,
  `JGBH` int(11) NOT NULL,
  `XKZYMC` varchar(30) NOT NULL,
  `XKZYSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`XKZYBH`),
  KEY `FK_Reference_43` (`JGBH`),
  CONSTRAINT `FK_Reference_43` FOREIGN KEY (`JGBH`) REFERENCES `t_b_jg` (`JGBH`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='计算机科学与技术\r\n软件技术\r\n嵌入式';

-- ----------------------------
-- Records of t_b_xkzy
-- ----------------------------
INSERT INTO `t_b_xkzy` VALUES ('1', '2', '计算机科学与技术', null);
INSERT INTO `t_b_xkzy` VALUES ('2', '2', '物流工程', null);
INSERT INTO `t_b_xkzy` VALUES ('3', '2', '网络工程', null);
INSERT INTO `t_b_xkzy` VALUES ('4', '2', '电子工程', null);
INSERT INTO `t_b_xkzy` VALUES ('5', '10', '汉语言文学', null);
INSERT INTO `t_b_xkzy` VALUES ('6', '10', '汉语国际教育', null);
INSERT INTO `t_b_xkzy` VALUES ('7', '9', '商务英语', null);
INSERT INTO `t_b_xkzy` VALUES ('8', '9', '日语教育', null);
INSERT INTO `t_b_xkzy` VALUES ('9', '1', '嵌入式系统工程', '');
INSERT INTO `t_b_xkzy` VALUES ('10', '1', '影视动画', '');
INSERT INTO `t_b_xkzy` VALUES ('11', '1', '网络技术', '');
INSERT INTO `t_b_xkzy` VALUES ('12', '5', '公共事业管理', '');
INSERT INTO `t_b_xkzy` VALUES ('13', '5', '历史教育', '');
INSERT INTO `t_b_xkzy` VALUES ('14', '6', '化工制药', '');
INSERT INTO `t_b_xkzy` VALUES ('15', '6', '应用化学', '');
INSERT INTO `t_b_xkzy` VALUES ('16', '7', '生物科学', '');
INSERT INTO `t_b_xkzy` VALUES ('17', '7', '生物技术', '');
INSERT INTO `t_b_xkzy` VALUES ('18', '13', '特殊教育', '');
INSERT INTO `t_b_xkzy` VALUES ('19', '13', '学前教育', '');
INSERT INTO `t_b_xkzy` VALUES ('20', '13', '教育学', '');
INSERT INTO `t_b_xkzy` VALUES ('22', '8', '应用数学', '');
INSERT INTO `t_b_xkzy` VALUES ('23', '8', '数学教育', '');
INSERT INTO `t_b_xkzy` VALUES ('24', '4', '文化市场管理', '');
INSERT INTO `t_b_xkzy` VALUES ('25', '12', '导游', '');
INSERT INTO `t_b_xkzy` VALUES ('26', '11', '舞蹈', '');
INSERT INTO `t_b_xkzy` VALUES ('27', '11', '油画', '');
INSERT INTO `t_b_xkzy` VALUES ('29', '1', '软件技术', '');

-- ----------------------------
-- Table structure for `t_b_xl`
-- ----------------------------
DROP TABLE IF EXISTS `t_b_xl`;
CREATE TABLE `t_b_xl` (
  `XLBH` int(11) NOT NULL AUTO_INCREMENT,
  `XLMC` varchar(40) NOT NULL,
  `XLSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`XLBH`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_b_xl
-- ----------------------------
INSERT INTO `t_b_xl` VALUES ('1', '研究生', null);
INSERT INTO `t_b_xl` VALUES ('2', '硕士', null);
INSERT INTO `t_b_xl` VALUES ('3', '博士', null);

-- ----------------------------
-- Table structure for `t_e_kcxx`
-- ----------------------------
DROP TABLE IF EXISTS `t_e_kcxx`;
CREATE TABLE `t_e_kcxx` (
  `KCBH` int(11) NOT NULL AUTO_INCREMENT,
  `JGBH` int(11) NOT NULL,
  `XKZYBH` int(11) NOT NULL,
  `KMBH` int(11) NOT NULL,
  `NJBH` int(11) NOT NULL,
  `BH` int(11) NOT NULL,
  `JSBH` varchar(20) NOT NULL,
  `KCSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`KCBH`),
  KEY `FK_Reference_22` (`JGBH`),
  KEY `FK_Reference_23` (`XKZYBH`),
  KEY `FK_Reference_24` (`KMBH`),
  KEY `FK_Reference_25` (`NJBH`),
  KEY `FK_Reference_26` (`BH`),
  KEY `FK_Reference_27` (`JSBH`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`JGBH`) REFERENCES `t_b_jg` (`JGBH`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`XKZYBH`) REFERENCES `t_b_xkzy` (`XKZYBH`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`KMBH`) REFERENCES `t_b_km` (`KMBH`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`NJBH`) REFERENCES `t_b_nj` (`NJBH`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`BH`) REFERENCES `t_b_bj` (`BH`),
  CONSTRAINT `FK_Reference_27` FOREIGN KEY (`JSBH`) REFERENCES `t_ry_jsxx` (`JSBH`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_e_kcxx
-- ----------------------------
INSERT INTO `t_e_kcxx` VALUES ('15', '2', '1', '1', '4', '15', '123456', '');
INSERT INTO `t_e_kcxx` VALUES ('16', '2', '1', '6', '4', '15', '123456', '');

-- ----------------------------
-- Table structure for `t_e_kscj`
-- ----------------------------
DROP TABLE IF EXISTS `t_e_kscj`;
CREATE TABLE `t_e_kscj` (
  `CJBH` int(11) NOT NULL AUTO_INCREMENT,
  `XSXH` varchar(15) NOT NULL,
  `RWBH` varchar(16) NOT NULL,
  `XZCJ` float DEFAULT NULL,
  `TKCJ` float DEFAULT NULL,
  `JDCJ` float DEFAULT NULL,
  `ZHCJ` float DEFAULT NULL,
  `ZCJ` float DEFAULT NULL,
  `TG` int(2) NOT NULL COMMENT '是否通过',
  `BZW` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CJBH`),
  KEY `FK326F29D470E646BF` (`XSXH`),
  KEY `FK326F29D4645F7B3B` (`RWBH`),
  CONSTRAINT `FK326F29D4645F7B3B` FOREIGN KEY (`RWBH`) REFERENCES `t_e_ksrw` (`RWBH`),
  CONSTRAINT `FK326F29D470E646BF` FOREIGN KEY (`XSXH`) REFERENCES `t_ry_xsxx` (`XSXH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_e_kscj
-- ----------------------------

-- ----------------------------
-- Table structure for `t_e_ksrw`
-- ----------------------------
DROP TABLE IF EXISTS `t_e_ksrw`;
CREATE TABLE `t_e_ksrw` (
  `RWBH` varchar(16) NOT NULL,
  `SJBH` varchar(16) NOT NULL,
  `KMBH` int(11) NOT NULL,
  `BH` varchar(50) NOT NULL,
  `XZBH` int(11) NOT NULL,
  `JSBH` varchar(20) NOT NULL,
  `KSSJ` varchar(20) NOT NULL,
  `JSSJ` varchar(20) NOT NULL,
  `KSDD` varchar(50) NOT NULL,
  `JKLS` varchar(50) DEFAULT NULL,
  `KSSM` varchar(100) DEFAULT NULL,
  `KSZT` varchar(10) NOT NULL COMMENT 'PENDING-',
  PRIMARY KEY (`RWBH`),
  KEY `FK_Reference_31` (`SJBH`),
  KEY `FK_Reference_32` (`KMBH`),
  KEY `FK_Reference_34` (`XZBH`),
  KEY `FK_Reference_35` (`JSBH`),
  CONSTRAINT `FK_Reference_31` FOREIGN KEY (`SJBH`) REFERENCES `t_e_sjxx` (`SJBH`),
  CONSTRAINT `FK_Reference_32` FOREIGN KEY (`KMBH`) REFERENCES `t_b_km` (`KMBH`),
  CONSTRAINT `FK_Reference_34` FOREIGN KEY (`XZBH`) REFERENCES `t_b_ksxz` (`XZBH`),
  CONSTRAINT `FK_Reference_35` FOREIGN KEY (`JSBH`) REFERENCES `t_ry_jsxx` (`JSBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_e_ksrw
-- ----------------------------

-- ----------------------------
-- Table structure for `t_e_sdzj`
-- ----------------------------
DROP TABLE IF EXISTS `t_e_sdzj`;
CREATE TABLE `t_e_sdzj` (
  `BH` int(11) NOT NULL AUTO_INCREMENT,
  `SJBH` varchar(16) NOT NULL,
  `LXBH` int(11) NOT NULL,
  `STTH` varchar(400) NOT NULL,
  `STGS` int(11) NOT NULL,
  `STZF` float NOT NULL,
  PRIMARY KEY (`BH`),
  KEY `FK_Reference_40` (`SJBH`),
  KEY `FK_Reference_41` (`LXBH`),
  CONSTRAINT `FK_Reference_40` FOREIGN KEY (`SJBH`) REFERENCES `t_e_sjxx` (`SJBH`),
  CONSTRAINT `FK_Reference_41` FOREIGN KEY (`LXBH`) REFERENCES `t_t_stlx` (`LXBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_e_sdzj
-- ----------------------------

-- ----------------------------
-- Table structure for `t_e_sjxx`
-- ----------------------------
DROP TABLE IF EXISTS `t_e_sjxx`;
CREATE TABLE `t_e_sjxx` (
  `SJBH` varchar(16) NOT NULL,
  `SJMC` varchar(50) NOT NULL,
  `JSBH` varchar(20) NOT NULL,
  `KMBH` int(11) NOT NULL,
  `NJBH` int(11) NOT NULL,
  `TGFS` float NOT NULL COMMENT '通过分数',
  `CJSJ` varchar(15) NOT NULL,
  `ZJFS` int(11) NOT NULL COMMENT '1自动0手动',
  `SJSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SJBH`),
  KEY `FK_Reference_28` (`JSBH`),
  KEY `FK_Reference_29` (`KMBH`),
  KEY `FK_Reference_30` (`NJBH`),
  CONSTRAINT `FK_Reference_28` FOREIGN KEY (`JSBH`) REFERENCES `t_ry_jsxx` (`JSBH`),
  CONSTRAINT `FK_Reference_29` FOREIGN KEY (`KMBH`) REFERENCES `t_b_km` (`KMBH`),
  CONSTRAINT `FK_Reference_30` FOREIGN KEY (`NJBH`) REFERENCES `t_b_nj` (`NJBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_e_sjxx
-- ----------------------------

-- ----------------------------
-- Table structure for `t_e_zdzj`
-- ----------------------------
DROP TABLE IF EXISTS `t_e_zdzj`;
CREATE TABLE `t_e_zdzj` (
  `BH` int(11) NOT NULL AUTO_INCREMENT,
  `SJBH` varchar(16) NOT NULL,
  `LXBH` int(11) NOT NULL,
  `NDXS` int(11) NOT NULL,
  `STGS` int(11) NOT NULL,
  `SM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BH`),
  KEY `FK_Reference_39` (`SJBH`),
  KEY `FK_Reference_42` (`LXBH`),
  CONSTRAINT `FK_Reference_39` FOREIGN KEY (`SJBH`) REFERENCES `t_e_sjxx` (`SJBH`),
  CONSTRAINT `FK_Reference_42` FOREIGN KEY (`LXBH`) REFERENCES `t_t_stlx` (`LXBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_e_zdzj
-- ----------------------------

-- ----------------------------
-- Table structure for `t_ry_jsxx`
-- ----------------------------
DROP TABLE IF EXISTS `t_ry_jsxx`;
CREATE TABLE `t_ry_jsxx` (
  `JSBH` varchar(20) NOT NULL,
  `JSMM` varchar(32) NOT NULL,
  `JSXM` varchar(36) NOT NULL,
  `JSXB` varchar(1) DEFAULT NULL,
  `XLBH` int(11) NOT NULL,
  `NLBH` int(11) NOT NULL,
  `JGBH` int(11) NOT NULL,
  `LXFS` varchar(100) DEFAULT NULL,
  `JSSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`JSBH`),
  KEY `FK_Reference_13` (`XLBH`),
  KEY `FK_Reference_14` (`NLBH`),
  KEY `FK_Reference_17` (`JGBH`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`XLBH`) REFERENCES `t_b_xl` (`XLBH`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`NLBH`) REFERENCES `t_b_nldm` (`NLBH`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`JGBH`) REFERENCES `t_b_jg` (`JGBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ry_jsxx
-- ----------------------------
INSERT INTO `t_ry_jsxx` VALUES ('123456', '123', '赵老师', '1', '3', '1', '2', null, null);

-- ----------------------------
-- Table structure for `t_ry_xsxx`
-- ----------------------------
DROP TABLE IF EXISTS `t_ry_xsxx`;
CREATE TABLE `t_ry_xsxx` (
  `XSXH` varchar(15) NOT NULL,
  `XSMM` varchar(32) NOT NULL,
  `XSXM` varchar(36) NOT NULL,
  `XSXB` int(11) NOT NULL,
  `CSRQ` varchar(15) DEFAULT NULL,
  `JG` varchar(80) DEFAULT NULL,
  `ZZMM` varchar(10) DEFAULT NULL,
  `BH` int(11) NOT NULL COMMENT 'ѧУ�Ա�',
  `NJBH` int(11) NOT NULL,
  `XKZYBH` int(11) NOT NULL,
  `JGBH` int(11) NOT NULL,
  `JSBH` int(11) NOT NULL,
  `XSSM` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`XSXH`),
  KEY `FK_Reference_16` (`JGBH`),
  KEY `FK_Reference_19` (`JSBH`),
  KEY `FK_Reference_4` (`XKZYBH`),
  KEY `FKC2065948A2B6FD7E` (`BH`),
  KEY `FKC206594866E303F9` (`NJBH`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`BH`) REFERENCES `t_b_bj` (`BH`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`JGBH`) REFERENCES `t_b_jg` (`JGBH`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`JSBH`) REFERENCES `t_r_js` (`JSBH`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`NJBH`) REFERENCES `t_b_nj` (`NJBH`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`XKZYBH`) REFERENCES `t_b_xkzy` (`XKZYBH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ry_xsxx
-- ----------------------------
INSERT INTO `t_ry_xsxx` VALUES ('20130402201001', '123', '张三', '1', '1990-05-02', '河北省邯郸市', '党员', '15', '4', '1', '2', '2', '');

-- ----------------------------
-- Table structure for `t_r_dz`
-- ----------------------------
DROP TABLE IF EXISTS `t_r_dz`;
CREATE TABLE `t_r_dz` (
  `DZBH` int(11) NOT NULL AUTO_INCREMENT,
  `DZMC` varchar(20) NOT NULL,
  `DZSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DZBH`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_r_dz
-- ----------------------------
INSERT INTO `t_r_dz` VALUES ('1', 'list', '列表');
INSERT INTO `t_r_dz` VALUES ('2', 'show', '详细信息');
INSERT INTO `t_r_dz` VALUES ('3', 'delete', '删除');
INSERT INTO `t_r_dz` VALUES ('4', 'update', '修改');
INSERT INTO `t_r_dz` VALUES ('5', 'add', '跳转添加页面');
INSERT INTO `t_r_dz` VALUES ('6', 'save', '保存数据');
INSERT INTO `t_r_dz` VALUES ('7', 'create', '创建');
INSERT INTO `t_r_dz` VALUES ('8', 'search', '搜索');
INSERT INTO `t_r_dz` VALUES ('9', 'change', '改变');
INSERT INTO `t_r_dz` VALUES ('10', 'statistics', '统计');
INSERT INTO `t_r_dz` VALUES ('11', 'read', '导入');
INSERT INTO `t_r_dz` VALUES ('12', 'export', '导出');
INSERT INTO `t_r_dz` VALUES ('13', 'judge', '二次判分');
INSERT INTO `t_r_dz` VALUES ('14', 'download', '下载');
INSERT INTO `t_r_dz` VALUES ('15', 'get', '获取数据');
INSERT INTO `t_r_dz` VALUES ('16', 'file', '文件管理');
INSERT INTO `t_r_dz` VALUES ('17', 'revoke', '分配权限');

-- ----------------------------
-- Table structure for `t_r_dzmk`
-- ----------------------------
DROP TABLE IF EXISTS `t_r_dzmk`;
CREATE TABLE `t_r_dzmk` (
  `MKDZBH` int(11) NOT NULL AUTO_INCREMENT,
  `DZBH` int(11) NOT NULL,
  `MKBH` int(11) NOT NULL,
  PRIMARY KEY (`MKDZBH`),
  KEY `FK_Reference_10` (`MKBH`),
  KEY `FK_Reference_9` (`DZBH`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`MKBH`) REFERENCES `t_r_mk` (`MKBH`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`DZBH`) REFERENCES `t_r_dz` (`DZBH`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_r_dzmk
-- ----------------------------
INSERT INTO `t_r_dzmk` VALUES ('4', '4', '1');
INSERT INTO `t_r_dzmk` VALUES ('27', '2', '1');
INSERT INTO `t_r_dzmk` VALUES ('42', '3', '1');
INSERT INTO `t_r_dzmk` VALUES ('43', '5', '1');
INSERT INTO `t_r_dzmk` VALUES ('44', '6', '1');
INSERT INTO `t_r_dzmk` VALUES ('45', '1', '1');
INSERT INTO `t_r_dzmk` VALUES ('47', '10', '1');
INSERT INTO `t_r_dzmk` VALUES ('48', '8', '1');
INSERT INTO `t_r_dzmk` VALUES ('56', '5', '4');
INSERT INTO `t_r_dzmk` VALUES ('57', '12', '4');
INSERT INTO `t_r_dzmk` VALUES ('58', '11', '4');
INSERT INTO `t_r_dzmk` VALUES ('59', '1', '5');
INSERT INTO `t_r_dzmk` VALUES ('60', '2', '5');
INSERT INTO `t_r_dzmk` VALUES ('61', '6', '5');
INSERT INTO `t_r_dzmk` VALUES ('62', '10', '5');
INSERT INTO `t_r_dzmk` VALUES ('63', '13', '5');
INSERT INTO `t_r_dzmk` VALUES ('64', '16', '11');
INSERT INTO `t_r_dzmk` VALUES ('65', '2', '7');
INSERT INTO `t_r_dzmk` VALUES ('66', '6', '7');
INSERT INTO `t_r_dzmk` VALUES ('67', '15', '7');
INSERT INTO `t_r_dzmk` VALUES ('68', '16', '8');
INSERT INTO `t_r_dzmk` VALUES ('69', '2', '9');
INSERT INTO `t_r_dzmk` VALUES ('70', '5', '9');
INSERT INTO `t_r_dzmk` VALUES ('71', '3', '9');
INSERT INTO `t_r_dzmk` VALUES ('72', '15', '9');
INSERT INTO `t_r_dzmk` VALUES ('73', '4', '9');
INSERT INTO `t_r_dzmk` VALUES ('74', '6', '9');
INSERT INTO `t_r_dzmk` VALUES ('75', '1', '10');
INSERT INTO `t_r_dzmk` VALUES ('76', '2', '10');
INSERT INTO `t_r_dzmk` VALUES ('77', '6', '10');
INSERT INTO `t_r_dzmk` VALUES ('78', '4', '10');
INSERT INTO `t_r_dzmk` VALUES ('79', '1', '12');
INSERT INTO `t_r_dzmk` VALUES ('80', '3', '12');
INSERT INTO `t_r_dzmk` VALUES ('81', '4', '12');
INSERT INTO `t_r_dzmk` VALUES ('82', '5', '12');
INSERT INTO `t_r_dzmk` VALUES ('83', '6', '12');
INSERT INTO `t_r_dzmk` VALUES ('84', '15', '12');
INSERT INTO `t_r_dzmk` VALUES ('85', '1', '13');
INSERT INTO `t_r_dzmk` VALUES ('86', '3', '13');
INSERT INTO `t_r_dzmk` VALUES ('87', '4', '13');
INSERT INTO `t_r_dzmk` VALUES ('88', '5', '13');
INSERT INTO `t_r_dzmk` VALUES ('89', '6', '13');
INSERT INTO `t_r_dzmk` VALUES ('90', '15', '13');
INSERT INTO `t_r_dzmk` VALUES ('91', '1', '14');
INSERT INTO `t_r_dzmk` VALUES ('92', '3', '14');
INSERT INTO `t_r_dzmk` VALUES ('93', '4', '14');
INSERT INTO `t_r_dzmk` VALUES ('94', '5', '14');
INSERT INTO `t_r_dzmk` VALUES ('95', '6', '14');
INSERT INTO `t_r_dzmk` VALUES ('96', '17', '14');
INSERT INTO `t_r_dzmk` VALUES ('99', '1', '15');
INSERT INTO `t_r_dzmk` VALUES ('100', '2', '15');
INSERT INTO `t_r_dzmk` VALUES ('101', '3', '15');
INSERT INTO `t_r_dzmk` VALUES ('102', '4', '15');
INSERT INTO `t_r_dzmk` VALUES ('103', '15', '15');
INSERT INTO `t_r_dzmk` VALUES ('104', '5', '15');
INSERT INTO `t_r_dzmk` VALUES ('105', '6', '15');
INSERT INTO `t_r_dzmk` VALUES ('106', '7', '3');
INSERT INTO `t_r_dzmk` VALUES ('109', '8', '3');
INSERT INTO `t_r_dzmk` VALUES ('110', '14', '5');

-- ----------------------------
-- Table structure for `t_r_js`
-- ----------------------------
DROP TABLE IF EXISTS `t_r_js`;
CREATE TABLE `t_r_js` (
  `JSBH` int(11) NOT NULL AUTO_INCREMENT,
  `JSMC` varchar(15) NOT NULL,
  `JSSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`JSBH`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_r_js
-- ----------------------------
INSERT INTO `t_r_js` VALUES ('1', '教师', null);
INSERT INTO `t_r_js` VALUES ('2', '学生', null);
INSERT INTO `t_r_js` VALUES ('3', '管理员', null);

-- ----------------------------
-- Table structure for `t_r_jsdzmk`
-- ----------------------------
DROP TABLE IF EXISTS `t_r_jsdzmk`;
CREATE TABLE `t_r_jsdzmk` (
  `JSDZBH` int(11) NOT NULL AUTO_INCREMENT,
  `JSBH` int(11) NOT NULL,
  `MKDZBH` int(11) NOT NULL,
  PRIMARY KEY (`JSDZBH`),
  KEY `FK_Reference_11` (`JSBH`),
  KEY `FK_Reference_12` (`MKDZBH`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`JSBH`) REFERENCES `t_r_js` (`JSBH`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`MKDZBH`) REFERENCES `t_r_dzmk` (`MKDZBH`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_r_jsdzmk
-- ----------------------------
INSERT INTO `t_r_jsdzmk` VALUES ('17', '1', '4');
INSERT INTO `t_r_jsdzmk` VALUES ('18', '1', '27');
INSERT INTO `t_r_jsdzmk` VALUES ('20', '1', '42');
INSERT INTO `t_r_jsdzmk` VALUES ('21', '1', '43');
INSERT INTO `t_r_jsdzmk` VALUES ('22', '1', '44');
INSERT INTO `t_r_jsdzmk` VALUES ('30', '1', '56');
INSERT INTO `t_r_jsdzmk` VALUES ('31', '1', '57');
INSERT INTO `t_r_jsdzmk` VALUES ('32', '1', '58');
INSERT INTO `t_r_jsdzmk` VALUES ('33', '1', '59');
INSERT INTO `t_r_jsdzmk` VALUES ('34', '1', '60');
INSERT INTO `t_r_jsdzmk` VALUES ('35', '1', '61');
INSERT INTO `t_r_jsdzmk` VALUES ('36', '1', '62');
INSERT INTO `t_r_jsdzmk` VALUES ('37', '1', '63');
INSERT INTO `t_r_jsdzmk` VALUES ('38', '1', '68');
INSERT INTO `t_r_jsdzmk` VALUES ('39', '1', '69');
INSERT INTO `t_r_jsdzmk` VALUES ('40', '1', '70');
INSERT INTO `t_r_jsdzmk` VALUES ('41', '1', '71');
INSERT INTO `t_r_jsdzmk` VALUES ('42', '1', '72');
INSERT INTO `t_r_jsdzmk` VALUES ('43', '1', '73');
INSERT INTO `t_r_jsdzmk` VALUES ('44', '1', '74');
INSERT INTO `t_r_jsdzmk` VALUES ('45', '1', '75');
INSERT INTO `t_r_jsdzmk` VALUES ('46', '1', '76');
INSERT INTO `t_r_jsdzmk` VALUES ('47', '1', '77');
INSERT INTO `t_r_jsdzmk` VALUES ('48', '1', '78');
INSERT INTO `t_r_jsdzmk` VALUES ('50', '1', '64');
INSERT INTO `t_r_jsdzmk` VALUES ('52', '2', '66');
INSERT INTO `t_r_jsdzmk` VALUES ('53', '2', '67');
INSERT INTO `t_r_jsdzmk` VALUES ('54', '2', '65');
INSERT INTO `t_r_jsdzmk` VALUES ('55', '2', '76');
INSERT INTO `t_r_jsdzmk` VALUES ('56', '2', '77');
INSERT INTO `t_r_jsdzmk` VALUES ('62', '3', '79');
INSERT INTO `t_r_jsdzmk` VALUES ('63', '3', '80');
INSERT INTO `t_r_jsdzmk` VALUES ('64', '3', '81');
INSERT INTO `t_r_jsdzmk` VALUES ('65', '3', '82');
INSERT INTO `t_r_jsdzmk` VALUES ('66', '3', '83');
INSERT INTO `t_r_jsdzmk` VALUES ('67', '3', '84');
INSERT INTO `t_r_jsdzmk` VALUES ('68', '3', '85');
INSERT INTO `t_r_jsdzmk` VALUES ('69', '3', '86');
INSERT INTO `t_r_jsdzmk` VALUES ('70', '3', '87');
INSERT INTO `t_r_jsdzmk` VALUES ('71', '3', '88');
INSERT INTO `t_r_jsdzmk` VALUES ('72', '3', '89');
INSERT INTO `t_r_jsdzmk` VALUES ('73', '3', '90');
INSERT INTO `t_r_jsdzmk` VALUES ('74', '3', '91');
INSERT INTO `t_r_jsdzmk` VALUES ('75', '3', '92');
INSERT INTO `t_r_jsdzmk` VALUES ('76', '3', '93');
INSERT INTO `t_r_jsdzmk` VALUES ('77', '3', '94');
INSERT INTO `t_r_jsdzmk` VALUES ('78', '3', '95');
INSERT INTO `t_r_jsdzmk` VALUES ('79', '3', '96');
INSERT INTO `t_r_jsdzmk` VALUES ('80', '3', '99');
INSERT INTO `t_r_jsdzmk` VALUES ('81', '3', '100');
INSERT INTO `t_r_jsdzmk` VALUES ('82', '3', '101');
INSERT INTO `t_r_jsdzmk` VALUES ('83', '3', '102');
INSERT INTO `t_r_jsdzmk` VALUES ('84', '3', '103');
INSERT INTO `t_r_jsdzmk` VALUES ('85', '3', '104');
INSERT INTO `t_r_jsdzmk` VALUES ('86', '3', '105');
INSERT INTO `t_r_jsdzmk` VALUES ('87', '3', '64');
INSERT INTO `t_r_jsdzmk` VALUES ('97', '2', '106');
INSERT INTO `t_r_jsdzmk` VALUES ('98', '1', '47');
INSERT INTO `t_r_jsdzmk` VALUES ('99', '1', '45');
INSERT INTO `t_r_jsdzmk` VALUES ('100', '2', '109');

-- ----------------------------
-- Table structure for `t_r_jsjs`
-- ----------------------------
DROP TABLE IF EXISTS `t_r_jsjs`;
CREATE TABLE `t_r_jsjs` (
  `JSJSBH` int(11) NOT NULL AUTO_INCREMENT,
  `JSBH` int(11) NOT NULL,
  `T_J_JSBH` varchar(20) NOT NULL,
  PRIMARY KEY (`JSJSBH`),
  KEY `FK_Reference_36` (`JSBH`),
  KEY `FK_Reference_37` (`T_J_JSBH`),
  CONSTRAINT `FK_Reference_36` FOREIGN KEY (`JSBH`) REFERENCES `t_r_js` (`JSBH`),
  CONSTRAINT `FK_Reference_37` FOREIGN KEY (`T_J_JSBH`) REFERENCES `t_ry_jsxx` (`JSBH`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_r_jsjs
-- ----------------------------
INSERT INTO `t_r_jsjs` VALUES ('1', '1', '123456');
INSERT INTO `t_r_jsjs` VALUES ('2', '3', '123456');

-- ----------------------------
-- Table structure for `t_r_mk`
-- ----------------------------
DROP TABLE IF EXISTS `t_r_mk`;
CREATE TABLE `t_r_mk` (
  `MKBH` int(11) NOT NULL AUTO_INCREMENT,
  `MKMC` varchar(60) NOT NULL,
  `MKURL` varchar(100) NOT NULL,
  `MKSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MKBH`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_r_mk
-- ----------------------------
INSERT INTO `t_r_mk` VALUES ('1', '试卷、任务管理', '/exam', '1');
INSERT INTO `t_r_mk` VALUES ('3', '考试模块', '/examine', '学生是否有考试任务、抽卷子、序列化试卷');
INSERT INTO `t_r_mk` VALUES ('4', '试题导入导出', '/excelAction', 'poi操作excel');
INSERT INTO `t_r_mk` VALUES ('5', '成绩管理', '/judge', '二次判分、试卷统计');
INSERT INTO `t_r_mk` VALUES ('6', '用户登录', '/view', '');
INSERT INTO `t_r_mk` VALUES ('7', '在线考试', '/onlineExam', '主观题判分、序列化');
INSERT INTO `t_r_mk` VALUES ('8', '题库上传', '/fileStatus', '进度条读取');
INSERT INTO `t_r_mk` VALUES ('9', '题库管理', '/question', '增、删、改、查');
INSERT INTO `t_r_mk` VALUES ('10', '用户信息', '/user', '详细信息、修改密码');
INSERT INTO `t_r_mk` VALUES ('11', 'KindEditor', '/uploadJson', 'KindEditor富文本框操作');
INSERT INTO `t_r_mk` VALUES ('12', '课程管理', '/courseAction', '专业、科目、课程、考试任务、状态');
INSERT INTO `t_r_mk` VALUES ('13', '院系管理', '/department', '机构、年级、班级');
INSERT INTO `t_r_mk` VALUES ('14', '权限管理', '/right', '分配系统权限');
INSERT INTO `t_r_mk` VALUES ('15', '人员管理', '/usermanager', '添加、修改、删除教师或学生信息');

-- ----------------------------
-- Table structure for `t_t_jdt`
-- ----------------------------
DROP TABLE IF EXISTS `t_t_jdt`;
CREATE TABLE `t_t_jdt` (
  `TH` int(11) NOT NULL AUTO_INCREMENT,
  `BT` varchar(255) NOT NULL,
  `TM` text NOT NULL,
  `DA` text NOT NULL,
  `NDXS` int(11) NOT NULL,
  `FZ` float NOT NULL,
  `KMBH` int(11) NOT NULL,
  `NJBH` int(11) NOT NULL,
  `JSBH` int(11) NOT NULL,
  `TJSJ` varchar(50) NOT NULL,
  `STSM` text,
  PRIMARY KEY (`TH`),
  KEY `FK_Reference_46` (`KMBH`),
  KEY `FK_Reference_54` (`NJBH`),
  CONSTRAINT `FK_Reference_46` FOREIGN KEY (`KMBH`) REFERENCES `t_b_km` (`KMBH`),
  CONSTRAINT `FK_Reference_54` FOREIGN KEY (`NJBH`) REFERENCES `t_b_nj` (`NJBH`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_t_jdt
-- ----------------------------
INSERT INTO `t_t_jdt` VALUES ('3', '谈谈javascript数组排序方法sort()的使用，重点介绍sort()参数的使用及其内部机制', '谈谈javascript数组排序方法sort()的使用，重点介绍sort()参数的使用及其内部机制<br />', 'sort的实现的功能类似JAVA的比较器，数据排序从多维数组的第一维开始排序 &nbsp;可以自己定义排序方法，很不多的函数&nbsp;<br />', '1', '5', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_jdt` VALUES ('4', '结合text这段结构，谈谈innerHTML outerHTML innerText之间的区别。', '结合text这段结构，谈谈innerHTML outerHTML innerText之间的区别。', 'innerHTML对象里面的HTML,outerHTML包括对象和里面的 &nbsp;innerText对象里面的文本', '1', '10', '6', '4', '123456', '2014-04-06', '<br />');
INSERT INTO `t_t_jdt` VALUES ('5', '对Web标准化（或网站重构）知道哪些相关的知识，简述几条你知道的Web标准？', '对Web标准化（或网站重构）知道哪些相关的知识，简述几条你知道的Web标准？<br />', '网页主要由三部分组成：结构（Structure）、表现（Presentation）和行为（Behavior）。对应的网站标准也分三方面：结构化标准语言，主要包括XHTML和XML；表现标准语言主要包括CSS；行为标准主要包括对象模型（如W3C DOM）、ECMAScript等。', '1', '10', '6', '4', '123456', '2014-04-06', '<br />');
INSERT INTO `t_t_jdt` VALUES ('6', '谈谈javascript数组排序方法sort()的使用，重点介绍sort()参数的使用及其内部机制', 'sort的实现的功能类似JAVA的比较器，数据排序从多维数组的第一维开始排序 &nbsp;可以自己定义排序方法，很不多的函数&nbsp;<br />', '谈谈javascript数组排序方法sort()的使用，重点介绍sort()参数的使用及其内部机制<br />', '1', '5', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_jdt` VALUES ('7', '结合text这段结构，谈谈innerHTML outerHTML innerText之间的区别。', 'innerHTML对象里面的HTML,outerHTML包括对象和里面的 &nbsp;innerText对象里面的文本', '结合text这段结构，谈谈innerHTML outerHTML innerText之间的区别。', '1', '10', '6', '4', '123456', '2014-04-06', '<br />');
INSERT INTO `t_t_jdt` VALUES ('8', '对Web标准化（或网站重构）知道哪些相关的知识，简述几条你知道的Web标准？', '网页主要由三部分组成：结构（Structure）、表现（Presentation）和行为（Behavior）。对应的网站标准也分三方面：结构化标准语言，主要包括XHTML和XML；表现标准语言主要包括CSS；行为标准主要包括对象模型（如W3C DOM）、ECMAScript等。', '对Web标准化（或网站重构）知道哪些相关的知识，简述几条你知道的Web标准？<br />', '1', '10', '6', '4', '123456', '2014-04-06', '<br />');
INSERT INTO `t_t_jdt` VALUES ('9', '1', '<strong>试题内容</strong>', '<strong>试题答案</strong>', '1', '1', '1', '4', '123456', '2014-05-30', '<strong>试题说明</strong>');
INSERT INTO `t_t_jdt` VALUES ('10', '2', '<strong>试题内容</strong>', '<strong>试题答案</strong>', '1', '2', '1', '4', '123456', '2014-05-30', '<strong>试题说明</strong>');
INSERT INTO `t_t_jdt` VALUES ('11', '3', '<strong>试题内容</strong>', '<strong>试题答案</strong>', '1', '3', '1', '4', '123456', '2014-05-30', '<strong>试题说明</strong>');

-- ----------------------------
-- Table structure for `t_t_stlx`
-- ----------------------------
DROP TABLE IF EXISTS `t_t_stlx`;
CREATE TABLE `t_t_stlx` (
  `LXBH` int(11) NOT NULL AUTO_INCREMENT,
  `LXMC` varchar(20) NOT NULL,
  `LXSM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LXBH`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_t_stlx
-- ----------------------------
INSERT INTO `t_t_stlx` VALUES ('1', '选择题', null);
INSERT INTO `t_t_stlx` VALUES ('2', '填空题', null);
INSERT INTO `t_t_stlx` VALUES ('3', '简答题', null);
INSERT INTO `t_t_stlx` VALUES ('4', '综合题', '带图片多用途');

-- ----------------------------
-- Table structure for `t_t_tkt`
-- ----------------------------
DROP TABLE IF EXISTS `t_t_tkt`;
CREATE TABLE `t_t_tkt` (
  `TH` int(11) NOT NULL AUTO_INCREMENT,
  `TM` text NOT NULL,
  `DA` text NOT NULL,
  `TKS` int(11) NOT NULL,
  `NDXS` int(11) NOT NULL,
  `FZ` float NOT NULL,
  `KMBH` int(11) NOT NULL,
  `NJBH` int(11) NOT NULL,
  `JSBH` varchar(20) NOT NULL,
  `TJSJ` varchar(50) NOT NULL,
  `STSM` text,
  PRIMARY KEY (`TH`),
  KEY `FK_Reference_45` (`KMBH`),
  KEY `FK_Reference_53` (`NJBH`),
  CONSTRAINT `FK_Reference_45` FOREIGN KEY (`KMBH`) REFERENCES `t_b_km` (`KMBH`),
  CONSTRAINT `FK_Reference_53` FOREIGN KEY (`NJBH`) REFERENCES `t_b_nj` (`NJBH`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_t_tkt
-- ----------------------------
INSERT INTO `t_t_tkt` VALUES ('3', 'JS特性不包括（） ', '面向对象', '1', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_tkt` VALUES ('4', '有语句“var x=0;while() x+=2;”，要使while循环体执行10次，空白处的循环判定式应写为 ', 'x<20', '1', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_tkt` VALUES ('5', '在使用Javascript实现省市级联菜单功能时，在添加城市列表前清空原来的下拉选项的代码是（） ', 'document.myform.selCity.options.length=0', '1', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_tkt` VALUES ('6', '分析下面的Javascript代码段，输出结果是（）var s1=parseInt(“101中学”);document.write(s1); ', '101', '1', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_tkt` VALUES ('7', '在HTML中，点击图片”previous.gif”上的超级链接后页面将加载历史列表中的上一个URL页面。代码如下所示，应在下划线处填入（）<a href=_________><img src=”previous.gif” width=”67” height=”21”></a> ', 'javascript:history.go(-1)', '1', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_tkt` VALUES ('8', '预测以下代码片段的输出结果:var str ;alert(typeof str);  ', 'undefined', '1', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_tkt` VALUES ('9', '我们可分别使用 Socket 的方法（） 和（） 来创建输入 / 输出流', 'getInputStream(),getOurputStream()', '2', '1', '1', '1', '4', '123456', 'Mon May 21 12:45:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('10', '待通信任务完毕后，用 DatagramSocket 对象的（） 方法来关闭数据报通信 Socket', 'close()', '1', '1', '1', '1', '4', '123456', 'Tue May 22 12:45:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('11', '成员函数的继承可以通过两种方式实现，分别是（）和（）', '继承,覆盖', '2', '1', '1', '1', '4', '123456', 'Tue May 22 12:56:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('12', '面向对象程序设计的特点包括(),(),()', '封装,继承,多态', '3', '1', '1', '1', '4', '123456', 'Tue May 22 13:07:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('13', '设字符串string s=“123456”，将此字符串转换成整数的语句是（）', 'Int i=Interget.PaserInt(s)', '1', '1', '1', '1', '4', '123456', 'Tue May 22 13:18:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('14', 'Java语言的变量可以分两大类：（）和 引用变量', '简单变量 ', '1', '1', '1', '1', '4', '123456', 'Tue May 22 13:29:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('15', '接口中定义的方法都是（），变量都是（）', '抽象方法,常量', '2', '1', '1', '1', '4', '123456', 'Tue May 22 13:40:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('16', 'Java针对桌面应用，企业级应用和嵌入式应用分别推出了 Java SE（）和Java ME三个版本', 'Java EE', '1', '1', '1', '1', '4', '123456', 'Tue May 22 13:51:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('17', 'Java符号按词法可分为标识符，关键字，运算符，（）和符号常量5类', '分隔符', '1', '1', '1', '1', '4', '123456', 'Tue May 22 14:02:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('18', 'Java的引用类型包括 数组，（）和（）三种', '类,接口', '2', '1', '1', '1', '4', '123456', 'Tue May 22 14:13:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('19', '声明变量包括给出（）和指明变量的数据类型，必要时还可以指定（）', '变量名,初始值', '2', '1', '1', '1', '4', '123456', 'Tue May 22 14:24:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('20', 'Java程序中可以使用（）（）和 文档注释 3种注释', '单行注释,多行注释 ', '2', '1', '1', '1', '4', '123456', 'Tue May 22 14:35:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('21', '类，接口的关键字分别是（）和（）', 'class,interface', '2', '1', '1', '1', '4', '123456', 'Tue May 22 14:46:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('22', '继承类和实现接口的关键字分别是（）和（）', 'extends,implements', '2', '1', '1', '1', '4', '123456', 'Tue May 22 14:57:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('23', 'Integer类提供（）方法将字符串转换为整数，String类提供（）方法获得字符串长度', 'parseInt(),length()', '2', '1', '1', '1', '4', '123456', 'Tue May 22 15:08:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('24', '一个异常对象需要经历（）捕获 及 处理 3个过程', '抛出', '1', '1', '1', '1', '4', '123456', 'Tue May 22 15:19:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('25', 'Java异常处理语句的三个关键词是（），（）和（）', 'try,catch,finally', '3', '1', '1', '1', '4', '123456', 'Tue May 22 15:30:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('26', '进程调度采用剥夺方式。就绪线程按（）排队，遵循先到先排队原则', '优先级', '1', '1', '1', '1', '4', '123456', 'Tue May 22 15:41:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('27', '进程动态特性表现为（）运行和（）三种状态', '就绪,堵塞', '2', '1', '1', '1', '4', '123456', 'Tue May 22 15:52:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('28', 'Java提供两种创建线程常见方式，一是实现（）接口，二是继承（）类', 'Runnable,Thread', '2', '1', '1', '1', '4', '123456', 'Tue May 22 16:03:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('29', '线程的操作代码则写于（）方法内，调用线程对象的（）方法启动线程。', 'run(),start()', '2', '1', '1', '1', '4', '123456', 'Tue May 22 16:14:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('30', 'Java 流的根类主要有（），OuputStream，（）和 Writer 4个', 'InputStream,Reader', '2', '1', '1', '1', '4', '123456', 'Tue May 22 16:25:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('31', 'JVM是指.java虚拟机,将CLASS字节码文件编译成（）可执行文件', '二进制', '1', '1', '1', '1', '4', '123456', 'Tue May 22 16:36:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('32', '类定义了对象的一个种类，一个对象则是一个类中的（）', '实例', '1', '1', '1', '1', '4', '123456', 'Tue May 22 16:47:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('33', '字符串分为两大类，一类是字符串常量，使用 （）类的对象表示；另一类是字符串变量，使用（）类的对象表示', 'String,StringBuffer', '2', '1', '1', '1', '4', '123456', 'Tue May 22 16:58:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('34', '在Java程序中，通过类的定义只能实现（）重继承，但通过接口的定义可以实现（）重继承关系', '单,多', '2', '1', '1', '1', '4', '123456', 'Tue May 22 17:09:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('35', '多态是指子类覆盖了父类的方法，在Java中有两种多态，一种是使用方法的（）实现多态，另一种是使用方法的（）实现多态', '重载,覆盖', '2', '1', '1', '1', '4', '123456', 'Tue May 22 17:20:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('36', 'Java源程序是由类定义组成的，每个程序中可以定义若干个类，但是只有一个类是主类。在Java Application中，这个主类是指包含（）方法的类', 'main（）', '1', '1', '1', '1', '4', '123456', 'Tue May 22 17:31:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('37', '开发与运行Java程序需要经过的三个主要步骤为 编写、（）和（）', '编译,运行', '2', '1', '1', '1', '4', '123456', 'Tue May 22 17:42:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('38', '在Java程序运行时，系统自动通过System类创建三个静态的I/O对象，它们是标准输入流对象（）、标准输出流对象 \n（）、和标准错误流对象ErrorStream', 'InputStream,OutputStream ', '2', '1', '1', '1', '4', '123456', 'Tue May 22 17:53:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('39', '构造一个包的是使用关键字（）来指定该文件代码中属于该包', 'package ', '1', '1', '1', '1', '4', '123456', 'Tue May 22 18:04:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('40', '异常处理机制简化了程序的复杂性，如果在程序执行过程中，则可以用（）语句主动抛出异常', 'throws ', '1', '1', '1', '1', '4', '123456', 'Tue May 22 18:15:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('41', '当子类中的变量或方法与父类的变量和方法重名时,子类的变量被隐藏,子类中的方法被（）。此时,指向父类中的变量或方法，则用（）变量实现', '重载,super', '2', '1', '1', '1', '4', '123456', 'Tue May 22 18:26:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('42', '我们用_______来定义一个整数， 用_______来定义一个字符类型， 称为原始数据类型', 'int,char ', '2', '1', '1', '1', '4', '123456', 'Tue May 22 18:37:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('43', '.java.io 包中的____________和____________类主要用于对对象(Object)的读写。 ', 'ObjectInputStream, ObjectOutputSteam', '1', '1', '1', '1', '4', '123456', 'Tue May 22 18:48:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('44', ' 程序运行的结果是：_______________。 public class Example{ String str=new String(\"good\"); char[]ch={\'a\',\'b\',\'c\'}; public static void main(String args[]){ Example ex=new Example(); ex.change(ex.str,ex.ch); System.out.print(ex.str+\" and \"); Sytem.out.print(ex.ch); } public void change(String str,char ch[]){ str=\"test ok\"; ch[0]=\'g\'; } } ', 'good and gbc', '1', '1', '1', '1', '4', '123456', 'Tue May 22 18:59:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('45', 'Java 是目前最广泛的__________编程语言之一', '网络', '1', '1', '1', '1', '4', '123456', 'Tue May 22 19:10:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('46', ' Java 具有简单、___________、稳定、与平台无关、解释型、多线程、动态等特点', '面向对象', '1', '1', '1', '1', '4', '123456', 'Tue May 22 19:21:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('47', 'JDK 开发 java 程序需三个步骤，分别为______________,编译 java 源程序,运行 java 源程序', '编写源文件 ', '1', '1', '1', '1', '4', '123456', 'Tue May 22 19:32:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('48', ' Java 具有简单、面向对象、稳定、与平台无关、解释型、___________、动态等特点', '多线程', '1', '1', '1', '1', '4', '123456', 'Tue May 22 19:43:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('49', '编写 Java 程序，可以使用一个__________来编写源文件', '文字编辑器', '1', '1', '1', '1', '4', '123456', 'Tue May 22 19:54:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('50', '把编写好的 Java 源文件保存起来，原文件的扩展名必须是___________', 'java', '1', '1', '1', '1', '4', '123456', 'Tue May 22 20:05:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('51', '用 JDK 编译 Java 源程序，使用的命令是__________，编译源文件得到字节码文件', 'Javac', '1', '1', '1', '1', '4', '123456', 'Tue May 22 20:16:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('52', 'Java 源程序编译后生成的字节码文件扩展名为__________', 'class', '1', '1', '1', '1', '4', '123456', 'Tue May 22 20:27:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('53', '用 JDK 运行 Java 应用程序，使用的命令是__________', 'Java', '1', '1', '1', '1', '4', '123456', 'Tue May 22 20:38:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('54', ' Java 程序分为两类，即___________和 Java 小应用程序', 'Java 应用程序', '1', '1', '1', '1', '4', '123456', 'Tue May 22 20:49:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('55', '一个 Java 源程序是由若干个___________组成', '类', '1', '1', '1', '1', '4', '123456', 'Tue May 22 21:00:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('56', ' __________是 Java 的关键字，用来定义类', 'class', '1', '1', '1', '1', '4', '123456', 'Tue May 22 21:11:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('57', 'Java 应用程序中有多个类时， java 命令后的类名必须是包含了___________方法的那个类的名字', 'main', '1', '1', '1', '1', '4', '123456', 'Tue May 22 21:22:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('58', '在一个 Java 应用程序中 main 方法必须被说明为_____________', 'public static void ', '1', '1', '1', '1', '4', '123456', 'Tue May 22 21:33:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('59', 'Java 中所有程序都使用方法，应用程序以______________方法开始', 'main', '1', '1', '1', '1', '4', '123456', 'Tue May 22 21:44:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('60', 'Java 源文件中有多个类，但只能有一个类是____________类。', 'public', '1', '1', '1', '1', '4', '123456', 'Tue May 22 21:55:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('61', '用来标识类名、变量名、方法名、类型名、数组名、文件名的有效字符序列称为___________。', '标识符', '1', '1', '1', '1', '4', '123456', 'Tue May 22 22:06:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('62', 'Java 语言规定标识符由字母、 下划线、 美元符号和数字组成， 并且第一个字符不能是___________', ' 数字', '1', '1', '1', '1', '4', '123456', 'Tue May 22 22:17:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('63', ' ____________就是 Java 语言中已经被赋予特定意义的一些单词， 不可以把这类词作为名字来用', '关键字', '1', '1', '1', '1', '4', '123456', 'Tue May 22 22:28:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('64', '使用关键字___________来定义逻辑变量', 'boolean', '1', '1', '1', '1', '4', '123456', 'Tue May 22 22:39:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('65', ' 使用关键字__________来定义字符变量', 'char', '1', '1', '1', '1', '4', '123456', 'Tue May 22 22:50:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('66', '对于 int 型变量，内存分配___________个字节', '4', '1', '1', '1', '1', '4', '123456', 'Tue May 22 23:01:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('67', ' Java 中有两种类型的控制语句即 if 和___________', 'switch ', '1', '1', '1', '1', '4', '123456', 'Tue May 22 23:12:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('68', ' 为了能使用 Java 提供的类，我们可以使用_________语句来引入所需的类', 'import', '1', '1', '1', '1', '4', '123456', 'Tue May 22 23:23:00 CST 2012', null);
INSERT INTO `t_t_tkt` VALUES ('69', '____________语句作为 Java 源文件的第一条语句，指明该源文件定义的类所在的包', 'package ', '1', '1', '1', '1', '4', '123456', 'Tue May 22 23:34:00 CST 2012', null);

-- ----------------------------
-- Table structure for `t_t_xzt`
-- ----------------------------
DROP TABLE IF EXISTS `t_t_xzt`;
CREATE TABLE `t_t_xzt` (
  `TH` int(11) NOT NULL AUTO_INCREMENT,
  `TM` text NOT NULL,
  `XX_A` varchar(300) NOT NULL,
  `XX_B` varchar(300) NOT NULL,
  `XX_C` varchar(300) NOT NULL,
  `XX_D` varchar(300) NOT NULL,
  `DA` varchar(2) NOT NULL,
  `NDXS` int(11) NOT NULL,
  `FZ` float NOT NULL,
  `KMBH` int(11) NOT NULL,
  `NJBH` int(11) NOT NULL,
  `JSBH` varchar(20) NOT NULL,
  `TJSJ` varchar(50) NOT NULL,
  `STSM` text,
  PRIMARY KEY (`TH`),
  KEY `FK_Reference_38` (`KMBH`),
  KEY `FK_Reference_52` (`NJBH`),
  CONSTRAINT `FK_Reference_38` FOREIGN KEY (`KMBH`) REFERENCES `t_b_km` (`KMBH`),
  CONSTRAINT `FK_Reference_52` FOREIGN KEY (`NJBH`) REFERENCES `t_b_nj` (`NJBH`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_t_xzt
-- ----------------------------
INSERT INTO `t_t_xzt` VALUES ('4', 'Java语言具有许多优点和特点，哪个反映了Java程序并行机制的特点？ ', '安全性 ', '多线性 ', '跨平台', '可移植', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('5', '以下哪些关于垃圾回收的陈述是正确的', '垃圾回收线程的优先级很高，以保证不再使用的内存将被及时回收  ', '垃圾收集允许程序开发者明确指定释放哪一个对象  ', '垃圾回收机制保证了JAVA程序不会出现内存溢出  ', '以上都不对  ', 'D', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('6', '下列类哪个属于java.lang.*包的是 ( )  ', 'Date  ', 'System  ', 'Button  ', 'File  ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('7', '欲构造ArrayLlist类的一个实例，此类继承了List接口，下列哪个方法是正确的（） ', 'ArrayList MyList=New object();', 'List MyList=New ArrayList(); ', 'ArrayList MyList=NewList();', 'List MyList=New List(); ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('8', 'Swing组件必须添加到Swing顶层容器相关的( )', '分隔板上', '内容面板上  ', '选项板上  ', '复选框内 ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('9', '如果早关闭socket时发生一个I/O错误，会抛出（）异常 ', 'IOException ', 'UnknownHostException ', 'SocketException ', 'MalformedURLException ', 'A', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('10', '下面的集合中，（）不可以存储重复元素。 ', 'Set ', 'Collection ', 'Map ', 'List ', 'C', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('11', '在Javascript中，可以使用Date对象的()方法返回一个月中的每一天 ', 'getDate ', 'getYear ', 'getMonth ', 'getTime ', 'A', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('12', '下列选项中关于浏览器对象的说法错误的是（） ', 'history对象记录了用户在一个浏览器中已经访问过的URLs ', 'location对象相当于IE浏览器中的地址栏，包含关于当前URL地址的信息 ', 'location对象是history对象的父对象 ', 'location对象是window对象的子对象 ', 'C', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('14', '分析下面的Javascript代码段，输出结果是（）。var mystring=”I am a student”;var a=mystring.substring(9,13);document.write(a); ', 'stud ', 'tuden ', 'uden ', 'udent ', 'C', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('15', 'Java语言具有许多优点和特点，哪个反映了Java程序并行机制的特点？ ', '安全性 ', '多线性 ', '跨平台', '可移植', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('16', '以下哪些关于垃圾回收的陈述是正确的', '垃圾回收线程的优先级很高，以保证不再使用的内存将被及时回收  ', '垃圾收集允许程序开发者明确指定释放哪一个对象  ', '垃圾回收机制保证了JAVA程序不会出现内存溢出  ', '以上都不对  ', 'D', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('17', '下列类哪个属于java.lang.*包的是 ( )  ', 'Date  ', 'System  ', 'Button  ', 'File  ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('18', '欲构造ArrayLlist类的一个实例，此类继承了List接口，下列哪个方法是正确的（） ', 'ArrayList MyList=New object();', 'List MyList=New ArrayList(); ', 'ArrayList MyList=NewList();', 'List MyList=New List(); ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('19', 'Swing组件必须添加到Swing顶层容器相关的( )', '分隔板上', '内容面板上  ', '选项板上  ', '复选框内 ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('20', '如果早关闭socket时发生一个I/O错误，会抛出（）异常 ', 'IOException ', 'UnknownHostException ', 'SocketException ', 'MalformedURLException ', 'A', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('21', '下面的集合中，（）不可以存储重复元素。 ', 'Set ', 'Collection ', 'Map ', 'List ', 'C', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('22', '在Javascript中，可以使用Date对象的()方法返回一个月中的每一天 ', 'getDate ', 'getYear ', 'getMonth ', 'getTime ', 'A', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('23', '下列选项中关于浏览器对象的说法错误的是（） ', 'history对象记录了用户在一个浏览器中已经访问过的URLs ', 'location对象相当于IE浏览器中的地址栏，包含关于当前URL地址的信息 ', 'location对象是history对象的父对象 ', 'location对象是window对象的子对象 ', 'C', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('24', '分析下面的Javascript代码段，输出结果是（）。var mystring=”I am a student”;var a=mystring.substring(9,13);document.write(a); ', 'stud ', 'tuden ', 'uden ', 'udent ', 'C', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('25', 'Java语言具有许多优点和特点，哪个反映了Java程序并行机制的特点？ ', '安全性 ', '多线性 ', '跨平台', '可移植', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('26', '以下哪些关于垃圾回收的陈述是正确的', '垃圾回收线程的优先级很高，以保证不再使用的内存将被及时回收  ', '垃圾收集允许程序开发者明确指定释放哪一个对象  ', '垃圾回收机制保证了JAVA程序不会出现内存溢出  ', '以上都不对  ', 'D', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('27', '下列类哪个属于java.lang.*包的是 ( )  ', 'Date  ', 'System  ', 'Button  ', 'File  ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('28', '欲构造ArrayLlist类的一个实例，此类继承了List接口，下列哪个方法是正确的（） ', 'ArrayList MyList=New object();', 'List MyList=New ArrayList(); ', 'ArrayList MyList=NewList();', 'List MyList=New List(); ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('29', 'Swing组件必须添加到Swing顶层容器相关的( )', '分隔板上', '内容面板上  ', '选项板上  ', '复选框内 ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('30', '如果早关闭socket时发生一个I/O错误，会抛出（）异常 ', 'IOException ', 'UnknownHostException ', 'SocketException ', 'MalformedURLException ', 'A', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('31', '下面的集合中，（）不可以存储重复元素。 ', 'Set ', 'Collection ', 'Map ', 'List ', 'C', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('32', '在Javascript中，可以使用Date对象的()方法返回一个月中的每一天 ', 'getDate ', 'getYear ', 'getMonth ', 'getTime ', 'A', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('33', '下列选项中关于浏览器对象的说法错误的是（） ', 'history对象记录了用户在一个浏览器中已经访问过的URLs ', 'location对象相当于IE浏览器中的地址栏，包含关于当前URL地址的信息 ', 'location对象是history对象的父对象 ', 'location对象是window对象的子对象 ', 'C', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('34', '分析下面的Javascript代码段，输出结果是（）。var mystring=”I am a student”;var a=mystring.substring(9,13);document.write(a); ', 'stud ', 'tuden ', 'uden ', 'udent ', 'C', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('35', 'Java语言具有许多优点和特点，哪个反映了Java程序并行机制的特点？ ', '安全性 ', '多线性 ', '跨平台', '可移植', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('36', '以下哪些关于垃圾回收的陈述是正确的', '垃圾回收线程的优先级很高，以保证不再使用的内存将被及时回收  ', '垃圾收集允许程序开发者明确指定释放哪一个对象  ', '垃圾回收机制保证了JAVA程序不会出现内存溢出  ', '以上都不对  ', 'D', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('37', '下列类哪个属于java.lang.*包的是 ( )  ', 'Date  ', 'System  ', 'Button  ', 'File  ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('38', '欲构造ArrayLlist类的一个实例，此类继承了List接口，下列哪个方法是正确的（） ', 'ArrayList MyList=New object();', 'List MyList=New ArrayList(); ', 'ArrayList MyList=NewList();', 'List MyList=New List(); ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('39', 'Swing组件必须添加到Swing顶层容器相关的( )', '分隔板上', '内容面板上  ', '选项板上  ', '复选框内 ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('40', '如果早关闭socket时发生一个I/O错误，会抛出（）异常 ', 'IOException ', 'UnknownHostException ', 'SocketException ', 'MalformedURLException ', 'A', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('41', '下面的集合中，（）不可以存储重复元素。 ', 'Set ', 'Collection ', 'Map ', 'List ', 'C', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('42', '在Javascript中，可以使用Date对象的()方法返回一个月中的每一天 ', 'getDate ', 'getYear ', 'getMonth ', 'getTime ', 'A', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('43', '下列选项中关于浏览器对象的说法错误的是（） ', 'history对象记录了用户在一个浏览器中已经访问过的URLs ', 'location对象相当于IE浏览器中的地址栏，包含关于当前URL地址的信息 ', 'location对象是history对象的父对象 ', 'location对象是window对象的子对象 ', 'C', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('44', '分析下面的Javascript代码段，输出结果是（）。var mystring=”I am a student”;var a=mystring.substring(9,13);document.write(a); ', 'stud ', 'tuden ', 'uden ', 'udent ', 'C', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('45', 'Java语言具有许多优点和特点，哪个反映了Java程序并行机制的特点？ ', '安全性 ', '多线性 ', '跨平台', '可移植', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('46', '以下哪些关于垃圾回收的陈述是正确的', '垃圾回收线程的优先级很高，以保证不再使用的内存将被及时回收  ', '垃圾收集允许程序开发者明确指定释放哪一个对象  ', '垃圾回收机制保证了JAVA程序不会出现内存溢出  ', '以上都不对  ', 'D', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('47', '下列类哪个属于java.lang.*包的是 ( )  ', 'Date  ', 'System  ', 'Button  ', 'File  ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('48', '欲构造ArrayLlist类的一个实例，此类继承了List接口，下列哪个方法是正确的（） ', 'ArrayList MyList=New object();', 'List MyList=New ArrayList(); ', 'ArrayList MyList=NewList();', 'List MyList=New List(); ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('49', 'Swing组件必须添加到Swing顶层容器相关的( )', '分隔板上', '内容面板上  ', '选项板上  ', '复选框内 ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('50', '如果早关闭socket时发生一个I/O错误，会抛出（）异常 ', 'IOException ', 'UnknownHostException ', 'SocketException ', 'MalformedURLException ', 'A', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('51', '下面的集合中，（）不可以存储重复元素。 ', 'Set ', 'Collection ', 'Map ', 'List ', 'C', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('52', '在Javascript中，可以使用Date对象的()方法返回一个月中的每一天 ', 'getDate ', 'getYear ', 'getMonth ', 'getTime ', 'A', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('53', '下列选项中关于浏览器对象的说法错误的是（） ', 'history对象记录了用户在一个浏览器中已经访问过的URLs ', 'location对象相当于IE浏览器中的地址栏，包含关于当前URL地址的信息 ', 'location对象是history对象的父对象 ', 'location对象是window对象的子对象 ', 'C', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('54', '分析下面的Javascript代码段，输出结果是（）。var mystring=”I am a student”;var a=mystring.substring(9,13);document.write(a); ', 'stud ', 'tuden ', 'uden ', 'udent ', 'C', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('55', 'Java语言具有许多优点和特点，哪个反映了Java程序并行机制的特点？ ', '安全性 ', '多线性 ', '跨平台', '可移植', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('56', '以下哪些关于垃圾回收的陈述是正确的', '垃圾回收线程的优先级很高，以保证不再使用的内存将被及时回收  ', '垃圾收集允许程序开发者明确指定释放哪一个对象  ', '垃圾回收机制保证了JAVA程序不会出现内存溢出  ', '以上都不对  ', 'D', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('57', '下列类哪个属于java.lang.*包的是 ( )  ', 'Date  ', 'System  ', 'Button  ', 'File  ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('58', '欲构造ArrayLlist类的一个实例，此类继承了List接口，下列哪个方法是正确的（） ', 'ArrayList MyList=New object();', 'List MyList=New ArrayList(); ', 'ArrayList MyList=NewList();', 'List MyList=New List(); ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('59', 'Swing组件必须添加到Swing顶层容器相关的( )', '分隔板上', '内容面板上  ', '选项板上  ', '复选框内 ', 'B', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('60', '如果早关闭socket时发生一个I/O错误，会抛出（）异常 ', 'IOException ', 'UnknownHostException ', 'SocketException ', 'MalformedURLException ', 'A', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('61', '下面的集合中，（）不可以存储重复元素。 ', 'Set ', 'Collection ', 'Map ', 'List ', 'C', '1', '2', '1', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('62', '在Javascript中，可以使用Date对象的()方法返回一个月中的每一天 ', 'getDate ', 'getYear ', 'getMonth ', 'getTime ', 'A', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('63', '下列选项中关于浏览器对象的说法错误的是（） ', 'history对象记录了用户在一个浏览器中已经访问过的URLs ', 'location对象相当于IE浏览器中的地址栏，包含关于当前URL地址的信息 ', 'location对象是history对象的父对象 ', 'location对象是window对象的子对象 ', 'C', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('64', '分析下面的Javascript代码段，输出结果是（）。var mystring=”I am a student”;var a=mystring.substring(9,13);document.write(a); ', 'stud ', 'tuden ', 'uden ', 'udent ', 'C', '1', '2', '6', '4', '123456', '2014-04-06', '');
INSERT INTO `t_t_xzt` VALUES ('67', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '123456', '123', '333');
INSERT INTO `t_t_xzt` VALUES ('68', '1', '1', '1', '1', '1', 'A', '1', '1', '1', '1', '123456', '2014-05-30', '1');

-- ----------------------------
-- Table structure for `t_t_zht`
-- ----------------------------
DROP TABLE IF EXISTS `t_t_zht`;
CREATE TABLE `t_t_zht` (
  `TH` int(11) NOT NULL AUTO_INCREMENT,
  `BT` varchar(255) NOT NULL,
  `TM` text NOT NULL,
  `DA` text NOT NULL,
  `TP` varchar(100) DEFAULT NULL,
  `NDXS` int(11) NOT NULL,
  `FZ` float NOT NULL,
  `KMBH` int(11) NOT NULL,
  `NJBH` int(11) NOT NULL,
  `JSBH` varchar(20) NOT NULL,
  `TJSJ` varchar(50) NOT NULL,
  `STSM` text,
  PRIMARY KEY (`TH`),
  KEY `FK_Reference_47` (`KMBH`),
  KEY `FK_Reference_55` (`NJBH`),
  CONSTRAINT `FK_Reference_47` FOREIGN KEY (`KMBH`) REFERENCES `t_b_km` (`KMBH`),
  CONSTRAINT `FK_Reference_55` FOREIGN KEY (`NJBH`) REFERENCES `t_b_nj` (`NJBH`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_t_zht
-- ----------------------------
INSERT INTO `t_t_zht` VALUES ('7', '实现复选框的全选、全不选效果。', '<strong> \r\n<p class=\"p0\">\r\n	&nbsp;<img alt=\"\" src=\"/ExamDemo/UploadFile/image/20140408/20140408134318_71.jpg\" />\r\n</p>\r\n</strong>', '<br />', null, '1', '20', '6', '4', '123456', '2014-04-06', '<br />');
INSERT INTO `t_t_zht` VALUES ('8', '点击重置按钮，提示是否确认重置表单。', '<img alt=\"\" src=\"/ExamDemo/UploadFile/image/20140408/20140408134339_765.jpg\" /><br />', '<br />', null, '1', '20', '6', '4', '123456', '2014-04-06', '<br />');
INSERT INTO `t_t_zht` VALUES ('9', '使用setTimeout()方法模拟进度条。', '<br />\r\n<img alt=\"\" src=\"/ExamDemo/UploadFile/image/20140408/20140408134419_472.jpg\" />', '<br />', null, '1', '20', '6', '4', '123456', '2014-04-06', '<br />');
INSERT INTO `t_t_zht` VALUES ('10', '在页面内动态显示时间。', '<img alt=\"\" src=\"/ExamDemo/UploadFile/image/20140408/20140408134442_170.jpg\" />', '<br />', null, '1', '20', '6', '4', '123456', '2014-04-06', '<br />');
INSERT INTO `t_t_zht` VALUES ('11', '实现复选框的全选、全不选效果。', '<strong> \r\n<p class=\"p0\">\r\n	&nbsp;<img alt=\"\" src=\"/ExamDemo/UploadFile/image/20140408/20140408134318_71.jpg\" />\r\n</p>\r\n</strong>', '<br />', '<br />', '1', '20', '6', '4', '123456', '2014-04-06', '<br />');
INSERT INTO `t_t_zht` VALUES ('12', '点击重置按钮，提示是否确认重置表单。', '<img alt=\"\" src=\"/ExamDemo/UploadFile/image/20140408/20140408134339_765.jpg\" /><br />', '<br />', '<br />', '1', '20', '6', '4', '123456', '2014-04-06', '<br />');
INSERT INTO `t_t_zht` VALUES ('13', '使用setTimeout()方法模拟进度条。', '<br />\r\n<img alt=\"\" src=\"/ExamDemo/UploadFile/image/20140408/20140408134419_472.jpg\" />', '<br />', '<br />', '1', '20', '6', '4', '123456', '2014-04-06', '<br />');
INSERT INTO `t_t_zht` VALUES ('14', '在页面内动态显示时间。', '<img alt=\"\" src=\"/ExamDemo/UploadFile/image/20140408/20140408134442_170.jpg\" />', '<br />', '<br />', '1', '20', '6', '4', '123456', '2014-04-06', '<br />');
