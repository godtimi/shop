/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3306
 Source Schema         : agricultural

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 22/11/2024 13:24:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_article
-- ----------------------------
DROP TABLE IF EXISTS `sys_article`;
CREATE TABLE `sys_article`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `enable` tinyint(1) NULL DEFAULT 1,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_article
-- ----------------------------
INSERT INTO `sys_article` VALUES (4, '公告', '平台规则', '### </br></br> <img src=\"http://localhost:9090/file/e62634cffb2a4be5ba7f63ba0dd98185.png\" width=\"20\" height=\"20\" >&nbsp;&nbsp; **1.不支持7天无理由**\n本平台出售的商品主要为生鲜/冷藏/冷冻类食品，不支持7天无理由退货，收货后请妥善保存商品。\n### <img src=\"http://localhost:9090/file/60cd7d6e320343948aae1b7c79dd5cdb.png\" width=\"20\" height=\"20\">&nbsp;&nbsp;**2.72小时品质无忧**\n商品送达72小时内，发现腐烂/变质等情况，提供有效凭证后，平台24小时内响应审核退款。\n### \n### <img src=\"http://localhost:9090/file/8b64606fa57f4781a751a5e5ff4a6188.png\" width=\"20\" height=\"20\" >&nbsp;&nbsp;**3.闪电退款**\n诚信用户申请退款，经平台的审核退款通过后，享受闪电退款到账服务。\n### <img src=\"http://localhost:9090/file/03247dd73a6c42e6ab846371a5273ba4.png\" width=\"20\" height=\"20\">&nbsp;&nbsp;**4.缺货退**\n购买后如发生商家缺货，平台及时给您办理退款。\n</br></br>', 1, '2023-12-22 09:28:04', '2023-12-22 09:28:04');
INSERT INTO `sys_article` VALUES (5, '知识', '绿色农产品', '### 1.绿色农产品\n&nbsp;&nbsp;&nbsp;&nbsp;绿色农产品是指遵循可持续发展原则 ，按照特定生产方式生产 ，经专门机构认定，许可使用绿色食品标志，无污染的安全、优质、营养农产品。如绿色小麦、绿色水稻 、绿色蔬菜、绿色水果、绿色畜禽肉、绿色水产品等。\n::: hljs-center\n\n<img src=\"http://localhost:9090/file/ee9bba99dc954909a83f2141a3607aac.jpg\" width=\"270\" height=\"150\">\n\n:::\n\n### 2产品介绍\n&nbsp;&nbsp;&nbsp;&nbsp;我国绿色农产品分为A级和AA级，A级为初级标准，即允许在生长过程中限时、限量、限品种使用安全性较高的化肥和农药。AA级为高级绿色农产品。\n### 3产品发展\n&nbsp;&nbsp;&nbsp;&nbsp;由中国农业国际合作促进会主办的“农产品：绿色、有机论坛，2012”驻华机构联谊会在北京举行。来自联合国粮农组织、联合国发展计划署、联合国环境规划署、部分国家和地区驻华机构、国内有关部门和农业企业等方面的代表约150人参加了会议。本次会议是中国农业国际合作促进会新一届常务理事会成立后第一次大型活动，目的在于促进中国与各国在绿色食品和有机农产品生产加工贸易等领域的合作，搭建一座沟通交流的平台。\n\n#### &nbsp;&nbsp;&nbsp;&nbsp;走有中国特色绿色有机农产品发展道路\n\n&nbsp;&nbsp;&nbsp;&nbsp;原中国农业科学院院长、中国农业国际合作促进会会长翟虎渠在讲话中指出，绿色、有机是农业发展的方向，全球很多国家特别是发达国家，注重绿色食品和有机食品的生产和销售。长期以来，中国在发展绿色有机农产品方面进行了不懈探索，取得了巨大成就，但是中国仍然是一个发展中国家，发展不平衡，在发展绿色食品和有机食品的同时，还遇到很多的困难，通过加强国际交流合作等方式，一定会走出一条具有中国特色的绿色有机农产品发展道路。\n\n#### &nbsp;&nbsp;&nbsp;&nbsp;政府、民间组织、私营部门的合作是一种好方式\n\n&nbsp;&nbsp;&nbsp;&nbsp;联合国粮农组织驻华代表波西·米西卡（PercyMisika）在致辞中强调，有机农业对促进食品安全有重要的作用，在整个食品价值链上，它使用较少的资源，提高了农业效率。从全球来看，有机贸易目前正在以每年15-20%的速度发展，中国现在是增长最快的国家之一，它的有机认证农田的面积也居世界第二位，中国有一些成功的实践，比如说承包性的农场这种模式，大力促进了有机生产。\n\n&nbsp;&nbsp;&nbsp;&nbsp;联合国粮农组织支持全球地区和各个国家有机食品工业的发展，同时证实了政府、民间组织、私营部门的合作是一种好的方式。关注有机农业，绿色食品是有附加值的，可以帮助减少土地、水等的污染程度，联合国粮农组织有一个长期的项目，就是有机农业项目，它帮助各个成员国通过促进有机生产加工，认证和产品的营销来提高人们的生活水平和实现环境保护，为了实现这个长期的目标，要将技能、知识、传播到田间，同时开发一些实用工具促进有机产品的贸易。\n\n&nbsp;&nbsp;&nbsp;&nbsp;使农作物直接对接到蜀农网等电子商务平台国内数家农业企业介绍了各自在绿色有机农产品生产流通方面进行的实践探索。中国绿色食品有机食品北京展销中心代表王梅林介绍，中心在技术、示范推广、市场营销等方面开展多渠道合作与交流，如与中国优质农产品协会合作，主要在农业技术（生物肥料和生物杀虫剂）领域合作，发展种植养殖基地战略；与视农网合作，发展可视化农业等。\n\n&nbsp;&nbsp;&nbsp;&nbsp;视农网络科技有限公司代表邓正宏认为，农户的分散性和市场的自由性对规范农产品的安全生产产生阻力，生态基地的开拓和发展是改革农业现状的有效途径。同时，可视化技术的注入，使农产品的安全得到了根本性监管。生态种植养殖技术、可视技术和卫星雷达技术对基地的应用，使得基地农作物及畜养动物的生长发育情况随时随地地清晰呈现在电脑视频中。再次，依托电子商务平台，将物联网技术和互联网技术与基地农产品对接，使农作物直接对接到网络平台，给农作物的产出和销售带来了时效性的进展。\n\n&nbsp;&nbsp;&nbsp;&nbsp;来自中国绿色食品有机食品中心、农业部农产品质量标准研究中心的专家，介绍了我国绿色有机农产品行业的发展和中国农产品质量安全管理等方面的情况。来自以色列、西班牙、澳大利亚等国驻华使馆的代表，分别介绍了本国发展有机农产品的做法经验。论坛结束后，与会代表参观了中国农业科学院国家现代设施农业展示园区。', 1, '2023-12-22 09:28:04', '2023-12-22 09:28:04');
INSERT INTO `sys_article` VALUES (6, '最新', '浓郁醇香的山茶油，帮你重温外婆厨房的味道', '</br></br>一年一度的新春佳节即将到来，我也要踏上回乡的旅途了。终于又可以吃到外婆做的鱼香茄子了，那可是日思夜想的家的味道。我从小就在外婆家长大，从我记事起外婆就经常给我做这道鱼香茄子。然而光阴荏苒，长大之后的我离开家乡独自外出求学，脑海里却时常想起外婆做的这道鱼香茄子。所以，我决定回去之后跟外婆学习如何制作这道菜，这样以后在外地自己也可以做出美味的鱼香茄子了！\n\n外婆说想要制作这道鱼香茄子，需要准备茄子3根、大蒜4瓣、红椒2个、香葱少许、黄豆酱2茶匙、草菇老抽1茶匙、油适量。\n\n1.先将茄子切段后放入锅中蒸熟，盛出晾凉备用。\n\n2.再将大蒜拍扁去皮后剁成蒜末，红椒和香葱均切段备用。\n\n3.将油倒入锅中烧热放入黄豆酱炒香，再加入蒸好的茄子段一起翻炒。\n\n4.茄子段入味后再放入蒜末、红椒段和草菇老抽起锅，之后撒上香葱段即可。\n\n <a  href=\"http://localhost:8080/reception/detail?id=64\">  ![7e34a4c522024cc5aee5f13709934870.jpg](http://localhost:9090/file/7e34a4c522024cc5aee5f13709934870.jpg)  </a>\n\n\n\n\n说完了制作这道菜的方法，我以为就到此结束了。外婆却跟我说，这道菜好吃的秘诀不在于过程，而在于用料，一定要选择这款山茶油！因为它与其它食用油不同，这款山茶油精选了优质的非转基因油菜籽为制油原料，再通过古法小榨工艺和纯物理压榨技术制取精髓，只为保留山茶油中的营养，且无任何不良添加，具有独特的小榨风味。用它来做鱼香茄子，具有上色、提味的效果。\n\n经过研究表明，人体对菜油的消化吸收率高达99%，这也说明山茶油非常适合消化功能较弱的人群食用，这也是外婆如此青睐它的原因。\n<a  href=\"http://localhost:8080/reception/detail?id=63\"> \n![2da085d443b0417fadc9d43792e15a4b.jpg](http://localhost:9090/file/2da085d443b0417fadc9d43792e15a4b.jpg) </a>\n\n\n有了美味的鱼香茄子，当然也少不了美味的大米饭啊！外婆给我推荐了这款东北五常长粒香米。与其它大米不同，它产自三代皇后故里、中国的粳稻贡米之乡——吉林市。而且所有大米都是在专属生态基地进行种植的，那里拥有光热资源丰沃的松江黑土冲积平原及丰富的水资源，是世界公认的“黄金水稻带”，上下温差可高达40摄氏度左右，十分适合水稻的生长。这款在千年龙脉所孕育出来的米之精华，米粒整齐、饱满晶莹。煮饭后，还会散发出十分浓郁的大米香，而且入口香糯入魂。\n\n外婆做的鱼香茄子，是我一辈子都忘不了的味道，简单的菜肴里面饱含着满满的爱。现在有了山茶油和东北五常长粒香米，即使我远在异乡，也可以时常吃到外婆的味道。</br></br>', 1, '2023-12-22 09:28:04', '2023-12-22 09:28:04');
INSERT INTO `sys_article` VALUES (7, 'HOT', '民以食为天，国庆节送爸妈礼物就选它', '还有十多天就要到国庆节了，很多人都准备和父母团聚，很多朋友也开始筹划着给父母买点礼物，其实送父母的礼物他们是不会在乎贵贱的，最重要的是实用。只要父母健健康康、开开心心的，就是我们最大的愿望。俗话说民以食为天，给爸妈礼物也要从“食”入手，如果还没考虑好送父母什么礼物，就跟我一起来看看吧~\n\n食补大于药补，过年送爸妈几袋精品米礼品也是不错的选择。米饭是人们日常饮食中的主角之一，一味米饭，与五味调配，几乎可以供给全身所需营养。大米有补中益气、健脾养胃、益精强志、止烦、止渴、止泻等的功效。对于年纪较大，身体机能偏低的中老年人群来说是最需要的。\n\n好的大米富含更多的能量、蛋白质、碳水化合物等人体所需的营养元素。金龙鱼乳玉皇妃稻香贡米产自东北吉林冲积平原，含有优越的光热和资源丰沃松江黑土，是世界公认的“黄金水稻带”。大米在专属生态基地种植，寒地沃土及丰富的水资源，最高温与最低温差高达40摄氏度左右，十分适合水稻生产。\n<a  href=\"http://localhost:8080/reception/detail?id=63\"> \n![2da085d443b0417fadc9d43792e15a4b.jpg](http://localhost:9090/file/2da085d443b0417fadc9d43792e15a4b.jpg) </a>\n\n之所以如此取名因为东北五常长粒香米是古代中国三代皇后的故里，千年龙脉孕育米之精华，保质保量，口味独特。煮出来的米饭个个米粒整齐、饱满晶莹，香气浓郁，膨胀系数大。入口软糯，香糯入魂。而且不回生，凉着吃也好吃，很入味。双层六面体真空包装，更加保鲜。包装特别精美，送给爸妈铁定让他们很欣慰。', 1, '2023-12-22 09:28:04', '2023-12-22 09:28:04');

-- ----------------------------
-- Table structure for sys_cart
-- ----------------------------
DROP TABLE IF EXISTS `sys_cart`;
CREATE TABLE `sys_cart`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` int NULL DEFAULT NULL COMMENT '商品id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `num` int NULL DEFAULT NULL COMMENT '商品数量',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `product_user_uni`(`product_id` ASC, `user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_cart
-- ----------------------------
INSERT INTO `sys_cart` VALUES (89, 55, 37, 2, '2023-12-20 16:06:00', '2023-12-20 16:06:00');
INSERT INTO `sys_cart` VALUES (97, 38, 33, 4, '2024-11-22 01:04:37', '2024-11-22 01:04:37');
INSERT INTO `sys_cart` VALUES (98, 57, 33, 1, '2024-11-22 10:45:23', '2024-11-22 10:45:23');

-- ----------------------------
-- Table structure for sys_classification
-- ----------------------------
DROP TABLE IF EXISTS `sys_classification`;
CREATE TABLE `sys_classification`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品种类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_classification
-- ----------------------------
INSERT INTO `sys_classification` VALUES (4, '时令水果');
INSERT INTO `sys_classification` VALUES (5, '蔬菜豆制');
INSERT INTO `sys_classification` VALUES (7, '酒水乳饮');
INSERT INTO `sys_classification` VALUES (8, '花卉绿植');
INSERT INTO `sys_classification` VALUES (10, '休闲零食');
INSERT INTO `sys_classification` VALUES (11, '冷冻冷藏');
INSERT INTO `sys_classification` VALUES (12, '肉蛋水产');
INSERT INTO `sys_classification` VALUES (13, '粮油调味');

-- ----------------------------
-- Table structure for sys_collection
-- ----------------------------
DROP TABLE IF EXISTS `sys_collection`;
CREATE TABLE `sys_collection`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_collection
-- ----------------------------
INSERT INTO `sys_collection` VALUES (68, 41, 23, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_collection` VALUES (69, 57, 23, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_collection` VALUES (70, 59, 23, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_collection` VALUES (72, 55, 1, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_collection` VALUES (73, 55, 44, '2023-12-29 17:23:09', '2023-12-29 17:23:09');
INSERT INTO `sys_collection` VALUES (76, 38, 33, '2024-01-03 09:34:11', '2024-01-03 09:34:11');

-- ----------------------------
-- Table structure for sys_comment
-- ----------------------------
DROP TABLE IF EXISTS `sys_comment`;
CREATE TABLE `sys_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `user_id` int NULL DEFAULT NULL COMMENT '评论时间',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户id',
  `pid` int NULL DEFAULT NULL COMMENT '父id',
  `ancestors_id` int NULL DEFAULT NULL COMMENT '祖宗id',
  `product_id` int NULL DEFAULT NULL COMMENT '商品id',
  `p_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1535324163 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_comment
-- ----------------------------
INSERT INTO `sys_comment` VALUES (-431878143, '还好把', 1, '2023-12-20 16:00:35', NULL, NULL, 66, NULL);
INSERT INTO `sys_comment` VALUES (1535324162, '很好', 33, '2024-01-03 09:23:58', NULL, NULL, 55, NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES ('custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` VALUES ('grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES ('goods', 'el-icon-goods', 'icon');
INSERT INTO `sys_dict` VALUES ('picture', 'el-icon-picture-outline', 'icon');
INSERT INTO `sys_dict` VALUES ('goodslist', 'el-icon-tickets', 'icon');
INSERT INTO `sys_dict` VALUES ('cart', 'el-icon-shopping-cart-2', 'icon');
INSERT INTO `sys_dict` VALUES ('1', '不想要了', 'reason');
INSERT INTO `sys_dict` VALUES ('2', '商品错选/多选', 'reason');
INSERT INTO `sys_dict` VALUES ('3', '商品无货', 'reason');
INSERT INTO `sys_dict` VALUES ('4', '地址信息填写错误', 'reason');
INSERT INTO `sys_dict` VALUES ('5', '商品降价', 'reason');
INSERT INTO `sys_dict` VALUES ('6', '没用/少用/错用优惠', 'reason');

-- ----------------------------
-- Table structure for sys_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `sys_evaluate`;
CREATE TABLE `sys_evaluate`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `product_id` int NULL DEFAULT NULL COMMENT '商品id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_evaluate
-- ----------------------------
INSERT INTO `sys_evaluate` VALUES (7, '![tb_image_share_1662993595608.jpg](http://localhost:9090/file/a476cd59677c4fb88409fbb24efe476d.jpg)![tb_image_share_1662993602489.jpg](http://localhost:9090/file/69e033e362774e1fb72a95f300cc1746.jpg)![tb_image_share_1662993607294.jpg](http://localhost:9090/file/fc9df3600f9645e1bbb0be1324c93d1e.jpg)![tb_image_share_1662993612250.jpg](http://localhost:9090/file/130bbc01d35f44e4a5033caa36468e07.jpg)![tb_image_share_1662993633756.jpg](http://localhost:9090/file/3b074265f15442c49f2be8d012fa754c.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 35, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (8, '![tb_image_share_1662995850802.jpg](http://localhost:9090/file/ea0b585330dc43c5899aec46f91ddf10.jpg)![tb_image_share_1662995856063.jpg](http://localhost:9090/file/9e5fd5905e264af79ad78569318686d3.jpg)![tb_image_share_1662995860758.jpg](http://localhost:9090/file/8c443828bd79425bb25977be67c681c0.jpg)![tb_image_share_1662995864807.jpg](http://localhost:9090/file/565d12681f5f432d851150c4f54e4987.jpg)![tb_image_share_1662995869654.jpg](http://localhost:9090/file/ba905fc3ba194f1c875484b71d9179e3.jpg)![tb_image_share_1662995876398.jpg](http://localhost:9090/file/787ec74aaf7c48a4a0f9283aeb7e52a2.jpg)![tb_image_share_1662995389287.jpg](http://localhost:9090/file/0706aa95655f4a669b23b26ed2a109f8.jpg)', 36, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (9, '![tb_image_share_1662997723113.jpg](http://localhost:9090/file/b7b50dc6e439459a9df8cb2520972387.jpg)![tb_image_share_1662997731671.jpg](http://localhost:9090/file/7e5cfef574a34af59f2b354e448aafa5.jpg)![tb_image_share_1662997774290.jpg](http://localhost:9090/file/de8b9ce9e80647e598913a5e4cfdc5e7.jpg)![tb_image_share_1662997779001.jpg](http://localhost:9090/file/62ab8efa7c67406a9e299cc45d87a9a0.jpg)![tb_image_share_1662997782992.jpg](http://localhost:9090/file/6c1149e4f1cf46b79356434aeb2138f7.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 37, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (10, '![O1CN015UnJ6B1GTptuVB2jv_!!2209055290624.jpg](http://localhost:9090/file/4f266cdb9a524afe9d516884ba8dd780.jpg)![O1CN01LsWvSi1GTpu1SAQmE_!!2209055290624.jpg](http://localhost:9090/file/34baf2dee215426f8db8a406b3a3cf19.jpg)![O1CN01oqqbrB1GTptzFKuub_!!2209055290624 1.jpg](http://localhost:9090/file/d522182d5ad84c9fa5e43cf630d5d705.jpg)![O1CN01vGD66r1GTpu4X5Zek_!!2209055290624.jpg](http://localhost:9090/file/e09177687a5d418b843e4a74be56cec7.jpg)![O1CN01SUG6u01GTpu5lUVnv_!!2209055290624.jpg](http://localhost:9090/file/8268593b3c6947b591ce3d46f4fd4d55.jpg)', 38, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (11, '![1663033028240.jpg](http://localhost:9090/file/afd8a2c73b16443bb4eadf1a2b5dc5ae.jpg)![1663033063759.jpg](http://localhost:9090/file/e1482fa6989a46d7b5d6c137ed1cfeab.jpg)![1663033067311.jpg](http://localhost:9090/file/20be0f8d90a74a0b94c989988a958259.jpg)![tb_image_share_1662995389287.jpg](http://localhost:9090/file/0706aa95655f4a669b23b26ed2a109f8.jpg)', 39, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (12, '![TITANS_20220913_094835.jpg](http://localhost:9090/file/c0d1b8550bb84237acf31ebc20097cce.jpg)![TITANS_20220913_094838.jpg](http://localhost:9090/file/af75489854b34bd3aac32b67bdfd5553.jpg)![TITANS_20220913_094844.jpg](http://localhost:9090/file/fc0bd9b43b634e65b3ae81057462b8a3.jpg)![TITANS_20220913_094846.jpg](http://localhost:9090/file/b046e12d374f40ad9ce359ade2f31cbd.jpg)![TITANS_20220913_094851.jpg](http://localhost:9090/file/8da17583683e4ba58637227c3f8114ed.jpg)![TITANS_20220913_094854.jpg](http://localhost:9090/file/b38e299a7d164c4db9d05905f53a74e5.jpg)![TITANS_20220913_094857.jpg](http://localhost:9090/file/df23207629ec4598a117afe9c0d0111b.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 40, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (13, '![TITANS_20220913_100103.jpg](http://localhost:9090/file/4eb5321e74a6427780c0ba0cee36434f.jpg)![TITANS_20220913_100106.jpg](http://localhost:9090/file/ba5e25016c5c4a519f8c6f13d8dbeb4d.jpg)![TITANS_20220913_100108.jpg](http://localhost:9090/file/6c0104b9c4c24cddbe6362164e2dea06.jpg)![TITANS_20220913_100110.jpg](http://localhost:9090/file/6bea3af558e64bd382eca0c06fceee6d.jpg)![TITANS_20220913_100113.jpg](http://localhost:9090/file/49399fb6aa7d47f2ab55edda2d4769e9.jpg)![TITANS_20220913_100115.jpg](http://localhost:9090/file/9b5e24a797664250b3313b9b2898604d.jpg)![TITANS_20220913_100117.jpg](http://localhost:9090/file/f7feeecae1cf4db3983dc92344d9a8f3.jpg)![TITANS_20220913_100119.jpg](http://localhost:9090/file/d0c4d4dab0b3476b80c28fc66791b0b0.jpg)![TITANS_20220913_100121.jpg](http://localhost:9090/file/fc13be9e565e4c918d4b664789e0480f.jpg)![TITANS_20220913_100123.jpg](http://localhost:9090/file/378adcde94f64d82ab284ef4bccbd1f9.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 41, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (14, '![TITANS_20220913_100645.jpg](http://localhost:9090/file/ae256846d6e54d34934e3afc1c848396.jpg)![TITANS_20220913_100647.jpg](http://localhost:9090/file/c6beab4b976842e091d6ed560abb213f.jpg)![TITANS_20220913_100651.jpg](http://localhost:9090/file/efb009b711c54a8796616ccbca7ada4f.jpg)![TITANS_20220913_100653.jpg](http://localhost:9090/file/dfe1a1b8c99543ee846527a0a73db512.jpg)![TITANS_20220913_100655.jpg](http://localhost:9090/file/2dc71c38588e45139816b7b1e09bbd5d.jpg)![TITANS_20220913_100702.jpg](http://localhost:9090/file/22c6755399504e8f8662b58c0a53216e.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 42, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (15, '![TITANS_20220913_103207.jpg](http://localhost:9090/file/b0d5a688cc8e40c9ab309e43c9dafba3.jpg)![TITANS_20220913_103210.jpg](http://localhost:9090/file/8bff025d9eaf43a8965a5e43079b6277.jpg)![TITANS_20220913_103212.jpg](http://localhost:9090/file/411487622103487098ad9f525ed85d71.jpg)![TITANS_20220913_103214.jpg](http://localhost:9090/file/f2ee08b747e6487a8448ed885d1a8dcf.jpg)![TITANS_20220913_103218.jpg](http://localhost:9090/file/be050d69678543ccaa877ca728c31efd.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 43, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (16, '![TITANS_20220913_104112.jpg](http://localhost:9090/file/96663bdcbcbd45b6bb5562fae9ff4d9a.jpg)![TITANS_20220913_104115.jpg](http://localhost:9090/file/d178f3cbea754297b0a0d4f367ddbd7b.jpg)![TITANS_20220913_104117.jpg](http://localhost:9090/file/01ef9d0b20bd4aacb9e2ea80a34a1e63.jpg)![TITANS_20220913_104120.jpg](http://localhost:9090/file/b9b0384d19f8403985a986fd09823e48.jpg)![TITANS_20220913_104122.jpg](http://localhost:9090/file/95f64acf72e04ee18fcd61aa32358409.jpg)![TITANS_20220913_104126.jpg](http://localhost:9090/file/b6f562d62f3b4eaabba1bc9521afa0b1.jpg)![TITANS_20220913_104128.jpg](http://localhost:9090/file/1e70b61c706b4e7b9450c321bfa92b63.jpg)![TITANS_20220913_104132.jpg](http://localhost:9090/file/25fbbd403ed2446aab42ca399f2cceab.jpg)![TITANS_20220913_104134.jpg](http://localhost:9090/file/1a13879a419c4720894d79681a34f691.jpg)![TITANS_20220913_104137.jpg](http://localhost:9090/file/4b249c987eb04be2be5a4bc695a4f9d9.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 44, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (17, '![tb_image_share_1663037651926.jpg](http://localhost:9090/file/e12091fe088245d8aa2a85141fcbfbd3.jpg)![tb_image_share_1663037657845.jpg](http://localhost:9090/file/7aef25dfe5c94ff59d0c488a61810fc0.jpg)![tb_image_share_1663037663224.jpg](http://localhost:9090/file/ece62f15ba6d4c4391b46466d68fc74a.jpg)![tb_image_share_1663037667842.jpg](http://localhost:9090/file/4dea9afb4b0a43fdbf6d557e039b71a2.jpg)![tb_image_share_1663037672380.jpg](http://localhost:9090/file/a19ebb3c6c1049379ada10734958abf9.jpg)![tb_image_share_1663037677306.jpg](http://localhost:9090/file/1a2bfe728e26451a8b4877f5e9ad606e.jpg)![tb_image_share_1663037682599.jpg](http://localhost:9090/file/21ffe10d114e44868d14fda781d731f6.jpg)![tb_image_share_1663037687604.jpg](http://localhost:9090/file/6dc6efcbfd1847588cee8bfb3ea41957.jpg)![tb_image_share_1663037693302.jpg](http://localhost:9090/file/12258babe3f340d5abdf5f17e2b49db6.jpg)![tb_image_share_1662995389287.jpg](http://localhost:9090/file/0706aa95655f4a669b23b26ed2a109f8.jpg)', 45, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (18, '![tb_image_share_1663040634122.jpg](http://localhost:9090/file/72069ef326184a759116c9fbcbd80b70.jpg)![tb_image_share_1663040474408.jpg](http://localhost:9090/file/4f84d190eff24d0fb8342994a2e78770.jpg)![tb_image_share_1663040482313.jpg](http://localhost:9090/file/7be0b657ffa1423fa90a9ccd6a2c9797.jpg)![tb_image_share_1663040487639.jpg](http://localhost:9090/file/6f61d0d2f234439ebc55cd3ecebd725b.jpg)![tb_image_share_1663040492868.jpg](http://localhost:9090/file/c0b199d74161418cb73cfce6d4f6aa5e.jpg)![tb_image_share_1663040503436.jpg](http://localhost:9090/file/d972bfe5e93545e7974740d52b46db4e.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 46, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (19, '![tb_image_share_1663043335526.jpg](http://localhost:9090/file/1e3e5a33f1ab4d65b4f93842668feb53.jpg)![tb_image_share_1663043120621.jpg](http://localhost:9090/file/55c7698499df4bb4bb696ff0bc123877.jpg)![tb_image_share_1663043125136.jpg](http://localhost:9090/file/ce9816fd3c024aa2b0b1d01171f5e70b.jpg)![tb_image_share_1663043134752.jpg](http://localhost:9090/file/d74964ec180e49738a036d757513416a.jpg)![tb_image_share_1663043139743.jpg](http://localhost:9090/file/971d64a9a7d24a989866390b1e701ce7.jpg)![tb_image_share_1663043144256.jpg](http://localhost:9090/file/983fa2a19f5f4cf9805056bc575ad923.jpg)![tb_image_share_1663043163875.jpg](http://localhost:9090/file/2bc8f124c757459cb95f1d226512c911.jpg)![tb_image_share_1663043167733.jpg](http://localhost:9090/file/6f289058e8e749ce8b812f405219397f.jpg)![tb_image_share_1663043171633.jpg](http://localhost:9090/file/578908b03e2e46759b531df5896ef227.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 47, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (20, '![tb_image_share_1663043955499.jpg](http://localhost:9090/file/6b925fc013b1442aacc31c4442759e46.jpg)![tb_image_share_1663043962286.jpg](http://localhost:9090/file/9f81bf5ceaf440ac8116009100c0333b.jpg)![tb_image_share_1663043976802.jpg](http://localhost:9090/file/1a408d252f8f4853b1375161d724cead.jpg)![tb_image_share_1663043980695.jpg](http://localhost:9090/file/4b9ba10dfe494e23a5dde8266fd7136f.jpg)![tb_image_share_1663043985760.jpg](http://localhost:9090/file/b6f34dc530584e1791ca8e7d84ec6b54.jpg)![tb_image_share_1663043990094.jpg](http://localhost:9090/file/e839b1642d8243fc8408b7c4e2a16fe7.jpg)![tb_image_share_1663043995640.jpg](http://localhost:9090/file/939da1070b814eb0ba7f259111748e89.jpg)![tb_image_share_1663044001392.jpg](http://localhost:9090/file/0de51df42b21475187b4908b78d064cc.jpg)![tb_image_share_1663044007271.jpg](http://localhost:9090/file/6638f224ffc44894a3bf3eed629d9b31.jpg)![tb_image_share_1663044012550.jpg](http://localhost:9090/file/d62a00705453431f85a51de0883855b6.jpg)![tb_image_share_1663044047492.jpg](http://localhost:9090/file/e9cb8966dbdb4593861e5e937b27cbd5.jpg)![tb_image_share_1663044056917.jpg](http://localhost:9090/file/e4dab48f7fb14488bb8d9b7f8794293b.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 48, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (21, '![1663044877667.jpg](http://localhost:9090/file/05456f058be34568ac5921394a9b8003.jpg)![1663044885920.jpg](http://localhost:9090/file/6c280fb5e8bb4324a26fae5035a01152.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 49, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (22, '![tb_image_share_1663053841410.jpg](http://localhost:9090/file/50148d0559b8464c81694c418a68c310.jpg)![tb_image_share_1663053845337.jpg](http://localhost:9090/file/fc3d3cc6718b4416bc9c47af74789a9c.jpg)![tb_image_share_1663053850363.jpg](http://localhost:9090/file/9bd4a4d7716542b197b5080318a73de0.jpg)![tb_image_share_1663053857456.jpg](http://localhost:9090/file/10981352b19b4279a758a970d7c3e1a5.jpg)![tb_image_share_1663053860966.jpg](http://localhost:9090/file/ecf832bf079041a08246484236486001.jpg)![tb_image_share_1663053867639.jpg](http://localhost:9090/file/743deffa9a2d498da57fa938190b01d9.jpg)![tb_image_share_1663053871749.jpg](http://localhost:9090/file/b018fa1802a446f0aa405213230a1436.jpg)![tb_image_share_1663053877254.jpg](http://localhost:9090/file/eae32c09be774cde92a773e8ce69191a.jpg)![tb_image_share_1663053888694.jpg](http://localhost:9090/file/8844bfd2840449d28eceee4248516a4d.jpg)![tb_image_share_1663053897166.jpg](http://localhost:9090/file/75ca7127b7b541e2b80b88afd2124bd5.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 50, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (23, '![1663054554826.jpg](http://localhost:9090/file/d644588a8fab4e45bd33a85139c420dd.jpg)![1663054571701.jpg](http://localhost:9090/file/3108031837b34262b68ce01f2b93415e.jpg)![1663054591599.jpg](http://localhost:9090/file/70122d5160984996842f6aa956fc083c.jpg)![1663054602695.jpg](http://localhost:9090/file/49815824fb9d464194f7b8f5e40435e9.jpg)![1663054612120.jpg](http://localhost:9090/file/f84228143a4a4b8789a16308c7444a09.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 51, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (24, '![tb_image_share_1663055057786.jpg](http://localhost:9090/file/a6c27381688d4affa927105cf43056c0.jpg)![tb_image_share_1663055067602.jpg](http://localhost:9090/file/89bef5a0ff384702a9b1c8c5cb2551dc.jpg)![tb_image_share_1663055077252.jpg](http://localhost:9090/file/391bae60913e47ecb41bf2b717f436f7.jpg)![tb_image_share_1663055084842.jpg](http://localhost:9090/file/b1c201b4068a43db8e7276600a2e1fc4.jpg)![qq_pic_merged_1662986063363.jpg](http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg)', 52, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (25, '![tb_image_share_1663057329774.jpg](http://localhost:9090/file/696385567c314a0396091458ee6292dd.jpg)![tb_image_share_1663057336340.jpg](http://localhost:9090/file/abf0d07e5f174a75a9b71fe513456cc6.jpg)![tb_image_share_1663057341595.jpg](http://localhost:9090/file/5afc85e278204b2ab1354bc59f5fcfdc.jpg)![tb_image_share_1663057347292.jpg](http://localhost:9090/file/3a75fbab69b64edc8ac8d78f287c4ee9.jpg)![tb_image_share_1663057352269.jpg](http://localhost:9090/file/dd8de1a1e1a04cfa91f55582a11f7413.jpg)![tb_image_share_1663057357370.jpg](http://localhost:9090/file/1800744538b049d8b669168d09e2bcce.jpg)![tb_image_share_1663057367272.jpg](http://localhost:9090/file/cdaba05e8fa84fbf89b3565e5734278e.jpg)![tb_image_share_1663057370906.jpg](http://localhost:9090/file/739a57b2855b4fd780752e5f97682fea.jpg)', 53, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (26, '![1663057889352.jpg](http://localhost:9090/file/e5c66611dce6474cbd84f61604db95e7.jpg)![1663057902617.jpg](http://localhost:9090/file/3808ff548cd047b9991e4b77a5d433d3.jpg)![1663057908091.jpg](http://localhost:9090/file/529effc029e349b984c90cbb61058cb0.jpg)![1663057914641.jpg](http://localhost:9090/file/ce68968a92dd41bdacbec5f6ab2315a4.jpg)![1663057922247.jpg](http://localhost:9090/file/6e0f9c9be8b547eab43abeaec13364c8.jpg)![1663057932269.jpg](http://localhost:9090/file/5b69db820fab4ef88147ff9f79a97a91.jpg)![1663057935066.jpg](http://localhost:9090/file/638ff3d3fc214540a35c8458bd014fae.jpg)', 54, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (27, '![tb_image_share_1663059597509.jpg](http://localhost:9090/file/c3bea4e365ef4919ade5d101b0b0020c.jpg)![tb_image_share_1663059601425.jpg](http://localhost:9090/file/b91a9e238b3948c887067eb9de680b52.jpg)![tb_image_share_1663059606331.jpg](http://localhost:9090/file/8dde69d837e04fc3a498743f9dc12092.jpg)![tb_image_share_1663059606331.jpg](http://localhost:9090/file/8dde69d837e04fc3a498743f9dc12092.jpg)![tb_image_share_1663059611515.jpg](http://localhost:9090/file/81b6ccdf27304d449d746b93603957ec.jpg)![tb_image_share_1663059620486.jpg](http://localhost:9090/file/b4d2aa8d95cc4cc0967c2ee31cf80bc6.jpg)![tb_image_share_1663059624857.jpg](http://localhost:9090/file/55a76b9e95a44b838f89291daf074371.jpg)![tb_image_share_1663059635180.jpg](http://localhost:9090/file/0503dbae97d3441ba1d73d378be8d3f2.jpg)![tb_image_share_1663059639559.jpg](http://localhost:9090/file/af82720026d04a35b7764bc962506a7a.jpg)', 55, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (28, '![tb_image_share_1663062061641.jpg](http://localhost:9090/file/024fd80aaf3d44b3a27a77acb48032b9.jpg)![tb_image_share_1663062065795.jpg](http://localhost:9090/file/19685028172242a1849c2e8865df2ead.jpg)![tb_image_share_1663062069258.jpg](http://localhost:9090/file/8cb76e394d304e0db58984a57e30d174.jpg)![tb_image_share_1663062072498.jpg](http://localhost:9090/file/579facdc07f9499cb13da9bdca31ad07.jpg)![tb_image_share_1663062077488.jpg](http://localhost:9090/file/f5eba8db1d2f4e89a8b9dfda8ddc4004.jpg)![tb_image_share_1663062081175.jpg](http://localhost:9090/file/c1d5e9d56c8b48bb98824fec79e2ea9c.jpg)![tb_image_share_1663062085088.jpg](http://localhost:9090/file/8a275e093db7438db68fa5d4304515b1.jpg)![tb_image_share_1663062092278.jpg](http://localhost:9090/file/a86cc11048ae4859bf8eb5249cbbe9a7.jpg)', 56, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (29, '![tb_image_share_1663062274935.jpg](http://localhost:9090/file/e7825dea019743b697ae52d3870c4d11.jpg)![tb_image_share_1663062278415.jpg](http://localhost:9090/file/1018e267374e4de1802cb1fbe9b0a8b9.jpg)![tb_image_share_1663062282066.jpg](http://localhost:9090/file/b790ebdff10f427e9b50f255d69477eb.jpg)![tb_image_share_1663062285648.jpg](http://localhost:9090/file/d5f61017610548fdac769cdc76dfbae7.jpg)![tb_image_share_1663062289227.jpg](http://localhost:9090/file/bd58e52c8e754e58b8625e29936388a7.jpg)![tb_image_share_1663062292625.jpg](http://localhost:9090/file/d740ec7c56dc4937b783459a9104c809.jpg)![tb_image_share_1663062307748.jpg](http://localhost:9090/file/ae700aa803144f54bbd95543bb640d64.jpg)', 57, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (30, '![tb_image_share_1663063388438.jpg](http://localhost:9090/file/3e983f75a956458b834def4ac9eb75ea.jpg)![tb_image_share_1663063392070.jpg](http://localhost:9090/file/9fe1657104e1474bb399c989bbad4c8f.jpg)![tb_image_share_1663063401135.jpg](http://localhost:9090/file/ccf8194522bb44e6afa16737e1c8efb3.jpg)![tb_image_share_1663063412170.jpg](http://localhost:9090/file/0975cbe12c7849a188dd813b2a79e11e.jpg)![tb_image_share_1663063421379.jpg](http://localhost:9090/file/e2181b583fc746608eb455fd8d947c5f.jpg)![tb_image_share_1663063425901.jpg](http://localhost:9090/file/04e9bf451e80463bbef21b082027724c.jpg)', 58, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (31, '![tb_image_share_1663064925774.jpg](http://localhost:9090/file/e3eadfaaaeea42ecb1e7291f75c736be.jpg)![tb_image_share_1663064930266.jpg](http://localhost:9090/file/dcf7fc2e9b08444a94a83902255c02e8.jpg)![tb_image_share_1663064934104.jpg](http://localhost:9090/file/f4155737cd5a405385624a2e074fd402.jpg)![tb_image_share_1663064937912.jpg](http://localhost:9090/file/6f3d6c56f6ac48a48b40cb7f211fb822.jpg)![tb_image_share_1663064943076.jpg](http://localhost:9090/file/f997a27b0a124a86ac977887a354da66.jpg)![tb_image_share_1663064946486.jpg](http://localhost:9090/file/b9f12721e3f44a28a2a660cfcc55b1d3.jpg)![tb_image_share_1663064950185.jpg](http://localhost:9090/file/65b02559a818426a82f497cb0a6906a7.jpg)![tb_image_share_1663064969398.jpg](http://localhost:9090/file/61dfbccfb26d42fb9db257d6221af56d.jpg)![tb_image_share_1663057357370.jpg](http://localhost:9090/file/1800744538b049d8b669168d09e2bcce.jpg)', 59, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (32, '![1663065558249.jpg](http://localhost:9090/file/ffaddddf58f54542bf88247dbd6839dc.jpg)![1663065566567.jpg](http://localhost:9090/file/907e1f84d8a34ce6bf6c89d4701f4286.jpg)', 60, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (33, '![tb_image_share_1663057357370.jpg](http://localhost:9090/file/1800744538b049d8b669168d09e2bcce.jpg)![tb_image_share_1663065965882.jpg](http://localhost:9090/file/f29199aec5bc4c939a27d5193d65042a.jpg)![tb_image_share_1663065961435.jpg](http://localhost:9090/file/4cdc5195b67d49fca4f0a1e7429f539b.jpg)![tb_image_share_1663065936552.jpg](http://localhost:9090/file/4f07a35501df423997f36db0c4c74dff.jpg)![tb_image_share_1663065971943.jpg](http://localhost:9090/file/2b02e28c1f7e4a849562efaf26b148fb.jpg)![tb_image_share_1663065982533.jpg](http://localhost:9090/file/e43dbc663e0b41049e1f64c427420977.jpg)', 61, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (34, '![tb_image_share_1663057357370.jpg](http://localhost:9090/file/1800744538b049d8b669168d09e2bcce.jpg)![tb_image_share_1663066843073.jpg](http://localhost:9090/file/0ac138b4526441a9becd2e99300cfa3a.jpg)![tb_image_share_1663066848419.jpg](http://localhost:9090/file/8d09c5ea4e8942098f4c5b17de07efdc.jpg)![tb_image_share_1663066853111.jpg](http://localhost:9090/file/8bb0978a4de7463aadae80cb728286bc.jpg)![tb_image_share_1663066856850.jpg](http://localhost:9090/file/e2d580f3f0b94a2f9aca4f4bd46113b4.jpg)![tb_image_share_1663066861168.jpg](http://localhost:9090/file/237954fc8c884cb1942f8c816ff8879f.jpg)![tb_image_share_1663066874263.jpg](http://localhost:9090/file/dc77aec14a414768a089f14676aea2b3.jpg)![tb_image_share_1663066877939.jpg](http://localhost:9090/file/e3d6206bae45470cbca50c5eb1b445f1.jpg)', 62, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (35, '![tb_image_share_1663074961315.jpg](http://localhost:9090/file/7fa8ee440ec443b0a349a7a486b2040e.jpg)![tb_image_share_1663074966192.jpg](http://localhost:9090/file/4b2fe24b2dd545b9b6d96d3f68ec3b82.jpg)![tb_image_share_1663074971540.jpg](http://localhost:9090/file/5d66264a13a5456da7f4c96b9eef34db.jpg)![tb_image_share_1663074976782.jpg](http://localhost:9090/file/ee9a20e56722458aa1d08af0d58153e3.jpg)![tb_image_share_1663074981702.jpg](http://localhost:9090/file/233ea764eb914c91805835917cc79f54.jpg)![tb_image_share_1663074986914.jpg](http://localhost:9090/file/2020e51df0024430a497721d6f120f09.jpg)![tb_image_share_1663074991710.jpg](http://localhost:9090/file/45c5015090e04322a156b89a626d2130.jpg)![tb_image_share_1663074996006.jpg](http://localhost:9090/file/0d5549608b444ba483a200a303b59aa8.jpg)', 63, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (36, '![tb_image_share_1663075476838.jpg](http://localhost:9090/file/2b61822bf39544a69517a27b08466dbb.jpg)![tb_image_share_1663075481732.jpg](http://localhost:9090/file/fe51b75eb9aa4d8fae414c1022e825e6.jpg)![tb_image_share_1663075486420.jpg](http://localhost:9090/file/899ed5a1a29645a49d9399292b7581ec.jpg)![tb_image_share_1663075491590.jpg](http://localhost:9090/file/c451d11c20814605a5f22f7990c39485.jpg)![tb_image_share_1663075495615.jpg](http://localhost:9090/file/b66c344a000541979e5a9a7e111ad329.jpg)![tb_image_share_1663075500054.jpg](http://localhost:9090/file/1aae9edf5c2446c8bb923b2a2ff3eb5e.jpg)![tb_image_share_1663075503923.jpg](http://localhost:9090/file/97e46185f9f943238242fb0177b6b115.jpg)![tb_image_share_1663075507821.jpg](http://localhost:9090/file/a547b2839ab94c149c66b8291b2c384e.jpg)![tb_image_share_1663075511338.jpg](http://localhost:9090/file/186c9a48b8284c97ab1a40e9d47acc78.jpg)![tb_image_share_1663075515314.jpg](http://localhost:9090/file/a3f9c7d8c7c149eea3f69f3357f3338b.jpg)', 64, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (37, '![tb_image_share_1663076072451.jpg](http://localhost:9090/file/55783fb11605425396009b0de1938d8b.jpg)![tb_image_share_1663076076548.jpg](http://localhost:9090/file/38fc0c122219495191d31a7cc4c319a8.jpg)![tb_image_share_1663076080435.jpg](http://localhost:9090/file/99c2f7700ccc4e09a41f695456785076.jpg)![tb_image_share_1663076084818.jpg](http://localhost:9090/file/44d17b47a67a4709a088b387d9125eaa.jpg)![tb_image_share_1663076088327.jpg](http://localhost:9090/file/6d294c067dd9405aa7fb7ae747ed5eae.jpg)![tb_image_share_1663076091750.jpg](http://localhost:9090/file/e3c1b6a5620347b9b227012a4ca4402d.jpg)![tb_image_share_1663076095043.jpg](http://localhost:9090/file/7a8e75b866504b8ca395b27d85cd1083.jpg)![tb_image_share_1663076099937.jpg](http://localhost:9090/file/13f9527fce0a4b368093d6b761445510.jpg)', 65, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (38, '![tb_image_share_1663076539025.jpg](http://localhost:9090/file/ffe53bbb2dff436c97ecab87b06ef781.jpg)![tb_image_share_1663076552053.jpg](http://localhost:9090/file/6137f90fa776434ab530cd43c5d9eb2a.jpg)![tb_image_share_1663076555850.jpg](http://localhost:9090/file/76c8a3aed9b04fc798410d0439cd2c41.jpg)![tb_image_share_1663076560349.jpg](http://localhost:9090/file/4c9467e034dd40998a4bb412a1ef9a1f.jpg)![tb_image_share_1663076564982.jpg](http://localhost:9090/file/7d76789ceac3464fbf17252debbd2d1e.jpg)![tb_image_share_1663076572875.jpg](http://localhost:9090/file/609f8c0377a84ee78c2b35494e3629c4.jpg)![tb_image_share_1663076578613.jpg](http://localhost:9090/file/dc6ca01751b24938a48b710dc41a02a9.jpg)', 66, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (39, '![tb_image_share_1663077189205.jpg](http://localhost:9090/file/e7440aebedb541b5ad97bcb416bad29e.jpg)![tb_image_share_1663077200510.jpg](http://localhost:9090/file/7b149901cf3847eda1cff36a3be8bfcf.jpg)![tb_image_share_1663077205651.jpg](http://localhost:9090/file/d39c09ab450846a4a80a2a7319daae3c.jpg)![tb_image_share_1663077209954.jpg](http://localhost:9090/file/f3272139da784c2ba3395c95d904d234.jpg)![tb_image_share_1663077213735.jpg](http://localhost:9090/file/b694694c097f4da38a7919a03044cbd4.jpg)![tb_image_share_1663077223244.jpg](http://localhost:9090/file/8f802c58dd2e4532a1668a0e144390f8.jpg)![tb_image_share_1663077229037.jpg](http://localhost:9090/file/937e6970dc964452bc540654e18b3cc3.jpg)![tb_image_share_1663077233060.jpg](http://localhost:9090/file/b423fdbb617e4d7ca21da804ab20131b.jpg)![tb_image_share_1663077238843.jpg](http://localhost:9090/file/19fc50aa00484783af621a88bc3d633c.jpg)![tb_image_share_1663075486420.jpg](http://localhost:9090/file/899ed5a1a29645a49d9399292b7581ec.jpg)', 67, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (40, '![tb_image_share_1663079219632.jpg](http://localhost:9090/file/b5ba77d5ef094c0e888ea909ef57eaf6.jpg)![tb_image_share_1663079222883.jpg](http://localhost:9090/file/bf59106ecdae40cbbe1d0731813e7bf2.jpg)![tb_image_share_1663079226892.jpg](http://localhost:9090/file/099608c19b5d4f6fb8af2557f6e82653.jpg)![tb_image_share_1663079231547.jpg](http://localhost:9090/file/06a3c36bc4fd4d52b05ecb8a62568b09.jpg)![tb_image_share_1663079242459.jpg](http://localhost:9090/file/f1bc81edb8cd4ee0be8b21adcaa994ae.jpg)![tb_image_share_1663079250263.jpg](http://localhost:9090/file/554d80ee13824ae4ac9baff2d1e09c1b.jpg)![tb_image_share_1663079258652.jpg](http://localhost:9090/file/54f07707116d45d480311d4eba59cd3f.jpg)![tb_image_share_1663079275571.jpg](http://localhost:9090/file/928025a6802b42d08f6d05bd1c69e277.jpg)![tb_image_share_1663075486420.jpg](http://localhost:9090/file/899ed5a1a29645a49d9399292b7581ec.jpg)', 68, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (41, '![tb_image_share_1663079987547.jpg](http://localhost:9090/file/c549e628df214b278d7b79cd25f5d228.jpg)![tb_image_share_1663079991996.jpg](http://localhost:9090/file/2ff8edc64e304fb293e460ed269931b4.jpg)![tb_image_share_1663079996553.jpg](http://localhost:9090/file/2749c42a8a2a41df887f476a2f9a7ead.jpg)![tb_image_share_1663080002136.jpg](http://localhost:9090/file/9908961de27b4977b179667a63f58e91.jpg)![tb_image_share_1663080006894.jpg](http://localhost:9090/file/ec3b4196e68741ca89ea727d7cb8ae60.jpg)![tb_image_share_1663080012162.jpg](http://localhost:9090/file/c005f246036f44879b0984ea452289c9.jpg)![tb_image_share_1663080019754.jpg](http://localhost:9090/file/c58f137245554132a87fe56cee77142a.jpg)![tb_image_share_1663080016283.jpg](http://localhost:9090/file/609347d5f36c45ac904bc626cbe2a1cb.jpg)![tb_image_share_1663075486420.jpg](http://localhost:9090/file/899ed5a1a29645a49d9399292b7581ec.jpg)', 69, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (42, '![1663080559765.jpg](http://localhost:9090/file/8980f958af4d4f1f9fb4062233f5c72f.jpg)![1663080574560.jpg](http://localhost:9090/file/1131eb83a93d4204b29e98efad3f8f4d.jpg)![1663080585793.jpg](http://localhost:9090/file/38a439be799b4b5f89952f620b21b127.jpg)![1663080593922.jpg](http://localhost:9090/file/180f15d94a0f44cf943d46242daa5d8b.jpg)![1663080597598.jpg](http://localhost:9090/file/504c64fcdaf04cad9434984eb911f9ec.jpg)![1663080600504.jpg](http://localhost:9090/file/435e0bc758e947af863550cd052cad63.jpg)![1663080611537.jpg](http://localhost:9090/file/05f9cbf6dee2467faf39467ee58c1743.jpg)![tb_image_share_1663075486420.jpg](http://localhost:9090/file/899ed5a1a29645a49d9399292b7581ec.jpg)', 70, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (43, '123123123123123123123123123123123', 71, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_evaluate` VALUES (44, '很好啊', 72, '2023-12-29 09:33:55', '2023-12-29 09:33:55');
INSERT INTO `sys_evaluate` VALUES (45, '123123', 73, '2023-12-29 16:05:01', '2023-12-29 16:05:01');
INSERT INTO `sys_evaluate` VALUES (46, '123123123', 74, '2023-12-29 16:07:40', '2023-12-29 16:07:40');
INSERT INTO `sys_evaluate` VALUES (47, '123123123', 75, '2024-01-03 09:39:24', '2024-01-03 09:39:24');

-- ----------------------------
-- Table structure for sys_examine
-- ----------------------------
DROP TABLE IF EXISTS `sys_examine`;
CREATE TABLE `sys_examine`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int NULL DEFAULT NULL COMMENT '订单id',
  `passno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '待审核' COMMENT '审核状态',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '原因',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `item_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品状态',
  `operation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户申请内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_examine
-- ----------------------------
INSERT INTO `sys_examine` VALUES (22, 88, '审核通过', '地址信息填写错误', 23, '待发货', '取消订单');
INSERT INTO `sys_examine` VALUES (23, 89, '待审核', '商品无货', 23, '待发货', '取消订单');
INSERT INTO `sys_examine` VALUES (24, 94, '待审核', '商品错选/多选', 23, '待付款', '取消订单');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint NULL DEFAULT NULL COMMENT '文件大小',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `is_delete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文件md5',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 861 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (318, 'v2-66ca9738e041fd2fb4fc8cbee9ee6854_720w.jpg', 'jpg', 56, 'http://localhost:9090/file/4d56c010516846aa89384a694031ae08.jpg', 0, 1, 'a6ae6421f123d40ccb0c3d6b27c73d3a');
INSERT INTO `sys_file` VALUES (319, 'tb_image_share_1662992829767.jpg', 'jpg', 950, 'http://localhost:9090/file/7ac41096e1464de58eb02c10bc7cfa35.jpg', 0, 1, '71bdd7590ad603e6a8fec36bd9a1251d');
INSERT INTO `sys_file` VALUES (320, 'tb_image_share_1662992851095.jpg', 'jpg', 965, 'http://localhost:9090/file/4c9c8984551945c59f75b4fe086c21bf.jpg', 0, 1, '3de9134efdca1e8d0eb56600c0738865');
INSERT INTO `sys_file` VALUES (321, 'tb_image_share_1662992838846.jpg', 'jpg', 951, 'http://localhost:9090/file/e37d2a215a4e4765a858a597f7eaa41e.jpg', 0, 1, '77c7a7468c4e50fbd9b8ced751527188');
INSERT INTO `sys_file` VALUES (322, 'tb_image_share_1662992845248.jpg', 'jpg', 825, 'http://localhost:9090/file/a465793ba09f448892ce0156861a7890.jpg', 0, 1, '70dc382e0559fe92d12fbb87ae3db404');
INSERT INTO `sys_file` VALUES (323, 'tb_image_share_1662992848234.jpg', 'jpg', 1210, 'http://localhost:9090/file/38f06e84aa1c4ee6a53b437a51d7d56b.jpg', 0, 1, 'f6ae9f746b6b1b77f6352d7a66b2900a');
INSERT INTO `sys_file` VALUES (324, '1662993381678.mp4', 'mp4', 5719, 'http://localhost:9090/file/f1aff158795f42deaa010fe059372d52.mp4', 0, 1, 'f85bc7eb76fe2d06627f0ea02ce61297');
INSERT INTO `sys_file` VALUES (325, 'tb_image_share_1662993595608.jpg', 'jpg', 515, 'http://localhost:9090/file/a476cd59677c4fb88409fbb24efe476d.jpg', 0, 1, '5c6c66037167376716fdda1b02a6c025');
INSERT INTO `sys_file` VALUES (326, 'tb_image_share_1662993602489.jpg', 'jpg', 510, 'http://localhost:9090/file/69e033e362774e1fb72a95f300cc1746.jpg', 0, 1, '1e6882084080f9d78dfa9e90c5e8468e');
INSERT INTO `sys_file` VALUES (327, 'tb_image_share_1662993607294.jpg', 'jpg', 907, 'http://localhost:9090/file/fc9df3600f9645e1bbb0be1324c93d1e.jpg', 0, 1, 'a08b7dd81c57b67aa8dd25cbf6ffd04f');
INSERT INTO `sys_file` VALUES (328, 'tb_image_share_1662993612250.jpg', 'jpg', 524, 'http://localhost:9090/file/130bbc01d35f44e4a5033caa36468e07.jpg', 0, 1, '332a7197823e116e1a22cd9f9ff47aa5');
INSERT INTO `sys_file` VALUES (329, 'tb_image_share_1662993633756.jpg', 'jpg', 142, 'http://localhost:9090/file/3b074265f15442c49f2be8d012fa754c.jpg', 0, 1, 'df36bafa47da33e182bae16ada63376f');
INSERT INTO `sys_file` VALUES (330, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (331, 'tb_image_share_1662995406576.jpg', 'jpg', 469, 'http://localhost:9090/file/87b74483327347518c0351479db453d5.jpg', 0, 1, '851b6691bfe42a1a942c78df149cc351');
INSERT INTO `sys_file` VALUES (332, 'O1CN01ayxPcH1EWvI7NPgZw_!!3476360360.jpg_60x60q90.jpg', 'jpg', 4, 'http://localhost:9090/file/02f1d84a62e54618a5de2fd97045485e.jpg', 0, 1, '6937cc21a353ef34013fa56a0fa55f8a');
INSERT INTO `sys_file` VALUES (333, 'O1CN01fLcUnd1EWvIC57UN0_!!3476360360.jpg_60x60q90.jpg', 'jpg', 4, 'http://localhost:9090/file/3ce303ad0ef24f18a03cf565afb12a4a.jpg', 0, 1, 'b00633c9e977dd3957a13c65a4876c69');
INSERT INTO `sys_file` VALUES (334, 'O1CN01JmmwYL1EWvIJKZK1i_!!3476360360.jpg_60x60q90.jpg', 'jpg', 5, 'http://localhost:9090/file/413e1a0277a846818d7ef62ab34ee947.jpg', 0, 1, 'ece1368d1ac676e5b9e9d4ad04fdf496');
INSERT INTO `sys_file` VALUES (335, 'O1CN016MiBjF1EWvIJKMIWh_!!3476360360.jpg_60x60q90.jpg', 'jpg', 5, 'http://localhost:9090/file/324eb47cac1d46589489a0f062f026b4.jpg', 0, 1, 'bbc1a0e43e2f57e4d4cdc89a9d772b86');
INSERT INTO `sys_file` VALUES (336, '紫薯新鲜板栗红薯番薯地瓜蜜薯糖心10斤山芋烟薯香薯蔬菜农家自种-tmall.com天猫.mp4', 'mp4', 11098, 'http://localhost:9090/file/be08677486c94415bd9afaecf9593483.mp4', 0, 1, '01da1c8087dbccab84e043557914e3dd');
INSERT INTO `sys_file` VALUES (337, 'tb_image_share_1662995850802.jpg', 'jpg', 554, 'http://localhost:9090/file/ea0b585330dc43c5899aec46f91ddf10.jpg', 0, 1, '4a7e7fbab2ef0796fd7cfc384604d0a2');
INSERT INTO `sys_file` VALUES (338, 'tb_image_share_1662995856063.jpg', 'jpg', 582, 'http://localhost:9090/file/9e5fd5905e264af79ad78569318686d3.jpg', 0, 1, '1bf2710bdc4b14e270069972505ed260');
INSERT INTO `sys_file` VALUES (339, 'tb_image_share_1662995860758.jpg', 'jpg', 685, 'http://localhost:9090/file/8c443828bd79425bb25977be67c681c0.jpg', 0, 1, '80225f10c0fbc1c18d1df27877fb7556');
INSERT INTO `sys_file` VALUES (340, 'tb_image_share_1662995860758.jpg', 'jpg', 685, 'http://localhost:9090/file/8c443828bd79425bb25977be67c681c0.jpg', 0, 1, '80225f10c0fbc1c18d1df27877fb7556');
INSERT INTO `sys_file` VALUES (341, 'tb_image_share_1662995864807.jpg', 'jpg', 1001, 'http://localhost:9090/file/565d12681f5f432d851150c4f54e4987.jpg', 0, 1, 'bca30f3006f006a0fc7ee20c60882328');
INSERT INTO `sys_file` VALUES (342, 'tb_image_share_1662995869654.jpg', 'jpg', 537, 'http://localhost:9090/file/ba905fc3ba194f1c875484b71d9179e3.jpg', 0, 1, '81d7df75bf373cb2bf9461e58076b910');
INSERT INTO `sys_file` VALUES (343, 'tb_image_share_1662995876398.jpg', 'jpg', 178, 'http://localhost:9090/file/787ec74aaf7c48a4a0f9283aeb7e52a2.jpg', 0, 1, '69e21394505819d28dacc3447edf362f');
INSERT INTO `sys_file` VALUES (344, 'tb_image_share_1662995389287.jpg', 'jpg', 328, 'http://localhost:9090/file/0706aa95655f4a669b23b26ed2a109f8.jpg', 0, 1, '2970668db0a8cc84434d6ba8c93a1800');
INSERT INTO `sys_file` VALUES (345, 'tb_image_share_1662996140713.jpg', 'jpg', 473, 'http://localhost:9090/file/e5d4fac3b2a749d782f085f01f05dac1.jpg', 0, 1, 'da3b0e1a05d98a14a339eef595ea3f85');
INSERT INTO `sys_file` VALUES (346, 'tb_image_share_1662996134278.jpg', 'jpg', 540, 'http://localhost:9090/file/c484a6f05ac844889f9d6c3731d4808e.jpg', 0, 1, '5ccf3de016cd843eaeabfe3d9522ae97');
INSERT INTO `sys_file` VALUES (347, 'tb_image_share_1662996150531.jpg', 'jpg', 511, 'http://localhost:9090/file/84ae1f202cd0480cbc0fe33a71d84e97.jpg', 0, 1, '639c4bd3d1ac786433a3cd084cbfcbd7');
INSERT INTO `sys_file` VALUES (348, 'tb_image_share_1662996158266.jpg', 'jpg', 618, 'http://localhost:9090/file/ba11c8d4b6ef4115b3310323e430c853.jpg', 0, 1, '28ea2e982df155df2e044b24adea1c34');
INSERT INTO `sys_file` VALUES (349, 'tb_image_share_1662996134278.jpg', 'jpg', 540, 'http://localhost:9090/file/c484a6f05ac844889f9d6c3731d4808e.jpg', 0, 1, '5ccf3de016cd843eaeabfe3d9522ae97');
INSERT INTO `sys_file` VALUES (350, 'tb_image_share_1662996140713.jpg', 'jpg', 473, 'http://localhost:9090/file/e5d4fac3b2a749d782f085f01f05dac1.jpg', 0, 1, 'da3b0e1a05d98a14a339eef595ea3f85');
INSERT INTO `sys_file` VALUES (351, 'tb_image_share_1662996150531.jpg', 'jpg', 511, 'http://localhost:9090/file/84ae1f202cd0480cbc0fe33a71d84e97.jpg', 0, 1, '639c4bd3d1ac786433a3cd084cbfcbd7');
INSERT INTO `sys_file` VALUES (352, 'tb_image_share_1662997273011.jpg', 'jpg', 548, 'http://localhost:9090/file/a5ef51a145054f3f8ef5bb3398dd239f.jpg', 0, 1, '2e8d857504e15c30b98b8f1d2c8ee082');
INSERT INTO `sys_file` VALUES (353, 'tb_image_share_1662997269920.jpg', 'jpg', 492, 'http://localhost:9090/file/ad7c30d440f7403fa0e7ec3cebbf5f82.jpg', 0, 1, '93649b61c31d41306a92f63b5f4ba410');
INSERT INTO `sys_file` VALUES (354, 'tb_image_share_1662997280553.jpg', 'jpg', 505, 'http://localhost:9090/file/7cd57c80beb14cacbeb2647704dbdd39.jpg', 0, 1, '4444d551171c3f8f11b005d859b6191b');
INSERT INTO `sys_file` VALUES (355, 'tb_image_share_1662997283248.jpg', 'jpg', 492, 'http://localhost:9090/file/1ea3aa7a571f48e5b32cae8dc5c26d74.jpg', 0, 1, '6a9e870ba8c754a992adbe3316038e0f');
INSERT INTO `sys_file` VALUES (356, 'tb_image_share_1662997286328.jpg', 'jpg', 516, 'http://localhost:9090/file/d63188de825d4e6d9c4fe6a8487344e5.jpg', 0, 1, 'cd057c47c32788db4740cd843d00811e');
INSERT INTO `sys_file` VALUES (357, '广西荔浦芋头9斤新鲜牛奶小芋头槟榔芋艿泥正宗红芽香芋圆蔬菜10-tmall.com天猫.mp4', 'mp4', 10371, 'http://localhost:9090/file/f1547be847174be1b394da4e7ad345dc.mp4', 0, 1, '228895ba91e2c2b1d2e89856c2184461');
INSERT INTO `sys_file` VALUES (358, 'tb_image_share_1662997723113.jpg', 'jpg', 565, 'http://localhost:9090/file/b7b50dc6e439459a9df8cb2520972387.jpg', 0, 1, '9bca37db698f432f7852c3619bd86609');
INSERT INTO `sys_file` VALUES (359, 'tb_image_share_1662997731671.jpg', 'jpg', 79, 'http://localhost:9090/file/7e5cfef574a34af59f2b354e448aafa5.jpg', 0, 1, 'bddec8c5c6553907717d638fb1b8d142');
INSERT INTO `sys_file` VALUES (360, 'tb_image_share_1662997774290.jpg', 'jpg', 414, 'http://localhost:9090/file/de8b9ce9e80647e598913a5e4cfdc5e7.jpg', 0, 1, '6ab81bfd43dd81a983108ecdff189aa8');
INSERT INTO `sys_file` VALUES (361, 'tb_image_share_1662997779001.jpg', 'jpg', 80, 'http://localhost:9090/file/62ab8efa7c67406a9e299cc45d87a9a0.jpg', 0, 1, '8bba4b1a0634b273229f65eae6405a61');
INSERT INTO `sys_file` VALUES (362, 'tb_image_share_1662997782992.jpg', 'jpg', 432, 'http://localhost:9090/file/6c1149e4f1cf46b79356434aeb2138f7.jpg', 0, 1, 'af478a6afafc9877492878189b1a117e');
INSERT INTO `sys_file` VALUES (363, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (364, 'tb_image_share_1662998244058.jpg', 'jpg', 284, 'http://localhost:9090/file/0d6c090a3a394d9ca144804b72fdc0c8.jpg', 0, 1, 'e9c6a81910404e88df6107a9a31bb38d');
INSERT INTO `sys_file` VALUES (365, 'tb_image_share_1662998247621.jpg', 'jpg', 264, 'http://localhost:9090/file/5f55692d6dee487d9ee762b498d532a8.jpg', 0, 1, '1b12cdb49cd637a8dfa540542c7c9890');
INSERT INTO `sys_file` VALUES (366, 'tb_image_share_1662998250475.jpg', 'jpg', 356, 'http://localhost:9090/file/eedac3ec151940ac83739dad55de5f4f.jpg', 0, 1, '949737e1f59326eea8f13187f1550aee');
INSERT INTO `sys_file` VALUES (367, 'TITANS_20220912_235644.jpg', 'jpg', 80, 'http://localhost:9090/file/19bd9e201e094fe6b6b6557c239c7f77.jpg', 0, 1, '959e3e6a84ee9ca4d011319218541965');
INSERT INTO `sys_file` VALUES (368, 'TITANS_20220912_235646.jpg', 'jpg', 148, 'http://localhost:9090/file/5aba967687e14569913799687ca7e9f9.jpg', 0, 1, '1eb80964fc5511176d3c3cb9274d4474');
INSERT INTO `sys_file` VALUES (369, '娃娃菜新鮮高山露天娃娃菜黃心菜大白菜火鍋菜麻辣燙燒烤菜包郵.mp4', 'mp4', 1778, 'http://localhost:9090/file/cb0b0f154de74b869946b38fc59c6f5a.mp4', 0, 1, 'eb8f47864f64ab116c79ea431cc68a99');
INSERT INTO `sys_file` VALUES (370, 'O1CN015UnJ6B1GTptuVB2jv_!!2209055290624.jpg', 'jpg', 150, 'http://localhost:9090/file/4f266cdb9a524afe9d516884ba8dd780.jpg', 0, 1, 'a24b4b69ec86da092d52d54230acd23f');
INSERT INTO `sys_file` VALUES (371, 'O1CN01LsWvSi1GTpu1SAQmE_!!2209055290624.jpg', 'jpg', 100, 'http://localhost:9090/file/34baf2dee215426f8db8a406b3a3cf19.jpg', 0, 1, '102172149fd56391c31c30e13eb6875a');
INSERT INTO `sys_file` VALUES (372, 'O1CN01oqqbrB1GTptzFKuub_!!2209055290624 (1).jpg', 'jpg', 118, 'http://localhost:9090/file/d522182d5ad84c9fa5e43cf630d5d705.jpg', 0, 1, '53b7d8aa1452122afbfb4d2505a139ed');
INSERT INTO `sys_file` VALUES (373, 'O1CN01vGD66r1GTpu4X5Zek_!!2209055290624.jpg', 'jpg', 192, 'http://localhost:9090/file/e09177687a5d418b843e4a74be56cec7.jpg', 0, 1, '8156fa8ab389e2d91daff0b761974897');
INSERT INTO `sys_file` VALUES (374, 'O1CN01SUG6u01GTpu5lUVnv_!!2209055290624.jpg', 'jpg', 137, 'http://localhost:9090/file/8268593b3c6947b591ce3d46f4fd4d55.jpg', 0, 1, 'cbc8f0a26eb2eab389419adc66a09233');
INSERT INTO `sys_file` VALUES (375, 'tb_image_share_1663031312560.jpg', 'jpg', 416, 'http://localhost:9090/file/cbdda617aa9b447e873e7acc40a1455f.jpg', 0, 1, 'eedfb665f3daa6f34ce87d7943a77652');
INSERT INTO `sys_file` VALUES (376, 'tb_image_share_1663031316115.jpg', 'jpg', 436, 'http://localhost:9090/file/da940d5327ee4097ba7a0f4674a46961.jpg', 0, 1, 'de61757fcdffc9b715b03f037de0caa9');
INSERT INTO `sys_file` VALUES (377, 'tb_image_share_1663031319156.jpg', 'jpg', 479, 'http://localhost:9090/file/607d794f5a2a432ba09640be15f531af.jpg', 0, 1, '8179cab9f24ef195b8444f5785698aaf');
INSERT INTO `sys_file` VALUES (378, 'tb_image_share_1663031319156.jpg', 'jpg', 479, 'http://localhost:9090/file/607d794f5a2a432ba09640be15f531af.jpg', 0, 1, '8179cab9f24ef195b8444f5785698aaf');
INSERT INTO `sys_file` VALUES (379, 'tb_image_share_1663031325054.jpg', 'jpg', 222, 'http://localhost:9090/file/a98a4d38c3a84baba825942f0af47632.jpg', 0, 1, '10cb11604b742db97eb1a472372a9060');
INSERT INTO `sys_file` VALUES (380, 'O6H0tPMvLMnVkXCNr80_227886960425_hd_hq.mp4', 'mp4', 6303, 'http://localhost:9090/file/eae05c8e361543198a6dfc59883ebf89.mp4', 0, 1, 'db8d439e049cb2a63552e128f9810480');
INSERT INTO `sys_file` VALUES (381, '1663033028240.jpg', 'jpg', 717, 'http://localhost:9090/file/afd8a2c73b16443bb4eadf1a2b5dc5ae.jpg', 0, 1, '83d00bbba2b7fe5db7543243f5de63f4');
INSERT INTO `sys_file` VALUES (382, '1663033063759.jpg', 'jpg', 595, 'http://localhost:9090/file/e1482fa6989a46d7b5d6c137ed1cfeab.jpg', 0, 1, 'b465ae78279c17ef14834851b28e0da9');
INSERT INTO `sys_file` VALUES (383, '1663033067311.jpg', 'jpg', 702, 'http://localhost:9090/file/20be0f8d90a74a0b94c989988a958259.jpg', 0, 1, '20c107794bd8a1271fdfe91eaa37f3e4');
INSERT INTO `sys_file` VALUES (384, 'tb_image_share_1662995389287.jpg', 'jpg', 328, 'http://localhost:9090/file/0706aa95655f4a669b23b26ed2a109f8.jpg', 0, 1, '2970668db0a8cc84434d6ba8c93a1800');
INSERT INTO `sys_file` VALUES (385, 'TITANS_20220913_094117.jpg', 'jpg', 216, 'http://localhost:9090/file/61e3d11a243142a3b560f3c97c403824.jpg', 0, 1, 'b14dae60093677f519f8d7ef846621b7');
INSERT INTO `sys_file` VALUES (386, 'TITANS_20220913_094120.jpg', 'jpg', 177, 'http://localhost:9090/file/a3ff3ebb95de43b2b66d80f616901a56.jpg', 0, 1, 'd3c458db50cdf66ef87f713278570b1d');
INSERT INTO `sys_file` VALUES (387, 'TITANS_20220913_094122.jpg', 'jpg', 89, 'http://localhost:9090/file/fc30c034043644339589a8f1de358ecb.jpg', 0, 1, '9746d0550d320ad81e8a6b52e6fa7486');
INSERT INTO `sys_file` VALUES (388, 'TITANS_20220913_094126.jpg', 'jpg', 140, 'http://localhost:9090/file/c7759a2f1f26498693f8cf294b2f39eb.jpg', 0, 1, 'dadcf87a5dbf20752f52f99ee95a6472');
INSERT INTO `sys_file` VALUES (389, 'TITANS_20220913_094129.jpg', 'jpg', 114, 'http://localhost:9090/file/9a911a7cad784cdbbdb274cd30185434.jpg', 0, 1, '010eec528b9cc247609cf3b7b2b40706');
INSERT INTO `sys_file` VALUES (390, 'dtvhlZ8jI4eca77Ux09_325084662348_mp4_264_hd.mp4', 'mp4', 4545, 'http://localhost:9090/file/151e915a61914e4293bb3a2ace3703cf.mp4', 0, 1, 'da5d82cdb014cac8e72721e389a64d78');
INSERT INTO `sys_file` VALUES (391, 'TITANS_20220913_094835.jpg', 'jpg', 168, 'http://localhost:9090/file/c0d1b8550bb84237acf31ebc20097cce.jpg', 0, 1, 'e3b95a3a9f813df1288d8d0ef51d3710');
INSERT INTO `sys_file` VALUES (392, 'TITANS_20220913_094838.jpg', 'jpg', 342, 'http://localhost:9090/file/af75489854b34bd3aac32b67bdfd5553.jpg', 0, 1, '1ba0da0b5c07783d8ff335e116835f18');
INSERT INTO `sys_file` VALUES (393, 'TITANS_20220913_094844.jpg', 'jpg', 240, 'http://localhost:9090/file/fc0bd9b43b634e65b3ae81057462b8a3.jpg', 0, 1, 'c8f99e55304f21ed774f6d50b71a56bd');
INSERT INTO `sys_file` VALUES (394, 'TITANS_20220913_094846.jpg', 'jpg', 160, 'http://localhost:9090/file/b046e12d374f40ad9ce359ade2f31cbd.jpg', 0, 1, '68be92585a859e16b4f333c2bfc065d2');
INSERT INTO `sys_file` VALUES (395, 'TITANS_20220913_094851.jpg', 'jpg', 229, 'http://localhost:9090/file/8da17583683e4ba58637227c3f8114ed.jpg', 0, 1, '7b0cc6ce307e23720570d02c205b5673');
INSERT INTO `sys_file` VALUES (396, 'TITANS_20220913_094854.jpg', 'jpg', 266, 'http://localhost:9090/file/b38e299a7d164c4db9d05905f53a74e5.jpg', 0, 1, 'd544e82d8bcf9691c846f8adf4900df2');
INSERT INTO `sys_file` VALUES (397, 'TITANS_20220913_094857.jpg', 'jpg', 205, 'http://localhost:9090/file/df23207629ec4598a117afe9c0d0111b.jpg', 0, 1, '60014ba49bc07d94c6251227fef3b141');
INSERT INTO `sys_file` VALUES (398, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (399, 'TITANS_20220913_095658.jpg', 'jpg', 140, 'http://localhost:9090/file/24601a2175f84b0b8fa055303299cfa2.jpg', 0, 1, '62d5e55deca0b92db6cee7d15c189bb0');
INSERT INTO `sys_file` VALUES (400, 'TITANS_20220913_095700.jpg', 'jpg', 114, 'http://localhost:9090/file/10a84d9fd56343a9ae6d7fa55eb95191.jpg', 0, 1, 'f9bd2320b3e794ec36c204d0f716133d');
INSERT INTO `sys_file` VALUES (401, 'TITANS_20220913_095702.jpg', 'jpg', 94, 'http://localhost:9090/file/e43ba9c95fbf48fca36eee4de6df0cc2.jpg', 0, 1, 'dfdfe7a5d32deb8fe2ba5e1db442f0c9');
INSERT INTO `sys_file` VALUES (402, 'TITANS_20220913_095705.jpg', 'jpg', 126, 'http://localhost:9090/file/3064ff6aa77d4c1aa2379f5cf37c287b.jpg', 0, 1, '9033d073d1a7bec434a3e10a3b9fabe1');
INSERT INTO `sys_file` VALUES (403, 'TITANS_20220913_095707.jpg', 'jpg', 92, 'http://localhost:9090/file/c1598c716acb4fc5aa3d11224d02547a.jpg', 0, 1, '8d2d05dd0785601f6e18153b45e36a73');
INSERT INTO `sys_file` VALUES (404, '20220715_c71dc21b0fac0789_369075674126_mp4_264_hd_taobao.mp4', 'mp4', 5963, 'http://localhost:9090/file/99151b627f0c42dc9c9af5722fc170ac.mp4', 0, 1, '06e0378d5594f94746cf90d08604aed8');
INSERT INTO `sys_file` VALUES (405, 'TITANS_20220913_100103.jpg', 'jpg', 340, 'http://localhost:9090/file/4eb5321e74a6427780c0ba0cee36434f.jpg', 0, 1, 'd3bab74a7f7e69444858e7192e217cbf');
INSERT INTO `sys_file` VALUES (406, 'TITANS_20220913_100106.jpg', 'jpg', 57, 'http://localhost:9090/file/ba5e25016c5c4a519f8c6f13d8dbeb4d.jpg', 0, 1, 'df1c41255aa44f1b2be076426f0ada2a');
INSERT INTO `sys_file` VALUES (407, 'TITANS_20220913_100108.jpg', 'jpg', 311, 'http://localhost:9090/file/6c0104b9c4c24cddbe6362164e2dea06.jpg', 0, 1, '1c7b1d68a9177fd0a39fe6d3f5a0ba29');
INSERT INTO `sys_file` VALUES (408, 'TITANS_20220913_100110.jpg', 'jpg', 206, 'http://localhost:9090/file/6bea3af558e64bd382eca0c06fceee6d.jpg', 0, 1, '4a1596f55a028ef9a2b1be133113a47d');
INSERT INTO `sys_file` VALUES (409, 'TITANS_20220913_100113.jpg', 'jpg', 343, 'http://localhost:9090/file/49399fb6aa7d47f2ab55edda2d4769e9.jpg', 0, 1, '46832ed5345837d4dbed0710d667af2c');
INSERT INTO `sys_file` VALUES (410, 'TITANS_20220913_100115.jpg', 'jpg', 346, 'http://localhost:9090/file/9b5e24a797664250b3313b9b2898604d.jpg', 0, 1, 'f4de8f17d3c0671015c7b68fe03e97f9');
INSERT INTO `sys_file` VALUES (411, 'TITANS_20220913_100117.jpg', 'jpg', 73, 'http://localhost:9090/file/f7feeecae1cf4db3983dc92344d9a8f3.jpg', 0, 1, 'eec336963e23d9a3aa3c88195701b238');
INSERT INTO `sys_file` VALUES (412, 'TITANS_20220913_100119.jpg', 'jpg', 524, 'http://localhost:9090/file/d0c4d4dab0b3476b80c28fc66791b0b0.jpg', 0, 1, 'b39a6a16710ab6013702a1cdd27883e6');
INSERT INTO `sys_file` VALUES (413, 'TITANS_20220913_100123.jpg', 'jpg', 77, 'http://localhost:9090/file/378adcde94f64d82ab284ef4bccbd1f9.jpg', 0, 1, '10b24a4beab6478bfa16489e0d99ea31');
INSERT INTO `sys_file` VALUES (414, 'TITANS_20220913_100121.jpg', 'jpg', 310, 'http://localhost:9090/file/fc13be9e565e4c918d4b664789e0480f.jpg', 0, 1, 'de08a566d8c79b393e3016f71439a6c8');
INSERT INTO `sys_file` VALUES (415, 'TITANS_20220913_100123.jpg', 'jpg', 77, 'http://localhost:9090/file/378adcde94f64d82ab284ef4bccbd1f9.jpg', 0, 1, '10b24a4beab6478bfa16489e0d99ea31');
INSERT INTO `sys_file` VALUES (416, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (417, 'TITANS_20220913_100619.jpg', 'jpg', 127, 'http://localhost:9090/file/4c575a5a87164c12b2778ada369af162.jpg', 0, 1, 'c1fa40636a7eb8595318d7fc374a6af9');
INSERT INTO `sys_file` VALUES (418, 'TITANS_20220913_100615.jpg', 'jpg', 161, 'http://localhost:9090/file/1dc5e436a15c4d9caf21f1278dffb557.jpg', 0, 1, '7688b91b83e4371eb7213264b0e80d70');
INSERT INTO `sys_file` VALUES (419, 'TITANS_20220913_100617.jpg', 'jpg', 170, 'http://localhost:9090/file/1052efff3aea4b079b8d9295d4efe154.jpg', 0, 1, 'a9abb9fd0e14027df05550435c75520f');
INSERT INTO `sys_file` VALUES (420, 'TITANS_20220913_100621.jpg', 'jpg', 185, 'http://localhost:9090/file/1f08bdc0a7114526810fdc00bf91958f.jpg', 0, 1, '9d57b3f19f199b1cc3fff9f5fd6daee7');
INSERT INTO `sys_file` VALUES (421, 'TITANS_20220913_100624.jpg', 'jpg', 164, 'http://localhost:9090/file/7f1a2c7c6c384de89a7031f13301ee4e.jpg', 0, 1, '674c435119f360c3409d974f6e8e261f');
INSERT INTO `sys_file` VALUES (422, '20220801_1a2f82cf1d5af483_370786129140_mp4_264_hd_taobao.mp4', 'mp4', 3156, 'http://localhost:9090/file/244ef2416d6e4508a5ff3216ce2a962c.mp4', 0, 1, '5b0c44955819b9142e0750df6ada7240');
INSERT INTO `sys_file` VALUES (423, 'TITANS_20220913_100645.jpg', 'jpg', 220, 'http://localhost:9090/file/ae256846d6e54d34934e3afc1c848396.jpg', 0, 1, 'ea3f5e834d4166c790d2eed578e139c4');
INSERT INTO `sys_file` VALUES (424, 'TITANS_20220913_100647.jpg', 'jpg', 212, 'http://localhost:9090/file/c6beab4b976842e091d6ed560abb213f.jpg', 0, 1, '6291d4b41b8b45d0204a812d7ec009da');
INSERT INTO `sys_file` VALUES (425, 'TITANS_20220913_100651.jpg', 'jpg', 203, 'http://localhost:9090/file/efb009b711c54a8796616ccbca7ada4f.jpg', 0, 1, 'a99cc4ad3da46aeb579da7edf78478f3');
INSERT INTO `sys_file` VALUES (426, 'TITANS_20220913_100653.jpg', 'jpg', 86, 'http://localhost:9090/file/dfe1a1b8c99543ee846527a0a73db512.jpg', 0, 1, 'bdfd2487743a8cc0928c9f387a621d2e');
INSERT INTO `sys_file` VALUES (427, 'TITANS_20220913_100655.jpg', 'jpg', 153, 'http://localhost:9090/file/2dc71c38588e45139816b7b1e09bbd5d.jpg', 0, 1, 'c9cec8cacae9c042ad680148169e77be');
INSERT INTO `sys_file` VALUES (428, 'TITANS_20220913_100702.jpg', 'jpg', 137, 'http://localhost:9090/file/22c6755399504e8f8662b58c0a53216e.jpg', 0, 1, 'ff4e86c18d2e4d4a850125f7b445f5ed');
INSERT INTO `sys_file` VALUES (429, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (430, 'TITANS_20220913_101707.jpg', 'jpg', 182, 'http://localhost:9090/file/916f4ab3434b45ab975f8acbffafb36f.jpg', 0, 1, '361b3c6b23370ad0b0e3b3f947bd647a');
INSERT INTO `sys_file` VALUES (431, 'TITANS_20220913_101703.jpg', 'jpg', 148, 'http://localhost:9090/file/303fc44f720044ea980ee75773268a2d.jpg', 0, 1, 'e1c2aa33fe84cfbe84b7bff7fe4395e9');
INSERT INTO `sys_file` VALUES (432, 'TITANS_20220913_101706.jpg', 'jpg', 166, 'http://localhost:9090/file/af72cf26c31d44d1bf5482e5013a0a14.jpg', 0, 1, 'c9abac455357296bbfff14a53bdba772');
INSERT INTO `sys_file` VALUES (433, 'TITANS_20220913_101709.jpg', 'jpg', 196, 'http://localhost:9090/file/9919e997c3b247e4bd9cb8d6ede42cf4.jpg', 0, 1, 'ea63760a9f67e50b3fa02ac7585ce75c');
INSERT INTO `sys_file` VALUES (434, 'TITANS_20220913_101711.jpg', 'jpg', 191, 'http://localhost:9090/file/0710d83bf4834c42b3cb673843350cb6.jpg', 0, 1, 'e055a16419dcfff35e523686e3724d14');
INSERT INTO `sys_file` VALUES (435, '20220815_892db2f795a9506e_372753805711_mp4_264_hd_taobao.mp4', 'mp4', 3084, 'http://localhost:9090/file/c8662fa8ae874d8db4fa04f466dbc3e7.mp4', 0, 1, '9fa835190b10c3a71cefcf1bf032c5d5');
INSERT INTO `sys_file` VALUES (436, 'TITANS_20220913_103207.jpg', 'jpg', 72, 'http://localhost:9090/file/b0d5a688cc8e40c9ab309e43c9dafba3.jpg', 0, 1, 'ffe8aa5eb4babde92405c8cb9152f078');
INSERT INTO `sys_file` VALUES (437, 'TITANS_20220913_103210.jpg', 'jpg', 93, 'http://localhost:9090/file/8bff025d9eaf43a8965a5e43079b6277.jpg', 0, 1, 'db4cdc81e897e9b85c4fa0c7ac98de3c');
INSERT INTO `sys_file` VALUES (438, 'TITANS_20220913_103212.jpg', 'jpg', 95, 'http://localhost:9090/file/411487622103487098ad9f525ed85d71.jpg', 0, 1, '76f237a4a29c0ac87f4a2ce61150b64f');
INSERT INTO `sys_file` VALUES (439, 'TITANS_20220913_103214.jpg', 'jpg', 85, 'http://localhost:9090/file/f2ee08b747e6487a8448ed885d1a8dcf.jpg', 0, 1, 'd3eddbec6a3c50d44d3c50b8a6f68864');
INSERT INTO `sys_file` VALUES (440, 'TITANS_20220913_103218.jpg', 'jpg', 78, 'http://localhost:9090/file/be050d69678543ccaa877ca728c31efd.jpg', 0, 1, '385fc50c665fbd2fc6ae1a1d1286542f');
INSERT INTO `sys_file` VALUES (441, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (442, 'TITANS_20220913_103714.jpg', 'jpg', 173, 'http://localhost:9090/file/613310fadc2f4359a4021022cb52ded5.jpg', 0, 1, '7f448f8f67f6bdbb6a31fb7b0ae7a654');
INSERT INTO `sys_file` VALUES (443, 'tb_image_share_1663036604092.jpg', 'jpg', 337, 'http://localhost:9090/file/37a64253155e400094b91e6e2e88591e.jpg', 0, 1, '8a6e1e6c0ec73a0d467d7be259a01ee8');
INSERT INTO `sys_file` VALUES (444, 'tb_image_share_1663036607463.jpg', 'jpg', 391, 'http://localhost:9090/file/b2532037a1d14624b12bc133fd02503c.jpg', 0, 1, '8762a86f6d552aaf087701ffb20b90a1');
INSERT INTO `sys_file` VALUES (445, 'tb_image_share_1663036610658.jpg', 'jpg', 489, 'http://localhost:9090/file/b037389581b8417bb0af626e7da1bd2d.jpg', 0, 1, 'a71a9e3a92a0517394a29f05f0301491');
INSERT INTO `sys_file` VALUES (446, 'tb_image_share_1663036613504.jpg', 'jpg', 235, 'http://localhost:9090/file/72a8f1296c7b402babce33cd45aa0204.jpg', 0, 1, '32b9d10f2832114993488dc9eaba7f72');
INSERT INTO `sys_file` VALUES (447, 'YZ0bsMYbzzZWGmK0QLF_321733410847_mp4_264_hd.mp4', 'mp4', 2168, 'http://localhost:9090/file/0a91a11410ad48fd9b60cb5ede0bb6cb.mp4', 0, 1, 'b165373ac896850f8b2bbfcdcf4c8bb7');
INSERT INTO `sys_file` VALUES (448, 'TITANS_20220913_104112.jpg', 'jpg', 72, 'http://localhost:9090/file/96663bdcbcbd45b6bb5562fae9ff4d9a.jpg', 0, 1, 'ce2398ee9df21b2b1e841aded7ca9e38');
INSERT INTO `sys_file` VALUES (449, 'TITANS_20220913_104115.jpg', 'jpg', 66, 'http://localhost:9090/file/d178f3cbea754297b0a0d4f367ddbd7b.jpg', 0, 1, '8c15e4364725fa42b3960df8c9bbd1dd');
INSERT INTO `sys_file` VALUES (450, 'TITANS_20220913_104117.jpg', 'jpg', 57, 'http://localhost:9090/file/01ef9d0b20bd4aacb9e2ea80a34a1e63.jpg', 0, 1, '781d081d1ca50ec172949df2ac0f1301');
INSERT INTO `sys_file` VALUES (451, 'TITANS_20220913_104120.jpg', 'jpg', 51, 'http://localhost:9090/file/b9b0384d19f8403985a986fd09823e48.jpg', 0, 1, 'c9ab0189ecb81a9c19ed9dc55cbfd7eb');
INSERT INTO `sys_file` VALUES (452, 'TITANS_20220913_104122.jpg', 'jpg', 76, 'http://localhost:9090/file/95f64acf72e04ee18fcd61aa32358409.jpg', 0, 1, '7c79141e7471da8b6a87542d9da8c7eb');
INSERT INTO `sys_file` VALUES (453, 'TITANS_20220913_104126.jpg', 'jpg', 62, 'http://localhost:9090/file/b6f562d62f3b4eaabba1bc9521afa0b1.jpg', 0, 1, 'b4b88dc2f18393c2eceed6a5ba52b35e');
INSERT INTO `sys_file` VALUES (454, 'TITANS_20220913_104128.jpg', 'jpg', 70, 'http://localhost:9090/file/1e70b61c706b4e7b9450c321bfa92b63.jpg', 0, 1, 'a955b9e535b50babcc9ec3642cd3e4dd');
INSERT INTO `sys_file` VALUES (455, 'TITANS_20220913_104132.jpg', 'jpg', 71, 'http://localhost:9090/file/25fbbd403ed2446aab42ca399f2cceab.jpg', 0, 1, '496c5877804d217654fa8ffae0209af8');
INSERT INTO `sys_file` VALUES (456, 'TITANS_20220913_104134.jpg', 'jpg', 106, 'http://localhost:9090/file/1a13879a419c4720894d79681a34f691.jpg', 0, 1, '3d2e50fd445603307974fe0d62366b5b');
INSERT INTO `sys_file` VALUES (457, 'TITANS_20220913_104137.jpg', 'jpg', 53, 'http://localhost:9090/file/4b249c987eb04be2be5a4bc695a4f9d9.jpg', 0, 1, '1869478d209f9c3a9e1c9debb0cbb946');
INSERT INTO `sys_file` VALUES (458, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (459, 'tb_image_share_1663037228670.jpg', 'jpg', 714, 'http://localhost:9090/file/8256ad95d5484a33bdad03b9fc9a1a3d.jpg', 0, 1, 'e9fadf65906e6da4b10ae48b91bc07e2');
INSERT INTO `sys_file` VALUES (460, 'tb_image_share_1663037233062.jpg', 'jpg', 286, 'http://localhost:9090/file/7a69ff22f294410aa5375289c2d62f35.jpg', 0, 1, '4850fcf2b4b6cf55dfae635456f6d6a8');
INSERT INTO `sys_file` VALUES (461, 'tb_image_share_1663037239978.jpg', 'jpg', 442, 'http://localhost:9090/file/62c3c9fc5ac140d0aac1dd20d423f73b.jpg', 0, 1, '5d94276254e591a02093ee225cc6f286');
INSERT INTO `sys_file` VALUES (462, 'tb_image_share_1663037243278.jpg', 'jpg', 435, 'http://localhost:9090/file/9f9c9b2dc1514e9e8d15266f09d9813e.jpg', 0, 1, '669c60371628a5e25c777f77727118a9');
INSERT INTO `sys_file` VALUES (463, 'tb_image_share_1663037246793.jpg', 'jpg', 345, 'http://localhost:9090/file/772db13859d443d2803a8196ce6a933f.jpg', 0, 1, '0748227be7853ec54d1d4ea748f948d8');
INSERT INTO `sys_file` VALUES (464, '80mmRopKfFm44mUViDm_248510259225_hd_append.mp4', 'mp4', 8547, 'http://localhost:9090/file/0752f559d22348f9a3e21b7e7e250bff.mp4', 0, 1, '7b7e7df234d3767cdf6ca6a3905ad6aa');
INSERT INTO `sys_file` VALUES (465, 'tb_image_share_1663037651926.jpg', 'jpg', 312, 'http://localhost:9090/file/e12091fe088245d8aa2a85141fcbfbd3.jpg', 0, 1, 'fdb0b19b15ae3df4ab51aea46b561127');
INSERT INTO `sys_file` VALUES (466, 'tb_image_share_1663037657845.jpg', 'jpg', 1056, 'http://localhost:9090/file/7aef25dfe5c94ff59d0c488a61810fc0.jpg', 0, 1, 'adc468c7c72c74c93b314505ef742094');
INSERT INTO `sys_file` VALUES (467, 'tb_image_share_1663037663224.jpg', 'jpg', 346, 'http://localhost:9090/file/ece62f15ba6d4c4391b46466d68fc74a.jpg', 0, 1, 'd3eaf862d74107dedaca6e6da4498fe3');
INSERT INTO `sys_file` VALUES (468, 'tb_image_share_1663037667842.jpg', 'jpg', 1335, 'http://localhost:9090/file/4dea9afb4b0a43fdbf6d557e039b71a2.jpg', 0, 1, '7dd145a5eb73b999481a1fd2f9760467');
INSERT INTO `sys_file` VALUES (469, 'tb_image_share_1663037672380.jpg', 'jpg', 457, 'http://localhost:9090/file/a19ebb3c6c1049379ada10734958abf9.jpg', 0, 1, '87649206e7b5ab43fa4acfa3d7fc248d');
INSERT INTO `sys_file` VALUES (470, 'tb_image_share_1663037677306.jpg', 'jpg', 300, 'http://localhost:9090/file/1a2bfe728e26451a8b4877f5e9ad606e.jpg', 0, 1, 'e551715e52a4501c7d860f0f65a45fc4');
INSERT INTO `sys_file` VALUES (471, 'tb_image_share_1663037682599.jpg', 'jpg', 423, 'http://localhost:9090/file/21ffe10d114e44868d14fda781d731f6.jpg', 0, 1, '663c6658e22059488646a0774abf65a4');
INSERT INTO `sys_file` VALUES (472, 'tb_image_share_1663037687604.jpg', 'jpg', 359, 'http://localhost:9090/file/6dc6efcbfd1847588cee8bfb3ea41957.jpg', 0, 1, '01d3dacfe0eab668fdac0dfd9ffa1421');
INSERT INTO `sys_file` VALUES (473, 'tb_image_share_1663037693302.jpg', 'jpg', 553, 'http://localhost:9090/file/12258babe3f340d5abdf5f17e2b49db6.jpg', 0, 1, 'e132206d6e5386ba4bf644bf2673afdc');
INSERT INTO `sys_file` VALUES (474, 'tb_image_share_1662995389287.jpg', 'jpg', 328, 'http://localhost:9090/file/0706aa95655f4a669b23b26ed2a109f8.jpg', 0, 1, '2970668db0a8cc84434d6ba8c93a1800');
INSERT INTO `sys_file` VALUES (475, 'tb_image_share_1663040014039.jpg', 'jpg', 428, 'http://localhost:9090/file/972e1cf5ec3a4ed090bccd67d5f4d3b6.jpg', 0, 1, '68fda5c2a79459d0e8e0bcf083cfd36b');
INSERT INTO `sys_file` VALUES (476, 'tb_image_share_1663040017318.jpg', 'jpg', 344, 'http://localhost:9090/file/4a4fd73698084aef8cf05e77ab4501a2.jpg', 0, 1, '276e862703f846e46655337a005f3762');
INSERT INTO `sys_file` VALUES (477, 'tb_image_share_1663040020478.jpg', 'jpg', 418, 'http://localhost:9090/file/009dc591d3184403b204ce4522e16df9.jpg', 0, 1, '667f4bc158fe08b200ba814444fc01db');
INSERT INTO `sys_file` VALUES (478, 'tb_image_share_1663040023330.jpg', 'jpg', 491, 'http://localhost:9090/file/acf3e02e8fed4fdfbab3c143081d6c30.jpg', 0, 1, '089afc70cf3a27ebee5bb97d8bccd100');
INSERT INTO `sys_file` VALUES (479, 'tb_image_share_1663040026000.jpg', 'jpg', 268, 'http://localhost:9090/file/cefbae75a6fb4599b5f4f7a435042eee.jpg', 0, 1, '98a3a767b6b4f31fd09b26e17effac6e');
INSERT INTO `sys_file` VALUES (480, '20220801_57b24027ad32cbfc_370300448215_mp4_264_hd_taobao.mp4', 'mp4', 4750, 'http://localhost:9090/file/acf8fece0808491b9507219711c0cbc7.mp4', 0, 1, '6fa1e479269dfbe34e1756bae5e5b789');
INSERT INTO `sys_file` VALUES (481, 'tb_image_share_1663040634122.jpg', 'jpg', 420, 'http://localhost:9090/file/72069ef326184a759116c9fbcbd80b70.jpg', 0, 1, 'ab69eb29d334756ad2cc4283e610fee9');
INSERT INTO `sys_file` VALUES (482, 'tb_image_share_1663040474408.jpg', 'jpg', 139, 'http://localhost:9090/file/4f84d190eff24d0fb8342994a2e78770.jpg', 0, 1, 'db33152ff5b75e4b8222b43f085ff6d1');
INSERT INTO `sys_file` VALUES (483, 'tb_image_share_1663040482313.jpg', 'jpg', 917, 'http://localhost:9090/file/7be0b657ffa1423fa90a9ccd6a2c9797.jpg', 0, 1, '4555662eb5a1869e3ba5d24365c575e9');
INSERT INTO `sys_file` VALUES (484, 'tb_image_share_1663040487639.jpg', 'jpg', 554, 'http://localhost:9090/file/6f61d0d2f234439ebc55cd3ecebd725b.jpg', 0, 1, '4474e3d5f44fef0f9f5d48b7775266e5');
INSERT INTO `sys_file` VALUES (485, 'tb_image_share_1663040492868.jpg', 'jpg', 846, 'http://localhost:9090/file/c0b199d74161418cb73cfce6d4f6aa5e.jpg', 0, 1, 'eff90a6774a9ab2c68e437e91754dfa0');
INSERT INTO `sys_file` VALUES (486, 'tb_image_share_1663040503436.jpg', 'jpg', 445, 'http://localhost:9090/file/d972bfe5e93545e7974740d52b46db4e.jpg', 0, 1, '60c05a4d5aaac2ce3f9b23174c1c020d');
INSERT INTO `sys_file` VALUES (487, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (488, 'tb_image_share_1663041034842.jpg', 'jpg', 384, 'http://localhost:9090/file/945eacbb9793451ebe23584b4234bb2c.jpg', 0, 1, '3f70939dfc6718acab1220a41e777f48');
INSERT INTO `sys_file` VALUES (489, 'tb_image_share_1663041038834.jpg', 'jpg', 493, 'http://localhost:9090/file/28a03ea3118e4adaa359c3330ec4c6fd.jpg', 0, 1, 'd996efe46bfdaa20bc6459dcb1b98e8f');
INSERT INTO `sys_file` VALUES (490, 'tb_image_share_1663041041477.jpg', 'jpg', 471, 'http://localhost:9090/file/1e503de02e1246b1a47bbcdb4eadf19c.jpg', 0, 1, '0d4465a3813d0b761431f958c6f0d467');
INSERT INTO `sys_file` VALUES (491, 'tb_image_share_1663041043970.jpg', 'jpg', 471, 'http://localhost:9090/file/bfa406b7583a4fd7924e6f7387903242.jpg', 0, 1, 'd8a61764168934b9d41389c246f00ed1');
INSERT INTO `sys_file` VALUES (492, 'tb_image_share_1663041046495.jpg', 'jpg', 333, 'http://localhost:9090/file/4fdc89658ee241dca0b652a1144e3c64.jpg', 0, 1, '7359c8082376e479b30edcbb244f2daf');
INSERT INTO `sys_file` VALUES (493, 'LG5kXzc0sp6WXTulR3e_316500370637_mp4_264_hd.mp4', 'mp4', 9300, 'http://localhost:9090/file/ead630d9803e4b2b99e4a7c1d7813f8a.mp4', 0, 1, 'db3441147421d023171e97a428817017');
INSERT INTO `sys_file` VALUES (494, 'tb_image_share_1663043120621.jpg', 'jpg', 364, 'http://localhost:9090/file/55c7698499df4bb4bb696ff0bc123877.jpg', 0, 1, '2b803eb557b160799bd786900f411651');
INSERT INTO `sys_file` VALUES (495, 'tb_image_share_1663043335526.jpg', 'jpg', 1071, 'http://localhost:9090/file/1e3e5a33f1ab4d65b4f93842668feb53.jpg', 0, 1, 'f2fcf3dc4f1b3d1d7d554b695b813b2a');
INSERT INTO `sys_file` VALUES (496, 'tb_image_share_1663043120621.jpg', 'jpg', 364, 'http://localhost:9090/file/55c7698499df4bb4bb696ff0bc123877.jpg', 0, 1, '2b803eb557b160799bd786900f411651');
INSERT INTO `sys_file` VALUES (497, 'tb_image_share_1663043125136.jpg', 'jpg', 842, 'http://localhost:9090/file/ce9816fd3c024aa2b0b1d01171f5e70b.jpg', 0, 1, 'e7a9eabe22f845884aa4552948dca30d');
INSERT INTO `sys_file` VALUES (498, 'tb_image_share_1663043134752.jpg', 'jpg', 881, 'http://localhost:9090/file/d74964ec180e49738a036d757513416a.jpg', 0, 1, '78e5baf7afdc10adf2a8000d76013011');
INSERT INTO `sys_file` VALUES (499, 'tb_image_share_1663043139743.jpg', 'jpg', 327, 'http://localhost:9090/file/971d64a9a7d24a989866390b1e701ce7.jpg', 0, 1, 'b16c922eb903e0c8fe4392847987b6d8');
INSERT INTO `sys_file` VALUES (500, 'tb_image_share_1663043144256.jpg', 'jpg', 1163, 'http://localhost:9090/file/983fa2a19f5f4cf9805056bc575ad923.jpg', 0, 1, 'c3db391429e0ef7359b8f7009d8ea482');
INSERT INTO `sys_file` VALUES (501, 'tb_image_share_1663043163875.jpg', 'jpg', 354, 'http://localhost:9090/file/2bc8f124c757459cb95f1d226512c911.jpg', 0, 1, '608acfee2a58a8a48e0ae1488de003cf');
INSERT INTO `sys_file` VALUES (502, 'tb_image_share_1663043167733.jpg', 'jpg', 673, 'http://localhost:9090/file/6f289058e8e749ce8b812f405219397f.jpg', 0, 1, 'c191e4366fd31ca05734b89f486a2295');
INSERT INTO `sys_file` VALUES (503, 'tb_image_share_1663043171633.jpg', 'jpg', 333, 'http://localhost:9090/file/578908b03e2e46759b531df5896ef227.jpg', 0, 1, '44b630271447815db19b1f41fb1823cd');
INSERT INTO `sys_file` VALUES (504, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (505, 'tb_image_share_1663043574203.jpg', 'jpg', 339, 'http://localhost:9090/file/22d105d5d4e14926a386ebd7f22ae34d.jpg', 0, 1, 'd8e2824d93f3a2a6836cacaae0c7b32a');
INSERT INTO `sys_file` VALUES (506, 'tb_image_share_1663043569146.jpg', 'jpg', 393, 'http://localhost:9090/file/2050d13548ff45a69c924903c1f6ae65.jpg', 0, 1, '2f82849b6accb5d09a36e5ff6de12c44');
INSERT INTO `sys_file` VALUES (507, 'tb_image_share_1663043571822.jpg', 'jpg', 173, 'http://localhost:9090/file/4bcf59abca5e4ad09a51d8bf5f754d3c.jpg', 0, 1, 'aa30c80a692564f72cf21977e5be9262');
INSERT INTO `sys_file` VALUES (508, 'tb_image_share_1663043576588.jpg', 'jpg', 239, 'http://localhost:9090/file/f54fc21b966e46d8ae3ef52014adc7f8.jpg', 0, 1, 'e6fb0ee249dea528b63b622fd94bd68c');
INSERT INTO `sys_file` VALUES (509, 'tb_image_share_1663043579091.jpg', 'jpg', 329, 'http://localhost:9090/file/2e55debd46db4a0d884d336ac0135a0e.jpg', 0, 1, '81acb28886618c1524f3dcb9a33b738e');
INSERT INTO `sys_file` VALUES (510, 'zQ2IhSR2ve3cFUCq056_217667601404_hd_hq.mp4', 'mp4', 4764, 'http://localhost:9090/file/1310c9b473e8458abb42867d00373c42.mp4', 0, 1, '4a7822c665f9c16fce8fb8e4f234795c');
INSERT INTO `sys_file` VALUES (511, 'tb_image_share_1663043955499.jpg', 'jpg', 1140, 'http://localhost:9090/file/6b925fc013b1442aacc31c4442759e46.jpg', 0, 1, 'a805e947265912e8d6e559969b1d7d26');
INSERT INTO `sys_file` VALUES (512, 'tb_image_share_1663043962286.jpg', 'jpg', 703, 'http://localhost:9090/file/9f81bf5ceaf440ac8116009100c0333b.jpg', 0, 1, 'a6812a236b533c7f0494081648454370');
INSERT INTO `sys_file` VALUES (513, 'tb_image_share_1663043976802.jpg', 'jpg', 454, 'http://localhost:9090/file/1a408d252f8f4853b1375161d724cead.jpg', 0, 1, 'ba10231fdff6ac73bf3f3a3293cf4195');
INSERT INTO `sys_file` VALUES (514, 'tb_image_share_1663043980695.jpg', 'jpg', 1149, 'http://localhost:9090/file/4b9ba10dfe494e23a5dde8266fd7136f.jpg', 0, 1, '062181633d3900a5ef4e2518a8174134');
INSERT INTO `sys_file` VALUES (515, 'tb_image_share_1663043985760.jpg', 'jpg', 875, 'http://localhost:9090/file/b6f34dc530584e1791ca8e7d84ec6b54.jpg', 0, 1, 'f090c565c98eb72eb866c1e01a7c2dcd');
INSERT INTO `sys_file` VALUES (516, 'tb_image_share_1663043990094.jpg', 'jpg', 840, 'http://localhost:9090/file/e839b1642d8243fc8408b7c4e2a16fe7.jpg', 0, 1, 'a9bdf0d8178160b310050de2fbb6dd92');
INSERT INTO `sys_file` VALUES (517, 'tb_image_share_1663043995640.jpg', 'jpg', 337, 'http://localhost:9090/file/939da1070b814eb0ba7f259111748e89.jpg', 0, 1, 'fdd07709ec7b749cc919e33d392dc231');
INSERT INTO `sys_file` VALUES (518, 'tb_image_share_1663044001392.jpg', 'jpg', 883, 'http://localhost:9090/file/0de51df42b21475187b4908b78d064cc.jpg', 0, 1, '01803f73cf7da4a8f4aad39044ea1062');
INSERT INTO `sys_file` VALUES (519, 'tb_image_share_1663044007271.jpg', 'jpg', 966, 'http://localhost:9090/file/6638f224ffc44894a3bf3eed629d9b31.jpg', 0, 1, 'f168aff6662e37bdd50b927c662e6661');
INSERT INTO `sys_file` VALUES (520, 'tb_image_share_1663044012550.jpg', 'jpg', 597, 'http://localhost:9090/file/d62a00705453431f85a51de0883855b6.jpg', 0, 1, '4040a1c7f0c0387e1031cd412cb74129');
INSERT INTO `sys_file` VALUES (521, 'tb_image_share_1663044047492.jpg', 'jpg', 492, 'http://localhost:9090/file/e9cb8966dbdb4593861e5e937b27cbd5.jpg', 0, 1, '0c79051f8887f23bb56adfd6c271cfce');
INSERT INTO `sys_file` VALUES (522, 'tb_image_share_1663044056917.jpg', 'jpg', 741, 'http://localhost:9090/file/e4dab48f7fb14488bb8d9b7f8794293b.jpg', 0, 1, '52914cc1f1f810a971cfa8cb7e735768');
INSERT INTO `sys_file` VALUES (523, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (524, 'tb_image_share_1663044470069.jpg', 'jpg', 530, 'http://localhost:9090/file/e40e08dab1ae4567b92eafd2dbd58be5.jpg', 0, 1, '85c13fd7b6de741fe10ffe8f1b3c0c56');
INSERT INTO `sys_file` VALUES (525, 'tb_image_share_1663044473134.jpg', 'jpg', 347, 'http://localhost:9090/file/47ad34a01d454a06aeef1f2f9d83b9d4.jpg', 0, 1, 'bc4d5989ea616c65a23adf276fb19679');
INSERT INTO `sys_file` VALUES (526, 'tb_image_share_1663044475887.jpg', 'jpg', 359, 'http://localhost:9090/file/94ce01aecdc34c67a92733218b9b28cf.jpg', 0, 1, '0bacbd492d5651d54b3b616597863b94');
INSERT INTO `sys_file` VALUES (527, 'tb_image_share_1663044478427.jpg', 'jpg', 414, 'http://localhost:9090/file/d53c50bd01a042fcbb8e78b09eca70b2.jpg', 0, 1, '2783a16e0899bf0bc12debf00c7769e5');
INSERT INTO `sys_file` VALUES (528, 'tb_image_share_1663044481369.jpg', 'jpg', 305, 'http://localhost:9090/file/b65b0ae169aa4b23a44716b50841861b.jpg', 0, 1, 'd23b1269efcfd110b2b69d8b1741c433');
INSERT INTO `sys_file` VALUES (529, 'AA1F7B5EEF294241884156B8C2CF61A3.mp4_330562393216_mp4_264_hd.aliyun.mp4', 'mp4', 24944, 'http://localhost:9090/file/a38012a2cda94d78bc1feea002d82455.mp4', 0, 1, '83b2ec4df05a2963ac8ae59c9f29d43e');
INSERT INTO `sys_file` VALUES (530, '1663044877667.jpg', 'jpg', 790, 'http://localhost:9090/file/05456f058be34568ac5921394a9b8003.jpg', 0, 1, '5ba4c19a76a1d2fef1e5d688dcd459de');
INSERT INTO `sys_file` VALUES (531, '1663044885920.jpg', 'jpg', 3662, 'http://localhost:9090/file/6c280fb5e8bb4324a26fae5035a01152.jpg', 0, 1, '524a648a86635f79dab4c76f058d694d');
INSERT INTO `sys_file` VALUES (532, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (533, 'tb_image_share_1663052979271.jpg', 'jpg', 364, 'http://localhost:9090/file/7bbd26adc959469c8728f0163a37db9f.jpg', 0, 1, 'd802d39c7ef6d9e42c0463456de26dce');
INSERT INTO `sys_file` VALUES (534, 'tb_image_share_1663052981947.jpg', 'jpg', 232, 'http://localhost:9090/file/80a50d9b116d46cca52534246b13b8b4.jpg', 0, 1, 'cb9816e9923023a3da4995eadff61ba2');
INSERT INTO `sys_file` VALUES (535, 'tb_image_share_1663052976579.jpg', 'jpg', 320, 'http://localhost:9090/file/18f6571f3f034ed8893f4db9f5cd5bc6.jpg', 0, 1, '6ce8abb5e0bc12dbe5c553642ccdbf59');
INSERT INTO `sys_file` VALUES (536, 'tb_image_share_1663053057214.jpg', 'jpg', 268, 'http://localhost:9090/file/9ecf806b345d48db8123806b98038996.jpg', 0, 1, '7127675f50cb5e216dc4b3b5e52078b0');
INSERT INTO `sys_file` VALUES (537, 'tb_image_share_1663052973585.jpg', 'jpg', 232, 'http://localhost:9090/file/80a50d9b116d46cca52534246b13b8b4.jpg', 0, 1, 'cb9816e9923023a3da4995eadff61ba2');
INSERT INTO `sys_file` VALUES (538, 'tb_image_share_1663052981947.jpg', 'jpg', 232, 'http://localhost:9090/file/80a50d9b116d46cca52534246b13b8b4.jpg', 0, 1, 'cb9816e9923023a3da4995eadff61ba2');
INSERT INTO `sys_file` VALUES (539, '6c4b60d5e4b02849.mp4_326846746027_mp4_264_hd.mp4', 'mp4', 5067, 'http://localhost:9090/file/bda77c671bac47dfbe20686722849e38.mp4', 0, 1, '1e9da65f31cf51f1ec6639fc85d2703d');
INSERT INTO `sys_file` VALUES (540, 'tb_image_share_1663053841410.jpg', 'jpg', 532, 'http://localhost:9090/file/50148d0559b8464c81694c418a68c310.jpg', 0, 1, 'b1ae3312f987f38ae9e8184ee1ee8664');
INSERT INTO `sys_file` VALUES (541, 'tb_image_share_1663053845337.jpg', 'jpg', 495, 'http://localhost:9090/file/fc3d3cc6718b4416bc9c47af74789a9c.jpg', 0, 1, '6cb940ccdcc1902f3c06860a31458f3e');
INSERT INTO `sys_file` VALUES (542, 'tb_image_share_1663053850363.jpg', 'jpg', 1101, 'http://localhost:9090/file/9bd4a4d7716542b197b5080318a73de0.jpg', 0, 1, '65177025987b85a2ac80d25d36e4529a');
INSERT INTO `sys_file` VALUES (543, 'tb_image_share_1663053857456.jpg', 'jpg', 120, 'http://localhost:9090/file/10981352b19b4279a758a970d7c3e1a5.jpg', 0, 1, '577c8aae153919bec130baa840f7f16a');
INSERT INTO `sys_file` VALUES (544, 'tb_image_share_1663053860966.jpg', 'jpg', 396, 'http://localhost:9090/file/ecf832bf079041a08246484236486001.jpg', 0, 1, 'ef1eef4ab3df8cea187acd1594f852cb');
INSERT INTO `sys_file` VALUES (545, 'tb_image_share_1663053867639.jpg', 'jpg', 288, 'http://localhost:9090/file/743deffa9a2d498da57fa938190b01d9.jpg', 0, 1, '4dbc638445a61e617670706d7030120d');
INSERT INTO `sys_file` VALUES (546, 'tb_image_share_1663053871749.jpg', 'jpg', 1153, 'http://localhost:9090/file/b018fa1802a446f0aa405213230a1436.jpg', 0, 1, 'fee4849ac334d7ed5b7c83c1fced39fc');
INSERT INTO `sys_file` VALUES (547, 'tb_image_share_1663053877254.jpg', 'jpg', 435, 'http://localhost:9090/file/eae32c09be774cde92a773e8ce69191a.jpg', 0, 1, 'b1d9843dfb07697e52c7d139b464a983');
INSERT INTO `sys_file` VALUES (548, 'tb_image_share_1663053888694.jpg', 'jpg', 159, 'http://localhost:9090/file/8844bfd2840449d28eceee4248516a4d.jpg', 0, 1, 'c21cd7f6f2aa64a891cba44618236265');
INSERT INTO `sys_file` VALUES (549, 'tb_image_share_1663053897166.jpg', 'jpg', 90, 'http://localhost:9090/file/75ca7127b7b541e2b80b88afd2124bd5.jpg', 0, 1, '72797efc798d86ec2390a32b4ded4515');
INSERT INTO `sys_file` VALUES (550, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (551, 'tb_image_share_1663054209055.jpg', 'jpg', 278, 'http://localhost:9090/file/68245f780129427b8c4a0156d7725173.jpg', 0, 1, '9418ae1f6b0fd72d4708fee2446bda97');
INSERT INTO `sys_file` VALUES (552, 'tb_image_share_1663054203572.jpg', 'jpg', 417, 'http://localhost:9090/file/33d0f9d554ac4bb990304d2e26a3eb30.jpg', 0, 1, '82f04c830db61e6e68d8f492d9380ea3');
INSERT INTO `sys_file` VALUES (553, 'tb_image_share_1663054206605.jpg', 'jpg', 478, 'http://localhost:9090/file/343da0aea5bb48d3ae449ceef7883e2a.jpg', 0, 1, '986e130697dfbb2e95e75fd13d7ba9fb');
INSERT INTO `sys_file` VALUES (554, 'tb_image_share_1663054211534.jpg', 'jpg', 360, 'http://localhost:9090/file/e01315e060f0439bbd26cca305ec7986.jpg', 0, 1, 'b5f7fd997bb892a5424e26abe23757d4');
INSERT INTO `sys_file` VALUES (555, 'tb_image_share_1663054214023.jpg', 'jpg', 203, 'http://localhost:9090/file/08e28628968c44108072e8223ea2b4e6.jpg', 0, 1, 'abd054bf3fdfac60b986023153bda9ef');
INSERT INTO `sys_file` VALUES (556, '20220906_650a91fb902b407b_375217284461_mp4_264_hd_taobao.mp4', 'mp4', 4486, 'http://localhost:9090/file/ee18e83fa3544af1804d8fd205ca9dd9.mp4', 0, 1, '3cbcfc999b13d6f5b0dd1fd7eeccc8d5');
INSERT INTO `sys_file` VALUES (557, '1663054612120.jpg', 'jpg', 381, 'http://localhost:9090/file/f84228143a4a4b8789a16308c7444a09.jpg', 0, 1, 'a9741d4e08b4d24230d3971a2a003162');
INSERT INTO `sys_file` VALUES (558, '1663054554826.jpg', 'jpg', 511, 'http://localhost:9090/file/d644588a8fab4e45bd33a85139c420dd.jpg', 0, 1, '6fc392fc0d9872445ba9853fe7d7adf0');
INSERT INTO `sys_file` VALUES (559, '1663054571701.jpg', 'jpg', 391, 'http://localhost:9090/file/3108031837b34262b68ce01f2b93415e.jpg', 0, 1, '365c414f36598e32adb4da123da2c3d1');
INSERT INTO `sys_file` VALUES (560, '1663054591599.jpg', 'jpg', 418, 'http://localhost:9090/file/70122d5160984996842f6aa956fc083c.jpg', 0, 1, 'f181a8515b31176a6b155b0ef41b1893');
INSERT INTO `sys_file` VALUES (561, '1663054602695.jpg', 'jpg', 445, 'http://localhost:9090/file/49815824fb9d464194f7b8f5e40435e9.jpg', 0, 1, '6249fb8a1d5087c8b4dfde5b2a491b4f');
INSERT INTO `sys_file` VALUES (562, '1663054612120.jpg', 'jpg', 381, 'http://localhost:9090/file/f84228143a4a4b8789a16308c7444a09.jpg', 0, 1, 'a9741d4e08b4d24230d3971a2a003162');
INSERT INTO `sys_file` VALUES (563, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (564, 'tb_image_share_1663054977688.jpg', 'jpg', 140, 'http://localhost:9090/file/0310d31a3edb410a8fb0b47f976207ab.jpg', 0, 1, '60803c335991d9038e1cfdbb68369aae');
INSERT INTO `sys_file` VALUES (565, 'tb_image_share_1663054980846.jpg', 'jpg', 263, 'http://localhost:9090/file/7ca0f9d47fa848dab03dd5952f3aabc9.jpg', 0, 1, '1d739af2a95eaa25a0043487c72b0ffd');
INSERT INTO `sys_file` VALUES (566, 'tb_image_share_1663054983596.jpg', 'jpg', 341, 'http://localhost:9090/file/e1a31aa0ad494227bc00708df19ea198.jpg', 0, 1, '988163cfdf7bbd508e051d99df200cc2');
INSERT INTO `sys_file` VALUES (567, 'tb_image_share_1663054986130.jpg', 'jpg', 433, 'http://localhost:9090/file/6cdd082980034346acdc00bea86e9633.jpg', 0, 1, '14b3dccd5cfc972ed478e7c182793f48');
INSERT INTO `sys_file` VALUES (568, 'tb_image_share_1663054988558.jpg', 'jpg', 59, 'http://localhost:9090/file/de5cf7b296014b528141c36b9e94f6b0.jpg', 0, 1, '533d8b0081dd8144f7f79f6d427b2a1b');
INSERT INTO `sys_file` VALUES (569, 'tb_image_share_1663055057786.jpg', 'jpg', 1033, 'http://localhost:9090/file/a6c27381688d4affa927105cf43056c0.jpg', 0, 1, 'f7398237a1854fac10391f0c93e07f7c');
INSERT INTO `sys_file` VALUES (570, 'tb_image_share_1663055067602.jpg', 'jpg', 890, 'http://localhost:9090/file/89bef5a0ff384702a9b1c8c5cb2551dc.jpg', 0, 1, '2b7ca61e41b31ac17db452856299dfb5');
INSERT INTO `sys_file` VALUES (571, 'tb_image_share_1663055077252.jpg', 'jpg', 620, 'http://localhost:9090/file/391bae60913e47ecb41bf2b717f436f7.jpg', 0, 1, '6627b8ee678383fe6e0d4a174c8b92e6');
INSERT INTO `sys_file` VALUES (572, 'tb_image_share_1663055084842.jpg', 'jpg', 281, 'http://localhost:9090/file/b1c201b4068a43db8e7276600a2e1fc4.jpg', 0, 1, '97b3a805dec48ad96df3ecd48b4d206f');
INSERT INTO `sys_file` VALUES (573, 'qq_pic_merged_1662986063363.jpg', 'jpg', 46, 'http://localhost:9090/file/8b57234f87db44b4899defe913a547e7.jpg', 0, 1, '1020513e883c90a9af6f95961e9d905a');
INSERT INTO `sys_file` VALUES (574, 'tb_image_share_1663057277691.jpg', 'jpg', 304, 'http://localhost:9090/file/7261749276fa4b7988743db04c399500.jpg', 0, 1, 'edbcbcf442657b3b61672ec9a56508e1');
INSERT INTO `sys_file` VALUES (575, 'tb_image_share_1663057283033.jpg', 'jpg', 319, 'http://localhost:9090/file/550ea7c1c0b84fb183144844d20d7336.jpg', 0, 1, 'ced8744cae84e60db467803dd47a25b4');
INSERT INTO `sys_file` VALUES (576, 'tb_image_share_1663057285423.jpg', 'jpg', 287, 'http://localhost:9090/file/3c97da97fcf440b4a555baf4af153a8d.jpg', 0, 1, '9878146d6131eb2bf590b95a062f152b');
INSERT INTO `sys_file` VALUES (577, 'tb_image_share_1663057287858.jpg', 'jpg', 204, 'http://localhost:9090/file/72769e59cf0540af93c374af68daa747.jpg', 0, 1, '4b9df97726d04cba40a39cfdb2669479');
INSERT INTO `sys_file` VALUES (578, 'tb_image_share_1663057290296.jpg', 'jpg', 155, 'http://localhost:9090/file/b9f2f472b44541d9b045ceacce55d7b9.jpg', 0, 1, '108e0e626c66e93ab0f74d6ba040e6d4');
INSERT INTO `sys_file` VALUES (579, 'tb_image_share_1663057329774.jpg', 'jpg', 471, 'http://localhost:9090/file/696385567c314a0396091458ee6292dd.jpg', 0, 1, 'e92d446d940375464f82d271df1809ee');
INSERT INTO `sys_file` VALUES (580, 'tb_image_share_1663057336340.jpg', 'jpg', 519, 'http://localhost:9090/file/abf0d07e5f174a75a9b71fe513456cc6.jpg', 0, 1, 'a16cff3aaff38e13cedc9320ade935c3');
INSERT INTO `sys_file` VALUES (581, 'tb_image_share_1663057341595.jpg', 'jpg', 300, 'http://localhost:9090/file/5afc85e278204b2ab1354bc59f5fcfdc.jpg', 0, 1, '71e6cd445bbf10b12b1047238ffa0a2b');
INSERT INTO `sys_file` VALUES (582, 'tb_image_share_1663057347292.jpg', 'jpg', 358, 'http://localhost:9090/file/3a75fbab69b64edc8ac8d78f287c4ee9.jpg', 0, 1, '70399f2ffefcf3bf66582a93dda90468');
INSERT INTO `sys_file` VALUES (583, 'tb_image_share_1663057352269.jpg', 'jpg', 428, 'http://localhost:9090/file/dd8de1a1e1a04cfa91f55582a11f7413.jpg', 0, 1, '422777baea3aa37012965428eae8f56f');
INSERT INTO `sys_file` VALUES (584, 'tb_image_share_1663057357370.jpg', 'jpg', 186, 'http://localhost:9090/file/1800744538b049d8b669168d09e2bcce.jpg', 0, 1, '9726ba2528caa17c92a437071c2ea136');
INSERT INTO `sys_file` VALUES (585, 'tb_image_share_1663057367272.jpg', 'jpg', 215, 'http://localhost:9090/file/cdaba05e8fa84fbf89b3565e5734278e.jpg', 0, 1, '9e9c3ade303664487a38193f4420a3ad');
INSERT INTO `sys_file` VALUES (586, 'tb_image_share_1663057370906.jpg', 'jpg', 236, 'http://localhost:9090/file/739a57b2855b4fd780752e5f97682fea.jpg', 0, 1, 'd9a168eae2befcc0711c12d152369d96');
INSERT INTO `sys_file` VALUES (587, 'tb_image_share_1663057842799.jpg', 'jpg', 358, 'http://localhost:9090/file/6ea850f6ad2f41e8b639fad2187c5d1c.jpg', 0, 1, 'c2e7e3f9efcf5881361ef7f917452f0e');
INSERT INTO `sys_file` VALUES (588, 'tb_image_share_1663057845551.jpg', 'jpg', 182, 'http://localhost:9090/file/94202de2dbc24550aba894da5475e5f4.jpg', 0, 1, 'adfffc7908f861ea4cb25f5939319bbf');
INSERT INTO `sys_file` VALUES (589, 'tb_image_share_1663057848111.jpg', 'jpg', 319, 'http://localhost:9090/file/afadb41b0c5e42d589ed20331f46aaab.jpg', 0, 1, 'b15d68f0e1d65b65f5abafc90cb6e1ce');
INSERT INTO `sys_file` VALUES (590, 'tb_image_share_1663057850532.jpg', 'jpg', 464, 'http://localhost:9090/file/f15c9945d27e462582f435f5ba6406a7.jpg', 0, 1, '03dffa9c093496e1d3253a9e3c817428');
INSERT INTO `sys_file` VALUES (591, 'tb_image_share_1663057852976.jpg', 'jpg', 236, 'http://localhost:9090/file/ad36e9fd31ea415fa1e879d0bb4ba530.jpg', 0, 1, '4c982eec06a1d7fe5e421827fcaaad76');
INSERT INTO `sys_file` VALUES (592, 'kBLuOShlIEJhNfj2AAG_243275252333_ld_hq.mp4', 'mp4', 1475, 'http://localhost:9090/file/03aa2d04ff99490293ec26d1b6334704.mp4', 0, 1, '0b402cc40962fd07f7422ea7cdccda62');
INSERT INTO `sys_file` VALUES (593, '1663057889352.jpg', 'jpg', 478, 'http://localhost:9090/file/e5c66611dce6474cbd84f61604db95e7.jpg', 0, 1, '766137ded3d7ea05b375db15d7e70301');
INSERT INTO `sys_file` VALUES (594, '1663057902617.jpg', 'jpg', 186, 'http://localhost:9090/file/3808ff548cd047b9991e4b77a5d433d3.jpg', 0, 1, 'e94469d22fca43c7eb0c27a1bd666351');
INSERT INTO `sys_file` VALUES (595, '1663057908091.jpg', 'jpg', 178, 'http://localhost:9090/file/529effc029e349b984c90cbb61058cb0.jpg', 0, 1, '9a6fcc74a08c44e3e7da39ddb2a97a72');
INSERT INTO `sys_file` VALUES (596, '1663057914641.jpg', 'jpg', 374, 'http://localhost:9090/file/ce68968a92dd41bdacbec5f6ab2315a4.jpg', 0, 1, 'a69802ff5c331737356d081272d30da5');
INSERT INTO `sys_file` VALUES (597, '1663057922247.jpg', 'jpg', 203, 'http://localhost:9090/file/6e0f9c9be8b547eab43abeaec13364c8.jpg', 0, 1, 'f1b0f2a66abaf55cabb84df3e5d82b63');
INSERT INTO `sys_file` VALUES (598, '1663057932269.jpg', 'jpg', 236, 'http://localhost:9090/file/5b69db820fab4ef88147ff9f79a97a91.jpg', 0, 1, 'e2e268abb7f9bf54bae802e76acdf2dc');
INSERT INTO `sys_file` VALUES (599, '1663057935066.jpg', 'jpg', 229, 'http://localhost:9090/file/638ff3d3fc214540a35c8458bd014fae.jpg', 0, 1, '63c77c3f8a96dc273a7978b5cf9a4627');
INSERT INTO `sys_file` VALUES (600, 'tb_image_share_1663059550706.jpg', 'jpg', 497, 'http://localhost:9090/file/42eaaf94bd80427db0b5a2f54bd17a56.jpg', 0, 1, '5217ce78eddb620875c669bd6cdbd8a1');
INSERT INTO `sys_file` VALUES (601, 'tb_image_share_1663059553301.jpg', 'jpg', 354, 'http://localhost:9090/file/a607aefb2cb14a8a92044f98b63e694c.jpg', 0, 1, '63486f456ee9df27f17e497c8600d9cb');
INSERT INTO `sys_file` VALUES (602, 'tb_image_share_1663059555706.jpg', 'jpg', 466, 'http://localhost:9090/file/4ed1ebeb1abd49fd873f6cc276c930de.jpg', 0, 1, '7f56b08ac779fff8dc68ab55f916683a');
INSERT INTO `sys_file` VALUES (603, 'tb_image_share_1663059558354.jpg', 'jpg', 519, 'http://localhost:9090/file/b9d4f472f2b44def8bc03fec9f533a37.jpg', 0, 1, '8025375b3ac10c9166ce212416cc648e');
INSERT INTO `sys_file` VALUES (604, 'tb_image_share_1663059560919.jpg', 'jpg', 155, 'http://localhost:9090/file/cd4fbabc756441169cb09822b4ccaf51.jpg', 0, 1, '3f56e86fe026eedc2a9f7e51bf02bb00');
INSERT INTO `sys_file` VALUES (605, '88b6c59da4c4dc73_mp4_351473211492_mp4_264_hd_taobao.mp4', 'mp4', 3712, 'http://localhost:9090/file/914c0c26a6914420a3d4f92bcf129b22.mp4', 0, 1, 'dec89f52805bb80923da4f5b5271275a');
INSERT INTO `sys_file` VALUES (606, 'tb_image_share_1663059597509.jpg', 'jpg', 573, 'http://localhost:9090/file/c3bea4e365ef4919ade5d101b0b0020c.jpg', 0, 1, '5d097859bbd3d257c05d5129a13d3e7a');
INSERT INTO `sys_file` VALUES (607, 'tb_image_share_1663059601425.jpg', 'jpg', 1166, 'http://localhost:9090/file/b91a9e238b3948c887067eb9de680b52.jpg', 0, 1, '234c5e32f090017f57270d722c95a2f8');
INSERT INTO `sys_file` VALUES (608, 'tb_image_share_1663059606331.jpg', 'jpg', 384, 'http://localhost:9090/file/8dde69d837e04fc3a498743f9dc12092.jpg', 0, 1, 'b1b0764e0b4cdcd506f124ed2753bfac');
INSERT INTO `sys_file` VALUES (609, 'tb_image_share_1663059611515.jpg', 'jpg', 827, 'http://localhost:9090/file/81b6ccdf27304d449d746b93603957ec.jpg', 0, 1, '9a52be09d90c55f3f898cdbd23c14642');
INSERT INTO `sys_file` VALUES (610, 'tb_image_share_1663059620486.jpg', 'jpg', 840, 'http://localhost:9090/file/b4d2aa8d95cc4cc0967c2ee31cf80bc6.jpg', 0, 1, 'f51ac09d1d497441e2938e62fd6445e5');
INSERT INTO `sys_file` VALUES (611, 'tb_image_share_1663059624857.jpg', 'jpg', 701, 'http://localhost:9090/file/55a76b9e95a44b838f89291daf074371.jpg', 0, 1, '8fdd6eeac2d3548c829d72525d081ad6');
INSERT INTO `sys_file` VALUES (612, 'tb_image_share_1663059635180.jpg', 'jpg', 159, 'http://localhost:9090/file/0503dbae97d3441ba1d73d378be8d3f2.jpg', 0, 1, 'a475a77552205003882a2833b304c5af');
INSERT INTO `sys_file` VALUES (613, 'tb_image_share_1663059639559.jpg', 'jpg', 426, 'http://localhost:9090/file/af82720026d04a35b7764bc962506a7a.jpg', 0, 1, 'e2c78577353c3cee3d3593ddf4fbc8ae');
INSERT INTO `sys_file` VALUES (614, 'tb_image_share_1663057357370.jpg', 'jpg', 186, 'http://localhost:9090/file/1800744538b049d8b669168d09e2bcce.jpg', 0, 1, '9726ba2528caa17c92a437071c2ea136');
INSERT INTO `sys_file` VALUES (615, 'tb_image_share_1662995389287.jpg', 'jpg', 328, 'http://localhost:9090/file/0706aa95655f4a669b23b26ed2a109f8.jpg', 0, 1, '2970668db0a8cc84434d6ba8c93a1800');
INSERT INTO `sys_file` VALUES (616, 'tb_image_share_1663059550706.jpg', 'jpg', 497, 'http://localhost:9090/file/42eaaf94bd80427db0b5a2f54bd17a56.jpg', 0, 1, '5217ce78eddb620875c669bd6cdbd8a1');
INSERT INTO `sys_file` VALUES (617, 'tb_image_share_1663059553301.jpg', 'jpg', 354, 'http://localhost:9090/file/a607aefb2cb14a8a92044f98b63e694c.jpg', 0, 1, '63486f456ee9df27f17e497c8600d9cb');
INSERT INTO `sys_file` VALUES (618, 'tb_image_share_1663059555706.jpg', 'jpg', 466, 'http://localhost:9090/file/4ed1ebeb1abd49fd873f6cc276c930de.jpg', 0, 1, '7f56b08ac779fff8dc68ab55f916683a');
INSERT INTO `sys_file` VALUES (619, 'tb_image_share_1663059558354.jpg', 'jpg', 519, 'http://localhost:9090/file/b9d4f472f2b44def8bc03fec9f533a37.jpg', 0, 1, '8025375b3ac10c9166ce212416cc648e');
INSERT INTO `sys_file` VALUES (620, 'tb_image_share_1663059560919.jpg', 'jpg', 155, 'http://localhost:9090/file/cd4fbabc756441169cb09822b4ccaf51.jpg', 0, 1, '3f56e86fe026eedc2a9f7e51bf02bb00');
INSERT INTO `sys_file` VALUES (621, '88b6c59da4c4dc73_mp4_351473211492_mp4_264_hd_taobao.mp4', 'mp4', 3712, 'http://localhost:9090/file/914c0c26a6914420a3d4f92bcf129b22.mp4', 0, 1, 'dec89f52805bb80923da4f5b5271275a');
INSERT INTO `sys_file` VALUES (622, 'tb_image_share_1663059597509.jpg', 'jpg', 573, 'http://localhost:9090/file/c3bea4e365ef4919ade5d101b0b0020c.jpg', 0, 1, '5d097859bbd3d257c05d5129a13d3e7a');
INSERT INTO `sys_file` VALUES (623, 'tb_image_share_1663059601425.jpg', 'jpg', 1166, 'http://localhost:9090/file/b91a9e238b3948c887067eb9de680b52.jpg', 0, 1, '234c5e32f090017f57270d722c95a2f8');
INSERT INTO `sys_file` VALUES (624, 'tb_image_share_1663059606331.jpg', 'jpg', 384, 'http://localhost:9090/file/8dde69d837e04fc3a498743f9dc12092.jpg', 0, 1, 'b1b0764e0b4cdcd506f124ed2753bfac');
INSERT INTO `sys_file` VALUES (625, 'tb_image_share_1663059606331.jpg', 'jpg', 384, 'http://localhost:9090/file/8dde69d837e04fc3a498743f9dc12092.jpg', 0, 1, 'b1b0764e0b4cdcd506f124ed2753bfac');
INSERT INTO `sys_file` VALUES (626, 'tb_image_share_1663059611515.jpg', 'jpg', 827, 'http://localhost:9090/file/81b6ccdf27304d449d746b93603957ec.jpg', 0, 1, '9a52be09d90c55f3f898cdbd23c14642');
INSERT INTO `sys_file` VALUES (627, 'tb_image_share_1663059620486.jpg', 'jpg', 840, 'http://localhost:9090/file/b4d2aa8d95cc4cc0967c2ee31cf80bc6.jpg', 0, 1, 'f51ac09d1d497441e2938e62fd6445e5');
INSERT INTO `sys_file` VALUES (628, 'tb_image_share_1663059624857.jpg', 'jpg', 701, 'http://localhost:9090/file/55a76b9e95a44b838f89291daf074371.jpg', 0, 1, '8fdd6eeac2d3548c829d72525d081ad6');
INSERT INTO `sys_file` VALUES (629, 'tb_image_share_1663059635180.jpg', 'jpg', 159, 'http://localhost:9090/file/0503dbae97d3441ba1d73d378be8d3f2.jpg', 0, 1, 'a475a77552205003882a2833b304c5af');
INSERT INTO `sys_file` VALUES (630, 'tb_image_share_1663059639559.jpg', 'jpg', 426, 'http://localhost:9090/file/af82720026d04a35b7764bc962506a7a.jpg', 0, 1, 'e2c78577353c3cee3d3593ddf4fbc8ae');
INSERT INTO `sys_file` VALUES (631, 'tb_image_share_1663061641916.jpg', 'jpg', 430, 'http://localhost:9090/file/4617fa7792424841b954c52fdb880753.jpg', 0, 1, 'c4df1f0ef04ceba0e0d89caaee398e3f');
INSERT INTO `sys_file` VALUES (632, 'tb_image_share_1663061645519.jpg', 'jpg', 365, 'http://localhost:9090/file/4087ee75ab264aa4b6579954d2643215.jpg', 0, 1, '58eaaa3c5d888f9b2d2c59e2498f25e5');
INSERT INTO `sys_file` VALUES (633, 'tb_image_share_1663061647819.jpg', 'jpg', 313, 'http://localhost:9090/file/1b5c9b03978043d0ae26a017cfe39836.jpg', 0, 1, '7fa32faa826aa9c3066ea9f4d2556f69');
INSERT INTO `sys_file` VALUES (634, 'tb_image_share_1663061650200.jpg', 'jpg', 344, 'http://localhost:9090/file/03131c053f9943db882b5a7e82e07b7a.jpg', 0, 1, 'd2f293082cc7e5662ae0dd2638acd78a');
INSERT INTO `sys_file` VALUES (635, 'tb_image_share_1663061652657.jpg', 'jpg', 482, 'http://localhost:9090/file/2c119e8200404bacb7dfaebf855f8ac4.jpg', 0, 1, 'a22a4c5df0b48cbe7d2bf8e9b8725735');
INSERT INTO `sys_file` VALUES (636, '1db923e03354525c_mp4_358111752733_mp4_264_hd_taobao.mp4', 'mp4', 5670, 'http://localhost:9090/file/091453a5350244179c17c6dac6529bf6.mp4', 0, 1, 'c9092ed1633386fada8d8f1e759e8420');
INSERT INTO `sys_file` VALUES (637, 'tb_image_share_1663062061641.jpg', 'jpg', 780, 'http://localhost:9090/file/024fd80aaf3d44b3a27a77acb48032b9.jpg', 0, 1, '1deb0591b6a4f1fad3897d8d0ba34fc6');
INSERT INTO `sys_file` VALUES (638, 'tb_image_share_1663062065795.jpg', 'jpg', 430, 'http://localhost:9090/file/19685028172242a1849c2e8865df2ead.jpg', 0, 1, 'a98d4fc38cab595a5d45ac324630fa8f');
INSERT INTO `sys_file` VALUES (639, 'tb_image_share_1663062069258.jpg', 'jpg', 349, 'http://localhost:9090/file/8cb76e394d304e0db58984a57e30d174.jpg', 0, 1, '7abd6245292125b50bb806e59eb43a03');
INSERT INTO `sys_file` VALUES (640, 'tb_image_share_1663062072498.jpg', 'jpg', 661, 'http://localhost:9090/file/579facdc07f9499cb13da9bdca31ad07.jpg', 0, 1, '09afb7795bda8cedf4bc17a4d8382138');
INSERT INTO `sys_file` VALUES (641, 'tb_image_share_1663062077488.jpg', 'jpg', 257, 'http://localhost:9090/file/f5eba8db1d2f4e89a8b9dfda8ddc4004.jpg', 0, 1, '11010c81acd069c9d5e5570bc9a0bac2');
INSERT INTO `sys_file` VALUES (642, 'tb_image_share_1663062081175.jpg', 'jpg', 152, 'http://localhost:9090/file/c1d5e9d56c8b48bb98824fec79e2ea9c.jpg', 0, 1, 'eae2caabcccfe8b5c4964a6186659217');
INSERT INTO `sys_file` VALUES (643, 'tb_image_share_1663062085088.jpg', 'jpg', 547, 'http://localhost:9090/file/8a275e093db7438db68fa5d4304515b1.jpg', 0, 1, 'a2a270952ceb45de93a246f111074e44');
INSERT INTO `sys_file` VALUES (644, 'tb_image_share_1663062092278.jpg', 'jpg', 264, 'http://localhost:9090/file/a86cc11048ae4859bf8eb5249cbbe9a7.jpg', 0, 1, 'e77b79b72cb25747f8762cd80294f004');
INSERT INTO `sys_file` VALUES (645, 'tb_image_share_1663062242382.jpg', 'jpg', 455, 'http://localhost:9090/file/208f7858605e478fbb758f686ce11078.jpg', 0, 1, '2948fbd7b504ac221832c875c2990f69');
INSERT INTO `sys_file` VALUES (646, 'tb_image_share_1663062245093.jpg', 'jpg', 403, 'http://localhost:9090/file/06ab9647f7494539a09e98c9bb70faa4.jpg', 0, 1, 'b098d01b74f00aa1e5959456c9dbae76');
INSERT INTO `sys_file` VALUES (647, 'tb_image_share_1663062247417.jpg', 'jpg', 313, 'http://localhost:9090/file/f2b3ffc52ffc44969d9704aa0c4cc9d8.jpg', 0, 1, 'e2bdcd2b09cee1fb1d25f789fd93d524');
INSERT INTO `sys_file` VALUES (648, 'tb_image_share_1663062249707.jpg', 'jpg', 497, 'http://localhost:9090/file/f713241d16d245b196dbc33c552e5e5e.jpg', 0, 1, '3509bee8600b1829305308f345282af7');
INSERT INTO `sys_file` VALUES (649, 'tb_image_share_1663062251942.jpg', 'jpg', 490, 'http://localhost:9090/file/46f6809c74b340749ffd7494a1769ef3.jpg', 0, 1, 'b00e8294d5897ddaebbd139a8bab459f');
INSERT INTO `sys_file` VALUES (650, '20220717_9510d361b662c97e_368870009394_mp4_264_hd_taobao.mp4', 'mp4', 3898, 'http://localhost:9090/file/79ef1ba7e84a45edba4e69445aa6cf9c.mp4', 0, 1, 'd928616680d3246e7fc157410e990466');
INSERT INTO `sys_file` VALUES (651, 'tb_image_share_1663062274935.jpg', 'jpg', 358, 'http://localhost:9090/file/e7825dea019743b697ae52d3870c4d11.jpg', 0, 1, '9a62b793444b91b83398a9869d6db74d');
INSERT INTO `sys_file` VALUES (652, 'tb_image_share_1663062278415.jpg', 'jpg', 264, 'http://localhost:9090/file/1018e267374e4de1802cb1fbe9b0a8b9.jpg', 0, 1, 'ac6d104440ebadc712970497022af852');
INSERT INTO `sys_file` VALUES (653, 'tb_image_share_1663062282066.jpg', 'jpg', 423, 'http://localhost:9090/file/b790ebdff10f427e9b50f255d69477eb.jpg', 0, 1, '59b988ca4d3891726bd7f3162f94c3f9');
INSERT INTO `sys_file` VALUES (654, 'tb_image_share_1663062285648.jpg', 'jpg', 932, 'http://localhost:9090/file/d5f61017610548fdac769cdc76dfbae7.jpg', 0, 1, '82f8df121a59a2daf632927a1faa798c');
INSERT INTO `sys_file` VALUES (655, 'tb_image_share_1663062289227.jpg', 'jpg', 486, 'http://localhost:9090/file/bd58e52c8e754e58b8625e29936388a7.jpg', 0, 1, '7b3125469de778009a8ec568220349ae');
INSERT INTO `sys_file` VALUES (656, 'tb_image_share_1663062292625.jpg', 'jpg', 356, 'http://localhost:9090/file/d740ec7c56dc4937b783459a9104c809.jpg', 0, 1, 'eb1a2970a5ddb0a41a489c5d2a114595');
INSERT INTO `sys_file` VALUES (657, 'tb_image_share_1663062307748.jpg', 'jpg', 166, 'http://localhost:9090/file/ae700aa803144f54bbd95543bb640d64.jpg', 0, 1, '5eaf1d0a89a4c6dda85b09e9c4eb3010');
INSERT INTO `sys_file` VALUES (658, 'tb_image_share_1663062915570.jpg', 'jpg', 444, 'http://localhost:9090/file/40da55899a694656bcd4206b410b68ba.jpg', 0, 1, '02a372f08e11f53092649c7ef8eeb27f');
INSERT INTO `sys_file` VALUES (659, 'tb_image_share_1663062918034.jpg', 'jpg', 317, 'http://localhost:9090/file/fe76e87eea80479fbbf3471a31dbcfdf.jpg', 0, 1, 'a57e9bd22b1c97068c70f55a8e273dc3');
INSERT INTO `sys_file` VALUES (660, 'tb_image_share_1663062920560.jpg', 'jpg', 299, 'http://localhost:9090/file/a5a2a535df5f4d9eb849ccd46bcb6b81.jpg', 0, 1, 'a7ef5ff9f974c8f5a449e708965375d3');
INSERT INTO `sys_file` VALUES (661, 'tb_image_share_1663062923667.jpg', 'jpg', 499, 'http://localhost:9090/file/8dc7299fc5014fa3af6085f536b58762.jpg', 0, 1, 'b2cbf253b852d0a5ccd3d93ce70f320d');
INSERT INTO `sys_file` VALUES (662, 'tb_image_share_1663062925973.jpg', 'jpg', 427, 'http://localhost:9090/file/79dca1d87d8945cb80f85efc5144a6df.jpg', 0, 1, '00183e7b6349ad95fec8dc3d9bee43eb');
INSERT INTO `sys_file` VALUES (663, 'rXHM7WcxaT2ndVPgkXV_324127448070_mp4_264_hd.mp4', 'mp4', 7880, 'http://localhost:9090/file/129eb5f61c564b3e8ac399ed3b66b53f.mp4', 0, 1, '3448fc3627cbab58ba47612e7a456bf7');
INSERT INTO `sys_file` VALUES (664, 'tb_image_share_1663063388438.jpg', 'jpg', 827, 'http://localhost:9090/file/3e983f75a956458b834def4ac9eb75ea.jpg', 0, 1, '5955f99e47d98e198f80f18ccf2c048d');
INSERT INTO `sys_file` VALUES (665, 'tb_image_share_1663063392070.jpg', 'jpg', 521, 'http://localhost:9090/file/9fe1657104e1474bb399c989bbad4c8f.jpg', 0, 1, '84d8d854156a29b2db4da95f70eb5db5');
INSERT INTO `sys_file` VALUES (666, 'tb_image_share_1663063401135.jpg', 'jpg', 354, 'http://localhost:9090/file/ccf8194522bb44e6afa16737e1c8efb3.jpg', 0, 1, '4ab0508e9d4578fd42c8562713c4f47d');
INSERT INTO `sys_file` VALUES (667, 'tb_image_share_1663063412170.jpg', 'jpg', 835, 'http://localhost:9090/file/0975cbe12c7849a188dd813b2a79e11e.jpg', 0, 1, '3783496b14054315b0aba16af514b04d');
INSERT INTO `sys_file` VALUES (668, 'tb_image_share_1663063421379.jpg', 'jpg', 502, 'http://localhost:9090/file/e2181b583fc746608eb455fd8d947c5f.jpg', 0, 1, 'e90c2b40b6d6dd4030af25da3c5f2648');
INSERT INTO `sys_file` VALUES (669, 'tb_image_share_1663063425901.jpg', 'jpg', 37, 'http://localhost:9090/file/04e9bf451e80463bbef21b082027724c.jpg', 0, 1, 'fdebc5117c5bac333bc3773295204caa');
INSERT INTO `sys_file` VALUES (670, 'tb_image_share_1663064584143.jpg', 'jpg', 474, 'http://localhost:9090/file/fa5240aad7e54b158077af769e4b6133.jpg', 0, 1, '640718b23c32a3961628563619e2a353');
INSERT INTO `sys_file` VALUES (671, 'tb_image_share_1663063710639.jpg', 'jpg', 459, 'http://localhost:9090/file/1696b830647842f4ab68d177c2e34b04.jpg', 0, 1, '3d6022d7437bde09207e6f6276f40574');
INSERT INTO `sys_file` VALUES (672, 'tb_image_share_1663063715608.jpg', 'jpg', 620, 'http://localhost:9090/file/55f04110cb384097a06f63741c351a2d.jpg', 0, 1, '940b732e082d663a06fe2d505a2a4a21');
INSERT INTO `sys_file` VALUES (673, 'tb_image_share_1663064591275.jpg', 'jpg', 441, 'http://localhost:9090/file/9ee1fd789f8748208d71c28d414ad0c7.jpg', 0, 1, '87ef8af89f1fb2e3ef198d42fa928e2f');
INSERT INTO `sys_file` VALUES (674, 'tb_image_share_1663064595197.jpg', 'jpg', 456, 'http://localhost:9090/file/53b2232df84a495d9d54fb0e16d13759.jpg', 0, 1, '9346e61691ac41d1bee4c55c5cf3679f');
INSERT INTO `sys_file` VALUES (675, '20220811_78cd265f85b4bc00_372131113637_mp4_264_hd_taobao.mp4', 'mp4', 5954, 'http://localhost:9090/file/744332ef584747e6bb9c03b9edc0c4b0.mp4', 0, 1, 'b7de75e4513bf808c21a1a81a60cf795');
INSERT INTO `sys_file` VALUES (676, 'tb_image_share_1663064925774.jpg', 'jpg', 708, 'http://localhost:9090/file/e3eadfaaaeea42ecb1e7291f75c736be.jpg', 0, 1, '462ab84783fd618117a7aa3fff07830f');
INSERT INTO `sys_file` VALUES (677, 'tb_image_share_1663064930266.jpg', 'jpg', 563, 'http://localhost:9090/file/dcf7fc2e9b08444a94a83902255c02e8.jpg', 0, 1, '78dea2ebce84dedf4195be6283c3ee25');
INSERT INTO `sys_file` VALUES (678, 'tb_image_share_1663064934104.jpg', 'jpg', 505, 'http://localhost:9090/file/f4155737cd5a405385624a2e074fd402.jpg', 0, 1, '520b4b04872d03c68c4b25577c416859');
INSERT INTO `sys_file` VALUES (679, 'tb_image_share_1663064937912.jpg', 'jpg', 533, 'http://localhost:9090/file/6f3d6c56f6ac48a48b40cb7f211fb822.jpg', 0, 1, '5e9fb8f4d91eeeb87a4a53230bdbc6b9');
INSERT INTO `sys_file` VALUES (680, 'tb_image_share_1663064943076.jpg', 'jpg', 539, 'http://localhost:9090/file/f997a27b0a124a86ac977887a354da66.jpg', 0, 1, '0772f7280a4b904c7abd29f02c7672e8');
INSERT INTO `sys_file` VALUES (681, 'tb_image_share_1663064946486.jpg', 'jpg', 316, 'http://localhost:9090/file/b9f12721e3f44a28a2a660cfcc55b1d3.jpg', 0, 1, 'f5de11c413f6ecc075e757c6ed7bd785');
INSERT INTO `sys_file` VALUES (682, 'tb_image_share_1663064950185.jpg', 'jpg', 492, 'http://localhost:9090/file/65b02559a818426a82f497cb0a6906a7.jpg', 0, 1, 'e9343ae250d09a781c6db5c9eb2853e8');
INSERT INTO `sys_file` VALUES (683, 'tb_image_share_1663064969398.jpg', 'jpg', 1194, 'http://localhost:9090/file/61dfbccfb26d42fb9db257d6221af56d.jpg', 0, 1, '805934d2915f0575309aec381d47701f');
INSERT INTO `sys_file` VALUES (684, 'tb_image_share_1663057357370.jpg', 'jpg', 186, 'http://localhost:9090/file/1800744538b049d8b669168d09e2bcce.jpg', 0, 1, '9726ba2528caa17c92a437071c2ea136');
INSERT INTO `sys_file` VALUES (685, 'tb_image_share_1663065345758.jpg', 'jpg', 191, 'http://localhost:9090/file/b066e644839a4270bccebfdf231c2d2a.jpg', 0, 1, 'ed41633dac7e68c23823176966a59aa9');
INSERT INTO `sys_file` VALUES (686, 'tb_image_share_1663065350082.jpg', 'jpg', 230, 'http://localhost:9090/file/e6f394ec19024e8d80a0a39e3a3bd097.jpg', 0, 1, '51898a48bb1aea8243303030488ade89');
INSERT INTO `sys_file` VALUES (687, 'tb_image_share_1663065352470.jpg', 'jpg', 226, 'http://localhost:9090/file/ed55f2ee2ffd4d51961129b54300830c.jpg', 0, 1, '7669ee6c3c34e2ecf37c36e6151ad332');
INSERT INTO `sys_file` VALUES (688, 'tb_image_share_1663065354875.jpg', 'jpg', 180, 'http://localhost:9090/file/dd386794582740d0ae4c91810ab78441.jpg', 0, 1, '03e7d3d80e80bb506df6624920cf48ed');
INSERT INTO `sys_file` VALUES (689, 'tb_image_share_1663065357289.jpg', 'jpg', 116, 'http://localhost:9090/file/8634b4d4461d4b4cbfe07516131c1c4d.jpg', 0, 1, '29dfb2f57da0daeeeb8cd8d3182e976c');
INSERT INTO `sys_file` VALUES (690, '20220804_b5ef90132ebc9507_372157211090_mp4_264_hd_taobao.mp4', 'mp4', 541, 'http://localhost:9090/file/f8a487825fa84e61b5995ee38397045a.mp4', 0, 1, '1603802c52f2a31aa15aac9c5d334e56');
INSERT INTO `sys_file` VALUES (691, '1663065558249.jpg', 'jpg', 374, 'http://localhost:9090/file/ffaddddf58f54542bf88247dbd6839dc.jpg', 0, 1, 'f55998a23536524ab01fcb5ba0bf84a8');
INSERT INTO `sys_file` VALUES (692, '1663065566567.jpg', 'jpg', 256, 'http://localhost:9090/file/907e1f84d8a34ce6bf6c89d4701f4286.jpg', 0, 1, 'f8cc1ab0aafd2467afad42c5d74d9308');
INSERT INTO `sys_file` VALUES (693, 'tb_image_share_1663065869530.jpg', 'jpg', 530, 'http://localhost:9090/file/ab16838655d4455f8b3ad7e7392224a4.jpg', 0, 1, '0922f939f017cd29a604a4414b989f76');
INSERT INTO `sys_file` VALUES (694, 'tb_image_share_1663065872139.jpg', 'jpg', 140, 'http://localhost:9090/file/f20385c05d404eebb95062cad2493b27.jpg', 0, 1, '5710ced3ab4176296062770776e773be');
INSERT INTO `sys_file` VALUES (695, 'tb_image_share_1663065875614.jpg', 'jpg', 449, 'http://localhost:9090/file/8b873cec70ae4d9ea893b73cb8c88ee6.jpg', 0, 1, 'b318032a0eb0c262ce81ee16c04908b6');
INSERT INTO `sys_file` VALUES (696, 'tb_image_share_1663065877889.jpg', 'jpg', 490, 'http://localhost:9090/file/bf2991cb06a74e4781638aeb9aa07e5b.jpg', 0, 1, '5e013dddf6da2af650ec9b7b2f487eba');
INSERT INTO `sys_file` VALUES (697, 'tb_image_share_1663065882579.jpg', 'jpg', 347, 'http://localhost:9090/file/237b52ead6a84734b2d9d8f006c808ef.jpg', 0, 1, '32a3f2c1e55cd837636b75efd74e9c72');
INSERT INTO `sys_file` VALUES (698, '20220706_c547e88b1bde0e00_366834024029_mp4_264_hd_taobao.mp4', 'mp4', 7875, 'http://localhost:9090/file/3941bcb6025f49ddb4c25e21ae61be91.mp4', 0, 1, '2791191a46f2939a01de399092cc5f02');
INSERT INTO `sys_file` VALUES (699, 'tb_image_share_1663057357370.jpg', 'jpg', 186, 'http://localhost:9090/file/1800744538b049d8b669168d09e2bcce.jpg', 0, 1, '9726ba2528caa17c92a437071c2ea136');
INSERT INTO `sys_file` VALUES (700, 'tb_image_share_1663065936552.jpg', 'jpg', 674, 'http://localhost:9090/file/4f07a35501df423997f36db0c4c74dff.jpg', 0, 1, '4e72f5dfc51539ac7c8d5e3f5e13a512');
INSERT INTO `sys_file` VALUES (701, 'tb_image_share_1663065965882.jpg', 'jpg', 921, 'http://localhost:9090/file/f29199aec5bc4c939a27d5193d65042a.jpg', 0, 1, '40f83dd0d859f0e04c037a781ec36b7b');
INSERT INTO `sys_file` VALUES (702, 'tb_image_share_1663065961435.jpg', 'jpg', 481, 'http://localhost:9090/file/4cdc5195b67d49fca4f0a1e7429f539b.jpg', 0, 1, 'c6e6afac77175a40c1de3e5947c690cb');
INSERT INTO `sys_file` VALUES (703, 'tb_image_share_1663065936552.jpg', 'jpg', 674, 'http://localhost:9090/file/4f07a35501df423997f36db0c4c74dff.jpg', 0, 1, '4e72f5dfc51539ac7c8d5e3f5e13a512');
INSERT INTO `sys_file` VALUES (704, 'tb_image_share_1663065971943.jpg', 'jpg', 1268, 'http://localhost:9090/file/2b02e28c1f7e4a849562efaf26b148fb.jpg', 0, 1, '856d98df66af590df15d12f33a79e1db');
INSERT INTO `sys_file` VALUES (705, 'tb_image_share_1663065982533.jpg', 'jpg', 745, 'http://localhost:9090/file/e43dbc663e0b41049e1f64c427420977.jpg', 0, 1, 'edff5cf35c235a5e2255dffbfd83011a');
INSERT INTO `sys_file` VALUES (706, 'tb_image_share_1663066599801.jpg', 'jpg', 414, 'http://localhost:9090/file/72241559ad1046da9000735cdeea5991.jpg', 0, 1, '444017c930b08094718821e6f2757a9b');
INSERT INTO `sys_file` VALUES (707, 'tb_image_share_1663066603402.jpg', 'jpg', 283, 'http://localhost:9090/file/c5fac0699f4f4d178e88c8d907c9def1.jpg', 0, 1, '8b4b0cf8d1b5837068d3a6c93fbc0a7c');
INSERT INTO `sys_file` VALUES (708, 'tb_image_share_1663066605748.jpg', 'jpg', 253, 'http://localhost:9090/file/fef084efc0ee48e98077196f9c1b2154.jpg', 0, 1, '0f822a7bb272e81dd45dd8f57383ef86');
INSERT INTO `sys_file` VALUES (709, 'tb_image_share_1663066608344.jpg', 'jpg', 248, 'http://localhost:9090/file/123a91b223794332b3ed094a0ab26513.jpg', 0, 1, '80de7b2f8e2ec5f5d2a30f137645b459');
INSERT INTO `sys_file` VALUES (710, 'tb_image_share_1663066610620.jpg', 'jpg', 230, 'http://localhost:9090/file/e507ca8dbdad472f87cbea0a1849b6fa.jpg', 0, 1, '851600bfb4ae67d409399e3a8c57090d');
INSERT INTO `sys_file` VALUES (711, 'tb_image_share_1663057357370.jpg', 'jpg', 186, 'http://localhost:9090/file/1800744538b049d8b669168d09e2bcce.jpg', 0, 1, '9726ba2528caa17c92a437071c2ea136');
INSERT INTO `sys_file` VALUES (712, 'tb_image_share_1663066843073.jpg', 'jpg', 690, 'http://localhost:9090/file/0ac138b4526441a9becd2e99300cfa3a.jpg', 0, 1, 'b114de00044e8bbc11cc2aefd28e07e8');
INSERT INTO `sys_file` VALUES (713, 'tb_image_share_1663066848419.jpg', 'jpg', 1244, 'http://localhost:9090/file/8d09c5ea4e8942098f4c5b17de07efdc.jpg', 0, 1, 'b170b264fd86cecb2604f79d1e6028cc');
INSERT INTO `sys_file` VALUES (714, 'tb_image_share_1663066853111.jpg', 'jpg', 340, 'http://localhost:9090/file/8bb0978a4de7463aadae80cb728286bc.jpg', 0, 1, 'a01b72d39a1917ff71317eb0050308b1');
INSERT INTO `sys_file` VALUES (715, 'tb_image_share_1663066856850.jpg', 'jpg', 500, 'http://localhost:9090/file/e2d580f3f0b94a2f9aca4f4bd46113b4.jpg', 0, 1, 'f7d9aca558bf65c797de87514b0799cf');
INSERT INTO `sys_file` VALUES (716, 'tb_image_share_1663066861168.jpg', 'jpg', 568, 'http://localhost:9090/file/237954fc8c884cb1942f8c816ff8879f.jpg', 0, 1, '67f3f0441712be0c02355f4ee1f17ca0');
INSERT INTO `sys_file` VALUES (717, 'tb_image_share_1663066874263.jpg', 'jpg', 559, 'http://localhost:9090/file/dc77aec14a414768a089f14676aea2b3.jpg', 0, 1, '15e6517547262a3a3ac7bd087004cacd');
INSERT INTO `sys_file` VALUES (718, 'tb_image_share_1663066877939.jpg', 'jpg', 465, 'http://localhost:9090/file/e3d6206bae45470cbca50c5eb1b445f1.jpg', 0, 1, 'e0ea6f638bb06d1033c28a160c9e70cd');
INSERT INTO `sys_file` VALUES (719, 'tb_image_share_1663074928241.jpg', 'jpg', 418, 'http://localhost:9090/file/2da085d443b0417fadc9d43792e15a4b.jpg', 0, 1, 'e3346d356caff8c7a115ea98a1090466');
INSERT INTO `sys_file` VALUES (720, 'tb_image_share_1663074913364.jpg', 'jpg', 324, 'http://localhost:9090/file/9c981d675f034367bb604a00f5b5605b.jpg', 0, 1, '6b4cc9ba031b0665285c0d60e48ca840');
INSERT INTO `sys_file` VALUES (721, 'tb_image_share_1663074909664.jpg', 'jpg', 449, 'http://localhost:9090/file/2b9066e97e5a40ae8e95c766612223c1.jpg', 0, 1, '574d4b1b49e44074f741029ca9559471');
INSERT INTO `sys_file` VALUES (722, 'tb_image_share_1663074905940.jpg', 'jpg', 365, 'http://localhost:9090/file/e29de68cb721446b9fffa49a94ba155a.jpg', 0, 1, 'c5f06ca7eafd3674c5367a98a7b198a6');
INSERT INTO `sys_file` VALUES (723, 'XsP9dFA5h9xbiCG7BpN_338223021345_mp4_264_sd_taobao.mp4', 'mp4', 2727, 'http://localhost:9090/file/7546bed6ba564dd890dbfea1f9a82a90.mp4', 0, 1, '3649be9c96b1203f719269a483243d88');
INSERT INTO `sys_file` VALUES (724, 'tb_image_share_1663074961315.jpg', 'jpg', 827, 'http://localhost:9090/file/7fa8ee440ec443b0a349a7a486b2040e.jpg', 0, 1, 'c686fba53080443b0c36f7d7bc7c2985');
INSERT INTO `sys_file` VALUES (725, 'tb_image_share_1663074966192.jpg', 'jpg', 970, 'http://localhost:9090/file/4b2fe24b2dd545b9b6d96d3f68ec3b82.jpg', 0, 1, '7951b43e933979ac850b18a245aed25a');
INSERT INTO `sys_file` VALUES (726, 'tb_image_share_1663074971540.jpg', 'jpg', 671, 'http://localhost:9090/file/5d66264a13a5456da7f4c96b9eef34db.jpg', 0, 1, 'c28d8a6ce69d7f6c537df3e5d2389e11');
INSERT INTO `sys_file` VALUES (727, 'tb_image_share_1663074976782.jpg', 'jpg', 853, 'http://localhost:9090/file/ee9a20e56722458aa1d08af0d58153e3.jpg', 0, 1, 'c4d3a083656a8f665d4d9244040c6dad');
INSERT INTO `sys_file` VALUES (728, 'tb_image_share_1663074981702.jpg', 'jpg', 812, 'http://localhost:9090/file/233ea764eb914c91805835917cc79f54.jpg', 0, 1, '0d67cdb5b253fdf1762c0251f4294a8c');
INSERT INTO `sys_file` VALUES (729, 'tb_image_share_1663074986914.jpg', 'jpg', 747, 'http://localhost:9090/file/2020e51df0024430a497721d6f120f09.jpg', 0, 1, 'c0fcfafa21ec596ce8b9cf290ef01802');
INSERT INTO `sys_file` VALUES (730, 'tb_image_share_1663074991710.jpg', 'jpg', 657, 'http://localhost:9090/file/45c5015090e04322a156b89a626d2130.jpg', 0, 1, '89585bd622c979e60f9c641c9be23a96');
INSERT INTO `sys_file` VALUES (731, 'tb_image_share_1663074996006.jpg', 'jpg', 750, 'http://localhost:9090/file/0d5549608b444ba483a200a303b59aa8.jpg', 0, 1, 'c26b0c3f3942679f15026aadb0467dca');
INSERT INTO `sys_file` VALUES (732, 'tb_image_share_1663075409958.jpg', 'jpg', 367, 'http://localhost:9090/file/bc953081d89e4ea89f7e948f46642bfb.jpg', 0, 1, '8c92e1c7892a137f49b5f6c60bd641ec');
INSERT INTO `sys_file` VALUES (733, 'tb_image_share_1663075405054.jpg', 'jpg', 268, 'http://localhost:9090/file/7e34a4c522024cc5aee5f13709934870.jpg', 0, 1, 'cb595647aa59c7b5a729c25166e087bd');
INSERT INTO `sys_file` VALUES (734, 'tb_image_share_1663075407645.jpg', 'jpg', 191, 'http://localhost:9090/file/5a168f31c8aa4db78172b5a36223216c.jpg', 0, 1, '78598efb404c449bd14404921072a866');
INSERT INTO `sys_file` VALUES (735, 'tb_image_share_1663075439788.jpg', 'jpg', 337, 'http://localhost:9090/file/7c4550efe72c403e999ad06cdef67fc3.jpg', 0, 1, 'a8b6c72d002266f67b78bb0558618c90');
INSERT INTO `sys_file` VALUES (736, 'tb_image_share_1663075412444.jpg', 'jpg', 212, 'http://localhost:9090/file/a7f99b668d404f019ce39d8903ffa97e.jpg', 0, 1, 'bd869a2070d0316696249584ae213d0e');
INSERT INTO `sys_file` VALUES (737, '8f167e14399225f6_mp4_361584365095_mp4_264_hd_taobao.mp4', 'mp4', 9719, 'http://localhost:9090/file/f699a7d6305e40b99fdccdb41819916e.mp4', 0, 1, 'ead38ab71e9f9be1ffdcb80e12632d2c');
INSERT INTO `sys_file` VALUES (738, 'tb_image_share_1663075476838.jpg', 'jpg', 545, 'http://localhost:9090/file/2b61822bf39544a69517a27b08466dbb.jpg', 0, 1, '4e3c7c224260d614e01fb4abb3f6d367');
INSERT INTO `sys_file` VALUES (739, 'tb_image_share_1663075481732.jpg', 'jpg', 286, 'http://localhost:9090/file/fe51b75eb9aa4d8fae414c1022e825e6.jpg', 0, 1, 'e992652591cf81987bf3c64bbe8bf2a6');
INSERT INTO `sys_file` VALUES (740, 'tb_image_share_1663075486420.jpg', 'jpg', 481, 'http://localhost:9090/file/899ed5a1a29645a49d9399292b7581ec.jpg', 0, 1, 'f8820779b358c11439a76b7e0d686673');
INSERT INTO `sys_file` VALUES (741, 'tb_image_share_1663075491590.jpg', 'jpg', 548, 'http://localhost:9090/file/c451d11c20814605a5f22f7990c39485.jpg', 0, 1, '34f0d28017d364b0e682d34f5accc91e');
INSERT INTO `sys_file` VALUES (742, 'tb_image_share_1663075495615.jpg', 'jpg', 779, 'http://localhost:9090/file/b66c344a000541979e5a9a7e111ad329.jpg', 0, 1, '133cda4a5adf758da2c1b77bb9a46001');
INSERT INTO `sys_file` VALUES (743, 'tb_image_share_1663075500054.jpg', 'jpg', 255, 'http://localhost:9090/file/1aae9edf5c2446c8bb923b2a2ff3eb5e.jpg', 0, 1, '3ce9a01d7d72eb066f11198c6b901cc5');
INSERT INTO `sys_file` VALUES (744, 'tb_image_share_1663075503923.jpg', 'jpg', 296, 'http://localhost:9090/file/97e46185f9f943238242fb0177b6b115.jpg', 0, 1, 'ade86fac205a83bff80e0f44c6a474bb');
INSERT INTO `sys_file` VALUES (745, 'tb_image_share_1663075507821.jpg', 'jpg', 212, 'http://localhost:9090/file/a547b2839ab94c149c66b8291b2c384e.jpg', 0, 1, 'dfcc4600cf7733a398ea6c26cf4fd443');
INSERT INTO `sys_file` VALUES (746, 'tb_image_share_1663075511338.jpg', 'jpg', 787, 'http://localhost:9090/file/186c9a48b8284c97ab1a40e9d47acc78.jpg', 0, 1, 'fe3889f981fd883120288b30fe571f6a');
INSERT INTO `sys_file` VALUES (747, 'tb_image_share_1663075515314.jpg', 'jpg', 410, 'http://localhost:9090/file/a3f9c7d8c7c149eea3f69f3357f3338b.jpg', 0, 1, '39a5dea1234ff5c6a876543dd3bf3b09');
INSERT INTO `sys_file` VALUES (748, 'tb_image_share_1663076034099.jpg', 'jpg', 295, 'http://localhost:9090/file/20ad7c611eb241a48bdad16c0a358557.jpg', 0, 1, '50e270cbd577f41347f02587967abfe1');
INSERT INTO `sys_file` VALUES (749, 'tb_image_share_1663076036699.jpg', 'jpg', 245, 'http://localhost:9090/file/a5ae53c7c32447e2a2571213984ee210.jpg', 0, 1, 'a7ccd57366745cfb2c05a26e2ff59959');
INSERT INTO `sys_file` VALUES (750, 'tb_image_share_1663076038901.jpg', 'jpg', 316, 'http://localhost:9090/file/c425e4761874412f998573a94116c934.jpg', 0, 1, '0fb3e22badeeb4c714f8dd9fc7dd1880');
INSERT INTO `sys_file` VALUES (751, 'tb_image_share_1663076041490.jpg', 'jpg', 146, 'http://localhost:9090/file/eb7b67f02b1e4f5881cf6c7ca437cbb8.jpg', 0, 1, '2c70cca1803d5327a0a8aac86a39e725');
INSERT INTO `sys_file` VALUES (752, 'tb_image_share_1663076043842.jpg', 'jpg', 180, 'http://localhost:9090/file/e24ae84a81094f5b813e233d150285fe.jpg', 0, 1, 'd0cf3163c440f17530d3176fc06ad138');
INSERT INTO `sys_file` VALUES (753, 'LQ39yGXhT76j5NNvs4T_50084990631_hd_append.mp4', 'mp4', 2638, 'http://localhost:9090/file/e0921bf942bd485dbfed9c00a279bdb1.mp4', 0, 1, '352aef6105c185108ccf07115db63989');
INSERT INTO `sys_file` VALUES (754, 'tb_image_share_1663076072451.jpg', 'jpg', 318, 'http://localhost:9090/file/55783fb11605425396009b0de1938d8b.jpg', 0, 1, '71579d8a8a35c7d71f30876c5eed44c0');
INSERT INTO `sys_file` VALUES (755, 'tb_image_share_1663076076548.jpg', 'jpg', 208, 'http://localhost:9090/file/38fc0c122219495191d31a7cc4c319a8.jpg', 0, 1, '99e0faab7b9335e20a3e77b2d040fcd9');
INSERT INTO `sys_file` VALUES (756, 'tb_image_share_1663076080435.jpg', 'jpg', 321, 'http://localhost:9090/file/99c2f7700ccc4e09a41f695456785076.jpg', 0, 1, 'f7587c66de7b358febd4ef675dec8531');
INSERT INTO `sys_file` VALUES (757, 'tb_image_share_1663076084818.jpg', 'jpg', 317, 'http://localhost:9090/file/44d17b47a67a4709a088b387d9125eaa.jpg', 0, 1, '38e9e68871bec78d7422407ba074c82c');
INSERT INTO `sys_file` VALUES (758, 'tb_image_share_1663076088327.jpg', 'jpg', 222, 'http://localhost:9090/file/6d294c067dd9405aa7fb7ae747ed5eae.jpg', 0, 1, '0961e6543bafeb42ef2c535fd0e91ceb');
INSERT INTO `sys_file` VALUES (759, 'tb_image_share_1663076091750.jpg', 'jpg', 220, 'http://localhost:9090/file/e3c1b6a5620347b9b227012a4ca4402d.jpg', 0, 1, 'c8c144e144ecc1911876ce2382fa74b0');
INSERT INTO `sys_file` VALUES (760, 'tb_image_share_1663076095043.jpg', 'jpg', 276, 'http://localhost:9090/file/7a8e75b866504b8ca395b27d85cd1083.jpg', 0, 1, 'bd756e392009bed860d96bcf87439b90');
INSERT INTO `sys_file` VALUES (761, 'tb_image_share_1663076099937.jpg', 'jpg', 355, 'http://localhost:9090/file/13f9527fce0a4b368093d6b761445510.jpg', 0, 1, '7d72d1f3c7ad56123e9b2d783f77ca0f');
INSERT INTO `sys_file` VALUES (762, 'tb_image_share_1663076483709.jpg', 'jpg', 396, 'http://localhost:9090/file/71db6eff6b544d99abf55da1d83dca26.jpg', 0, 1, '2f6bbf5c8ebfcf7951377f7da9f4981c');
INSERT INTO `sys_file` VALUES (763, 'tb_image_share_1663076486156.jpg', 'jpg', 236, 'http://localhost:9090/file/b44e35745dcb4e5d833c334902a99524.jpg', 0, 1, 'f7eb5fb5880057a65fad8ca833844bcc');
INSERT INTO `sys_file` VALUES (764, 'tb_image_share_1663076488581.jpg', 'jpg', 274, 'http://localhost:9090/file/07511190f45144a997c54552aedd001f.jpg', 0, 1, '8115c47ca2f12c473621eb5ac80e515b');
INSERT INTO `sys_file` VALUES (765, 'tb_image_share_1663076491394.jpg', 'jpg', 195, 'http://localhost:9090/file/04cd537a940f4f55ac7651ad86060125.jpg', 0, 1, 'aa7ac05a56a9fd84ccf8c15d5203aa9e');
INSERT INTO `sys_file` VALUES (766, 'tb_image_share_1663076493803.jpg', 'jpg', 391, 'http://localhost:9090/file/85b37460cb434ed3b71ea47889959993.jpg', 0, 1, '80e7ddbf5f5c2e0af146010035db5cdd');
INSERT INTO `sys_file` VALUES (767, 'tb_image_share_1663076539025.jpg', 'jpg', 813, 'http://localhost:9090/file/ffe53bbb2dff436c97ecab87b06ef781.jpg', 0, 1, '68c3bac426a2c546efd3eb33878cfe8a');
INSERT INTO `sys_file` VALUES (768, 'tb_image_share_1663076552053.jpg', 'jpg', 303, 'http://localhost:9090/file/6137f90fa776434ab530cd43c5d9eb2a.jpg', 0, 1, '7c590f3d4144dcc5c3d81432d98da7e0');
INSERT INTO `sys_file` VALUES (769, 'tb_image_share_1663076555850.jpg', 'jpg', 313, 'http://localhost:9090/file/76c8a3aed9b04fc798410d0439cd2c41.jpg', 0, 1, '2b6278c71a75c93d78f417f1f9311828');
INSERT INTO `sys_file` VALUES (770, 'tb_image_share_1663076560349.jpg', 'jpg', 137, 'http://localhost:9090/file/4c9467e034dd40998a4bb412a1ef9a1f.jpg', 0, 1, 'c27e467ab460ad044cef541cf0685325');
INSERT INTO `sys_file` VALUES (771, 'tb_image_share_1663076564982.jpg', 'jpg', 244, 'http://localhost:9090/file/7d76789ceac3464fbf17252debbd2d1e.jpg', 0, 1, 'a4486f14c341f0be011e83aa11673b6e');
INSERT INTO `sys_file` VALUES (772, 'tb_image_share_1663076572875.jpg', 'jpg', 169, 'http://localhost:9090/file/609f8c0377a84ee78c2b35494e3629c4.jpg', 0, 1, '0b5ca1465187b4322e24a52aae8883c5');
INSERT INTO `sys_file` VALUES (773, 'tb_image_share_1663076578613.jpg', 'jpg', 171, 'http://localhost:9090/file/dc6ca01751b24938a48b710dc41a02a9.jpg', 0, 1, '624c9bcb9959796cc56152547ef4eabf');
INSERT INTO `sys_file` VALUES (774, 'tb_image_share_1663077141813.jpg', 'jpg', 447, 'http://localhost:9090/file/858b9461e12743bd9d83dd8a6a8281c1.jpg', 0, 1, '70385c89d38566abf19191af38a8f74a');
INSERT INTO `sys_file` VALUES (775, 'tb_image_share_1663077144300.jpg', 'jpg', 545, 'http://localhost:9090/file/53a8ef1e3640466b946bb2d086202dee.jpg', 0, 1, '3d5dbb02e4086d94644ef7df50d5e644');
INSERT INTO `sys_file` VALUES (776, 'tb_image_share_1663077146717.jpg', 'jpg', 475, 'http://localhost:9090/file/9d15fcb7194b494eb9454e2c2552262f.jpg', 0, 1, '17e0ad9deab736a85db367606e935e77');
INSERT INTO `sys_file` VALUES (777, 'tb_image_share_1663077149107.jpg', 'jpg', 558, 'http://localhost:9090/file/12562ad7debb4934b82e0b1e20ff80ab.jpg', 0, 1, '3f2433efb5e59a0f59d85eb4a8e7cf2f');
INSERT INTO `sys_file` VALUES (778, '20220906_b317e55874ca6eae_376757391154_mp4_264_hd_taobao.mp4', 'mp4', 2799, 'http://localhost:9090/file/650a999f72194cccbdf0338a8d859dd9.mp4', 0, 1, '3052c5e68795cf08adcaa07e6dea4412');
INSERT INTO `sys_file` VALUES (779, '20220906_b317e55874ca6eae_376757391154_mp4_264_hd_taobao.mp4', 'mp4', 2799, 'http://localhost:9090/file/650a999f72194cccbdf0338a8d859dd9.mp4', 0, 1, '3052c5e68795cf08adcaa07e6dea4412');
INSERT INTO `sys_file` VALUES (780, 'tb_image_share_1663077189205.jpg', 'jpg', 325, 'http://localhost:9090/file/e7440aebedb541b5ad97bcb416bad29e.jpg', 0, 1, 'ab427c490e7b729ed57079251c9fd75b');
INSERT INTO `sys_file` VALUES (781, 'tb_image_share_1663077200510.jpg', 'jpg', 756, 'http://localhost:9090/file/7b149901cf3847eda1cff36a3be8bfcf.jpg', 0, 1, '38fee4e4ecc2cf64a0982fd5bd59140f');
INSERT INTO `sys_file` VALUES (782, 'tb_image_share_1663077205651.jpg', 'jpg', 400, 'http://localhost:9090/file/d39c09ab450846a4a80a2a7319daae3c.jpg', 0, 1, '0cb649290e7c5458091a628c6fa6e263');
INSERT INTO `sys_file` VALUES (783, 'tb_image_share_1663077209954.jpg', 'jpg', 459, 'http://localhost:9090/file/f3272139da784c2ba3395c95d904d234.jpg', 0, 1, '164aa200dcf865ad69b776f5c1563c6b');
INSERT INTO `sys_file` VALUES (784, 'tb_image_share_1663077213735.jpg', 'jpg', 785, 'http://localhost:9090/file/b694694c097f4da38a7919a03044cbd4.jpg', 0, 1, '755f1e053bf95d7cc7c7098e5bb3882a');
INSERT INTO `sys_file` VALUES (785, 'tb_image_share_1663077223244.jpg', 'jpg', 1037, 'http://localhost:9090/file/8f802c58dd2e4532a1668a0e144390f8.jpg', 0, 1, '8b1c0fb05cfff760d1d9ca1cb3b8c741');
INSERT INTO `sys_file` VALUES (786, 'tb_image_share_1663077229037.jpg', 'jpg', 368, 'http://localhost:9090/file/937e6970dc964452bc540654e18b3cc3.jpg', 0, 1, '0940691518941280a65178958c50dade');
INSERT INTO `sys_file` VALUES (787, 'tb_image_share_1663077233060.jpg', 'jpg', 171, 'http://localhost:9090/file/b423fdbb617e4d7ca21da804ab20131b.jpg', 0, 1, '215fa7cc85544e37c6606be21f830ac9');
INSERT INTO `sys_file` VALUES (788, 'tb_image_share_1663077238843.jpg', 'jpg', 465, 'http://localhost:9090/file/19fc50aa00484783af621a88bc3d633c.jpg', 0, 1, 'f469861e4a43752d3ec5fc1632eb4f5f');
INSERT INTO `sys_file` VALUES (789, 'tb_image_share_1663075486420.jpg', 'jpg', 481, 'http://localhost:9090/file/899ed5a1a29645a49d9399292b7581ec.jpg', 0, 1, 'f8820779b358c11439a76b7e0d686673');
INSERT INTO `sys_file` VALUES (790, 'tb_image_share_1663075486420.jpg', 'jpg', 481, 'http://localhost:9090/file/899ed5a1a29645a49d9399292b7581ec.jpg', 0, 1, 'f8820779b358c11439a76b7e0d686673');
INSERT INTO `sys_file` VALUES (791, 'tb_image_share_1663079161916.jpg', 'jpg', 412, 'http://localhost:9090/file/e973d4ea73f2467e907cc7ea576a5d25.jpg', 0, 1, 'de3f0ff8783b6719d9157328bada3248');
INSERT INTO `sys_file` VALUES (792, 'tb_image_share_1663079164606.jpg', 'jpg', 344, 'http://localhost:9090/file/2e7cecde719841d6bdf749075ebc17a9.jpg', 0, 1, '682f186140ad8479df4832ceb14199f0');
INSERT INTO `sys_file` VALUES (793, 'tb_image_share_1663079167058.jpg', 'jpg', 281, 'http://localhost:9090/file/d0a628fbdc6c4327882e10fa9d67a80d.jpg', 0, 1, '0d3731f292b6917ae33294c6eba265d7');
INSERT INTO `sys_file` VALUES (794, 'tb_image_share_1663079169478.jpg', 'jpg', 315, 'http://localhost:9090/file/4a4453fbf1c847d3bedb46b2e477eca9.jpg', 0, 1, 'adfd9d31a9d0013a2249edce15e898e1');
INSERT INTO `sys_file` VALUES (795, 'tb_image_share_1663079172277.jpg', 'jpg', 265, 'http://localhost:9090/file/cce5ee280f3444d0ae715177c7ec47cd.jpg', 0, 1, '6030bce506d139472adc06343feef228');
INSERT INTO `sys_file` VALUES (796, 'DFDVE2PA5ntzsgDZkkA_230105944614_hd_append.mp4', 'mp4', 2003, 'http://localhost:9090/file/a53a347c6be743a0867dc697887cccc4.mp4', 0, 1, '9b184847d0f3fb602300e7b79eacc0e9');
INSERT INTO `sys_file` VALUES (797, 'tb_image_share_1663079219632.jpg', 'jpg', 159, 'http://localhost:9090/file/b5ba77d5ef094c0e888ea909ef57eaf6.jpg', 0, 1, '8e2b34f56c59e73c61a74dd524a8d654');
INSERT INTO `sys_file` VALUES (798, 'tb_image_share_1663079222883.jpg', 'jpg', 194, 'http://localhost:9090/file/bf59106ecdae40cbbe1d0731813e7bf2.jpg', 0, 1, '63d53cc5922d625d76c2bd403bd471c4');
INSERT INTO `sys_file` VALUES (799, 'tb_image_share_1663079226892.jpg', 'jpg', 544, 'http://localhost:9090/file/099608c19b5d4f6fb8af2557f6e82653.jpg', 0, 1, '2522c2faaeed42f49548ca9d19a3019c');
INSERT INTO `sys_file` VALUES (800, 'tb_image_share_1663079231547.jpg', 'jpg', 629, 'http://localhost:9090/file/06a3c36bc4fd4d52b05ecb8a62568b09.jpg', 0, 1, '073046927c4ed03fe11f3ea37f4f538a');
INSERT INTO `sys_file` VALUES (801, 'tb_image_share_1663079242459.jpg', 'jpg', 631, 'http://localhost:9090/file/f1bc81edb8cd4ee0be8b21adcaa994ae.jpg', 0, 1, 'ff6cd200061049dd0790d61b253d6646');
INSERT INTO `sys_file` VALUES (802, 'tb_image_share_1663079250263.jpg', 'jpg', 677, 'http://localhost:9090/file/554d80ee13824ae4ac9baff2d1e09c1b.jpg', 0, 1, '312f3050686221d560d85760a8abfe1c');
INSERT INTO `sys_file` VALUES (803, 'tb_image_share_1663079258652.jpg', 'jpg', 632, 'http://localhost:9090/file/54f07707116d45d480311d4eba59cd3f.jpg', 0, 1, '4ab19c03bffda57403f023c552a29d22');
INSERT INTO `sys_file` VALUES (804, 'tb_image_share_1663079275571.jpg', 'jpg', 936, 'http://localhost:9090/file/928025a6802b42d08f6d05bd1c69e277.jpg', 0, 1, 'f3397ee60b266be29011f512bb977725');
INSERT INTO `sys_file` VALUES (805, 'tb_image_share_1663075486420.jpg', 'jpg', 481, 'http://localhost:9090/file/899ed5a1a29645a49d9399292b7581ec.jpg', 0, 1, 'f8820779b358c11439a76b7e0d686673');
INSERT INTO `sys_file` VALUES (806, 'tb_image_share_1663079944442.jpg', 'jpg', 443, 'http://localhost:9090/file/5b4bdaeeab4b46a7a34534b547ee4707.jpg', 0, 1, '6820e120daf3e8b19a2126635b1ce919');
INSERT INTO `sys_file` VALUES (807, 'tb_image_share_1663079941861.jpg', 'jpg', 204, 'http://localhost:9090/file/a575dbad93374ef4832c6cc5996c99be.jpg', 0, 1, '3040d822345370960dbbe2d13d70bec6');
INSERT INTO `sys_file` VALUES (808, 'tb_image_share_1663079939117.jpg', 'jpg', 401, 'http://localhost:9090/file/94597af45ef042d39859a603d0b05331.jpg', 0, 1, 'd873ffa67efd1651c669b6151a86eeca');
INSERT INTO `sys_file` VALUES (809, 'tb_image_share_1663079935457.jpg', 'jpg', 266, 'http://localhost:9090/file/bdf7718a68f14fbba3b6664a6ecca4b5.jpg', 0, 1, '8f847ce41e2c11d20597a1f617cf8145');
INSERT INTO `sys_file` VALUES (810, 'tb_image_share_1663079987547.jpg', 'jpg', 1116, 'http://localhost:9090/file/c549e628df214b278d7b79cd25f5d228.jpg', 0, 1, '96bbfc2d86e1aad29a26b2655ef2fa4a');
INSERT INTO `sys_file` VALUES (811, 'tb_image_share_1663079991996.jpg', 'jpg', 989, 'http://localhost:9090/file/2ff8edc64e304fb293e460ed269931b4.jpg', 0, 1, 'c7fbae8443bd7ba9e276c61d981ff357');
INSERT INTO `sys_file` VALUES (812, 'tb_image_share_1663079996553.jpg', 'jpg', 619, 'http://localhost:9090/file/2749c42a8a2a41df887f476a2f9a7ead.jpg', 0, 1, '9928d4827c940d4e1010dd0fa06a1ae3');
INSERT INTO `sys_file` VALUES (813, 'tb_image_share_1663080002136.jpg', 'jpg', 923, 'http://localhost:9090/file/9908961de27b4977b179667a63f58e91.jpg', 0, 1, '296c9aacc9e11e634d35902b94b119b8');
INSERT INTO `sys_file` VALUES (814, 'tb_image_share_1663080006894.jpg', 'jpg', 1007, 'http://localhost:9090/file/ec3b4196e68741ca89ea727d7cb8ae60.jpg', 0, 1, '330adbbc58ededff95ce125c0d913ee1');
INSERT INTO `sys_file` VALUES (815, 'tb_image_share_1663080012162.jpg', 'jpg', 313, 'http://localhost:9090/file/c005f246036f44879b0984ea452289c9.jpg', 0, 1, '4d293a6b78c6d896892b1c31f39618df');
INSERT INTO `sys_file` VALUES (816, 'tb_image_share_1663080019754.jpg', 'jpg', 635, 'http://localhost:9090/file/c58f137245554132a87fe56cee77142a.jpg', 0, 1, 'ae395b3785275fd0beaeb8ffacff9cd9');
INSERT INTO `sys_file` VALUES (817, 'tb_image_share_1663080016283.jpg', 'jpg', 198, 'http://localhost:9090/file/609347d5f36c45ac904bc626cbe2a1cb.jpg', 0, 1, '627d0e2e727dc2c7163cf2387b698fca');
INSERT INTO `sys_file` VALUES (818, 'tb_image_share_1663075486420.jpg', 'jpg', 481, 'http://localhost:9090/file/899ed5a1a29645a49d9399292b7581ec.jpg', 0, 1, 'f8820779b358c11439a76b7e0d686673');
INSERT INTO `sys_file` VALUES (819, 'tb_image_share_1663080512676.jpg', 'jpg', 551, 'http://localhost:9090/file/e5fffaab984c48e6adb755bed1800167.jpg', 0, 1, '0b5d1b84a038ab00618c02fd9ca2744d');
INSERT INTO `sys_file` VALUES (820, 'tb_image_share_1663080514821.jpg', 'jpg', 461, 'http://localhost:9090/file/360bd69e1abe446d9e3bb28742f49a3e.jpg', 0, 1, '8e93bbc3d8d17a982e476cd7334f84b0');
INSERT INTO `sys_file` VALUES (821, 'tb_image_share_1663080517003.jpg', 'jpg', 501, 'http://localhost:9090/file/e333453f6d9f4a41be1d9ca0adf69a12.jpg', 0, 1, '2fddbcdc5e1d16a94c80a4b407a1d4c8');
INSERT INTO `sys_file` VALUES (822, 'tb_image_share_1663080519259.jpg', 'jpg', 229, 'http://localhost:9090/file/161b6adab7494cfbbfc4f05a446ba9c1.jpg', 0, 1, 'cfd1325ef0b6ac3730c3b65eef2a1774');
INSERT INTO `sys_file` VALUES (823, 'hTrDYVAk84HirLGx99B_325831907657_mp4_264_hd.mp4', 'mp4', 12182, 'http://localhost:9090/file/f79adcac2e8b4da3a3d73655b6b1fe65.mp4', 0, 1, '299f818b1ac74d4a41e04412ee2944d4');
INSERT INTO `sys_file` VALUES (824, '1663080559765.jpg', 'jpg', 850, 'http://localhost:9090/file/8980f958af4d4f1f9fb4062233f5c72f.jpg', 0, 1, 'bb888704837bcdfed6313f21636af0b9');
INSERT INTO `sys_file` VALUES (825, '1663080574560.jpg', 'jpg', 542, 'http://localhost:9090/file/1131eb83a93d4204b29e98efad3f8f4d.jpg', 0, 1, '42a58fc9e1e4a161d35a689fa77e3ffc');
INSERT INTO `sys_file` VALUES (826, '1663080585793.jpg', 'jpg', 469, 'http://localhost:9090/file/38a439be799b4b5f89952f620b21b127.jpg', 0, 1, 'cf75c33df9d62898ca439eb3f4433759');
INSERT INTO `sys_file` VALUES (827, '1663080585793.jpg', 'jpg', 469, 'http://localhost:9090/file/38a439be799b4b5f89952f620b21b127.jpg', 0, 1, 'cf75c33df9d62898ca439eb3f4433759');
INSERT INTO `sys_file` VALUES (828, '1663080593922.jpg', 'jpg', 524, 'http://localhost:9090/file/180f15d94a0f44cf943d46242daa5d8b.jpg', 0, 1, '33cac58a11203ae205b1da4a4fc0aa7d');
INSERT INTO `sys_file` VALUES (829, '1663080597598.jpg', 'jpg', 407, 'http://localhost:9090/file/504c64fcdaf04cad9434984eb911f9ec.jpg', 0, 1, '7f490315f1c57527fdcea1be261ca344');
INSERT INTO `sys_file` VALUES (830, '1663080600504.jpg', 'jpg', 497, 'http://localhost:9090/file/435e0bc758e947af863550cd052cad63.jpg', 0, 1, 'e4f0748ff891675255bc5389bbdd5de6');
INSERT INTO `sys_file` VALUES (831, '1663080611537.jpg', 'jpg', 248, 'http://localhost:9090/file/05f9cbf6dee2467faf39467ee58c1743.jpg', 0, 1, 'cae25f3ec2296ada710a83e06d17c394');
INSERT INTO `sys_file` VALUES (832, 'tb_image_share_1663075486420.jpg', 'jpg', 481, 'http://localhost:9090/file/899ed5a1a29645a49d9399292b7581ec.jpg', 0, 1, 'f8820779b358c11439a76b7e0d686673');
INSERT INTO `sys_file` VALUES (833, '1663080597598.jpg', 'jpg', 407, 'http://localhost:9090/file/504c64fcdaf04cad9434984eb911f9ec.jpg', 0, 1, '7f490315f1c57527fdcea1be261ca344');
INSERT INTO `sys_file` VALUES (834, '7天放心退.png', 'png', 10, 'http://localhost:9090/file/e62634cffb2a4be5ba7f63ba0dd98185.png', 0, 1, 'e8bbb0434a82c715275435d717d64286');
INSERT INTO `sys_file` VALUES (835, '7天放心退.png', 'png', 10, 'http://localhost:9090/file/e62634cffb2a4be5ba7f63ba0dd98185.png', 0, 1, 'e8bbb0434a82c715275435d717d64286');
INSERT INTO `sys_file` VALUES (836, '72小时发货.png', 'png', 4, 'http://localhost:9090/file/60cd7d6e320343948aae1b7c79dd5cdb.png', 0, 1, 'f942b5e0deb73c32a35639a8520a0398');
INSERT INTO `sys_file` VALUES (837, '72小时发货.png', 'png', 4, 'http://localhost:9090/file/60cd7d6e320343948aae1b7c79dd5cdb.png', 0, 1, 'f942b5e0deb73c32a35639a8520a0398');
INSERT INTO `sys_file` VALUES (838, '72小时发货.png', 'png', 4, 'http://localhost:9090/file/60cd7d6e320343948aae1b7c79dd5cdb.png', 0, 1, 'f942b5e0deb73c32a35639a8520a0398');
INSERT INTO `sys_file` VALUES (839, '72小时发货.png', 'png', 4, 'http://localhost:9090/file/60cd7d6e320343948aae1b7c79dd5cdb.png', 0, 1, 'f942b5e0deb73c32a35639a8520a0398');
INSERT INTO `sys_file` VALUES (840, '72小时发货.png', 'png', 4, 'http://localhost:9090/file/60cd7d6e320343948aae1b7c79dd5cdb.png', 0, 1, 'f942b5e0deb73c32a35639a8520a0398');
INSERT INTO `sys_file` VALUES (841, '72.png', 'png', 4, 'http://localhost:9090/file/60cd7d6e320343948aae1b7c79dd5cdb.png', 0, 1, 'f942b5e0deb73c32a35639a8520a0398');
INSERT INTO `sys_file` VALUES (842, 'v2-5b45adba5e22eae5918b3943036e844f_720w.jpg', 'jpg', 56, 'http://localhost:9090/file/8dd95b8df79d4c71917857b790e17c4f.jpg', 0, 1, 'f6a75c8a09d6af354650f5922d82b725');
INSERT INTO `sys_file` VALUES (843, 'v2-d3442bf1f70005176cb204a30b0c774f_720w.jpg', 'jpg', 42, 'http://localhost:9090/file/1f767536022d44f580cf42d7316cd729.jpg', 0, 1, 'e1d82a29528c77f2fde750bd8d8ec863');
INSERT INTO `sys_file` VALUES (844, '72.png', 'png', 4, 'http://localhost:9090/file/60cd7d6e320343948aae1b7c79dd5cdb.png', 0, 1, 'f942b5e0deb73c32a35639a8520a0398');
INSERT INTO `sys_file` VALUES (845, '闪电.png', 'png', 4, 'http://localhost:9090/file/8b64606fa57f4781a751a5e5ff4a6188.png', 0, 1, '70f58ceb89236d58f448a340f43ee451');
INSERT INTO `sys_file` VALUES (846, '退.png', 'png', 11, 'http://localhost:9090/file/03247dd73a6c42e6ab846371a5273ba4.png', 0, 1, '5d61abc999522f25e2c21b4a6c29fa22');
INSERT INTO `sys_file` VALUES (847, 'olive-oil-1412361_1920.jpg', 'jpg', 494, 'http://localhost:9090/file/ee9bba99dc954909a83f2141a3607aac.jpg', 0, 1, '3e8a370a505aad328d35833af8e8b753');
INSERT INTO `sys_file` VALUES (848, '7e34a4c522024cc5aee5f13709934870.jpg', 'jpg', 268, 'http://localhost:9090/file/7e34a4c522024cc5aee5f13709934870.jpg', 0, 1, 'cb595647aa59c7b5a729c25166e087bd');
INSERT INTO `sys_file` VALUES (849, '7e34a4c522024cc5aee5f13709934870.jpg', 'jpg', 268, 'http://localhost:9090/file/7e34a4c522024cc5aee5f13709934870.jpg', 0, 1, 'cb595647aa59c7b5a729c25166e087bd');
INSERT INTO `sys_file` VALUES (850, '2da085d443b0417fadc9d43792e15a4b.jpg', 'jpg', 418, 'http://localhost:9090/file/2da085d443b0417fadc9d43792e15a4b.jpg', 0, 1, 'e3346d356caff8c7a115ea98a1090466');
INSERT INTO `sys_file` VALUES (851, 'c76ac516d93e7c78cdefd2774e6a350e.png', 'png', 53, 'http://localhost:9090/file/dfd0df1ad6f14f768e7458d3a5832ad3.png', 0, 1, '425776a59cda52f4c173e81949460aa4');
INSERT INTO `sys_file` VALUES (852, '头像.jpg', 'jpg', 922, 'http://localhost:9090/file/de32f8a2855449bcbc67e66d49dee418.jpg', 0, 1, 'c562f4f8a857b8882bff61af43c717c9');
INSERT INTO `sys_file` VALUES (853, '芒果4.png', 'png', 940, 'http://localhost:9090/file/c050161914034c8588bf0ffd1239984d.png', 1, 1, 'c0ccbc0f35d0998712a9174895cd5003');
INSERT INTO `sys_file` VALUES (854, '芒果2.png', 'png', 1236, 'http://localhost:9090/file/be04619ccb144c6bbe8fbf76888b7505.png', 0, 1, '96ee4009ab8f2b0319e6e631d28d8690');
INSERT INTO `sys_file` VALUES (855, '1702104191449.png', 'png', 895, 'http://localhost:9090/file/9354590e330f4504be8f6c0a82a7c680.png', 0, 1, '3a45471fc256a432d1b5c8261f7ed4fd');
INSERT INTO `sys_file` VALUES (856, '芒果2.png', 'png', 1236, 'http://localhost:9090/file/be04619ccb144c6bbe8fbf76888b7505.png', 0, 1, '96ee4009ab8f2b0319e6e631d28d8690');
INSERT INTO `sys_file` VALUES (857, '芒果3.png', 'png', 883, 'http://localhost:9090/file/c7dfe05154a0479ca7b6090e155c52c7.png', 0, 1, 'e26e4abdbf6224fc76e1f32b3468624c');
INSERT INTO `sys_file` VALUES (858, '芒果4.png', 'png', 940, 'http://localhost:9090/file/c050161914034c8588bf0ffd1239984d.png', 0, 1, 'c0ccbc0f35d0998712a9174895cd5003');
INSERT INTO `sys_file` VALUES (859, '芒果一.png', 'png', 945, 'http://localhost:9090/file/79f52a531d2c40788f9f3bfaccf7649b.png', 0, 1, '204867a6ce52ed615f1df4ffbbdd3c55');
INSERT INTO `sys_file` VALUES (860, 'wu.sql', 'sql', 234, 'http://localhost:9090/file/60efd561dcf14f40ad93374193e836ae.sql', 0, 1, '5e47efd7725c7d7053e3a118ae624683');

-- ----------------------------
-- Table structure for sys_live
-- ----------------------------
DROP TABLE IF EXISTS `sys_live`;
CREATE TABLE `sys_live`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '直播id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '直播名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '直播封面',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `user_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像地址',
  `live_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '直播地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_live
-- ----------------------------
INSERT INTO `sys_live` VALUES (8, '小猪熊的直播间', 'http://localhost:9090/file/504c64fcdaf04cad9434984eb911f9ec.jpg', '欢迎大家', 'http://localhost:9090/file/09a17dc4f5f94c51aaa06c2ce542531c.jpg', 'http://10.22.43.68/flv?port=7933&app=hls&stream=qwe');

-- ----------------------------
-- Table structure for sys_live_product
-- ----------------------------
DROP TABLE IF EXISTS `sys_live_product`;
CREATE TABLE `sys_live_product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `live_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_live_product
-- ----------------------------
INSERT INTO `sys_live_product` VALUES (3, 8, 35);
INSERT INTO `sys_live_product` VALUES (4, 8, 36);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (13, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home');
INSERT INTO `sys_menu` VALUES (14, '系统管理', '', 'el-icon-s-grid', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (15, '用户管理', '/user', 'el-icon-s-custom', NULL, 14, 'User');
INSERT INTO `sys_menu` VALUES (16, '文件管理', '/file', 'el-icon-document', NULL, 14, 'File');
INSERT INTO `sys_menu` VALUES (17, '角色管理', '/role', 'el-icon-user', NULL, 14, 'Role');
INSERT INTO `sys_menu` VALUES (18, '菜单管理', '/menu', 'el-icon-menu', NULL, 14, 'Menu');
INSERT INTO `sys_menu` VALUES (25, '商品管理', NULL, 'el-icon-goods', NULL, NULL, NULL);
INSERT INTO `sys_menu` VALUES (26, '轮播图管理', '/rotation', 'el-icon-picture-outline', NULL, NULL, 'Rotation');
INSERT INTO `sys_menu` VALUES (27, '商品列表', '/product', 'el-icon-tickets', NULL, 25, 'Product');
INSERT INTO `sys_menu` VALUES (28, '购物车管理', '/cart', 'el-icon-shopping-cart-2', NULL, NULL, 'Cart');
INSERT INTO `sys_menu` VALUES (29, '订单管理', '/orders', 'el-icon-goods', NULL, NULL, 'Orders');
INSERT INTO `sys_menu` VALUES (30, '收藏管理', '/collection', 'el-icon-picture-outline', NULL, NULL, 'Collection');
INSERT INTO `sys_menu` VALUES (31, '商品分类管理', '/classification', 'el-icon-shopping-cart-2', NULL, 25, 'Classification');
INSERT INTO `sys_menu` VALUES (32, '添加商品', '/addproduct', 'el-icon-tickets', NULL, 25, 'AddProduct');
INSERT INTO `sys_menu` VALUES (33, '公告管理', '/article', 'el-icon-shopping-cart-2', NULL, NULL, 'Article');

-- ----------------------------
-- Table structure for sys_orders
-- ----------------------------
DROP TABLE IF EXISTS `sys_orders`;
CREATE TABLE `sys_orders`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编号',
  `all_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `state` int NULL DEFAULT NULL COMMENT '状态',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `pay_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '付款时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '订单是否删除',
  `is_cancel` tinyint(1) NULL DEFAULT 0 COMMENT '订单是否取消',
  `alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付宝交易号',
  `delivery_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货时间',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货电话',
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_orders
-- ----------------------------
INSERT INTO `sys_orders` VALUES (105, '绿植真花鹤', '202312261703553904774', 449.00, 6, 33, '2023-12-27 11:03:51', '2023-12-27 11:03:51', '2023-12-27 11:03:51', 0, 0, NULL, '2024-01-03 09:23:46', '中国', '13177646583', '张三');
INSERT INTO `sys_orders` VALUES (106, '绿植真花鹤', '202312291703841846784', 898.00, 4, 44, '2023-12-29T17:24:15.332', '2023-12-29 17:24:06', '2023-12-29 17:24:06', 0, 0, NULL, '2023-12-29 17:24:53', '中国', '15655435465', '老王');
INSERT INTO `sys_orders` VALUES (107, '枸杞子宁夏特级500g正宗大颗粒红苟杞', '202312291703842153903', 232.00, 4, 33, '2023-12-29T17:29:15.317', '2023-12-29 17:29:13', '2023-12-29 17:29:13', 0, 0, NULL, '2024-01-03 09:38:16', '中国', '13177646583', '张三');
INSERT INTO `sys_orders` VALUES (108, '大蒜', '202401031704245008044', 8.07, 4, 33, '2024-01-03T09:23:36.272', '2024-01-03 09:23:28', '2024-01-03 09:23:28', 0, 0, NULL, '2024-01-03 09:38:14', '中国', '13177646583', '张三');
INSERT INTO `sys_orders` VALUES (109, '草莓种籽子四季播种结果好种易活阳台室内外花卉盆栽植物花种籽子', '202401031704245626768', 48.00, 4, 33, '2024-01-03T09:33:59.201', '2024-01-03 09:33:46', '2024-01-03 09:33:46', 0, 0, NULL, '2024-01-03 09:38:13', '中国', '13177646583', '张三');

-- ----------------------------
-- Table structure for sys_orders_product
-- ----------------------------
DROP TABLE IF EXISTS `sys_orders_product`;
CREATE TABLE `sys_orders_product`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` int NULL DEFAULT NULL COMMENT '订单id',
  `product_id` int NULL DEFAULT NULL COMMENT '商品id',
  `num` int NULL DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2120232962 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_orders_product
-- ----------------------------
INSERT INTO `sys_orders_product` VALUES (-2080288766, 24, 7, 1);
INSERT INTO `sys_orders_product` VALUES (-2069856255, 82, 14, 1);
INSERT INTO `sys_orders_product` VALUES (-2038304766, 34, 17, 4);
INSERT INTO `sys_orders_product` VALUES (-2021457919, 107, 59, 4);
INSERT INTO `sys_orders_product` VALUES (-2021007358, 89, 67, 2);
INSERT INTO `sys_orders_product` VALUES (-1924567039, 97, 41, 1);
INSERT INTO `sys_orders_product` VALUES (-1895202815, 91, 62, 1);
INSERT INTO `sys_orders_product` VALUES (-1849581567, 28, 16, 100);
INSERT INTO `sys_orders_product` VALUES (-1847525374, 43, 34, 1);
INSERT INTO `sys_orders_product` VALUES (-1839161342, 39, 31, 1);
INSERT INTO `sys_orders_product` VALUES (-1803354110, 106, 55, 2);
INSERT INTO `sys_orders_product` VALUES (-1683967998, 76, 31, 1);
INSERT INTO `sys_orders_product` VALUES (-1660817406, 36, 13, 1);
INSERT INTO `sys_orders_product` VALUES (-1512001535, NULL, 32, 3);
INSERT INTO `sys_orders_product` VALUES (-1495220222, 46, 32, 1);
INSERT INTO `sys_orders_product` VALUES (-1390366718, NULL, 34, 1);
INSERT INTO `sys_orders_product` VALUES (-1371484159, 18, 17, 9);
INSERT INTO `sys_orders_product` VALUES (-1337966591, 27, 12, 11);
INSERT INTO `sys_orders_product` VALUES (-1304334335, 13, 16, 1);
INSERT INTO `sys_orders_product` VALUES (-1203146750, 96, 43, 1);
INSERT INTO `sys_orders_product` VALUES (-1142898686, 74, 31, 1);
INSERT INTO `sys_orders_product` VALUES (-1098268670, 93, 64, 1);
INSERT INTO `sys_orders_product` VALUES (-1071566846, 58, 34, 1);
INSERT INTO `sys_orders_product` VALUES (-1054834686, 77, 32, 1);
INSERT INTO `sys_orders_product` VALUES (-1023201278, 108, 35, 3);
INSERT INTO `sys_orders_product` VALUES (-1002311678, 31, 11, 10);
INSERT INTO `sys_orders_product` VALUES (-1001791486, 90, 42, 3);
INSERT INTO `sys_orders_product` VALUES (-920575999, 70, 32, 7);
INSERT INTO `sys_orders_product` VALUES (-876584959, 26, 7, 4);
INSERT INTO `sys_orders_product` VALUES (-849305598, 59, 32, 1);
INSERT INTO `sys_orders_product` VALUES (-817770495, 19, 16, 1);
INSERT INTO `sys_orders_product` VALUES (-757030911, 60, 34, 1);
INSERT INTO `sys_orders_product` VALUES (-738070526, 33, 15, 1);
INSERT INTO `sys_orders_product` VALUES (-725590015, 22, 7, 3);
INSERT INTO `sys_orders_product` VALUES (-603447295, 94, 46, 5);
INSERT INTO `sys_orders_product` VALUES (-582889470, 20, 16, 1);
INSERT INTO `sys_orders_product` VALUES (-509595647, 99, 35, 1);
INSERT INTO `sys_orders_product` VALUES (-446668798, 62, 32, 2);
INSERT INTO `sys_orders_product` VALUES (-404697086, 61, 34, 1);
INSERT INTO `sys_orders_product` VALUES (-287277055, 81, 31, 1);
INSERT INTO `sys_orders_product` VALUES (-257921022, 75, 32, 1);
INSERT INTO `sys_orders_product` VALUES (-253698047, NULL, 34, 1);
INSERT INTO `sys_orders_product` VALUES (-169811967, NULL, 32, 1);
INSERT INTO `sys_orders_product` VALUES (-102674430, 98, 36, 1);
INSERT INTO `sys_orders_product` VALUES (-83636222, 104, 59, 1);
INSERT INTO `sys_orders_product` VALUES (-56578046, 83, 12, 1);
INSERT INTO `sys_orders_product` VALUES (-10452990, 78, 32, 1);
INSERT INTO `sys_orders_product` VALUES (27287553, 66, 32, 1);
INSERT INTO `sys_orders_product` VALUES (75743234, 109, 57, 4);
INSERT INTO `sys_orders_product` VALUES (239161346, 25, 15, 1);
INSERT INTO `sys_orders_product` VALUES (253825026, 56, 34, 1);
INSERT INTO `sys_orders_product` VALUES (255877121, 21, 7, 3);
INSERT INTO `sys_orders_product` VALUES (297832449, 37, 7, 1);
INSERT INTO `sys_orders_product` VALUES (362881025, 73, 32, 7);
INSERT INTO `sys_orders_product` VALUES (365031425, 35, 13, 1);
INSERT INTO `sys_orders_product` VALUES (379609090, 67, 32, 1);
INSERT INTO `sys_orders_product` VALUES (507592706, 32, 7, 1);
INSERT INTO `sys_orders_product` VALUES (534806530, 79, 32, 1);
INSERT INTO `sys_orders_product` VALUES (559939586, 51, 13, 1);
INSERT INTO `sys_orders_product` VALUES (673259521, 72, 32, 1);
INSERT INTO `sys_orders_product` VALUES (689975298, 40, 32, 1);
INSERT INTO `sys_orders_product` VALUES (708853762, 38, 31, 1);
INSERT INTO `sys_orders_product` VALUES (738844673, 88, 35, 1);
INSERT INTO `sys_orders_product` VALUES (796954625, 29, 16, 1);
INSERT INTO `sys_orders_product` VALUES (805945346, 92, 41, 1);
INSERT INTO `sys_orders_product` VALUES (861954050, 63, 32, 6);
INSERT INTO `sys_orders_product` VALUES (894033922, 86, 36, 3);
INSERT INTO `sys_orders_product` VALUES (920662017, 54, 32, 1);
INSERT INTO `sys_orders_product` VALUES (935440385, 30, 16, 1);
INSERT INTO `sys_orders_product` VALUES (941645826, 64, 34, 1);
INSERT INTO `sys_orders_product` VALUES (952639490, 95, 36, 1);
INSERT INTO `sys_orders_product` VALUES (969048065, 100, 66, 13);
INSERT INTO `sys_orders_product` VALUES (985911298, 105, 55, 1);
INSERT INTO `sys_orders_product` VALUES (1024057345, 87, 37, 1);
INSERT INTO `sys_orders_product` VALUES (1075863554, 68, 32, 10);
INSERT INTO `sys_orders_product` VALUES (1137213442, 84, 64, 1);
INSERT INTO `sys_orders_product` VALUES (1218469889, 69, 32, 3);
INSERT INTO `sys_orders_product` VALUES (1242071041, 85, 39, 1);
INSERT INTO `sys_orders_product` VALUES (1403060226, 45, 34, 1);
INSERT INTO `sys_orders_product` VALUES (1486913538, 80, 31, 1);
INSERT INTO `sys_orders_product` VALUES (1507926017, 71, 32, 7);
INSERT INTO `sys_orders_product` VALUES (1537257473, 57, 34, 1);
INSERT INTO `sys_orders_product` VALUES (1853976577, 14, 13, 1);
INSERT INTO `sys_orders_product` VALUES (1948319745, 42, 13, 1);
INSERT INTO `sys_orders_product` VALUES (1994448898, 52, 32, 1);
INSERT INTO `sys_orders_product` VALUES (2015387649, 65, 32, 4);
INSERT INTO `sys_orders_product` VALUES (2057318402, 41, 34, 1);
INSERT INTO `sys_orders_product` VALUES (2065752065, 53, 34, 2);
INSERT INTO `sys_orders_product` VALUES (2090926081, 44, 12, 29);
INSERT INTO `sys_orders_product` VALUES (2097197058, 17, 15, 2);
INSERT INTO `sys_orders_product` VALUES (2120232961, 55, 32, 2);

-- ----------------------------
-- Table structure for sys_product
-- ----------------------------
DROP TABLE IF EXISTS `sys_product`;
CREATE TABLE `sys_product`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `store` int NULL DEFAULT NULL COMMENT '库存',
  `sold_num` int NULL DEFAULT 0 COMMENT '销量',
  `sell_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品图片',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `classification_id` int NULL DEFAULT NULL COMMENT '商品种类',
  `put_on_the_shelf` tinyint(1) NULL DEFAULT 1 COMMENT '是否上架',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `is_daily` tinyint(1) NULL DEFAULT 0 COMMENT '是否每日推荐',
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '视频地址',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发货地点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_product
-- ----------------------------
INSERT INTO `sys_product` VALUES (35, '真大蒜', 78, 22, 2.69, 'http://localhost:9090/file/7ac41096e1464de58eb02c10bc7cfa35.jpg', '蒜香浓郁', '500g ± 50g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 5, 1, 0, 0, 'http://localhost:9090/file/f1aff158795f42deaa010fe059372d52.mp4', '随州市');
INSERT INTO `sys_product` VALUES (36, '香糯小紫薯', 95, 5, 1.69, 'http://localhost:9090/file/87b74483327347518c0351479db453d5.jpg', '新鲜粉糯', '500g±50g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 5, 1, 0, 0, 'http://localhost:9090/file/be08677486c94415bd9afaecf9593483.mp4', '随州市');
INSERT INTO `sys_product` VALUES (37, '广西荔浦芋头', 99, 1, 6.99, 'http://localhost:9090/file/a5ef51a145054f3f8ef5bb3398dd239f.jpg', '松软不粘牙', '550g±100g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 5, 1, 0, 0, 'http://localhost:9090/file/f1547be847174be1b394da4e7ad345dc.mp4', '随州市');
INSERT INTO `sys_product` VALUES (38, '娃娃菜新鲜高山露天娃娃菜黄心菜大白菜火锅菜麻辣烫烧烤菜包邮', 100, 0, 5.99, 'http://localhost:9090/file/0d6c090a3a394d9ca144804b72fdc0c8.jpg', '丰富微元素 清甜水润 脆嫩微甜', '1000g±20g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 5, 1, 0, 0, 'http://localhost:9090/file/cb0b0f154de74b869946b38fc59c6f5a.mp4', '随州市');
INSERT INTO `sys_product` VALUES (39, '东北卤水豆腐纯手工现磨 鲜豆腐 嫩豆腐', 99, 1, 15.80, 'http://localhost:9090/file/cbdda617aa9b447e873e7acc40a1455f.jpg', '回味醇香', '1000g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 5, 1, 1, 0, 'http://localhost:9090/file/eae05c8e361543198a6dfc59883ebf89.mp4', '随州市');
INSERT INTO `sys_product` VALUES (40, '四川会理突尼斯软籽石榴新鲜水果', 10, 0, 6.99, 'http://localhost:9090/file/61e3d11a243142a3b560f3c97c403824.jpg', '清甜好滋味', '1000g±50g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 4, 1, 0, 0, 'http://localhost:9090/file/151e915a61914e4293bb3a2ace3703cf.mp4', '随州市');
INSERT INTO `sys_product` VALUES (41, '阳光玫瑰', 98, 2, 8.99, 'http://localhost:9090/file/24601a2175f84b0b8fa055303299cfa2.jpg', '脆甜爆汁', '500g±50g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 4, 1, 0, 0, 'http://localhost:9090/file/99151b627f0c42dc9c9af5722fc170ac.mp4', '随州市');
INSERT INTO `sys_product` VALUES (42, '蓝宝石金手指无籽黑提', 97, 3, 11.99, 'http://localhost:9090/file/4c575a5a87164c12b2778ada369af162.jpg', '优质好果 果肉细腻', '500g±50g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 4, 1, 0, 0, 'http://localhost:9090/file/244ef2416d6e4508a5ff3216ce2a962c.mp4', '随州市');
INSERT INTO `sys_product` VALUES (43, '本地西瓜新景玉', 0, 1, 10.99, 'http://localhost:9090/file/916f4ab3434b45ab975f8acbffafb36f.jpg', '果肉香甜爽口', '6斤±1斤', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 4, 1, 0, 0, 'http://localhost:9090/file/c8662fa8ae874d8db4fa04f466dbc3e7.mp4', '随州市');
INSERT INTO `sys_product` VALUES (44, '四川攀枝花凯特芒果', 100, 0, 8.99, 'http://localhost:9090/file/613310fadc2f4359a4021022cb52ded5.jpg', '舌尖甜到心头', '3斤±0.5斤', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 4, 1, 0, 0, 'http://localhost:9090/file/0a91a11410ad48fd9b60cb5ede0bb6cb.mp4', '随州市');
INSERT INTO `sys_product` VALUES (45, '青岛特大青虾', 100, 0, 169.00, 'http://localhost:9090/file/8256ad95d5484a33bdad03b9fc9a1a3d.jpg', '鲜活速冻 天然海域', '1400g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 12, 1, 0, 1, 'http://localhost:9090/file/0752f559d22348f9a3e21b7e7e250bff.mp4', '随州市');
INSERT INTO `sys_product` VALUES (46, '古原鸟鹌鹑蛋生蛋新鲜50枚', 95, 5, 180.00, 'http://localhost:9090/file/972e1cf5ec3a4ed090bccd67d5f4d3b6.jpg', '野生喂养 味道鲜美 没有激素', '60枚', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 12, 1, 0, 0, 'http://localhost:9090/file/acf8fece0808491b9507219711c0cbc7.mp4', '随州市');
INSERT INTO `sys_product` VALUES (47, '黑猪排骨新鲜现杀猪小排纯肋排', 100, 0, 336.00, 'http://localhost:9090/file/945eacbb9793451ebe23584b4234bb2c.jpg', '肉质饱满 纯小排骨', '3斤', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 12, 1, 0, 0, 'http://localhost:9090/file/ead630d9803e4b2b99e4a7c1d7813f8a.mp4', '随州市');
INSERT INTO `sys_product` VALUES (48, '中华鳖王八水鱼', 100, 0, 898.00, 'http://localhost:9090/file/22d105d5d4e14926a386ebd7f22ae34d.jpg', '生态甲鱼 自然生长 生态养殖', '3斤', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 12, 1, 0, 0, 'http://localhost:9090/file/1310c9b473e8458abb42867d00373c42.mp4', '随州市');
INSERT INTO `sys_product` VALUES (49, '新鲜超大多宝鱼鲜活冷冻', 100, 0, 366.00, 'http://localhost:9090/file/e40e08dab1ae4567b92eafd2dbd58be5.jpg', '色泽诱人 地道海味', '3条装', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 12, 1, 0, 0, 'http://localhost:9090/file/a38012a2cda94d78bc1feea002d82455.mp4', '随州市');
INSERT INTO `sys_product` VALUES (50, '【绿色食品】欧亚高原全脂纯牛奶250g*24盒', 1001, 0, 86.00, 'http://localhost:9090/file/7bbd26adc959469c8728f0163a37db9f.jpg', '严格质检 保证质量', '250g*24盒', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 7, 1, 0, 0, 'http://localhost:9090/file/bda77c671bac47dfbe20686722849e38.mp4', '随州市');
INSERT INTO `sys_product` VALUES (51, '天地精华天然矿泉水', 150, 0, 109.00, 'http://localhost:9090/file/68245f780129427b8c4a0156d7725173.jpg', '绿色食品 严格质量', '550ml*20', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 7, 1, 0, 0, 'http://localhost:9090/file/ee18e83fa3544af1804d8fd205ca9dd9.mp4', '随州市');
INSERT INTO `sys_product` VALUES (52, '赤霞珠92干红葡萄酒', 1000, 0, 128.00, 'http://localhost:9090/file/0310d31a3edb410a8fb0b47f976207ab.jpg', '手工酿造 人工挑选', '750ml', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 7, 1, 0, 0, NULL, '随州市');
INSERT INTO `sys_product` VALUES (53, '神内胡萝卜汁', 100, 0, 105.00, 'http://localhost:9090/file/7261749276fa4b7988743db04c399500.jpg', '新鲜果蔬 绿色认证', '238ml*10瓶', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 7, 1, 0, 0, NULL, '随州市');
INSERT INTO `sys_product` VALUES (54, '桑椹汁', 100, 0, 55.00, 'http://localhost:9090/file/6ea850f6ad2f41e8b639fad2187c5d1c.jpg', '人工采摘 科学配比', '180ml*12瓶', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 7, 1, 0, 0, 'http://localhost:9090/file/03aa2d04ff99490293ec26d1b6334704.mp4', '随州市');
INSERT INTO `sys_product` VALUES (55, '绿植真花鹤', 97, 3, 449.00, 'http://localhost:9090/file/42eaaf94bd80427db0b5a2f54bd17a56.jpg', '除甲醛 侘寂风', '一盆绿植', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 8, 1, 0, 1, 'http://localhost:9090/file/914c0c26a6914420a3d4f92bcf129b22.mp4', '随州市');
INSERT INTO `sys_product` VALUES (56, '小雏菊种子四季播种开花室内室外盆栽花卉好养易活花种子籽孑花籽', 1000, 0, 15.80, 'http://localhost:9090/file/4617fa7792424841b954c52fdb880753.jpg', '盆栽花卉 好养易活', '200粒', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 8, 1, 0, 0, 'http://localhost:9090/file/091453a5350244179c17c6dac6529bf6.mp4', '随州市');
INSERT INTO `sys_product` VALUES (57, '草莓种籽子四季播种结果好种易活阳台室内外花卉盆栽植物花种籽子', 96, 4, 12.00, 'http://localhost:9090/file/208f7858605e478fbb758f686ce11078.jpg', '观花种子 春意浓园艺', '100粒', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 8, 1, 0, 1, 'http://localhost:9090/file/79ef1ba7e84a45edba4e69445aa6cf9c.mp4', '随州市');
INSERT INTO `sys_product` VALUES (58, '桂花树苗盆栽四季常青花卉沉香嫁接八月金桂丹桂庭院室内阳台植物', 1000, 0, 388.00, 'http://localhost:9090/file/40da55899a694656bcd4206b410b68ba.jpg', '阳台植物 四季常青', '一棵树苗', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 8, 1, 0, 0, 'http://localhost:9090/file/129eb5f61c564b3e8ac399ed3b66b53f.mp4', '随州市');
INSERT INTO `sys_product` VALUES (59, '枸杞子宁夏特级500g正宗大颗粒红苟杞', 994, 6, 58.00, 'http://localhost:9090/file/fa5240aad7e54b158077af769e4b6133.jpg', '源出宁夏 没有添加', '500g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 10, 1, 0, 1, 'http://localhost:9090/file/744332ef584747e6bb9c03b9edc0c4b0.mp4', '随州市');
INSERT INTO `sys_product` VALUES (60, '纯藕粉', 1000, 0, 178.14, 'http://localhost:9090/file/b066e644839a4270bccebfdf231c2d2a.jpg', '手削原味 0糖0脂', '225g/罐', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 10, 1, 0, 1, 'http://localhost:9090/file/f8a487825fa84e61b5995ee38397045a.mp4', '随州市');
INSERT INTO `sys_product` VALUES (61, '葡萄干新疆特级超大绿香妃', 100, 0, 75.00, 'http://localhost:9090/file/ab16838655d4455f8b3ad7e7392224a4.jpg', '皮薄香甜 香酸甜', '1000g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 10, 1, 0, 0, 'http://localhost:9090/file/3941bcb6025f49ddb4c25e21ae61be91.mp4', '随州市');
INSERT INTO `sys_product` VALUES (62, '土耳其开心果', 99, 1, 199.00, 'http://localhost:9090/file/72241559ad1046da9000735cdeea5991.jpg', '无漂白无添加剂 进口坚果', '500g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 10, 1, 0, 1, NULL, '随州市');
INSERT INTO `sys_product` VALUES (63, '东北五常长粒香米', 1000, 0, 35.90, 'http://localhost:9090/file/2da085d443b0417fadc9d43792e15a4b.jpg', '一级粳米 香甜', '10斤', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 13, 1, 0, 0, 'http://localhost:9090/file/7546bed6ba564dd890dbfea1f9a82a90.mp4', '随州市');
INSERT INTO `sys_product` VALUES (64, '千岁好山茶油2000ml压榨一级油茶籽油', 98, 2, 228.00, 'http://localhost:9090/file/bc953081d89e4ea89f7e948f46642bfb.jpg', '一级油茶籽油 远离污染', '2000ml', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 13, 1, 0, 1, 'http://localhost:9090/file/f699a7d6305e40b99fdccdb41819916e.mp4', '随州市');
INSERT INTO `sys_product` VALUES (65, '海湾无碘海盐', 100, 0, 96.00, 'http://localhost:9090/file/20ad7c611eb241a48bdad16c0a358557.jpg', '不含抗结剂 不加碘食用盐', ' 350g*6袋', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 13, 1, 0, 1, 'http://localhost:9090/file/e0921bf942bd485dbfed9c00a279bdb1.mp4', '随州市');
INSERT INTO `sys_product` VALUES (66, '豆黄金腐竹', 87, 13, 329.00, 'http://localhost:9090/file/71db6eff6b544d99abf55da1d83dca26.jpg', '原浆无添加剂 非转基因', '1001g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 13, 1, 0, 0, NULL, '随州市');
INSERT INTO `sys_product` VALUES (67, '舟山梭子蟹', 98, 2, 398.00, 'http://localhost:9090/file/858b9461e12743bd9d83dd8a6a8281c1.jpg', '海捕螃蟹飞蟹 肉质新鲜', '1.5kg', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 11, 1, 0, 1, 'http://localhost:9090/file/650a999f72194cccbdf0338a8d859dd9.mp4', '随州市');
INSERT INTO `sys_product` VALUES (68, '马来西亚猫山王榴莲果肉', 100, 0, 258.00, 'http://localhost:9090/file/e973d4ea73f2467e907cc7ea576a5d25.jpg', '新鲜冷冻纯榴莲泥 包邮 无核', '500g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 11, 1, 0, 0, 'http://localhost:9090/file/a53a347c6be743a0867dc697887cccc4.mp4', '随州市');
INSERT INTO `sys_product` VALUES (69, '澳洲M9和牛原切牛排', 100, 0, 699.00, 'http://localhost:9090/file/5b4bdaeeab4b46a7a34534b547ee4707.jpg', '神户牛肉 原切 M9', '600g', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 11, 1, 0, 1, NULL, '随州市');
INSERT INTO `sys_product` VALUES (70, '梅花鹿肉', 99, 1, 328.00, 'http://localhost:9090/file/e5fffaab984c48e6adb755bed1800167.jpg', '健康美味 草饲散养', '2斤', '2023-12-07 23:14:38', '2024-11-22 01:04:09', 11, 1, 0, 1, 'http://localhost:9090/file/f79adcac2e8b4da3a3d73655b6b1fe65.mp4', '随州市');
INSERT INTO `sys_product` VALUES (72, '芒果', 133, 0, 12.00, 'http://localhost:9090/file/9354590e330f4504be8f6c0a82a7c680.png', '很好吃的芒果', '元', '2023-12-29 09:33:55', '2024-11-22 01:04:09', 4, 1, 1, 1, NULL, '随州市');
INSERT INTO `sys_product` VALUES (73, '123', 123, 0, 123.00, NULL, '123', '123', '2023-12-29 16:05:01', '2024-11-22 01:04:09', 4, 1, 1, 1, NULL, '随州市');
INSERT INTO `sys_product` VALUES (74, '123', 123, 0, 123.00, NULL, '123', '123', '2023-12-29 16:07:40', '2024-11-22 01:04:09', 4, 1, 1, 1, NULL, '随州市');
INSERT INTO `sys_product` VALUES (75, '123', 123, 0, 123.00, NULL, '123', '12', '2024-01-03 09:39:24', '2024-11-22 01:04:09', 4, 1, 1, 1, NULL, '随州市');

-- ----------------------------
-- Table structure for sys_product_img
-- ----------------------------
DROP TABLE IF EXISTS `sys_product_img`;
CREATE TABLE `sys_product_img`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` int NULL DEFAULT NULL COMMENT '商品id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'url',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_product_img
-- ----------------------------
INSERT INTO `sys_product_img` VALUES (49, 35, 'http://localhost:9090/file/4c9c8984551945c59f75b4fe086c21bf.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (50, 35, 'http://localhost:9090/file/e37d2a215a4e4765a858a597f7eaa41e.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (51, 35, 'http://localhost:9090/file/a465793ba09f448892ce0156861a7890.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (52, 35, 'http://localhost:9090/file/38f06e84aa1c4ee6a53b437a51d7d56b.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (53, NULL, '', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (54, NULL, '', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (55, 36, 'http://localhost:9090/file/c484a6f05ac844889f9d6c3731d4808e.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (56, 36, 'http://localhost:9090/file/e5d4fac3b2a749d782f085f01f05dac1.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (57, 36, 'http://localhost:9090/file/84ae1f202cd0480cbc0fe33a71d84e97.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (58, 36, 'http://localhost:9090/file/ba11c8d4b6ef4115b3310323e430c853.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (59, 37, 'http://localhost:9090/file/ad7c30d440f7403fa0e7ec3cebbf5f82.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (60, 37, 'http://localhost:9090/file/7cd57c80beb14cacbeb2647704dbdd39.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (61, 37, 'http://localhost:9090/file/1ea3aa7a571f48e5b32cae8dc5c26d74.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (62, 37, 'http://localhost:9090/file/d63188de825d4e6d9c4fe6a8487344e5.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (63, 38, 'http://localhost:9090/file/5f55692d6dee487d9ee762b498d532a8.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (64, 38, 'http://localhost:9090/file/eedac3ec151940ac83739dad55de5f4f.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (65, 38, 'http://localhost:9090/file/19bd9e201e094fe6b6b6557c239c7f77.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (66, 38, 'http://localhost:9090/file/5aba967687e14569913799687ca7e9f9.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (67, 39, 'http://localhost:9090/file/da940d5327ee4097ba7a0f4674a46961.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (68, 39, 'http://localhost:9090/file/607d794f5a2a432ba09640be15f531af.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (69, 39, 'http://localhost:9090/file/607d794f5a2a432ba09640be15f531af.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (70, 39, 'http://localhost:9090/file/a98a4d38c3a84baba825942f0af47632.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (71, 40, 'http://localhost:9090/file/a3ff3ebb95de43b2b66d80f616901a56.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (72, 40, 'http://localhost:9090/file/fc30c034043644339589a8f1de358ecb.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (73, 40, 'http://localhost:9090/file/c7759a2f1f26498693f8cf294b2f39eb.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (74, 40, 'http://localhost:9090/file/9a911a7cad784cdbbdb274cd30185434.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (75, 41, 'http://localhost:9090/file/10a84d9fd56343a9ae6d7fa55eb95191.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (76, 41, 'http://localhost:9090/file/e43ba9c95fbf48fca36eee4de6df0cc2.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (77, 41, 'http://localhost:9090/file/3064ff6aa77d4c1aa2379f5cf37c287b.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (78, 41, 'http://localhost:9090/file/c1598c716acb4fc5aa3d11224d02547a.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (79, 42, 'http://localhost:9090/file/1dc5e436a15c4d9caf21f1278dffb557.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (80, 42, 'http://localhost:9090/file/1052efff3aea4b079b8d9295d4efe154.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (81, 42, 'http://localhost:9090/file/1f08bdc0a7114526810fdc00bf91958f.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (82, 42, 'http://localhost:9090/file/7f1a2c7c6c384de89a7031f13301ee4e.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (83, 43, 'http://localhost:9090/file/303fc44f720044ea980ee75773268a2d.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (84, 43, 'http://localhost:9090/file/af72cf26c31d44d1bf5482e5013a0a14.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (85, 43, 'http://localhost:9090/file/9919e997c3b247e4bd9cb8d6ede42cf4.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (86, 43, 'http://localhost:9090/file/0710d83bf4834c42b3cb673843350cb6.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (87, 44, 'http://localhost:9090/file/37a64253155e400094b91e6e2e88591e.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (88, 44, 'http://localhost:9090/file/b2532037a1d14624b12bc133fd02503c.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (89, 44, 'http://localhost:9090/file/b037389581b8417bb0af626e7da1bd2d.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (90, 44, 'http://localhost:9090/file/72a8f1296c7b402babce33cd45aa0204.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (91, 45, 'http://localhost:9090/file/7a69ff22f294410aa5375289c2d62f35.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (92, 45, 'http://localhost:9090/file/62c3c9fc5ac140d0aac1dd20d423f73b.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (93, 45, 'http://localhost:9090/file/9f9c9b2dc1514e9e8d15266f09d9813e.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (94, 45, 'http://localhost:9090/file/772db13859d443d2803a8196ce6a933f.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (95, 46, 'http://localhost:9090/file/4a4fd73698084aef8cf05e77ab4501a2.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (96, 46, 'http://localhost:9090/file/009dc591d3184403b204ce4522e16df9.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (97, 46, 'http://localhost:9090/file/acf3e02e8fed4fdfbab3c143081d6c30.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (98, 46, 'http://localhost:9090/file/cefbae75a6fb4599b5f4f7a435042eee.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (99, 47, 'http://localhost:9090/file/28a03ea3118e4adaa359c3330ec4c6fd.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (100, 47, 'http://localhost:9090/file/1e503de02e1246b1a47bbcdb4eadf19c.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (101, 47, 'http://localhost:9090/file/bfa406b7583a4fd7924e6f7387903242.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (102, 47, 'http://localhost:9090/file/4fdc89658ee241dca0b652a1144e3c64.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (103, 48, 'http://localhost:9090/file/2050d13548ff45a69c924903c1f6ae65.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (104, 48, 'http://localhost:9090/file/4bcf59abca5e4ad09a51d8bf5f754d3c.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (105, 48, 'http://localhost:9090/file/f54fc21b966e46d8ae3ef52014adc7f8.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (106, 48, 'http://localhost:9090/file/2e55debd46db4a0d884d336ac0135a0e.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (107, 49, 'http://localhost:9090/file/47ad34a01d454a06aeef1f2f9d83b9d4.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (108, 49, 'http://localhost:9090/file/94ce01aecdc34c67a92733218b9b28cf.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (109, 49, 'http://localhost:9090/file/d53c50bd01a042fcbb8e78b09eca70b2.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (110, 49, 'http://localhost:9090/file/b65b0ae169aa4b23a44716b50841861b.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (111, 50, 'http://localhost:9090/file/80a50d9b116d46cca52534246b13b8b4.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (112, 50, 'http://localhost:9090/file/18f6571f3f034ed8893f4db9f5cd5bc6.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (113, 50, 'http://localhost:9090/file/9ecf806b345d48db8123806b98038996.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (114, 51, 'http://localhost:9090/file/33d0f9d554ac4bb990304d2e26a3eb30.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (115, 51, 'http://localhost:9090/file/343da0aea5bb48d3ae449ceef7883e2a.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (116, 51, 'http://localhost:9090/file/e01315e060f0439bbd26cca305ec7986.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (117, 51, 'http://localhost:9090/file/08e28628968c44108072e8223ea2b4e6.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (118, 52, 'http://localhost:9090/file/7ca0f9d47fa848dab03dd5952f3aabc9.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (119, 52, 'http://localhost:9090/file/e1a31aa0ad494227bc00708df19ea198.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (120, 52, 'http://localhost:9090/file/6cdd082980034346acdc00bea86e9633.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (121, 52, 'http://localhost:9090/file/de5cf7b296014b528141c36b9e94f6b0.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (122, 53, 'http://localhost:9090/file/550ea7c1c0b84fb183144844d20d7336.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (123, 53, 'http://localhost:9090/file/3c97da97fcf440b4a555baf4af153a8d.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (124, 53, 'http://localhost:9090/file/72769e59cf0540af93c374af68daa747.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (125, 53, 'http://localhost:9090/file/b9f2f472b44541d9b045ceacce55d7b9.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (126, 54, 'http://localhost:9090/file/94202de2dbc24550aba894da5475e5f4.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (127, 54, 'http://localhost:9090/file/afadb41b0c5e42d589ed20331f46aaab.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (128, 54, 'http://localhost:9090/file/f15c9945d27e462582f435f5ba6406a7.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (129, 54, 'http://localhost:9090/file/ad36e9fd31ea415fa1e879d0bb4ba530.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (130, 55, 'http://localhost:9090/file/a607aefb2cb14a8a92044f98b63e694c.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (131, 55, 'http://localhost:9090/file/4ed1ebeb1abd49fd873f6cc276c930de.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (132, 55, 'http://localhost:9090/file/b9d4f472f2b44def8bc03fec9f533a37.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (133, 55, 'http://localhost:9090/file/cd4fbabc756441169cb09822b4ccaf51.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (134, 56, 'http://localhost:9090/file/4087ee75ab264aa4b6579954d2643215.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (135, 56, 'http://localhost:9090/file/1b5c9b03978043d0ae26a017cfe39836.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (136, 56, 'http://localhost:9090/file/03131c053f9943db882b5a7e82e07b7a.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (137, 56, 'http://localhost:9090/file/2c119e8200404bacb7dfaebf855f8ac4.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (138, 57, 'http://localhost:9090/file/06ab9647f7494539a09e98c9bb70faa4.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (139, 57, 'http://localhost:9090/file/f2b3ffc52ffc44969d9704aa0c4cc9d8.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (140, 57, 'http://localhost:9090/file/f713241d16d245b196dbc33c552e5e5e.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (141, 57, 'http://localhost:9090/file/46f6809c74b340749ffd7494a1769ef3.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (142, 58, 'http://localhost:9090/file/fe76e87eea80479fbbf3471a31dbcfdf.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (143, 58, 'http://localhost:9090/file/a5a2a535df5f4d9eb849ccd46bcb6b81.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (144, 58, 'http://localhost:9090/file/8dc7299fc5014fa3af6085f536b58762.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (145, 58, 'http://localhost:9090/file/79dca1d87d8945cb80f85efc5144a6df.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (146, 59, 'http://localhost:9090/file/1696b830647842f4ab68d177c2e34b04.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (147, 59, 'http://localhost:9090/file/55f04110cb384097a06f63741c351a2d.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (148, 59, 'http://localhost:9090/file/9ee1fd789f8748208d71c28d414ad0c7.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (149, 59, 'http://localhost:9090/file/53b2232df84a495d9d54fb0e16d13759.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (150, 60, 'http://localhost:9090/file/e6f394ec19024e8d80a0a39e3a3bd097.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (151, 60, 'http://localhost:9090/file/ed55f2ee2ffd4d51961129b54300830c.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (152, 60, 'http://localhost:9090/file/dd386794582740d0ae4c91810ab78441.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (153, 60, 'http://localhost:9090/file/8634b4d4461d4b4cbfe07516131c1c4d.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (154, 61, 'http://localhost:9090/file/f20385c05d404eebb95062cad2493b27.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (155, 61, 'http://localhost:9090/file/8b873cec70ae4d9ea893b73cb8c88ee6.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (156, 61, 'http://localhost:9090/file/bf2991cb06a74e4781638aeb9aa07e5b.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (157, 61, 'http://localhost:9090/file/237b52ead6a84734b2d9d8f006c808ef.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (158, 62, 'http://localhost:9090/file/c5fac0699f4f4d178e88c8d907c9def1.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (159, 62, 'http://localhost:9090/file/fef084efc0ee48e98077196f9c1b2154.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (160, 62, 'http://localhost:9090/file/123a91b223794332b3ed094a0ab26513.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (161, 62, 'http://localhost:9090/file/e507ca8dbdad472f87cbea0a1849b6fa.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (162, 63, 'http://localhost:9090/file/9c981d675f034367bb604a00f5b5605b.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (163, 63, 'http://localhost:9090/file/2b9066e97e5a40ae8e95c766612223c1.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (164, 63, 'http://localhost:9090/file/e29de68cb721446b9fffa49a94ba155a.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (165, 64, 'http://localhost:9090/file/7e34a4c522024cc5aee5f13709934870.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (166, 64, 'http://localhost:9090/file/5a168f31c8aa4db78172b5a36223216c.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (167, 64, 'http://localhost:9090/file/7c4550efe72c403e999ad06cdef67fc3.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (168, 64, 'http://localhost:9090/file/a7f99b668d404f019ce39d8903ffa97e.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (169, 65, 'http://localhost:9090/file/a5ae53c7c32447e2a2571213984ee210.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (170, 65, 'http://localhost:9090/file/c425e4761874412f998573a94116c934.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (171, 65, 'http://localhost:9090/file/eb7b67f02b1e4f5881cf6c7ca437cbb8.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (172, 65, 'http://localhost:9090/file/e24ae84a81094f5b813e233d150285fe.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (173, 66, 'http://localhost:9090/file/b44e35745dcb4e5d833c334902a99524.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (174, 66, 'http://localhost:9090/file/07511190f45144a997c54552aedd001f.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (175, 66, 'http://localhost:9090/file/04cd537a940f4f55ac7651ad86060125.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (176, 66, 'http://localhost:9090/file/85b37460cb434ed3b71ea47889959993.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (177, 67, 'http://localhost:9090/file/53a8ef1e3640466b946bb2d086202dee.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (178, 67, 'http://localhost:9090/file/9d15fcb7194b494eb9454e2c2552262f.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (179, 67, 'http://localhost:9090/file/12562ad7debb4934b82e0b1e20ff80ab.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (180, 68, 'http://localhost:9090/file/2e7cecde719841d6bdf749075ebc17a9.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (181, 68, 'http://localhost:9090/file/d0a628fbdc6c4327882e10fa9d67a80d.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (182, 68, 'http://localhost:9090/file/4a4453fbf1c847d3bedb46b2e477eca9.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (183, 68, 'http://localhost:9090/file/cce5ee280f3444d0ae715177c7ec47cd.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (184, 69, 'http://localhost:9090/file/a575dbad93374ef4832c6cc5996c99be.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (185, 69, 'http://localhost:9090/file/94597af45ef042d39859a603d0b05331.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (186, 69, 'http://localhost:9090/file/bdf7718a68f14fbba3b6664a6ecca4b5.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (187, 70, 'http://localhost:9090/file/360bd69e1abe446d9e3bb28742f49a3e.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (188, 70, 'http://localhost:9090/file/e333453f6d9f4a41be1d9ca0adf69a12.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (189, 70, 'http://localhost:9090/file/161b6adab7494cfbbfc4f05a446ba9c1.jpg', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (190, 71, 'http://localhost:9090/file/be04619ccb144c6bbe8fbf76888b7505.png', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_img` VALUES (191, 72, 'http://localhost:9090/file/be04619ccb144c6bbe8fbf76888b7505.png', '2023-12-29 09:33:55', '2023-12-29 09:33:55');
INSERT INTO `sys_product_img` VALUES (192, 72, 'http://localhost:9090/file/c7dfe05154a0479ca7b6090e155c52c7.png', '2023-12-29 09:33:55', '2023-12-29 09:33:55');
INSERT INTO `sys_product_img` VALUES (193, 72, 'http://localhost:9090/file/c050161914034c8588bf0ffd1239984d.png', '2023-12-29 09:33:55', '2023-12-29 09:33:55');
INSERT INTO `sys_product_img` VALUES (194, 72, 'http://localhost:9090/file/79f52a531d2c40788f9f3bfaccf7649b.png', '2023-12-29 09:33:55', '2023-12-29 09:33:55');

-- ----------------------------
-- Table structure for sys_product_params
-- ----------------------------
DROP TABLE IF EXISTS `sys_product_params`;
CREATE TABLE `sys_product_params`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `product_id` int NULL DEFAULT NULL COMMENT '商品id',
  `product_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '产地',
  `product_period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '保质期',
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品牌名',
  `weight` double NULL DEFAULT NULL COMMENT '规格重量',
  `factory_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生产厂名',
  `factor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生产厂址',
  `packaging_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包装方式',
  `stroage_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '存储方式',
  `eat_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '食用方法',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_product_params
-- ----------------------------
INSERT INTO `sys_product_params` VALUES (15, 35, '武汉', '30天', '河南大蒜', 1, '无', '无', '袋装', '常温', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (16, 36, '广东', '15天', '广东紫薯', 0.5, '无', '无', '袋装', '常温', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (17, 37, '广西', '7天', '广西荔浦芋头', 0.5, '无', '无', '袋装', '常温', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (18, 38, '广西', '3天', '娃娃菜', 1, '无', '无', '袋装', '常温', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (19, 39, '广西贺州', '10天', '水豆腐', 1, '无', '无', '盒装', '常温', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (20, 40, '四川', '2天', '四川会理突尼斯软籽石榴', 1, '无', '无', '袋装', '常温', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (21, 41, '云南', '2天', '阳光玫瑰', 0.5, '无', '无', '盒装', '冷藏', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (22, 42, '云南', '2天', '蓝宝石黑手指无籽黑提', 1, '无', '无', '袋装', '冷藏', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (23, 43, '广西', '5天', '心景玉', 3, '无', '无', '箱装', '冷藏', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (24, 44, '四川', '3天', '凯特芒果', 1.5, '无', '无', '箱装', '冷藏', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (25, 45, '山东青岛', '365天', '青岛特大青虾', 1.4, '无', '无', '箱装', '冷冻', '烹饪', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (26, 46, '河北保定', '30天', '古原鸟', 3, '无', '无', '加厚蛋沫箱装', '冷藏', '烹饪', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (27, 47, '安徽', '180天', '龙桥五里山', 1.5, '枞阳县祖龙生态养殖家庭农场', '安徽省铜陵市枞阳县龙桥五里山', '包装', '冷冻', '烹饪', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (28, 48, '中国大陆', '30天', '大湖甲鱼', 1.5, '大湖水殖股份有限公司', '湖南省常德市武陵区城北办事处健', '包装', '冷藏', '烹饪', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (29, 49, '中国大陆', '18个月', '多宝鱼', 1.5, '无', '无', '箱装', '冷冻', '烹饪', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (30, 50, '中国大陆', '180 天', 'Europe-Asia/欧亚', 6, '云南欧亚乳业有限公司', '大理市大理经济开发区高新技术', '箱装', '常温', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (31, 51, '中国大陆', '365天', '天地精华', 11, '安徽天地精华股份有限公司', '安徽省六安市金安区东河口镇', '包装', '常温', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (32, 52, '河北', '3650天', '云溪山庄', 0.75, '昌黎长城庄园葡萄酿酒有限公司', '河北省秦皇岛市昌黎县十里铺', '箱装', '阴凉通风，避免阳光直射', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (33, 53, '新疆维吾尔自治区', ' 365天', '神内', 0.24, '石河子开发区神内食品有限公司', '新疆石河子开发区北三东路19号', '包装', '常温存储', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (34, 54, '广东省', '365天', 'Bosun/宝桑园', 0.18, '广东宝桑园健康食品有限公司', '广州市白云区钟落潭广东省', '包装', '避免高温，开盖后需冷藏', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (35, 55, '中国大陆', '30天', 'Sunday garden', 15, '无', '无', '盆装', '常温', '不可食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (36, 56, '中国大陆', '365天', '鲜洞察', 0.1, '无', '无', '袋装', '常温', '不可食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (37, 57, '中国大陆', '30天', '春意浓园艺', 0.1, '无', '无', '袋装', '常温', '不可食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (38, 58, '中国大陆', '30天', '一枝春(园艺)', 10, '无', '无', '盆装', '常温', '不可食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (39, 59, '宁夏', '540 天', ' 渭水鸿', 0.5, '渭源县会川世鸿中药材农民专业', '渭源县会川镇供销社内', '罐装', '冷藏 或置于阴凉干燥通风处', '泡水 煲汤', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (40, 60, '中国大陆', '365天', '嘉新正', 0.255, '抚州嘉新正食品有限公司', '江西省抚州市广昌县工业园区', '罐装', '常温阴凉处', '冲泡', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (41, 61, '中国大陆', '180天', '绿香妃红香妃', 1, '阿拉尔市胡杨树果业有限公司', '新疆阿拉尔市幸福城创业园区', '袋装', '冷藏', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (42, 62, '中国大陆', '240天', '绿山情', 0.5, '浙江慕脆生物科技有限公司', '浙江省杭州市临安区玲珑街道锦', '包装', '常温', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (43, 63, '黑龙江省', '365 天', '福神粮作', 5, '五常市龙凤稻业有限公司', '五常市龙凤山镇乐园村', '袋装', '离地离墙， 阴凉，通风', '烹饪', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (44, 64, '江西省', '540 天', '千岁好', 2, '玉山县大成仓食品有限公司', '江西省上饶市玉山县经济开发区', '包装', '阴凉及干燥处', '烹饪', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (45, 65, ' 中国大陆', '1080 天', '海湾', 0.36, '大连盐化集团有限公司', '辽宁省大连市瓦房店市兴湾街38', '包装', '阴凉通风处', '烹饪', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (46, 66, '中国大陆', '30天', '豆黄金', 1, '豆黄金食品有限公司', '山东临沂费县上冶镇工业园', '包装', '常温', '烹饪', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (47, 67, '中国大陆', '30天', '东半山', 1.5, '舟山市汇鲜水产有限公司', '浙江省舟山市普陀区沈家门街道', '食用农产品', '冷藏', '烹饪', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (48, 68, '马来西亚', '7天', 'DURIAN WINGS/榴芝翼', 0.5, '无', '无', '罐装', '冷冻-18℃', '直接食用', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (49, 69, '见包装', '365 天', '见包装', 0.6, '见包装', '见包装', '袋装', '冷冻', '烹饪', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (50, 70, '中国大陆', '7天', '其他', 1, '无', '无', '食用农产品', '冷冻-18℃', '烹饪', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (51, 71, '武汉', '12', '123', 123, '123', '123', '123', '123', '123', '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_product_params` VALUES (52, 72, '河南', '180', '天正', 12, '天正', '天正', '袋装', '常温', '剥皮', '2023-12-29 09:33:55', '2023-12-29 09:33:55');
INSERT INTO `sys_product_params` VALUES (53, 73, '123', '123', '123', 123, '123', '123', '123', '123', '123', '2023-12-29 16:05:01', '2023-12-29 16:05:01');
INSERT INTO `sys_product_params` VALUES (54, 74, '123', '123', '123', 123, '123', '123', '123', '123', '123', '2023-12-29 16:07:40', '2023-12-29 16:07:40');
INSERT INTO `sys_product_params` VALUES (55, 75, '123', '123', '123', 123, '123', '123', '123', '123', '123', '2024-01-03 09:39:24', '2024-01-03 09:39:24');

-- ----------------------------
-- Table structure for sys_receiving
-- ----------------------------
DROP TABLE IF EXISTS `sys_receiving`;
CREATE TABLE `sys_receiving`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货地址',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_receiving
-- ----------------------------
INSERT INTO `sys_receiving` VALUES (2, 23, '1916720618x', '广西柳州市进德镇', '啧', '收货地址2');
INSERT INTO `sys_receiving` VALUES (3, 23, '测试', '测试', '测试', '收货地址1');
INSERT INTO `sys_receiving` VALUES (4, 32, '13144567896', '江西', '张三', NULL);
INSERT INTO `sys_receiving` VALUES (5, 1, '13177653456', '中国', 'admin', NULL);
INSERT INTO `sys_receiving` VALUES (6, 37, '13611354676', '中国', 'lisi', NULL);
INSERT INTO `sys_receiving` VALUES (7, 33, '13177646583', '中国', '张三', NULL);
INSERT INTO `sys_receiving` VALUES (8, 44, '15655435465', '中国', '老王', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (3, '普通用户', '普通用户', 'ROLE_USER');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 13, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 14, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 15, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 16, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 17, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 18, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 25, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 26, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 27, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 29, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 30, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 31, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 32, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 33, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (1, 34, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (2, 14, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_role_menu` VALUES (2, 16, '2023-12-27 11:03:51', '2023-12-27 11:03:51');

-- ----------------------------
-- Table structure for sys_rotation
-- ----------------------------
DROP TABLE IF EXISTS `sys_rotation`;
CREATE TABLE `sys_rotation`  (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'url',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用链接',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_rotation
-- ----------------------------
INSERT INTO `sys_rotation` VALUES (0000000008, 'http://localhost:9090/file/e9ea2abb0967434c93749456e036b6b5.png', 1, 1, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_rotation` VALUES (0000000009, 'http://localhost:9090/file/66654ab745694f09846711e4b5e77b1e.png', 0, 1, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_rotation` VALUES (0000000010, 'http://localhost:9090/file/99c944a7100641de8e10aaa8db846a37.png', 0, 1, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_rotation` VALUES (0000000011, 'http://localhost:9090/file/49762f2aa44a42af8ab2da152f27160a.png', 0, 1, '2023-12-27 11:03:51', '2023-12-27 11:03:51');
INSERT INTO `sys_rotation` VALUES (0000000012, 'http://localhost:9090/file/fe918eb098394c7db7d1f5cf905f2a74.png', 0, 1, '2023-12-27 11:03:51', '2023-12-27 11:03:51');

-- ----------------------------
-- Table structure for sys_state
-- ----------------------------
DROP TABLE IF EXISTS `sys_state`;
CREATE TABLE `sys_state`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_state
-- ----------------------------
INSERT INTO `sys_state` VALUES (1, '全部');
INSERT INTO `sys_state` VALUES (2, '待付款');
INSERT INTO `sys_state` VALUES (3, '待发货');
INSERT INTO `sys_state` VALUES (4, '待收货');
INSERT INTO `sys_state` VALUES (5, '待评价');
INSERT INTO `sys_state` VALUES (6, '已完成');
INSERT INTO `sys_state` VALUES (7, '已退款');
INSERT INTO `sys_state` VALUES (8, '已取消');
INSERT INTO `sys_state` VALUES (9, '审核');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `create_time` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '123456', '管理员', 'admin@qq.com', '13877890987', '中国', 'http://localhost:9090/file/头像.jpg', 'ROLE_ADMIN', '2023-02-01 09:22:21.000000', '2023-12-20 15:04:46');
INSERT INTO `sys_user` VALUES (33, 'zhangsan', '123456', 'zhangsan', 'zhangsan@qq.com', '13811234123', '中国北京', 'http://localhost:9090/file/头像.jpg', 'ROLE_USER', '2023-12-20 15:02:21.974000', '2024-01-03 09:25:09');
INSERT INTO `sys_user` VALUES (43, 'lisi', '123456', NULL, NULL, NULL, NULL, 'http://localhost:9090/file/头像.jpg', 'ROLE_USER', '2023-12-29 17:13:12.858270', '2023-12-29 17:13:12');
INSERT INTO `sys_user` VALUES (46, 'laowang', NULL, 'laowang', 'laowang@qq.com', '13766543123', '中国', NULL, 'ROLE_USER', '2024-01-03 09:36:14.066000', '2024-01-03 09:36:20');

-- ----------------------------
-- Table structure for sys_user_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_visit_log`;
CREATE TABLE `sys_user_visit_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NULL DEFAULT NULL,
  `pid` int NULL DEFAULT NULL,
  `cid` int NULL DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 464 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_visit_log
-- ----------------------------
INSERT INTO `sys_user_visit_log` VALUES (367, 23, 35, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (368, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (369, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (370, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (371, 23, 37, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (372, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (373, 23, 38, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (374, 23, 39, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (375, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (376, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (377, 23, 37, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (378, 23, 38, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (379, 23, 40, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (380, 23, 41, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (381, 23, 41, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (382, 23, 41, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (383, 23, 42, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (384, 23, 43, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (385, 23, 44, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (386, 23, 41, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (387, 23, 45, 6, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (388, 23, 46, 12, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (389, 23, 46, 12, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (390, 23, 42, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (391, 23, 50, 7, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (392, 23, 37, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (393, 23, 38, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (394, 23, 42, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (395, 23, 42, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (396, 23, 53, 7, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (397, 23, 43, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (398, 23, 42, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (399, 23, 70, 11, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (400, 23, 41, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (401, 23, 57, 8, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (402, 23, 59, 10, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (403, 23, 37, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (404, 23, 38, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (405, 23, 39, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (406, 23, 43, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (407, 23, 37, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (408, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (409, 23, 37, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (410, 23, 42, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (411, 23, 41, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (412, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (413, 23, 43, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (414, 23, 42, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (415, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (416, 23, 43, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (417, 23, 42, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (418, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (419, 23, 59, 10, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (420, 23, 43, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (421, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (422, 23, 41, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (423, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (424, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (425, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (426, 23, 37, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (427, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (428, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (429, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (430, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (431, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (432, 23, 38, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (433, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (434, 23, 37, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (435, 23, 62, 10, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (436, 23, 41, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (437, 23, 58, 8, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (438, 23, 64, 13, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (439, 23, 37, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (440, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (441, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (442, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (443, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (444, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (445, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (446, 23, 42, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (447, 23, 37, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (448, 23, 43, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (449, 23, 43, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (450, 23, 43, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (451, 23, 41, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (452, 23, 40, 4, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (453, 23, 37, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (454, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (455, 23, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (456, 23, 35, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (457, 32, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (458, 32, 36, 5, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (459, 1, 55, 8, '2023-12-27 11:03:51');
INSERT INTO `sys_user_visit_log` VALUES (460, 44, 35, 5, '2023-12-29 17:22:49');
INSERT INTO `sys_user_visit_log` VALUES (461, 33, 35, 5, '2023-12-29 17:28:25');
INSERT INTO `sys_user_visit_log` VALUES (462, 33, 37, 5, '2024-01-03 09:24:14');
INSERT INTO `sys_user_visit_log` VALUES (463, 33, 35, 5, '2024-01-03 09:34:15');
INSERT INTO `sys_user_visit_log` VALUES (464, 33, 38, 5, '2024-11-22 01:04:36');
INSERT INTO `sys_user_visit_log` VALUES (465, 33, 38, 5, '2024-11-22 01:20:55');

SET FOREIGN_KEY_CHECKS = 1;
