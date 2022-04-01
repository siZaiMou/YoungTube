/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : youngtube

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 01/04/2022 13:58:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminId` int NOT NULL,
  `adminPassword` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for appeal
-- ----------------------------
DROP TABLE IF EXISTS `appeal`;
CREATE TABLE `appeal`  (
  `userId` int NULL DEFAULT NULL,
  `appealId` int NULL DEFAULT NULL,
  `appealType` int NULL DEFAULT NULL,
  `appealContent` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `appealDate` datetime NULL DEFAULT NULL,
  `assessorId` int NULL DEFAULT NULL,
  `appealStatus` int NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appeal
-- ----------------------------

-- ----------------------------
-- Table structure for blacklist
-- ----------------------------
DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist`  (
  `blackUserId` int NOT NULL,
  `blackedUserId` int NOT NULL,
  `blackDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`blackUserId`, `blackedUserId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for danmu
-- ----------------------------
DROP TABLE IF EXISTS `danmu`;
CREATE TABLE `danmu`  (
  `danmuId` int NOT NULL AUTO_INCREMENT,
  `videoId` int NULL DEFAULT NULL,
  `userId` int NULL DEFAULT NULL,
  `dcontent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dsize` int NULL DEFAULT 0,
  `dcolor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dtime` float NULL DEFAULT NULL,
  `dSendTime` datetime NULL DEFAULT NULL,
  `position` int NULL DEFAULT NULL,
  `danmuAuditStatus` int NULL DEFAULT 0,
  PRIMARY KEY (`danmuId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of danmu
-- ----------------------------
INSERT INTO `danmu` VALUES (1, 2, 3, 'tet001', 0, '16777215', 9.01842, '2022-01-13 04:58:27', 0, 0);
INSERT INTO `danmu` VALUES (2, 2, 3, 'rtatest002', 0, '6610199', 8.73241, '2022-01-13 04:58:41', 0, 0);
INSERT INTO `danmu` VALUES (3, 2, 3, 'eee', 0, '6610199', 31.9706, '2022-01-13 04:59:04', 2, 0);
INSERT INTO `danmu` VALUES (4, 2, 3, 'ee', 0, '16777215', 0, '2022-01-13 05:03:02', 0, 0);
INSERT INTO `danmu` VALUES (12, 2, 3, 'eeq', 0, '16777215', 2.64987, '2022-01-13 07:17:27', 0, 0);
INSERT INTO `danmu` VALUES (13, 2, 3, 'rrr', 0, '16777215', 2.08052, '2022-01-13 07:35:51', 0, 0);
INSERT INTO `danmu` VALUES (14, 2, 3, '你好', 0, '16777215', 8.00525, '2022-01-13 07:44:32', 0, 0);
INSERT INTO `danmu` VALUES (15, 1, 3, 'eehellow', 0, '16777215', 24.1496, '2022-01-13 09:55:08', 0, 0);
INSERT INTO `danmu` VALUES (16, 3, 3, 'baga', 0, '16777215', 4.49409, '2022-01-14 06:27:01', 0, 0);
INSERT INTO `danmu` VALUES (17, 3, 3, '欧西给', 0, '16777215', 11.6002, '2022-01-14 06:27:08', 0, 0);
INSERT INTO `danmu` VALUES (18, 4, 3, '为阿文', 0, '16777215', 2.34143, '2022-01-16 03:30:37', 0, 0);
INSERT INTO `danmu` VALUES (19, 10, 3, 'sukisuki', 0, '16777215', 5.79173, '2022-01-18 01:26:13', 0, 0);
INSERT INTO `danmu` VALUES (20, 10, 3, '很难不喜欢', 0, '6610199', 9.23607, '2022-01-18 01:26:41', 0, 0);
INSERT INTO `danmu` VALUES (21, 1, 3, '你好你好', 0, '16777215', 6.13621, '2022-01-18 10:26:00', 0, 0);
INSERT INTO `danmu` VALUES (22, 2, 6, '笑死', 0, '16777215', 2.94546, '2022-01-19 11:04:59', 0, 0);
INSERT INTO `danmu` VALUES (23, 4, 6, '你好你好', 0, '16777215', 4.46197, '2022-01-20 00:40:07', 0, 0);
INSERT INTO `danmu` VALUES (24, 1, 6, '弹幕', 0, '16769331', 10.3979, '2022-01-20 02:21:37', 1, 0);
INSERT INTO `danmu` VALUES (25, 2, 6, 'aaaa', 0, '6610199', 1.88827, '2022-01-20 11:30:58', 0, 0);
INSERT INTO `danmu` VALUES (26, 1, 3, 'eee', 0, '16777215', 1.93032, '2022-01-21 03:19:03', 0, 0);
INSERT INTO `danmu` VALUES (27, 1, 3, '11', 0, '16777215', 8.68919, '2022-01-21 03:20:13', 0, 0);
INSERT INTO `danmu` VALUES (28, 2, 3, 'rrrr', 0, '16777215', 0.197253, '2022-01-25 01:34:31', 0, 0);
INSERT INTO `danmu` VALUES (29, 1, 3, 'eeexs', 0, '16777215', 3.70961, '2022-01-26 03:48:03', 0, 0);
INSERT INTO `danmu` VALUES (30, 1, 3, 'mmmmmmmm', 0, '16777215', 6.26024, '2022-01-28 07:22:13', 0, 0);
INSERT INTO `danmu` VALUES (31, 2, 3, '额威威', 0, '16777215', 3.64006, '2022-02-19 09:51:50', 0, 0);
INSERT INTO `danmu` VALUES (32, 10, 3, '得到的', 0, '16777215', 6.0448, '2022-02-21 13:36:55', 0, 0);
INSERT INTO `danmu` VALUES (33, 10, 3, '555', 0, '3788031', 5.5104, '2022-02-21 13:37:48', 0, 0);
INSERT INTO `danmu` VALUES (34, 5, 3, 'ttttt', 0, '16777215', 4.47771, '2022-02-21 13:46:01', 0, 0);
INSERT INTO `danmu` VALUES (35, 9, 6, 'eeee', 0, '16777215', 4.81815, '2022-02-22 00:36:22', 0, 0);

-- ----------------------------
-- Table structure for dynamic
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic`  (
  `dynamicId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `dynamicContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dynamicIsTop` int NULL DEFAULT 0,
  `dynamicDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`dynamicId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dynamic
-- ----------------------------
INSERT INTO `dynamic` VALUES (1, 3, '哈喽哈喽', 0, '2022-01-19 11:01:22');
INSERT INTO `dynamic` VALUES (2, 3, '你好你好', 0, '2022-01-18 11:01:23');
INSERT INTO `dynamic` VALUES (3, 3, '确实确实', 0, '2022-01-13 11:01:27');
INSERT INTO `dynamic` VALUES (4, 3, '11', 0, '2022-01-19 11:49:32');
INSERT INTO `dynamic` VALUES (5, 3, '112', 0, '2022-01-19 11:49:40');
INSERT INTO `dynamic` VALUES (6, 3, '欧西给欧西给欧西给', 0, '2022-01-19 10:52:59');
INSERT INTO `dynamic` VALUES (7, 3, '额威威', 0, '2022-01-19 10:56:34');
INSERT INTO `dynamic` VALUES (8, 3, '你好你好', 0, '2022-01-19 10:59:05');
INSERT INTO `dynamic` VALUES (9, 3, '111', 0, '2022-01-19 10:59:57');
INSERT INTO `dynamic` VALUES (10, 3, '444', 0, '2022-01-19 11:03:17');
INSERT INTO `dynamic` VALUES (11, 6, '呃呃呃', 0, '2022-01-19 11:06:39');
INSERT INTO `dynamic` VALUES (12, 6, '然而我还，令人感叹', 0, '2022-01-19 11:06:51');
INSERT INTO `dynamic` VALUES (13, 6, '私密马赛', 0, '2022-01-19 11:07:24');
INSERT INTO `dynamic` VALUES (14, 3, '呃呃呃呃呃', 0, '2022-01-19 11:08:21');
INSERT INTO `dynamic` VALUES (15, 6, '动态动态', 0, '2022-01-20 02:23:29');
INSERT INTO `dynamic` VALUES (16, 6, '你好你好', 0, '2022-01-20 11:32:31');
INSERT INTO `dynamic` VALUES (17, 6, '笑死笑死', 0, '2022-01-22 07:29:12');
INSERT INTO `dynamic` VALUES (18, 3, 'eee', 0, '2022-01-22 09:11:54');
INSERT INTO `dynamic` VALUES (19, 3, '', 0, '2022-01-22 09:14:47');
INSERT INTO `dynamic` VALUES (20, 3, 'sukisuki', 0, '2022-01-22 09:16:20');
INSERT INTO `dynamic` VALUES (21, 3, 'dddd', 0, '2022-01-26 03:48:30');
INSERT INTO `dynamic` VALUES (22, 3, '绷不住了', 0, '2022-02-19 09:55:26');
INSERT INTO `dynamic` VALUES (23, 3, 'eee', 0, '2022-02-21 13:56:09');

-- ----------------------------
-- Table structure for dynamiccomment
-- ----------------------------
DROP TABLE IF EXISTS `dynamiccomment`;
CREATE TABLE `dynamiccomment`  (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `dynamicId` int NULL DEFAULT NULL,
  `commentContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `commentPraise` int NULL DEFAULT 0,
  `commentDislike` int NULL DEFAULT 0,
  `commentDate` datetime NULL DEFAULT NULL,
  `fatherCommentId` int NULL DEFAULT 0,
  `commentAuditStatus` int NULL DEFAULT 0,
  `dynamicCommentIsTop` int NULL DEFAULT 0,
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dynamiccomment
-- ----------------------------
INSERT INTO `dynamiccomment` VALUES (1, 6, 17, '666', 0, 0, '2022-01-22 08:19:08', 0, 0, 0);
INSERT INTO `dynamiccomment` VALUES (2, 6, 17, 'dwdwd', 0, 0, '2022-01-22 08:19:51', 0, 0, 0);
INSERT INTO `dynamiccomment` VALUES (3, 3, 20, 'wadwadwa', 0, 0, '2022-01-22 09:24:22', 0, 0, 0);
INSERT INTO `dynamiccomment` VALUES (4, 3, 20, '这个是否有点', 0, 0, '2022-01-24 01:19:48', 0, 0, 0);
INSERT INTO `dynamiccomment` VALUES (5, 3, 3, 'wdwdwdwdwdwd', 0, 0, '2022-01-24 01:20:41', 0, 0, 0);
INSERT INTO `dynamiccomment` VALUES (6, 3, 19, '好发', 0, 0, '2022-01-24 01:32:15', 0, 0, 0);
INSERT INTO `dynamiccomment` VALUES (7, 3, 21, 'eee', 0, 0, '2022-01-26 03:48:46', 0, 0, 0);
INSERT INTO `dynamiccomment` VALUES (8, 3, 22, '笑死', 0, 0, '2022-02-19 09:55:37', 0, 0, 0);
INSERT INTO `dynamiccomment` VALUES (9, 3, 22, 'ddd', 0, 0, '2022-02-21 13:55:55', 0, 0, 0);

-- ----------------------------
-- Table structure for dynamicpraise
-- ----------------------------
DROP TABLE IF EXISTS `dynamicpraise`;
CREATE TABLE `dynamicpraise`  (
  `dynamicId` int NOT NULL,
  `userId` int NOT NULL,
  `praiseDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`dynamicId`, `userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dynamicpraise
-- ----------------------------
INSERT INTO `dynamicpraise` VALUES (5, 6, '2022-01-22 07:24:38');
INSERT INTO `dynamicpraise` VALUES (8, 3, '2022-01-24 01:22:48');
INSERT INTO `dynamicpraise` VALUES (11, 6, '2022-01-22 07:24:50');
INSERT INTO `dynamicpraise` VALUES (15, 6, '2022-01-22 07:24:44');
INSERT INTO `dynamicpraise` VALUES (17, 6, '2022-01-22 07:29:19');
INSERT INTO `dynamicpraise` VALUES (19, 3, '2022-01-22 09:21:52');
INSERT INTO `dynamicpraise` VALUES (20, 3, '2022-01-22 09:21:51');
INSERT INTO `dynamicpraise` VALUES (21, 3, '2022-02-21 13:56:00');
INSERT INTO `dynamicpraise` VALUES (22, 3, '2022-02-19 09:55:30');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `favoriteId` int NOT NULL AUTO_INCREMENT,
  `favoriteName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` int NULL DEFAULT NULL,
  PRIMARY KEY (`favoriteId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES (1, '默认收藏夹', 3);
INSERT INTO `favorite` VALUES (2, '守望先锋', 3);
INSERT INTO `favorite` VALUES (3, '东北往事', 3);
INSERT INTO `favorite` VALUES (4, '黑马程序员', 3);
INSERT INTO `favorite` VALUES (5, '宠物', 3);
INSERT INTO `favorite` VALUES (6, '游戏', 3);
INSERT INTO `favorite` VALUES (7, '二次元', 3);
INSERT INTO `favorite` VALUES (8, '收藏夹tesst', 3);
INSERT INTO `favorite` VALUES (9, '默认收藏夹', 6);
INSERT INTO `favorite` VALUES (10, '222', 6);

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `followUserId` int NOT NULL,
  `followedUserId` int NOT NULL,
  `followDate` datetime NULL DEFAULT NULL,
  `followMode` int NULL DEFAULT 0,
  PRIMARY KEY (`followUserId`, `followedUserId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES (3, 3, '2022-02-21 13:59:22', 0);
INSERT INTO `follow` VALUES (3, 5, '2022-01-28 07:04:13', 0);
INSERT INTO `follow` VALUES (6, 3, '2022-02-21 14:04:19', 0);
INSERT INTO `follow` VALUES (6, 5, '2022-01-20 11:32:06', 0);

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `userId` int NULL DEFAULT NULL,
  `contentType` int NULL DEFAULT 0,
  `contentId` int NULL DEFAULT NULL,
  `viewDate` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `messageId` int NOT NULL AUTO_INCREMENT,
  `sendUserId` int NULL DEFAULT NULL,
  `receiveUserId` int NULL DEFAULT NULL,
  `messageContent` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `messageDate` datetime NULL DEFAULT NULL,
  `messageAuditStatus` int NULL DEFAULT 0,
  `messageStatus` int NULL DEFAULT 0,
  PRIMARY KEY (`messageId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for privacysetting
-- ----------------------------
DROP TABLE IF EXISTS `privacysetting`;
CREATE TABLE `privacysetting`  (
  `userId` int NULL DEFAULT NULL,
  `showFavorite` int NULL DEFAULT 1,
  `showPraise` int NULL DEFAULT 1,
  `showCoin` int NULL DEFAULT 1,
  `showFollow` int NULL DEFAULT 1,
  `showInformation` int NULL DEFAULT 1
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of privacysetting
-- ----------------------------

-- ----------------------------
-- Table structure for profit
-- ----------------------------
DROP TABLE IF EXISTS `profit`;
CREATE TABLE `profit`  (
  `userId` int NULL DEFAULT NULL,
  `earning` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profit
-- ----------------------------

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `userId` int NULL DEFAULT NULL,
  `reportType` int NULL DEFAULT 0,
  `contentId` int NULL DEFAULT NULL,
  `reportReason` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reportDate` datetime NULL DEFAULT NULL,
  `reportStatus` int NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for suggestion
-- ----------------------------
DROP TABLE IF EXISTS `suggestion`;
CREATE TABLE `suggestion`  (
  `suggestionId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `suggestionContent` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `suggestionTitle` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `suggestionStatus` int NULL DEFAULT 0,
  `assessorId` int NULL DEFAULT NULL,
  `assessDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`suggestionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of suggestion
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userPetName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userSignature` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userPassword` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userHeadSrc` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `userName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userLicense` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userSex` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userAddress` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userIp` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userPhone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userEmail` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `vipGrade` int NULL DEFAULT 0,
  `userReputation` int NULL DEFAULT 100,
  `userIsUp` int NULL DEFAULT 0,
  `registTime` datetime NULL DEFAULT NULL,
  `userCoin` int NULL DEFAULT 0,
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `userPetName`(`userPetName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, 'avavaava', '这个人很神秘，什么都没有写', 'e10adc3949ba59abbe56e057f20f883e', '/common/pictures/user/userhead/wanwan.jpg', NULL, NULL, NULL, '山东省临沂市', '122.6.184.73', '16865213017', NULL, 0, 100, 0, '2022-01-11 04:52:01', 39);
INSERT INTO `user` VALUES (5, '资深up主', '这个人很神秘，什么都没有写', 'e10adc3949ba59abbe56e057f20f883e', '/common/pictures/user/userhead/defaulthead.png', NULL, NULL, NULL, '山东省临沂市', '122.6.184.73', '19812323123', NULL, 0, 100, 0, '2022-01-12 00:39:31', 50);
INSERT INTO `user` VALUES (6, 'user22', '这个人很神秘，什么都没有写', 'e10adc3949ba59abbe56e057f20f883e', '/common/pictures/user/userhead/defaulthead.png', NULL, NULL, NULL, '山东省临沂市', '122.6.184.73', '11111111111', NULL, 0, 100, 0, '2022-01-16 06:00:57', 15);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `videoId` int NOT NULL AUTO_INCREMENT,
  `videoName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoIntroduction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoCategory` int NULL DEFAULT NULL,
  `videoFrontSrc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoSrc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoViewCount` int NULL DEFAULT 0,
  `videoIssuingTime` datetime NULL DEFAULT NULL,
  `videoAuditStatus` int NULL DEFAULT 0,
  `videoUpId` int NULL DEFAULT NULL,
  `videoTeenagerMode` int NULL DEFAULT 0,
  `videoDuring` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`videoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (1, '某科学的超电磁炮精剪', '喜欢我二次元吗?', 1, '/video/videoFont/paojie.png', '/video/paojie.mp4', 4, '2022-01-12 09:03:12', 0, 5, 0, '02:29');
INSERT INTO `video` VALUES (2, '刀剑神域', '喜欢我刀剑神域吗?', 1, '/video/videoFont/daojian.png', '/video/meimei.mp4', 1, '2022-01-12 09:03:14', 0, 5, 0, '04:31');
INSERT INTO `video` VALUES (3, '随机对对子不要笑蹭饭大挑战', '喜欢我p大将吗?', 2, 'http://i1.hdslb.com/bfs/archive/85235bc452a3a4da46ac08c4cf4da148e06c4ead.jpg', '/video/xiaoyuan.mp4', 11024, '2022-01-12 09:03:16', 0, 5, 0, '01:25');
INSERT INTO `video` VALUES (4, '嘉然的战争', '欧内的手哈嘉嘉', 1, '/video/videoFont/bilansuo.png', '/video/longnvpu.mp4', 0, '2022-01-12 09:05:08', 0, 5, 0, '03:02');
INSERT INTO `video` VALUES (5, '小艾锐评', '早该图图了', 3, 'http://i2.hdslb.com/bfs/archive/8587ccd716c66f44a494b3101a3d0777a4095290.jpg', '/video/longnvpu.mp4', 3, '2022-01-12 12:18:41', 0, 3, 0, '02:15');
INSERT INTO `video` VALUES (6, '温暖二次元', '闹挺大', 1, '/video/videoFont/zhongerbing.png', '/video/longnvpu.mp4', 232, '2022-01-12 12:19:44', 0, 5, 0, '05:23');
INSERT INTO `video` VALUES (7, '美国疫情现状', 'winwin', 3, '/video/videoFont/daojian.png', '/video/longnvpu.mp4', 0, '2022-01-12 13:05:28', 0, 5, 0, '06:44');
INSERT INTO `video` VALUES (8, '回家', '下北泽金曲', 4, 'http://i0.hdslb.com/bfs/archive/5782f82b46c3c558e6266e97d9b901d139869cd3.jpg', '/video/paojie.mp4', 31, '2022-01-12 13:06:35', 0, 3, 0, '01:58');
INSERT INTO `video` VALUES (9, '【黑马程序员】java从入门到放弃', '喜欢我计算机吗', 2, 'http://i2.hdslb.com/bfs/archive/7ee0526eb512928ac3f707bbfbd842d64bc313cd.png', '/video/longnvpu.mp4', 21315, '2022-01-17 21:33:47', 0, 5, 0, '23:31');
INSERT INTO `video` VALUES (10, '【高燃】我患上了玉玉证', '喜欢我玉皇大帝吗?', 2, '/video/videoFont/bilansuo.png', '/video/xiaoyuan.mp4', 991996, '2022-01-17 21:35:05', 0, 3, 0, '04:14');
INSERT INTO `video` VALUES (11, '【秒懂百科】秒懂百科bot', '绝绝子', 5, '/video/videoFont/bilansuo.png', '/video/xiaoyuan.mp4', 0, '2022-01-19 20:02:56', 0, 6, 0, '12:31');
INSERT INTO `video` VALUES (12, '牛中牛牛', 'npk48', 1, 'http://i1.hdslb.com/bfs/archive/ba8785fe6fa4506c4c21e3d8eb44cb27c5454691.jpg', '//player.bilibili.com/player.html?aid=11200262&cid=18527724&page=1', 3, '2022-02-20 20:01:20', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (17, 'ddd', 'dddd', 3, '/video/videoFont/1648786001335_longyuhu.png', '/video/1648785998278_5076187-1-hd.mp4', 0, '2022-04-01 04:06:38', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (18, '【一眼顶针】zood', '从理塘到了上海', 3, '/video/videoFont/1648786257472_13817402-1-hd.png', '/video/1648786253221_5082973-1-hd.mp4', 0, '2022-04-01 04:10:53', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (19, '不要急眼挑战', '我急了', 7, '/video/videoFont/1648786642146_henxiangjianni.png', '/video/1648786640768_10206688-1-hd.mp4', 0, '2022-04-01 04:17:21', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (20, '【冰与火之歌】爱民如子乔弗里', 'hear me roar', 2, '/video/videoFont/1648786906505_6760443-1-hd.png', '/video/1648786905306_datastract.mp4', 0, '2022-04-01 04:21:45', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (21, '【燃爆】耗时114514小时，真是绝绝子', '好汉', 3, '/video/videoFont/1648787170131_girlatbluecomputer0.4.png', '/video/1648787167653_binansuo.mp4', 0, '2022-04-01 04:26:08', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (22, '【嗨🐎程序员】操作系统入门', '操作系统', 6, '/video/videoFont/1648787313350_os.png', '/video/1648787311235_daojian.mp4', 0, '2022-04-01 04:28:31', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (23, '【血与火】坦格利安', 'got', 4, '/video/videoFont/1648787430674_5076187-1-hd.png', '/video/1648787429465_maijin.mp4', 0, '2022-04-01 04:30:29', 0, 3, 0, NULL);

-- ----------------------------
-- Table structure for videocategory
-- ----------------------------
DROP TABLE IF EXISTS `videocategory`;
CREATE TABLE `videocategory`  (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`categoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videocategory
-- ----------------------------
INSERT INTO `videocategory` VALUES (1, '动画');
INSERT INTO `videocategory` VALUES (2, '生活');
INSERT INTO `videocategory` VALUES (3, '音乐');
INSERT INTO `videocategory` VALUES (4, '资讯');
INSERT INTO `videocategory` VALUES (5, '游戏');
INSERT INTO `videocategory` VALUES (6, '知识');
INSERT INTO `videocategory` VALUES (7, 'vlog');
INSERT INTO `videocategory` VALUES (8, '科技');
INSERT INTO `videocategory` VALUES (9, '体育');

-- ----------------------------
-- Table structure for videoclick
-- ----------------------------
DROP TABLE IF EXISTS `videoclick`;
CREATE TABLE `videoclick`  (
  `userId` int NOT NULL,
  `videoId` int NOT NULL,
  `clickDate` datetime NULL DEFAULT NULL,
  `clickType` int NULL DEFAULT 0,
  PRIMARY KEY (`userId`, `videoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videoclick
-- ----------------------------
INSERT INTO `videoclick` VALUES (3, 2, '2022-01-19 10:48:07', 0);
INSERT INTO `videoclick` VALUES (3, 6, '2022-02-19 09:59:00', 0);
INSERT INTO `videoclick` VALUES (3, 7, '2022-01-16 03:25:16', 0);
INSERT INTO `videoclick` VALUES (3, 8, '2022-01-16 03:19:18', 0);
INSERT INTO `videoclick` VALUES (3, 10, '2022-01-18 01:23:52', 0);
INSERT INTO `videoclick` VALUES (5, 1, '2022-01-16 02:49:51', 0);
INSERT INTO `videoclick` VALUES (5, 5, '2022-02-19 10:09:52', 0);
INSERT INTO `videoclick` VALUES (5, 6, '2022-01-16 03:06:24', 0);
INSERT INTO `videoclick` VALUES (6, 1, '2022-01-20 11:33:31', 0);
INSERT INTO `videoclick` VALUES (6, 2, '2022-01-20 11:31:23', 0);
INSERT INTO `videoclick` VALUES (6, 9, '2022-02-22 00:38:49', 0);
INSERT INTO `videoclick` VALUES (6, 10, '2022-02-22 00:40:47', 0);

-- ----------------------------
-- Table structure for videocoin
-- ----------------------------
DROP TABLE IF EXISTS `videocoin`;
CREATE TABLE `videocoin`  (
  `userId` int NOT NULL,
  `videoId` int NOT NULL,
  `coinCount` int NULL DEFAULT NULL,
  `coinDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `videoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videocoin
-- ----------------------------
INSERT INTO `videocoin` VALUES (3, 1, 1, '2022-01-16 12:17:19');
INSERT INTO `videocoin` VALUES (3, 2, 1, '2022-01-16 08:05:03');
INSERT INTO `videocoin` VALUES (3, 3, 1, '2022-02-19 09:57:07');
INSERT INTO `videocoin` VALUES (3, 4, 1, '2022-01-16 04:28:55');
INSERT INTO `videocoin` VALUES (3, 5, 1, '2022-01-28 03:25:32');
INSERT INTO `videocoin` VALUES (3, 7, 1, '2022-01-16 04:28:09');
INSERT INTO `videocoin` VALUES (3, 10, 1, '2022-01-18 01:21:22');
INSERT INTO `videocoin` VALUES (6, 1, 1, '2022-01-20 02:22:04');
INSERT INTO `videocoin` VALUES (6, 2, 1, '2022-01-16 06:01:10');
INSERT INTO `videocoin` VALUES (6, 4, 1, '2022-01-20 00:40:28');

-- ----------------------------
-- Table structure for videocomment
-- ----------------------------
DROP TABLE IF EXISTS `videocomment`;
CREATE TABLE `videocomment`  (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `videoId` int NULL DEFAULT NULL,
  `commentContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `commentDate` datetime NULL DEFAULT NULL,
  `fatherCommentId` int NULL DEFAULT 0,
  `replyCommentId` int NULL DEFAULT 0,
  `commentAuditStatus` int NULL DEFAULT 0,
  `videoCommentIsTop` int NULL DEFAULT 0,
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videocomment
-- ----------------------------
INSERT INTO `videocomment` VALUES (1, 5, 1, '父评论测试', '2022-01-29 09:24:09', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (2, 3, 1, '子评论回复父评论', '2022-01-29 09:24:39', 1, 1, 0, 0);
INSERT INTO `videocomment` VALUES (3, 3, 1, '子评论回复子评论', '2022-01-29 09:25:18', 1, 2, 0, 0);
INSERT INTO `videocomment` VALUES (4, 3, 1, '笑死', '2022-01-29 03:44:01', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (5, 3, 1, 'rrr', '2022-01-29 03:51:14', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (6, 3, 1, '回复@avavaava:开什么玩笑', '2022-01-29 04:15:48', 1, 2, 0, 0);
INSERT INTO `videocomment` VALUES (7, 3, 1, '回复@avavaava:我要吐了', '2022-01-29 04:16:04', 1, 6, 0, 0);
INSERT INTO `videocomment` VALUES (8, 3, 1, '的味道', '2022-01-29 04:17:28', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (9, 3, 1, '回复@avavaava\r\n                                                    : 差不多得了', '2022-01-29 04:18:20', 8, 8, 0, 0);
INSERT INTO `videocomment` VALUES (10, 3, 1, '回复@avavaava:????', '2022-01-29 08:33:55', 1, 6, 0, 0);
INSERT INTO `videocomment` VALUES (11, 3, 1, '回复@我的名字 : 逆天', '2022-01-29 08:34:05', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (12, -1, 6, '回复@avavaava:ee', '2022-02-10 12:50:24', 1, 6, 0, 0);
INSERT INTO `videocomment` VALUES (13, -1, 6, '回复@avavaava:rr', '2022-02-10 12:52:37', 1, 6, 0, 0);
INSERT INTO `videocomment` VALUES (14, 3, 10, 'ee', '2022-02-10 13:21:37', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (15, 3, 10, '回复@avavaava: bbb', '2022-02-10 13:22:14', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (16, 3, 10, '回复@avavaava\r\n                                                    : eee', '2022-02-10 13:22:27', 15, 15, 0, 0);
INSERT INTO `videocomment` VALUES (17, 3, 10, '回复@avavaava:呃呃呃', '2022-02-10 13:22:44', 15, 16, 0, 0);
INSERT INTO `videocomment` VALUES (18, 3, 10, '回复@avavaava:鹅鹅鹅', '2022-02-10 13:22:55', 15, 17, 0, 0);
INSERT INTO `videocomment` VALUES (19, 3, 10, '1wae回复@avavaava\r\n                                                    : 文案', '2022-02-10 13:24:07', 14, 14, 0, 0);
INSERT INTO `videocomment` VALUES (20, 3, 10, '1wae回复@avavaava:呃呃、\r\n', '2022-02-10 13:25:20', 14, 19, 0, 0);
INSERT INTO `videocomment` VALUES (21, 3, 10, '呃呃呃', '2022-02-10 13:27:14', 14, 19, 0, 0);
INSERT INTO `videocomment` VALUES (22, 3, 1, '你好你好', '2022-02-18 13:59:00', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (23, 3, 1, '....xss', '2022-02-18 13:59:38', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (24, 3, 1, '不好不好', '2022-02-19 09:46:51', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (25, 3, 2, '呃呃呃', '2022-02-19 09:52:19', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (26, 3, 6, '呜呜呜', '2022-02-19 09:58:18', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (27, 3, 6, '回复@avavaava: 呜呜呜', '2022-02-19 09:58:22', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (28, 3, 6, '回复@avavaava\r\n                                                    : 呃呃呃', '2022-02-19 09:58:40', 27, 27, 0, 0);
INSERT INTO `videocomment` VALUES (29, 6, 9, 'eee', '2022-02-22 00:36:48', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (30, 6, 9, '评论', '2022-02-22 00:39:13', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (31, 3, 10, NULL, '2022-03-03 14:36:57', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (32, 3, 10, '556666', '2022-04-01 05:21:06', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for videocommentclick
-- ----------------------------
DROP TABLE IF EXISTS `videocommentclick`;
CREATE TABLE `videocommentclick`  (
  `commentId` int NULL DEFAULT NULL,
  `userId` int NULL DEFAULT NULL,
  `clickDate` datetime NULL DEFAULT NULL,
  `clickMode` int NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videocommentclick
-- ----------------------------
INSERT INTO `videocommentclick` VALUES (2, 3, '2022-01-29 08:24:57', 0);
INSERT INTO `videocommentclick` VALUES (1, 3, '2022-01-29 08:30:39', 0);
INSERT INTO `videocommentclick` VALUES (14, 3, '2022-02-21 13:59:03', 0);

-- ----------------------------
-- Table structure for videofavorite
-- ----------------------------
DROP TABLE IF EXISTS `videofavorite`;
CREATE TABLE `videofavorite`  (
  `favoriteId` int NOT NULL,
  `videoId` int NOT NULL,
  `favoriteDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`videoId`, `favoriteId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videofavorite
-- ----------------------------
INSERT INTO `videofavorite` VALUES (1, 1, '2022-02-19 09:54:54');
INSERT INTO `videofavorite` VALUES (3, 1, '2022-02-21 13:52:19');
INSERT INTO `videofavorite` VALUES (7, 1, '2022-02-21 13:52:19');
INSERT INTO `videofavorite` VALUES (1, 2, '2022-01-24 21:24:19');
INSERT INTO `videofavorite` VALUES (2, 3, '2022-02-19 09:57:27');
INSERT INTO `videofavorite` VALUES (3, 3, '2022-02-19 09:57:27');
INSERT INTO `videofavorite` VALUES (3, 4, '2022-01-26 03:49:00');
INSERT INTO `videofavorite` VALUES (7, 4, '2022-01-26 03:49:00');
INSERT INTO `videofavorite` VALUES (10, 10, '2022-02-22 00:40:32');

-- ----------------------------
-- Table structure for videotag
-- ----------------------------
DROP TABLE IF EXISTS `videotag`;
CREATE TABLE `videotag`  (
  `tagId` int NOT NULL AUTO_INCREMENT,
  `tagName` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoId` int NULL DEFAULT NULL,
  PRIMARY KEY (`tagId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videotag
-- ----------------------------

-- ----------------------------
-- Table structure for videotransmit
-- ----------------------------
DROP TABLE IF EXISTS `videotransmit`;
CREATE TABLE `videotransmit`  (
  `userId` int NOT NULL,
  `videoId` int NOT NULL,
  `transmitMode` int NULL DEFAULT 0,
  `transmitDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `videoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videotransmit
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
