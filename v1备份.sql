/*
 Navicat Premium Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 101.200.141.57:3306
 Source Schema         : youngtube

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 14/04/2022 15:53:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminId` int(0) NOT NULL,
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
  `userId` int(0) NULL DEFAULT NULL,
  `appealId` int(0) NULL DEFAULT NULL,
  `appealType` int(0) NULL DEFAULT NULL,
  `appealContent` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `appealDate` datetime(0) NULL DEFAULT NULL,
  `assessorId` int(0) NULL DEFAULT NULL,
  `appealStatus` int(0) NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appeal
-- ----------------------------

-- ----------------------------
-- Table structure for blacklist
-- ----------------------------
DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist`  (
  `blackUserId` int(0) NOT NULL,
  `blackedUserId` int(0) NOT NULL,
  `blackDate` datetime(0) NULL DEFAULT NULL,
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
  `danmuId` int(0) NOT NULL AUTO_INCREMENT,
  `videoId` int(0) NULL DEFAULT NULL,
  `userId` int(0) NULL DEFAULT NULL,
  `dcontent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dsize` int(0) NULL DEFAULT 0,
  `dcolor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dtime` float NULL DEFAULT NULL,
  `dSendTime` datetime(0) NULL DEFAULT NULL,
  `position` int(0) NULL DEFAULT NULL,
  `danmuAuditStatus` int(0) NULL DEFAULT 0,
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
  `dynamicId` int(0) NOT NULL AUTO_INCREMENT,
  `userId` int(0) NULL DEFAULT NULL,
  `dynamicContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dynamicIsTop` int(0) NULL DEFAULT 0,
  `dynamicDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`dynamicId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `dynamic` VALUES (24, 3, '', 0, '2022-04-04 10:16:29');
INSERT INTO `dynamic` VALUES (25, 3, 'jgvbghyub', 0, '2022-04-14 02:42:09');

-- ----------------------------
-- Table structure for dynamiccomment
-- ----------------------------
DROP TABLE IF EXISTS `dynamiccomment`;
CREATE TABLE `dynamiccomment`  (
  `commentId` int(0) NOT NULL AUTO_INCREMENT,
  `userId` int(0) NULL DEFAULT NULL,
  `dynamicId` int(0) NULL DEFAULT NULL,
  `commentContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `commentPraise` int(0) NULL DEFAULT 0,
  `commentDislike` int(0) NULL DEFAULT 0,
  `commentDate` datetime(0) NULL DEFAULT NULL,
  `fatherCommentId` int(0) NULL DEFAULT 0,
  `commentAuditStatus` int(0) NULL DEFAULT 0,
  `dynamicCommentIsTop` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
  `dynamicId` int(0) NOT NULL,
  `userId` int(0) NOT NULL,
  `praiseDate` datetime(0) NULL DEFAULT NULL,
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
  `favoriteId` int(0) NOT NULL AUTO_INCREMENT,
  `favoriteName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` int(0) NULL DEFAULT NULL,
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
INSERT INTO `favorite` VALUES (11, 'klkl', 9);
INSERT INTO `favorite` VALUES (12, 'test1', 7);
INSERT INTO `favorite` VALUES (13, 'test2', 7);

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `followUserId` int(0) NOT NULL,
  `followedUserId` int(0) NOT NULL,
  `followDate` datetime(0) NULL DEFAULT NULL,
  `followMode` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`followUserId`, `followedUserId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES (3, 3, '2022-02-21 13:59:22', 0);
INSERT INTO `follow` VALUES (3, 5, '2022-01-28 07:04:13', 0);
INSERT INTO `follow` VALUES (6, 3, '2022-02-21 14:04:19', 0);
INSERT INTO `follow` VALUES (6, 5, '2022-01-20 11:32:06', 0);
INSERT INTO `follow` VALUES (7, 3, '2022-04-13 04:31:24', 0);

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `userId` int(0) NOT NULL,
  `contentType` int(0) NOT NULL DEFAULT 0,
  `contentId` int(0) NOT NULL,
  `viewDate` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES (7, 1, 3, '2022-04-13 04:46:23');
INSERT INTO `history` VALUES (7, 1, 8, '2022-04-13 04:46:58');
INSERT INTO `history` VALUES (7, 1, 10, '2022-04-13 04:31:21');
INSERT INTO `history` VALUES (7, 1, 12, '2022-04-13 08:16:28');
INSERT INTO `history` VALUES (7, 1, 17, '2022-04-13 08:16:14');
INSERT INTO `history` VALUES (3, 1, 3, '2022-04-06 16:38:11');
INSERT INTO `history` VALUES (3, 1, 12, '2022-04-06 16:45:36');
INSERT INTO `history` VALUES (3, 1, 20, '2022-04-13 08:48:25');
INSERT INTO `history` VALUES (7, 1, 12, '2022-04-13 08:24:11');
INSERT INTO `history` VALUES (7, 1, 17, '2022-04-13 08:16:14');
INSERT INTO `history` VALUES (7, 1, 6, '2022-04-13 08:24:15');
INSERT INTO `history` VALUES (7, 1, 18, '2022-04-13 08:16:32');
INSERT INTO `history` VALUES (7, 1, 8, '2022-04-13 08:16:11');
INSERT INTO `history` VALUES (7, 1, 9, '2022-04-13 08:16:36');
INSERT INTO `history` VALUES (7, 1, 20, '2022-04-13 08:48:25');
INSERT INTO `history` VALUES (3, 1, 5, '2022-04-13 08:48:25');
INSERT INTO `history` VALUES (3, 1, 7, '2022-04-13 08:48:25');
INSERT INTO `history` VALUES (3, 1, 25, '2022-04-13 08:48:25');
INSERT INTO `history` VALUES (3, 1, 12, '2022-04-13 08:48:25');
INSERT INTO `history` VALUES (7, 1, 11, '2022-04-13 12:51:16');
INSERT INTO `history` VALUES (7, 1, 2, '2022-04-13 12:51:30');
INSERT INTO `history` VALUES (7, 1, 4, '2022-04-13 12:51:24');
INSERT INTO `history` VALUES (9, 1, 20, '2022-04-13 14:24:05');
INSERT INTO `history` VALUES (7, 1, 11, '2022-04-14 01:22:37');
INSERT INTO `history` VALUES (9, 1, 3, '2022-04-14 02:44:40');
INSERT INTO `history` VALUES (9, 1, 18, '2022-04-14 02:45:04');
INSERT INTO `history` VALUES (7, 1, 5, '2022-04-14 04:32:04');
INSERT INTO `history` VALUES (7, 1, 10, '2022-04-14 04:31:55');
INSERT INTO `history` VALUES (7, 1, 2, '2022-04-14 06:08:59');
INSERT INTO `history` VALUES (7, 1, 3, '2022-04-14 06:09:03');
INSERT INTO `history` VALUES (7, 1, 10, '2022-04-14 06:06:41');
INSERT INTO `history` VALUES (3, 1, 10, '2022-04-14 06:28:08');
INSERT INTO `history` VALUES (7, 1, 2, '2022-04-14 06:26:04');
INSERT INTO `history` VALUES (3, 1, 44, '2022-04-14 06:30:24');
INSERT INTO `history` VALUES (3, 1, 12, '2022-04-14 06:28:54');
INSERT INTO `history` VALUES (3, 1, 7, '2022-04-14 06:28:23');
INSERT INTO `history` VALUES (3, 1, 9, '2022-04-14 06:29:23');
INSERT INTO `history` VALUES (3, 1, 10, '2022-04-14 06:38:08');
INSERT INTO `history` VALUES (7, 1, 45, '2022-04-14 06:34:19');
INSERT INTO `history` VALUES (7, 1, 46, '2022-04-14 06:48:00');
INSERT INTO `history` VALUES (7, 1, 39, '2022-04-14 06:44:52');
INSERT INTO `history` VALUES (7, 1, 10, '2022-04-14 06:43:51');
INSERT INTO `history` VALUES (3, 1, 47, '2022-04-14 06:57:25');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `messageId` int(0) NOT NULL AUTO_INCREMENT,
  `sendUserId` int(0) NULL DEFAULT NULL,
  `receiveUserId` int(0) NULL DEFAULT NULL,
  `messageContent` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `messageDate` datetime(0) NULL DEFAULT NULL,
  `messageAuditStatus` int(0) NULL DEFAULT 0,
  `messageStatus` int(0) NULL DEFAULT 0,
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
  `userId` int(0) NULL DEFAULT NULL,
  `showFavorite` int(0) NULL DEFAULT 1,
  `showPraise` int(0) NULL DEFAULT 1,
  `showCoin` int(0) NULL DEFAULT 1,
  `showFollow` int(0) NULL DEFAULT 1,
  `showInformation` int(0) NULL DEFAULT 1
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of privacysetting
-- ----------------------------

-- ----------------------------
-- Table structure for profit
-- ----------------------------
DROP TABLE IF EXISTS `profit`;
CREATE TABLE `profit`  (
  `userId` int(0) NULL DEFAULT NULL,
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
  `userId` int(0) NULL DEFAULT NULL,
  `reportType` int(0) NULL DEFAULT 0,
  `contentId` int(0) NULL DEFAULT NULL,
  `reportReason` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reportDate` datetime(0) NULL DEFAULT NULL,
  `reportStatus` int(0) NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for suggestion
-- ----------------------------
DROP TABLE IF EXISTS `suggestion`;
CREATE TABLE `suggestion`  (
  `suggestionId` int(0) NOT NULL AUTO_INCREMENT,
  `userId` int(0) NULL DEFAULT NULL,
  `suggestionContent` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `suggestionTitle` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `suggestionStatus` int(0) NULL DEFAULT 0,
  `assessorId` int(0) NULL DEFAULT NULL,
  `assessDate` datetime(0) NULL DEFAULT NULL,
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
  `userId` int(0) NOT NULL AUTO_INCREMENT,
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
  `vipGrade` int(0) NULL DEFAULT 0,
  `userReputation` int(0) NULL DEFAULT 100,
  `userIsUp` int(0) NULL DEFAULT 0,
  `registTime` datetime(0) NULL DEFAULT NULL,
  `userCoin` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `userPetName`(`userPetName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, 'avavaava', '这个人很神秘，什么都没有写', 'e10adc3949ba59abbe56e057f20f883e', '/common/pictures/user/userhead/wanwan.jpg', NULL, NULL, NULL, '山东省临沂市', '122.6.184.73', '16865213017', NULL, 0, 100, 0, '2022-01-11 04:52:01', 39);
INSERT INTO `user` VALUES (5, '资深up主', '这个人很神秘，什么都没有写', 'e10adc3949ba59abbe56e057f20f883e', '/common/pictures/user/userhead/defaulthead.png', NULL, NULL, NULL, '山东省临沂市', '122.6.184.73', '19812323123', NULL, 0, 100, 0, '2022-01-12 00:39:31', 50);
INSERT INTO `user` VALUES (6, 'user22', '这个人很神秘，什么都没有写', 'e10adc3949ba59abbe56e057f20f883e', '/common/pictures/user/userhead/defaulthead.png', NULL, NULL, NULL, '山东省临沂市', '122.6.184.73', '11111111111', NULL, 0, 100, 0, '2022-01-16 06:00:57', 15);
INSERT INTO `user` VALUES (7, 'libo', '这个人很神秘，什么都没有写', 'e10adc3949ba59abbe56e057f20f883e', '/common/pictures/user/userhead/defaulthead.png', NULL, NULL, NULL, '山东省', '120.192.77.17', '13645419692', NULL, 0, 100, 0, '2022-04-03 01:44:27', 18);
INSERT INTO `user` VALUES (9, '123', '这个人很神秘，什么都没有写', 'e10adc3949ba59abbe56e057f20f883e', '/common/pictures/user/userhead/defaulthead.png', NULL, NULL, NULL, '山东省', '120.192.77.21', '13645419691', NULL, 0, 100, 0, '2022-04-13 11:54:48', 19);
INSERT INTO `user` VALUES (10, '123456', '这个人很神秘，什么都没有写', 'e10adc3949ba59abbe56e057f20f883e', '/common/pictures/user/userhead/defaulthead.png', NULL, NULL, NULL, '山东省', '120.192.77.19', '13645419693', NULL, 0, 100, 0, '2022-04-14 06:19:23', 20);

-- ----------------------------
-- Table structure for usersimiliarity
-- ----------------------------
DROP TABLE IF EXISTS `usersimiliarity`;
CREATE TABLE `usersimiliarity`  (
  `userId1` int(0) NOT NULL,
  `userId2` int(0) NOT NULL,
  `similiarity` double NULL DEFAULT NULL,
  PRIMARY KEY (`userId1`, `userId2`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usersimiliarity
-- ----------------------------
INSERT INTO `usersimiliarity` VALUES (3, 5, 0.5169267409357977);
INSERT INTO `usersimiliarity` VALUES (3, 6, 0.7542264350410416);
INSERT INTO `usersimiliarity` VALUES (3, 7, 0.40238972556325453);
INSERT INTO `usersimiliarity` VALUES (3, 9, 0.33765513325135343);
INSERT INTO `usersimiliarity` VALUES (3, 10, 0);
INSERT INTO `usersimiliarity` VALUES (5, 3, 0.5169267409357977);
INSERT INTO `usersimiliarity` VALUES (5, 6, 0.43297706738597536);
INSERT INTO `usersimiliarity` VALUES (5, 7, -0.0748163907405261);
INSERT INTO `usersimiliarity` VALUES (5, 9, -0.036450740219987725);
INSERT INTO `usersimiliarity` VALUES (5, 10, 0);
INSERT INTO `usersimiliarity` VALUES (6, 3, 0.7542264350410416);
INSERT INTO `usersimiliarity` VALUES (6, 5, 0.43297706738597536);
INSERT INTO `usersimiliarity` VALUES (6, 7, 0.34937293184314144);
INSERT INTO `usersimiliarity` VALUES (6, 9, -0.054992668133007704);
INSERT INTO `usersimiliarity` VALUES (6, 10, 0);
INSERT INTO `usersimiliarity` VALUES (7, 3, 0.40238972556325453);
INSERT INTO `usersimiliarity` VALUES (7, 5, -0.0748163907405261);
INSERT INTO `usersimiliarity` VALUES (7, 6, 0.34937293184314144);
INSERT INTO `usersimiliarity` VALUES (7, 9, 0.40143100755737965);
INSERT INTO `usersimiliarity` VALUES (7, 10, 0);
INSERT INTO `usersimiliarity` VALUES (9, 3, 0.33765513325135343);
INSERT INTO `usersimiliarity` VALUES (9, 5, -0.036450740219987725);
INSERT INTO `usersimiliarity` VALUES (9, 6, -0.054992668133007704);
INSERT INTO `usersimiliarity` VALUES (9, 7, 0.40143100755737965);
INSERT INTO `usersimiliarity` VALUES (9, 10, 0);
INSERT INTO `usersimiliarity` VALUES (10, 3, 0);
INSERT INTO `usersimiliarity` VALUES (10, 5, 0);
INSERT INTO `usersimiliarity` VALUES (10, 6, 0);
INSERT INTO `usersimiliarity` VALUES (10, 7, 0);
INSERT INTO `usersimiliarity` VALUES (10, 9, 0);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `videoId` int(0) NOT NULL AUTO_INCREMENT,
  `videoName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoIntroduction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoCategory` int(0) NULL DEFAULT NULL,
  `videoFrontSrc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoSrc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoViewCount` int(0) NULL DEFAULT 0,
  `videoIssuingTime` datetime(0) NULL DEFAULT NULL,
  `videoAuditStatus` int(0) NULL DEFAULT 0,
  `videoUpId` int(0) NULL DEFAULT NULL,
  `videoTeenagerMode` int(0) NULL DEFAULT 0,
  `videoDuring` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`videoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (1, '某科学的超电磁炮精剪', '喜欢我二次元吗?', 1, '/video/videoFont/paojie.png', '/video/paojie.mp4', 14, '2022-01-12 09:03:12', 0, 5, 0, '02:29');
INSERT INTO `video` VALUES (2, '刀剑神域', '喜欢我刀剑神域吗?', 1, '/video/videoFont/daojian.png', '/video/meimei.mp4', 9, '2022-01-12 09:03:14', 0, 5, 0, '04:31');
INSERT INTO `video` VALUES (3, '随机对对子不要笑蹭饭大挑战', '喜欢我p大将吗?', 2, 'http://i1.hdslb.com/bfs/archive/85235bc452a3a4da46ac08c4cf4da148e06c4ead.jpg', '/video/xiaoyuan.mp4', 11048, '2022-01-12 09:03:16', 0, 5, 0, '01:25');
INSERT INTO `video` VALUES (4, '嘉然的战争', '欧内的手哈嘉嘉', 1, '/video/videoFont/bilansuo.png', '/video/longnvpu.mp4', 4, '2022-01-12 09:05:08', 0, 5, 0, '03:02');
INSERT INTO `video` VALUES (5, '小艾锐评', '早该图图了', 3, 'http://i2.hdslb.com/bfs/archive/8587ccd716c66f44a494b3101a3d0777a4095290.jpg', '/video/longnvpu.mp4', 14, '2022-01-12 12:18:41', 0, 3, 0, '02:15');
INSERT INTO `video` VALUES (6, '温暖二次元', '闹挺大', 1, '/video/videoFont/zhongerbing.png', '/video/longnvpu.mp4', 245, '2022-01-12 12:19:44', 0, 5, 0, '05:23');
INSERT INTO `video` VALUES (7, '美国疫情现状', 'winwin', 3, '/video/videoFont/daojian.png', '/video/longnvpu.mp4', 1, '2022-01-12 13:05:28', 0, 5, 0, '06:44');
INSERT INTO `video` VALUES (8, '回家', '下北泽金曲', 4, 'http://i0.hdslb.com/bfs/archive/5782f82b46c3c558e6266e97d9b901d139869cd3.jpg', '/video/paojie.mp4', 40, '2022-01-12 13:06:35', 0, 3, 0, '01:58');
INSERT INTO `video` VALUES (9, '【黑马程序员】java从入门到放弃', '喜欢我计算机吗', 2, 'http://i2.hdslb.com/bfs/archive/7ee0526eb512928ac3f707bbfbd842d64bc313cd.png', '/video/longnvpu.mp4', 21337, '2022-01-17 21:33:47', 0, 5, 0, '23:31');
INSERT INTO `video` VALUES (10, '【高燃】我患上了玉玉证', '喜欢我玉皇大帝吗?', 2, '/video/videoFont/bilansuo.png', '/video/xiaoyuan.mp4', 992057, '2022-01-17 21:35:05', 0, 3, 0, '04:14');
INSERT INTO `video` VALUES (11, '【秒懂百科】秒懂百科bot', '绝绝子', 5, '/video/videoFont/bilansuo.png', '/video/xiaoyuan.mp4', 5, '2022-01-19 20:02:56', 0, 6, 0, '12:31');
INSERT INTO `video` VALUES (12, '牛中牛牛', 'npk48', 1, 'http://i1.hdslb.com/bfs/archive/ba8785fe6fa4506c4c21e3d8eb44cb27c5454691.jpg', '//player.bilibili.com/player.html?aid=11200262&cid=18527724&page=1', 9, '2022-02-20 20:01:20', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (17, 'ddd', 'dddd', 3, '/video/videoFont/1648786001335_longyuhu.png', '/video/1648785998278_5076187-1-hd.mp4', 3, '2022-04-01 04:06:38', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (18, '【一眼顶针】zood', '从理塘到了上海', 3, '/video/videoFont/1648786257472_13817402-1-hd.png', '/video/1648786253221_5082973-1-hd.mp4', 2, '2022-04-01 04:10:53', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (19, '不要急眼挑战', '我急了', 7, '/video/videoFont/1648786642146_henxiangjianni.png', '/video/1648786640768_10206688-1-hd.mp4', 2, '2022-04-01 04:17:21', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (20, '【冰与火之歌】爱民如子乔弗里', 'hear me roar', 2, '/video/videoFont/1648786906505_6760443-1-hd.png', '/video/1648786905306_datastract.mp4', 3, '2022-04-01 04:21:45', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (21, '【燃爆】耗时114514小时，真是绝绝子', '好汉', 3, '/video/videoFont/1648787170131_girlatbluecomputer0.4.png', '/video/1648787167653_binansuo.mp4', 0, '2022-04-01 04:26:08', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (22, '【嗨🐎程序员】操作系统入门', '操作系统', 6, '/video/videoFont/1648787313350_os.png', '/video/1648787311235_daojian.mp4', 2, '2022-04-01 04:28:31', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (23, '【血与火】坦格利安', 'got', 4, '/video/videoFont/1648787430674_5076187-1-hd.png', '/video/1648787429465_maijin.mp4', 0, '2022-04-01 04:30:29', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (24, '服务器测试', 'ttest', 7, '/video/videoFont/1648817026442_gaobaiqiu.png', '/video/1648817025421_13817402-1-hd.mp4', 2, '2022-04-01 12:43:45', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (25, '电棍爆炸', '爆爆爆', 3, '/video/videoFont/1648911545507_1648786543639.jpg', '/video/1648911545376_QQ视频_b2b780e0db85d87c7b71ca27f9f45bf11635156935.mp4', 2, '2022-04-02 14:59:05', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (26, '111113', '11111', 2, '/video/videoFont/1649082953579_20210626 0944.jpg', '/video/1649082953432_WIN_20210615_13_59_52_Pro.mp4', 0, '2022-04-04 14:35:53', 0, 5, 0, NULL);
INSERT INTO `video` VALUES (27, 'weee', 'wewewe', 3, '/video/videoFont/1649084223315_14779495-1-hd.png', '/video/1649084220106_3617382hd.mp4', 0, '2022-04-04 14:57:00', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (28, '111', '111', 3, '/video/videoFont/1649084491162_油储191董嘉辉.jpg', '/video/1649084488373_油储191董嘉辉.mp4', 0, '2022-04-04 15:01:28', 0, 5, 0, NULL);
INSERT INTO `video` VALUES (29, '11', '111', 4, '/video/videoFont/1649084609429_油储191董嘉辉.jpg', '/video/1649084607022_油储191董嘉辉.mp4', 0, '2022-04-04 15:03:27', 0, 5, 0, NULL);
INSERT INTO `video` VALUES (30, '111', '111', 2, '/video/videoFont/1649084843431_油储191董嘉辉.jpg', '/video/1649084839549_油储191董嘉辉.mp4', 0, '2022-04-04 15:07:20', 0, 5, 0, NULL);
INSERT INTO `video` VALUES (31, '11', '11', 2, '/video/videoFont/1649084946280_油储191董嘉辉.jpg', '/video/1649084943687_油储191董嘉辉.mp4', 0, '2022-04-04 15:09:04', 0, 5, 0, NULL);
INSERT INTO `video` VALUES (32, '1111', '111', 4, '/video/videoFont/1649086121870_20210626 0944.jpg', '/video/1649086121491_WIN_20210615_13_59_52_Pro.mp4', 0, '2022-04-04 15:28:41', 0, 5, 0, NULL);
INSERT INTO `video` VALUES (33, '111', '111', 3, '/video/videoFont/1649086663062_20210626 0944.jpg', '/video/1649086662673_WIN_20210615_13_59_52_Pro.mp4', 0, '2022-04-04 15:37:43', 0, 5, 0, NULL);
INSERT INTO `video` VALUES (34, '22222323', '2213123', 0, '/video/videoFont/1649086689902_20210626 0944.jpg', '/video/1649086689425_WIN_20210615_13_59_52_Pro.mp4', 0, '2022-04-04 15:38:09', 0, 5, 0, NULL);
INSERT INTO `video` VALUES (35, '9900', '0009809', 2, '/video/videoFont/1649086715633_20210626 0944.jpg', '/video/1649086715289_WIN_20210615_13_59_52_Pro.mp4', 0, '2022-04-04 15:38:35', 0, 5, 0, NULL);
INSERT INTO `video` VALUES (36, '111111', '112334434', 2, '/video/videoFont/1649086942318_20210626 0944.jpg', '/video/1649086941904_WIN_20210615_13_59_52_Pro.mp4', 0, '2022-04-04 15:42:22', 0, 5, 0, NULL);
INSERT INTO `video` VALUES (37, '网红', '主播', 2, '/video/videoFont/1649605086910_油储191董嘉辉.jpg', '/video/1649605084528_油储191董嘉辉.mp4', 0, '2022-04-10 15:38:05', 0, 7, 0, NULL);
INSERT INTO `video` VALUES (38, '11111', '111111', 1, '/video/videoFont/1649605339844_QQ图片20220310151055.jpg', '/video/1649605335517_油储191董嘉辉.mp4', 0, '2022-04-10 15:42:16', 0, 7, 0, NULL);
INSERT INTO `video` VALUES (39, '00', '哈哈', 1, '/video/videoFont/1649647587295_QQ图片20220310151100.jpg', '/video/1649647581583_油储191董嘉辉.mp4', 1, '2022-04-11 03:26:22', 0, 7, 0, NULL);
INSERT INTO `video` VALUES (40, '背景', '嗯', 1, '/video/videoFont/1649647671549_QQ图片20220305093413.jpg', '/video/1649647669108_油储191董嘉辉.mp4', 1, '2022-04-11 03:27:49', 0, 7, 0, NULL);
INSERT INTO `video` VALUES (41, '标题1', '描述1', 1, '/video/videoFont/1649647756361_QQ图片20220305093413.jpg', '/video/1649647751992_油储191董嘉辉.mp4', 0, '2022-04-11 03:29:12', 0, 7, 0, NULL);
INSERT INTO `video` VALUES (42, 'waeaw2221', 'awewae', 8, '/video/videoFont/1649778976874_girlatbluecomputer0.4.png', '/video/1649778974806_richangdawang.mp4', 0, '2022-04-12 15:56:15', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (43, 'biaoqian11212', 'fwadwa', 2, '/video/videoFont/1649779089924_girlatbluecomputer0.4.png', '/video/1649779087373_binansuo.mp4', 0, '2022-04-12 15:58:07', 0, 3, 0, NULL);
INSERT INTO `video` VALUES (44, '996669696', '99696', 6, '/video/videoFont/1649779341805_7_QQ图片20220310151055.jpg', '/video/1649779338786_7_油储191董嘉辉.mp4', 1, '2022-04-12 16:02:19', 0, 7, 0, NULL);
INSERT INTO `video` VALUES (45, '真是好人啊', '确实', 1, '/video/videoFont/1649918030530_7_油储191董嘉辉.jpg', '/video/1649918029091_7_油储191董嘉辉.mp4', 1, '2022-04-14 06:33:49', 0, 7, 0, NULL);
INSERT INTO `video` VALUES (46, 'test1', 'test1', 5, '/video/videoFont/1649918857383_7_油储191董嘉辉.jpg', '/video/1649918855995_7_djh.mp4', 1, '2022-04-14 06:47:36', 0, 7, 0, NULL);
INSERT INTO `video` VALUES (47, 'tougeceshi_111', 'tougeceshi_111', 1, '/video/videoFont/1649919417547_3_longnvpu.png', '/video/1649919412275_3_3617382hd.mp4', 2, '2022-04-14 06:56:52', 0, 3, 0, NULL);

-- ----------------------------
-- Table structure for videocategory
-- ----------------------------
DROP TABLE IF EXISTS `videocategory`;
CREATE TABLE `videocategory`  (
  `categoryId` int(0) NOT NULL AUTO_INCREMENT,
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
  `userId` int(0) NOT NULL,
  `videoId` int(0) NOT NULL,
  `clickDate` datetime(0) NULL DEFAULT NULL,
  `clickType` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userId`, `videoId`, `clickType`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videoclick
-- ----------------------------
INSERT INTO `videoclick` VALUES (3, 2, '2022-01-19 10:48:07', 0);
INSERT INTO `videoclick` VALUES (3, 5, '2022-04-03 09:52:38', 0);
INSERT INTO `videoclick` VALUES (3, 6, '2022-02-19 09:59:00', 0);
INSERT INTO `videoclick` VALUES (3, 7, '2022-01-16 03:25:16', 0);
INSERT INTO `videoclick` VALUES (3, 8, '2022-01-16 03:19:18', 0);
INSERT INTO `videoclick` VALUES (3, 10, '2022-04-11 14:27:39', 1);
INSERT INTO `videoclick` VALUES (5, 1, '2022-01-16 02:49:51', 0);
INSERT INTO `videoclick` VALUES (5, 5, '2022-02-19 10:09:52', 0);
INSERT INTO `videoclick` VALUES (5, 6, '2022-01-16 03:06:24', 0);
INSERT INTO `videoclick` VALUES (6, 1, '2022-01-20 11:33:31', 0);
INSERT INTO `videoclick` VALUES (6, 2, '2022-01-20 11:31:23', 0);
INSERT INTO `videoclick` VALUES (6, 9, '2022-02-22 00:38:49', 0);
INSERT INTO `videoclick` VALUES (6, 10, '2022-02-22 00:40:47', 0);
INSERT INTO `videoclick` VALUES (7, 3, '2022-04-11 07:10:53', 0);
INSERT INTO `videoclick` VALUES (7, 4, '2022-04-13 12:51:19', 0);
INSERT INTO `videoclick` VALUES (7, 4, '2022-04-13 12:51:20', 1);
INSERT INTO `videoclick` VALUES (7, 5, NULL, 0);
INSERT INTO `videoclick` VALUES (7, 5, NULL, 1);
INSERT INTO `videoclick` VALUES (7, 10, '2022-04-11 07:10:06', 0);
INSERT INTO `videoclick` VALUES (7, 11, '2022-04-12 10:35:39', 0);
INSERT INTO `videoclick` VALUES (7, 11, '2022-04-12 10:35:43', 1);

-- ----------------------------
-- Table structure for videocoin
-- ----------------------------
DROP TABLE IF EXISTS `videocoin`;
CREATE TABLE `videocoin`  (
  `userId` int(0) NOT NULL,
  `videoId` int(0) NOT NULL,
  `coinCount` int(0) NULL DEFAULT NULL,
  `coinDate` datetime(0) NULL DEFAULT NULL,
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
INSERT INTO `videocoin` VALUES (7, 4, 1, '2022-04-13 12:51:21');
INSERT INTO `videocoin` VALUES (7, 11, 1, '2022-04-12 10:35:41');
INSERT INTO `videocoin` VALUES (9, 3, 1, '2022-04-14 02:43:03');

-- ----------------------------
-- Table structure for videocomment
-- ----------------------------
DROP TABLE IF EXISTS `videocomment`;
CREATE TABLE `videocomment`  (
  `commentId` int(0) NOT NULL AUTO_INCREMENT,
  `userId` int(0) NULL DEFAULT NULL,
  `videoId` int(0) NULL DEFAULT NULL,
  `commentContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `commentDate` datetime(0) NULL DEFAULT NULL,
  `fatherCommentId` int(0) NULL DEFAULT 0,
  `replyCommentId` int(0) NULL DEFAULT 0,
  `commentAuditStatus` int(0) NULL DEFAULT 0,
  `videoCommentIsTop` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `videocomment` VALUES (33, 3, 10, NULL, '2022-04-01 12:42:39', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (34, 3, 10, NULL, '2022-04-01 12:42:47', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (35, 3, 10, '笑死了哈哈哈', '2022-04-01 12:42:55', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (36, 3, 10, '1111testt', '2022-04-03 14:54:35', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (37, 7, 10, '11', '2022-04-10 14:08:16', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (38, 7, 3, '1111', '2022-04-11 03:04:26', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (39, 7, 3, '回复@libo:好人', '2022-04-11 03:05:43', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (40, 3, 10, 'gggg', '2022-04-11 13:11:52', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (41, 9, 3, 'ytfycf,\r\n', '2022-04-14 02:43:31', 0, 0, 0, 0);
INSERT INTO `videocomment` VALUES (42, 9, 3, '回复@123: gy8gy', '2022-04-14 02:43:42', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for videocommentclick
-- ----------------------------
DROP TABLE IF EXISTS `videocommentclick`;
CREATE TABLE `videocommentclick`  (
  `commentId` int(0) NULL DEFAULT NULL,
  `userId` int(0) NULL DEFAULT NULL,
  `clickDate` datetime(0) NULL DEFAULT NULL,
  `clickMode` int(0) NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videocommentclick
-- ----------------------------
INSERT INTO `videocommentclick` VALUES (2, 3, '2022-01-29 08:24:57', 0);
INSERT INTO `videocommentclick` VALUES (1, 3, '2022-01-29 08:30:39', 0);
INSERT INTO `videocommentclick` VALUES (14, 3, '2022-02-21 13:59:03', 0);
INSERT INTO `videocommentclick` VALUES (14, 7, '2022-04-10 14:08:22', 0);

-- ----------------------------
-- Table structure for videocosine
-- ----------------------------
DROP TABLE IF EXISTS `videocosine`;
CREATE TABLE `videocosine`  (
  `videoId1` int(0) NOT NULL,
  `videoId2` int(0) NOT NULL,
  `cosine` double NULL DEFAULT NULL,
  PRIMARY KEY (`videoId1`, `videoId2`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videocosine
-- ----------------------------
INSERT INTO `videocosine` VALUES (1, 2, 0.5477225575051661);
INSERT INTO `videocosine` VALUES (1, 3, 0.5477225575051661);
INSERT INTO `videocosine` VALUES (1, 4, 0.47140452079103173);
INSERT INTO `videocosine` VALUES (1, 5, 0.408248290463863);
INSERT INTO `videocosine` VALUES (1, 6, 0.408248290463863);
INSERT INTO `videocosine` VALUES (1, 7, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 8, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 9, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 10, 0.24618298195866545);
INSERT INTO `videocosine` VALUES (1, 11, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 12, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 17, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 18, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 19, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 20, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 21, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 22, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 23, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 24, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 25, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 26, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 27, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 28, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 29, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 30, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 31, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 32, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 33, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 34, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 35, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 36, 1);
INSERT INTO `videocosine` VALUES (1, 37, 0.23570226039551587);
INSERT INTO `videocosine` VALUES (1, 38, 0.47140452079103173);
INSERT INTO `videocosine` VALUES (1, 39, 0.5);
INSERT INTO `videocosine` VALUES (1, 40, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 41, 0.2581988897471611);
INSERT INTO `videocosine` VALUES (1, 42, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 43, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (1, 44, 0.4629100498862757);
INSERT INTO `videocosine` VALUES (1, 45, 0.45291081365783825);
INSERT INTO `videocosine` VALUES (1, 46, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (1, 47, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (2, 1, 0.5477225575051661);
INSERT INTO `videocosine` VALUES (2, 3, 0.8);
INSERT INTO `videocosine` VALUES (2, 4, 0.7745966692414834);
INSERT INTO `videocosine` VALUES (2, 5, 0.5962847939999439);
INSERT INTO `videocosine` VALUES (2, 6, 0.5962847939999439);
INSERT INTO `videocosine` VALUES (2, 7, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 8, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 9, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 10, 0.40451991747794525);
INSERT INTO `videocosine` VALUES (2, 11, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 12, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 17, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 18, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 19, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 20, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 21, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 22, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 23, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 24, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 25, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 26, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 27, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 28, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 29, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 30, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 31, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 32, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 33, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 34, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 35, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 36, 0.5477225575051661);
INSERT INTO `videocosine` VALUES (2, 37, 0.3872983346207417);
INSERT INTO `videocosine` VALUES (2, 38, 0.7745966692414834);
INSERT INTO `videocosine` VALUES (2, 39, 0.7302967433402214);
INSERT INTO `videocosine` VALUES (2, 40, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 41, 0.4242640687119285);
INSERT INTO `videocosine` VALUES (2, 42, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 43, 0.6708203932499369);
INSERT INTO `videocosine` VALUES (2, 44, 0.6761234037828132);
INSERT INTO `videocosine` VALUES (2, 45, 0.6201736729460423);
INSERT INTO `videocosine` VALUES (2, 46, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (2, 47, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 1, 0.5477225575051661);
INSERT INTO `videocosine` VALUES (3, 2, 0.8);
INSERT INTO `videocosine` VALUES (3, 4, 0.7745966692414834);
INSERT INTO `videocosine` VALUES (3, 5, 0.7453559924999299);
INSERT INTO `videocosine` VALUES (3, 6, 0.7453559924999299);
INSERT INTO `videocosine` VALUES (3, 7, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 8, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 9, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 10, 0.40451991747794525);
INSERT INTO `videocosine` VALUES (3, 11, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 12, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 17, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 18, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 19, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 20, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 21, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 22, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 23, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 24, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 25, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 26, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 27, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 28, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 29, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 30, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 31, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 32, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 33, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 34, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 35, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 36, 0.5477225575051661);
INSERT INTO `videocosine` VALUES (3, 37, 0.3872983346207417);
INSERT INTO `videocosine` VALUES (3, 38, 0.7745966692414834);
INSERT INTO `videocosine` VALUES (3, 39, 0.9128709291752769);
INSERT INTO `videocosine` VALUES (3, 40, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 41, 0.4242640687119285);
INSERT INTO `videocosine` VALUES (3, 42, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 43, 0.6708203932499369);
INSERT INTO `videocosine` VALUES (3, 44, 0.8451542547285166);
INSERT INTO `videocosine` VALUES (3, 45, 0.8682431421244593);
INSERT INTO `videocosine` VALUES (3, 46, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (3, 47, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (4, 1, 0.47140452079103173);
INSERT INTO `videocosine` VALUES (4, 2, 0.7745966692414834);
INSERT INTO `videocosine` VALUES (4, 3, 0.7745966692414834);
INSERT INTO `videocosine` VALUES (4, 5, 0.5773502691896257);
INSERT INTO `videocosine` VALUES (4, 6, 0.5773502691896257);
INSERT INTO `videocosine` VALUES (4, 7, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 8, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 9, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 10, 0.3481553119113957);
INSERT INTO `videocosine` VALUES (4, 11, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 12, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 17, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 18, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 19, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 20, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 21, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 22, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 23, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 24, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 25, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 26, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 27, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 28, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 29, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 30, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 31, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 32, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 33, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 34, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 35, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 36, 0.47140452079103173);
INSERT INTO `videocosine` VALUES (4, 37, 0.3333333333333333);
INSERT INTO `videocosine` VALUES (4, 38, 0.6666666666666666);
INSERT INTO `videocosine` VALUES (4, 39, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (4, 40, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 41, 0.3651483716701107);
INSERT INTO `videocosine` VALUES (4, 42, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 43, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (4, 44, 0.6546536707079772);
INSERT INTO `videocosine` VALUES (4, 45, 0.6405126152203485);
INSERT INTO `videocosine` VALUES (4, 46, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (4, 47, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (5, 1, 0.408248290463863);
INSERT INTO `videocosine` VALUES (5, 2, 0.5962847939999439);
INSERT INTO `videocosine` VALUES (5, 3, 0.7453559924999299);
INSERT INTO `videocosine` VALUES (5, 4, 0.5773502691896257);
INSERT INTO `videocosine` VALUES (5, 6, 0.5555555555555556);
INSERT INTO `videocosine` VALUES (5, 7, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 8, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 9, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 10, 0.30151134457776363);
INSERT INTO `videocosine` VALUES (5, 11, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 12, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 17, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 18, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 19, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 20, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 21, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 22, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 23, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 24, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 25, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 26, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 27, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 28, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 29, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 30, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 31, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 32, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 33, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 34, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 35, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 36, 0.408248290463863);
INSERT INTO `videocosine` VALUES (5, 37, 0.28867513459481287);
INSERT INTO `videocosine` VALUES (5, 38, 0.5773502691896257);
INSERT INTO `videocosine` VALUES (5, 39, 0.816496580927726);
INSERT INTO `videocosine` VALUES (5, 40, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 41, 0.31622776601683794);
INSERT INTO `videocosine` VALUES (5, 42, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 43, 0.5);
INSERT INTO `videocosine` VALUES (5, 44, 0.7559289460184544);
INSERT INTO `videocosine` VALUES (5, 45, 0.7396002616336388);
INSERT INTO `videocosine` VALUES (5, 46, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (5, 47, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 1, 0.408248290463863);
INSERT INTO `videocosine` VALUES (6, 2, 0.5962847939999439);
INSERT INTO `videocosine` VALUES (6, 3, 0.7453559924999299);
INSERT INTO `videocosine` VALUES (6, 4, 0.5773502691896257);
INSERT INTO `videocosine` VALUES (6, 5, 0.5555555555555556);
INSERT INTO `videocosine` VALUES (6, 7, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 8, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 9, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 10, 0.30151134457776363);
INSERT INTO `videocosine` VALUES (6, 11, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 12, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 17, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 18, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 19, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 20, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 21, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 22, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 23, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 24, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 25, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 26, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 27, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 28, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 29, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 30, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 31, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 32, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 33, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 34, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 35, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 36, 0.408248290463863);
INSERT INTO `videocosine` VALUES (6, 37, 0.28867513459481287);
INSERT INTO `videocosine` VALUES (6, 38, 0.5773502691896257);
INSERT INTO `videocosine` VALUES (6, 39, 0.6804138174397717);
INSERT INTO `videocosine` VALUES (6, 40, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 41, 0.31622776601683794);
INSERT INTO `videocosine` VALUES (6, 42, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 43, 0.5);
INSERT INTO `videocosine` VALUES (6, 44, 0.629940788348712);
INSERT INTO `videocosine` VALUES (6, 45, 0.647150228929434);
INSERT INTO `videocosine` VALUES (6, 46, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (6, 47, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (7, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (7, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (7, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (7, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (7, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (7, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (7, 8, 1);
INSERT INTO `videocosine` VALUES (7, 9, 1);
INSERT INTO `videocosine` VALUES (7, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (7, 11, 1);
INSERT INTO `videocosine` VALUES (7, 12, 1);
INSERT INTO `videocosine` VALUES (7, 17, 1);
INSERT INTO `videocosine` VALUES (7, 18, 1);
INSERT INTO `videocosine` VALUES (7, 19, 1);
INSERT INTO `videocosine` VALUES (7, 20, 1);
INSERT INTO `videocosine` VALUES (7, 21, 1);
INSERT INTO `videocosine` VALUES (7, 22, 1);
INSERT INTO `videocosine` VALUES (7, 23, 1);
INSERT INTO `videocosine` VALUES (7, 24, 1);
INSERT INTO `videocosine` VALUES (7, 25, 1);
INSERT INTO `videocosine` VALUES (7, 26, 1);
INSERT INTO `videocosine` VALUES (7, 27, 1);
INSERT INTO `videocosine` VALUES (7, 28, 1);
INSERT INTO `videocosine` VALUES (7, 29, 1);
INSERT INTO `videocosine` VALUES (7, 30, 1);
INSERT INTO `videocosine` VALUES (7, 31, 1);
INSERT INTO `videocosine` VALUES (7, 32, 1);
INSERT INTO `videocosine` VALUES (7, 33, 1);
INSERT INTO `videocosine` VALUES (7, 34, 1);
INSERT INTO `videocosine` VALUES (7, 35, 1);
INSERT INTO `videocosine` VALUES (7, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (7, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (7, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (7, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (7, 40, 1);
INSERT INTO `videocosine` VALUES (7, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (7, 42, 1);
INSERT INTO `videocosine` VALUES (7, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (7, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (7, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (7, 46, 1);
INSERT INTO `videocosine` VALUES (7, 47, 1);
INSERT INTO `videocosine` VALUES (8, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (8, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (8, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (8, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (8, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (8, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (8, 7, 1);
INSERT INTO `videocosine` VALUES (8, 9, 1);
INSERT INTO `videocosine` VALUES (8, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (8, 11, 1);
INSERT INTO `videocosine` VALUES (8, 12, 1);
INSERT INTO `videocosine` VALUES (8, 17, 1);
INSERT INTO `videocosine` VALUES (8, 18, 1);
INSERT INTO `videocosine` VALUES (8, 19, 1);
INSERT INTO `videocosine` VALUES (8, 20, 1);
INSERT INTO `videocosine` VALUES (8, 21, 1);
INSERT INTO `videocosine` VALUES (8, 22, 1);
INSERT INTO `videocosine` VALUES (8, 23, 1);
INSERT INTO `videocosine` VALUES (8, 24, 1);
INSERT INTO `videocosine` VALUES (8, 25, 1);
INSERT INTO `videocosine` VALUES (8, 26, 1);
INSERT INTO `videocosine` VALUES (8, 27, 1);
INSERT INTO `videocosine` VALUES (8, 28, 1);
INSERT INTO `videocosine` VALUES (8, 29, 1);
INSERT INTO `videocosine` VALUES (8, 30, 1);
INSERT INTO `videocosine` VALUES (8, 31, 1);
INSERT INTO `videocosine` VALUES (8, 32, 1);
INSERT INTO `videocosine` VALUES (8, 33, 1);
INSERT INTO `videocosine` VALUES (8, 34, 1);
INSERT INTO `videocosine` VALUES (8, 35, 1);
INSERT INTO `videocosine` VALUES (8, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (8, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (8, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (8, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (8, 40, 1);
INSERT INTO `videocosine` VALUES (8, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (8, 42, 1);
INSERT INTO `videocosine` VALUES (8, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (8, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (8, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (8, 46, 1);
INSERT INTO `videocosine` VALUES (8, 47, 1);
INSERT INTO `videocosine` VALUES (9, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (9, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (9, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (9, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (9, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (9, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (9, 7, 1);
INSERT INTO `videocosine` VALUES (9, 8, 1);
INSERT INTO `videocosine` VALUES (9, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (9, 11, 1);
INSERT INTO `videocosine` VALUES (9, 12, 1);
INSERT INTO `videocosine` VALUES (9, 17, 1);
INSERT INTO `videocosine` VALUES (9, 18, 1);
INSERT INTO `videocosine` VALUES (9, 19, 1);
INSERT INTO `videocosine` VALUES (9, 20, 1);
INSERT INTO `videocosine` VALUES (9, 21, 1);
INSERT INTO `videocosine` VALUES (9, 22, 1);
INSERT INTO `videocosine` VALUES (9, 23, 1);
INSERT INTO `videocosine` VALUES (9, 24, 1);
INSERT INTO `videocosine` VALUES (9, 25, 1);
INSERT INTO `videocosine` VALUES (9, 26, 1);
INSERT INTO `videocosine` VALUES (9, 27, 1);
INSERT INTO `videocosine` VALUES (9, 28, 1);
INSERT INTO `videocosine` VALUES (9, 29, 1);
INSERT INTO `videocosine` VALUES (9, 30, 1);
INSERT INTO `videocosine` VALUES (9, 31, 1);
INSERT INTO `videocosine` VALUES (9, 32, 1);
INSERT INTO `videocosine` VALUES (9, 33, 1);
INSERT INTO `videocosine` VALUES (9, 34, 1);
INSERT INTO `videocosine` VALUES (9, 35, 1);
INSERT INTO `videocosine` VALUES (9, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (9, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (9, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (9, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (9, 40, 1);
INSERT INTO `videocosine` VALUES (9, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (9, 42, 1);
INSERT INTO `videocosine` VALUES (9, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (9, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (9, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (9, 46, 1);
INSERT INTO `videocosine` VALUES (9, 47, 1);
INSERT INTO `videocosine` VALUES (10, 1, 0.24618298195866545);
INSERT INTO `videocosine` VALUES (10, 2, 0.40451991747794525);
INSERT INTO `videocosine` VALUES (10, 3, 0.40451991747794525);
INSERT INTO `videocosine` VALUES (10, 4, 0.3481553119113957);
INSERT INTO `videocosine` VALUES (10, 5, 0.30151134457776363);
INSERT INTO `videocosine` VALUES (10, 6, 0.30151134457776363);
INSERT INTO `videocosine` VALUES (10, 7, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 8, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 9, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 11, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 12, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 17, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 18, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 19, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 20, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 21, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 22, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 23, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 24, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 25, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 26, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 27, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 28, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 29, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 30, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 31, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 32, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 33, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 34, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 35, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 36, 0.24618298195866545);
INSERT INTO `videocosine` VALUES (10, 37, 0.17407765595569785);
INSERT INTO `videocosine` VALUES (10, 38, 0.3481553119113957);
INSERT INTO `videocosine` VALUES (10, 39, 0.3692744729379982);
INSERT INTO `videocosine` VALUES (10, 40, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 41, 0.19069251784911848);
INSERT INTO `videocosine` VALUES (10, 42, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 43, 0.30151134457776363);
INSERT INTO `videocosine` VALUES (10, 44, 0.3418817293789138);
INSERT INTO `videocosine` VALUES (10, 45, 0.3344968040028363);
INSERT INTO `videocosine` VALUES (10, 46, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (10, 47, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (11, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (11, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (11, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (11, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (11, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (11, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (11, 7, 1);
INSERT INTO `videocosine` VALUES (11, 8, 1);
INSERT INTO `videocosine` VALUES (11, 9, 1);
INSERT INTO `videocosine` VALUES (11, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (11, 12, 1);
INSERT INTO `videocosine` VALUES (11, 17, 1);
INSERT INTO `videocosine` VALUES (11, 18, 1);
INSERT INTO `videocosine` VALUES (11, 19, 1);
INSERT INTO `videocosine` VALUES (11, 20, 1);
INSERT INTO `videocosine` VALUES (11, 21, 1);
INSERT INTO `videocosine` VALUES (11, 22, 1);
INSERT INTO `videocosine` VALUES (11, 23, 1);
INSERT INTO `videocosine` VALUES (11, 24, 1);
INSERT INTO `videocosine` VALUES (11, 25, 1);
INSERT INTO `videocosine` VALUES (11, 26, 1);
INSERT INTO `videocosine` VALUES (11, 27, 1);
INSERT INTO `videocosine` VALUES (11, 28, 1);
INSERT INTO `videocosine` VALUES (11, 29, 1);
INSERT INTO `videocosine` VALUES (11, 30, 1);
INSERT INTO `videocosine` VALUES (11, 31, 1);
INSERT INTO `videocosine` VALUES (11, 32, 1);
INSERT INTO `videocosine` VALUES (11, 33, 1);
INSERT INTO `videocosine` VALUES (11, 34, 1);
INSERT INTO `videocosine` VALUES (11, 35, 1);
INSERT INTO `videocosine` VALUES (11, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (11, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (11, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (11, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (11, 40, 1);
INSERT INTO `videocosine` VALUES (11, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (11, 42, 1);
INSERT INTO `videocosine` VALUES (11, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (11, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (11, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (11, 46, 1);
INSERT INTO `videocosine` VALUES (11, 47, 1);
INSERT INTO `videocosine` VALUES (12, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (12, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (12, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (12, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (12, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (12, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (12, 7, 1);
INSERT INTO `videocosine` VALUES (12, 8, 1);
INSERT INTO `videocosine` VALUES (12, 9, 1);
INSERT INTO `videocosine` VALUES (12, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (12, 11, 1);
INSERT INTO `videocosine` VALUES (12, 17, 1);
INSERT INTO `videocosine` VALUES (12, 18, 1);
INSERT INTO `videocosine` VALUES (12, 19, 1);
INSERT INTO `videocosine` VALUES (12, 20, 1);
INSERT INTO `videocosine` VALUES (12, 21, 1);
INSERT INTO `videocosine` VALUES (12, 22, 1);
INSERT INTO `videocosine` VALUES (12, 23, 1);
INSERT INTO `videocosine` VALUES (12, 24, 1);
INSERT INTO `videocosine` VALUES (12, 25, 1);
INSERT INTO `videocosine` VALUES (12, 26, 1);
INSERT INTO `videocosine` VALUES (12, 27, 1);
INSERT INTO `videocosine` VALUES (12, 28, 1);
INSERT INTO `videocosine` VALUES (12, 29, 1);
INSERT INTO `videocosine` VALUES (12, 30, 1);
INSERT INTO `videocosine` VALUES (12, 31, 1);
INSERT INTO `videocosine` VALUES (12, 32, 1);
INSERT INTO `videocosine` VALUES (12, 33, 1);
INSERT INTO `videocosine` VALUES (12, 34, 1);
INSERT INTO `videocosine` VALUES (12, 35, 1);
INSERT INTO `videocosine` VALUES (12, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (12, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (12, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (12, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (12, 40, 1);
INSERT INTO `videocosine` VALUES (12, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (12, 42, 1);
INSERT INTO `videocosine` VALUES (12, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (12, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (12, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (12, 46, 1);
INSERT INTO `videocosine` VALUES (12, 47, 1);
INSERT INTO `videocosine` VALUES (17, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (17, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (17, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (17, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (17, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (17, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (17, 7, 1);
INSERT INTO `videocosine` VALUES (17, 8, 1);
INSERT INTO `videocosine` VALUES (17, 9, 1);
INSERT INTO `videocosine` VALUES (17, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (17, 11, 1);
INSERT INTO `videocosine` VALUES (17, 12, 1);
INSERT INTO `videocosine` VALUES (17, 18, 1);
INSERT INTO `videocosine` VALUES (17, 19, 1);
INSERT INTO `videocosine` VALUES (17, 20, 1);
INSERT INTO `videocosine` VALUES (17, 21, 1);
INSERT INTO `videocosine` VALUES (17, 22, 1);
INSERT INTO `videocosine` VALUES (17, 23, 1);
INSERT INTO `videocosine` VALUES (17, 24, 1);
INSERT INTO `videocosine` VALUES (17, 25, 1);
INSERT INTO `videocosine` VALUES (17, 26, 1);
INSERT INTO `videocosine` VALUES (17, 27, 1);
INSERT INTO `videocosine` VALUES (17, 28, 1);
INSERT INTO `videocosine` VALUES (17, 29, 1);
INSERT INTO `videocosine` VALUES (17, 30, 1);
INSERT INTO `videocosine` VALUES (17, 31, 1);
INSERT INTO `videocosine` VALUES (17, 32, 1);
INSERT INTO `videocosine` VALUES (17, 33, 1);
INSERT INTO `videocosine` VALUES (17, 34, 1);
INSERT INTO `videocosine` VALUES (17, 35, 1);
INSERT INTO `videocosine` VALUES (17, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (17, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (17, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (17, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (17, 40, 1);
INSERT INTO `videocosine` VALUES (17, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (17, 42, 1);
INSERT INTO `videocosine` VALUES (17, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (17, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (17, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (17, 46, 1);
INSERT INTO `videocosine` VALUES (17, 47, 1);
INSERT INTO `videocosine` VALUES (18, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (18, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (18, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (18, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (18, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (18, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (18, 7, 1);
INSERT INTO `videocosine` VALUES (18, 8, 1);
INSERT INTO `videocosine` VALUES (18, 9, 1);
INSERT INTO `videocosine` VALUES (18, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (18, 11, 1);
INSERT INTO `videocosine` VALUES (18, 12, 1);
INSERT INTO `videocosine` VALUES (18, 17, 1);
INSERT INTO `videocosine` VALUES (18, 19, 1);
INSERT INTO `videocosine` VALUES (18, 20, 1);
INSERT INTO `videocosine` VALUES (18, 21, 1);
INSERT INTO `videocosine` VALUES (18, 22, 1);
INSERT INTO `videocosine` VALUES (18, 23, 1);
INSERT INTO `videocosine` VALUES (18, 24, 1);
INSERT INTO `videocosine` VALUES (18, 25, 1);
INSERT INTO `videocosine` VALUES (18, 26, 1);
INSERT INTO `videocosine` VALUES (18, 27, 1);
INSERT INTO `videocosine` VALUES (18, 28, 1);
INSERT INTO `videocosine` VALUES (18, 29, 1);
INSERT INTO `videocosine` VALUES (18, 30, 1);
INSERT INTO `videocosine` VALUES (18, 31, 1);
INSERT INTO `videocosine` VALUES (18, 32, 1);
INSERT INTO `videocosine` VALUES (18, 33, 1);
INSERT INTO `videocosine` VALUES (18, 34, 1);
INSERT INTO `videocosine` VALUES (18, 35, 1);
INSERT INTO `videocosine` VALUES (18, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (18, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (18, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (18, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (18, 40, 1);
INSERT INTO `videocosine` VALUES (18, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (18, 42, 1);
INSERT INTO `videocosine` VALUES (18, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (18, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (18, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (18, 46, 1);
INSERT INTO `videocosine` VALUES (18, 47, 1);
INSERT INTO `videocosine` VALUES (19, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (19, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (19, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (19, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (19, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (19, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (19, 7, 1);
INSERT INTO `videocosine` VALUES (19, 8, 1);
INSERT INTO `videocosine` VALUES (19, 9, 1);
INSERT INTO `videocosine` VALUES (19, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (19, 11, 1);
INSERT INTO `videocosine` VALUES (19, 12, 1);
INSERT INTO `videocosine` VALUES (19, 17, 1);
INSERT INTO `videocosine` VALUES (19, 18, 1);
INSERT INTO `videocosine` VALUES (19, 20, 1);
INSERT INTO `videocosine` VALUES (19, 21, 1);
INSERT INTO `videocosine` VALUES (19, 22, 1);
INSERT INTO `videocosine` VALUES (19, 23, 1);
INSERT INTO `videocosine` VALUES (19, 24, 1);
INSERT INTO `videocosine` VALUES (19, 25, 1);
INSERT INTO `videocosine` VALUES (19, 26, 1);
INSERT INTO `videocosine` VALUES (19, 27, 1);
INSERT INTO `videocosine` VALUES (19, 28, 1);
INSERT INTO `videocosine` VALUES (19, 29, 1);
INSERT INTO `videocosine` VALUES (19, 30, 1);
INSERT INTO `videocosine` VALUES (19, 31, 1);
INSERT INTO `videocosine` VALUES (19, 32, 1);
INSERT INTO `videocosine` VALUES (19, 33, 1);
INSERT INTO `videocosine` VALUES (19, 34, 1);
INSERT INTO `videocosine` VALUES (19, 35, 1);
INSERT INTO `videocosine` VALUES (19, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (19, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (19, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (19, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (19, 40, 1);
INSERT INTO `videocosine` VALUES (19, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (19, 42, 1);
INSERT INTO `videocosine` VALUES (19, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (19, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (19, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (19, 46, 1);
INSERT INTO `videocosine` VALUES (19, 47, 1);
INSERT INTO `videocosine` VALUES (20, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (20, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (20, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (20, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (20, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (20, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (20, 7, 1);
INSERT INTO `videocosine` VALUES (20, 8, 1);
INSERT INTO `videocosine` VALUES (20, 9, 1);
INSERT INTO `videocosine` VALUES (20, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (20, 11, 1);
INSERT INTO `videocosine` VALUES (20, 12, 1);
INSERT INTO `videocosine` VALUES (20, 17, 1);
INSERT INTO `videocosine` VALUES (20, 18, 1);
INSERT INTO `videocosine` VALUES (20, 19, 1);
INSERT INTO `videocosine` VALUES (20, 21, 1);
INSERT INTO `videocosine` VALUES (20, 22, 1);
INSERT INTO `videocosine` VALUES (20, 23, 1);
INSERT INTO `videocosine` VALUES (20, 24, 1);
INSERT INTO `videocosine` VALUES (20, 25, 1);
INSERT INTO `videocosine` VALUES (20, 26, 1);
INSERT INTO `videocosine` VALUES (20, 27, 1);
INSERT INTO `videocosine` VALUES (20, 28, 1);
INSERT INTO `videocosine` VALUES (20, 29, 1);
INSERT INTO `videocosine` VALUES (20, 30, 1);
INSERT INTO `videocosine` VALUES (20, 31, 1);
INSERT INTO `videocosine` VALUES (20, 32, 1);
INSERT INTO `videocosine` VALUES (20, 33, 1);
INSERT INTO `videocosine` VALUES (20, 34, 1);
INSERT INTO `videocosine` VALUES (20, 35, 1);
INSERT INTO `videocosine` VALUES (20, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (20, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (20, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (20, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (20, 40, 1);
INSERT INTO `videocosine` VALUES (20, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (20, 42, 1);
INSERT INTO `videocosine` VALUES (20, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (20, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (20, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (20, 46, 1);
INSERT INTO `videocosine` VALUES (20, 47, 1);
INSERT INTO `videocosine` VALUES (21, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (21, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (21, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (21, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (21, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (21, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (21, 7, 1);
INSERT INTO `videocosine` VALUES (21, 8, 1);
INSERT INTO `videocosine` VALUES (21, 9, 1);
INSERT INTO `videocosine` VALUES (21, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (21, 11, 1);
INSERT INTO `videocosine` VALUES (21, 12, 1);
INSERT INTO `videocosine` VALUES (21, 17, 1);
INSERT INTO `videocosine` VALUES (21, 18, 1);
INSERT INTO `videocosine` VALUES (21, 19, 1);
INSERT INTO `videocosine` VALUES (21, 20, 1);
INSERT INTO `videocosine` VALUES (21, 22, 1);
INSERT INTO `videocosine` VALUES (21, 23, 1);
INSERT INTO `videocosine` VALUES (21, 24, 1);
INSERT INTO `videocosine` VALUES (21, 25, 1);
INSERT INTO `videocosine` VALUES (21, 26, 1);
INSERT INTO `videocosine` VALUES (21, 27, 1);
INSERT INTO `videocosine` VALUES (21, 28, 1);
INSERT INTO `videocosine` VALUES (21, 29, 1);
INSERT INTO `videocosine` VALUES (21, 30, 1);
INSERT INTO `videocosine` VALUES (21, 31, 1);
INSERT INTO `videocosine` VALUES (21, 32, 1);
INSERT INTO `videocosine` VALUES (21, 33, 1);
INSERT INTO `videocosine` VALUES (21, 34, 1);
INSERT INTO `videocosine` VALUES (21, 35, 1);
INSERT INTO `videocosine` VALUES (21, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (21, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (21, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (21, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (21, 40, 1);
INSERT INTO `videocosine` VALUES (21, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (21, 42, 1);
INSERT INTO `videocosine` VALUES (21, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (21, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (21, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (21, 46, 1);
INSERT INTO `videocosine` VALUES (21, 47, 1);
INSERT INTO `videocosine` VALUES (22, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (22, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (22, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (22, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (22, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (22, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (22, 7, 1);
INSERT INTO `videocosine` VALUES (22, 8, 1);
INSERT INTO `videocosine` VALUES (22, 9, 1);
INSERT INTO `videocosine` VALUES (22, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (22, 11, 1);
INSERT INTO `videocosine` VALUES (22, 12, 1);
INSERT INTO `videocosine` VALUES (22, 17, 1);
INSERT INTO `videocosine` VALUES (22, 18, 1);
INSERT INTO `videocosine` VALUES (22, 19, 1);
INSERT INTO `videocosine` VALUES (22, 20, 1);
INSERT INTO `videocosine` VALUES (22, 21, 1);
INSERT INTO `videocosine` VALUES (22, 23, 1);
INSERT INTO `videocosine` VALUES (22, 24, 1);
INSERT INTO `videocosine` VALUES (22, 25, 1);
INSERT INTO `videocosine` VALUES (22, 26, 1);
INSERT INTO `videocosine` VALUES (22, 27, 1);
INSERT INTO `videocosine` VALUES (22, 28, 1);
INSERT INTO `videocosine` VALUES (22, 29, 1);
INSERT INTO `videocosine` VALUES (22, 30, 1);
INSERT INTO `videocosine` VALUES (22, 31, 1);
INSERT INTO `videocosine` VALUES (22, 32, 1);
INSERT INTO `videocosine` VALUES (22, 33, 1);
INSERT INTO `videocosine` VALUES (22, 34, 1);
INSERT INTO `videocosine` VALUES (22, 35, 1);
INSERT INTO `videocosine` VALUES (22, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (22, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (22, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (22, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (22, 40, 1);
INSERT INTO `videocosine` VALUES (22, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (22, 42, 1);
INSERT INTO `videocosine` VALUES (22, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (22, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (22, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (22, 46, 1);
INSERT INTO `videocosine` VALUES (22, 47, 1);
INSERT INTO `videocosine` VALUES (23, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (23, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (23, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (23, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (23, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (23, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (23, 7, 1);
INSERT INTO `videocosine` VALUES (23, 8, 1);
INSERT INTO `videocosine` VALUES (23, 9, 1);
INSERT INTO `videocosine` VALUES (23, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (23, 11, 1);
INSERT INTO `videocosine` VALUES (23, 12, 1);
INSERT INTO `videocosine` VALUES (23, 17, 1);
INSERT INTO `videocosine` VALUES (23, 18, 1);
INSERT INTO `videocosine` VALUES (23, 19, 1);
INSERT INTO `videocosine` VALUES (23, 20, 1);
INSERT INTO `videocosine` VALUES (23, 21, 1);
INSERT INTO `videocosine` VALUES (23, 22, 1);
INSERT INTO `videocosine` VALUES (23, 24, 1);
INSERT INTO `videocosine` VALUES (23, 25, 1);
INSERT INTO `videocosine` VALUES (23, 26, 1);
INSERT INTO `videocosine` VALUES (23, 27, 1);
INSERT INTO `videocosine` VALUES (23, 28, 1);
INSERT INTO `videocosine` VALUES (23, 29, 1);
INSERT INTO `videocosine` VALUES (23, 30, 1);
INSERT INTO `videocosine` VALUES (23, 31, 1);
INSERT INTO `videocosine` VALUES (23, 32, 1);
INSERT INTO `videocosine` VALUES (23, 33, 1);
INSERT INTO `videocosine` VALUES (23, 34, 1);
INSERT INTO `videocosine` VALUES (23, 35, 1);
INSERT INTO `videocosine` VALUES (23, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (23, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (23, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (23, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (23, 40, 1);
INSERT INTO `videocosine` VALUES (23, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (23, 42, 1);
INSERT INTO `videocosine` VALUES (23, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (23, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (23, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (23, 46, 1);
INSERT INTO `videocosine` VALUES (23, 47, 1);
INSERT INTO `videocosine` VALUES (24, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (24, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (24, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (24, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (24, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (24, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (24, 7, 1);
INSERT INTO `videocosine` VALUES (24, 8, 1);
INSERT INTO `videocosine` VALUES (24, 9, 1);
INSERT INTO `videocosine` VALUES (24, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (24, 11, 1);
INSERT INTO `videocosine` VALUES (24, 12, 1);
INSERT INTO `videocosine` VALUES (24, 17, 1);
INSERT INTO `videocosine` VALUES (24, 18, 1);
INSERT INTO `videocosine` VALUES (24, 19, 1);
INSERT INTO `videocosine` VALUES (24, 20, 1);
INSERT INTO `videocosine` VALUES (24, 21, 1);
INSERT INTO `videocosine` VALUES (24, 22, 1);
INSERT INTO `videocosine` VALUES (24, 23, 1);
INSERT INTO `videocosine` VALUES (24, 25, 1);
INSERT INTO `videocosine` VALUES (24, 26, 1);
INSERT INTO `videocosine` VALUES (24, 27, 1);
INSERT INTO `videocosine` VALUES (24, 28, 1);
INSERT INTO `videocosine` VALUES (24, 29, 1);
INSERT INTO `videocosine` VALUES (24, 30, 1);
INSERT INTO `videocosine` VALUES (24, 31, 1);
INSERT INTO `videocosine` VALUES (24, 32, 1);
INSERT INTO `videocosine` VALUES (24, 33, 1);
INSERT INTO `videocosine` VALUES (24, 34, 1);
INSERT INTO `videocosine` VALUES (24, 35, 1);
INSERT INTO `videocosine` VALUES (24, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (24, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (24, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (24, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (24, 40, 1);
INSERT INTO `videocosine` VALUES (24, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (24, 42, 1);
INSERT INTO `videocosine` VALUES (24, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (24, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (24, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (24, 46, 1);
INSERT INTO `videocosine` VALUES (24, 47, 1);
INSERT INTO `videocosine` VALUES (25, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (25, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (25, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (25, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (25, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (25, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (25, 7, 1);
INSERT INTO `videocosine` VALUES (25, 8, 1);
INSERT INTO `videocosine` VALUES (25, 9, 1);
INSERT INTO `videocosine` VALUES (25, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (25, 11, 1);
INSERT INTO `videocosine` VALUES (25, 12, 1);
INSERT INTO `videocosine` VALUES (25, 17, 1);
INSERT INTO `videocosine` VALUES (25, 18, 1);
INSERT INTO `videocosine` VALUES (25, 19, 1);
INSERT INTO `videocosine` VALUES (25, 20, 1);
INSERT INTO `videocosine` VALUES (25, 21, 1);
INSERT INTO `videocosine` VALUES (25, 22, 1);
INSERT INTO `videocosine` VALUES (25, 23, 1);
INSERT INTO `videocosine` VALUES (25, 24, 1);
INSERT INTO `videocosine` VALUES (25, 26, 1);
INSERT INTO `videocosine` VALUES (25, 27, 1);
INSERT INTO `videocosine` VALUES (25, 28, 1);
INSERT INTO `videocosine` VALUES (25, 29, 1);
INSERT INTO `videocosine` VALUES (25, 30, 1);
INSERT INTO `videocosine` VALUES (25, 31, 1);
INSERT INTO `videocosine` VALUES (25, 32, 1);
INSERT INTO `videocosine` VALUES (25, 33, 1);
INSERT INTO `videocosine` VALUES (25, 34, 1);
INSERT INTO `videocosine` VALUES (25, 35, 1);
INSERT INTO `videocosine` VALUES (25, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (25, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (25, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (25, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (25, 40, 1);
INSERT INTO `videocosine` VALUES (25, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (25, 42, 1);
INSERT INTO `videocosine` VALUES (25, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (25, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (25, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (25, 46, 1);
INSERT INTO `videocosine` VALUES (25, 47, 1);
INSERT INTO `videocosine` VALUES (26, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (26, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (26, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (26, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (26, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (26, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (26, 7, 1);
INSERT INTO `videocosine` VALUES (26, 8, 1);
INSERT INTO `videocosine` VALUES (26, 9, 1);
INSERT INTO `videocosine` VALUES (26, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (26, 11, 1);
INSERT INTO `videocosine` VALUES (26, 12, 1);
INSERT INTO `videocosine` VALUES (26, 17, 1);
INSERT INTO `videocosine` VALUES (26, 18, 1);
INSERT INTO `videocosine` VALUES (26, 19, 1);
INSERT INTO `videocosine` VALUES (26, 20, 1);
INSERT INTO `videocosine` VALUES (26, 21, 1);
INSERT INTO `videocosine` VALUES (26, 22, 1);
INSERT INTO `videocosine` VALUES (26, 23, 1);
INSERT INTO `videocosine` VALUES (26, 24, 1);
INSERT INTO `videocosine` VALUES (26, 25, 1);
INSERT INTO `videocosine` VALUES (26, 27, 1);
INSERT INTO `videocosine` VALUES (26, 28, 1);
INSERT INTO `videocosine` VALUES (26, 29, 1);
INSERT INTO `videocosine` VALUES (26, 30, 1);
INSERT INTO `videocosine` VALUES (26, 31, 1);
INSERT INTO `videocosine` VALUES (26, 32, 1);
INSERT INTO `videocosine` VALUES (26, 33, 1);
INSERT INTO `videocosine` VALUES (26, 34, 1);
INSERT INTO `videocosine` VALUES (26, 35, 1);
INSERT INTO `videocosine` VALUES (26, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (26, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (26, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (26, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (26, 40, 1);
INSERT INTO `videocosine` VALUES (26, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (26, 42, 1);
INSERT INTO `videocosine` VALUES (26, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (26, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (26, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (26, 46, 1);
INSERT INTO `videocosine` VALUES (26, 47, 1);
INSERT INTO `videocosine` VALUES (27, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (27, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (27, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (27, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (27, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (27, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (27, 7, 1);
INSERT INTO `videocosine` VALUES (27, 8, 1);
INSERT INTO `videocosine` VALUES (27, 9, 1);
INSERT INTO `videocosine` VALUES (27, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (27, 11, 1);
INSERT INTO `videocosine` VALUES (27, 12, 1);
INSERT INTO `videocosine` VALUES (27, 17, 1);
INSERT INTO `videocosine` VALUES (27, 18, 1);
INSERT INTO `videocosine` VALUES (27, 19, 1);
INSERT INTO `videocosine` VALUES (27, 20, 1);
INSERT INTO `videocosine` VALUES (27, 21, 1);
INSERT INTO `videocosine` VALUES (27, 22, 1);
INSERT INTO `videocosine` VALUES (27, 23, 1);
INSERT INTO `videocosine` VALUES (27, 24, 1);
INSERT INTO `videocosine` VALUES (27, 25, 1);
INSERT INTO `videocosine` VALUES (27, 26, 1);
INSERT INTO `videocosine` VALUES (27, 28, 1);
INSERT INTO `videocosine` VALUES (27, 29, 1);
INSERT INTO `videocosine` VALUES (27, 30, 1);
INSERT INTO `videocosine` VALUES (27, 31, 1);
INSERT INTO `videocosine` VALUES (27, 32, 1);
INSERT INTO `videocosine` VALUES (27, 33, 1);
INSERT INTO `videocosine` VALUES (27, 34, 1);
INSERT INTO `videocosine` VALUES (27, 35, 1);
INSERT INTO `videocosine` VALUES (27, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (27, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (27, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (27, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (27, 40, 1);
INSERT INTO `videocosine` VALUES (27, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (27, 42, 1);
INSERT INTO `videocosine` VALUES (27, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (27, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (27, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (27, 46, 1);
INSERT INTO `videocosine` VALUES (27, 47, 1);
INSERT INTO `videocosine` VALUES (28, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (28, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (28, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (28, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (28, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (28, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (28, 7, 1);
INSERT INTO `videocosine` VALUES (28, 8, 1);
INSERT INTO `videocosine` VALUES (28, 9, 1);
INSERT INTO `videocosine` VALUES (28, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (28, 11, 1);
INSERT INTO `videocosine` VALUES (28, 12, 1);
INSERT INTO `videocosine` VALUES (28, 17, 1);
INSERT INTO `videocosine` VALUES (28, 18, 1);
INSERT INTO `videocosine` VALUES (28, 19, 1);
INSERT INTO `videocosine` VALUES (28, 20, 1);
INSERT INTO `videocosine` VALUES (28, 21, 1);
INSERT INTO `videocosine` VALUES (28, 22, 1);
INSERT INTO `videocosine` VALUES (28, 23, 1);
INSERT INTO `videocosine` VALUES (28, 24, 1);
INSERT INTO `videocosine` VALUES (28, 25, 1);
INSERT INTO `videocosine` VALUES (28, 26, 1);
INSERT INTO `videocosine` VALUES (28, 27, 1);
INSERT INTO `videocosine` VALUES (28, 29, 1);
INSERT INTO `videocosine` VALUES (28, 30, 1);
INSERT INTO `videocosine` VALUES (28, 31, 1);
INSERT INTO `videocosine` VALUES (28, 32, 1);
INSERT INTO `videocosine` VALUES (28, 33, 1);
INSERT INTO `videocosine` VALUES (28, 34, 1);
INSERT INTO `videocosine` VALUES (28, 35, 1);
INSERT INTO `videocosine` VALUES (28, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (28, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (28, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (28, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (28, 40, 1);
INSERT INTO `videocosine` VALUES (28, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (28, 42, 1);
INSERT INTO `videocosine` VALUES (28, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (28, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (28, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (28, 46, 1);
INSERT INTO `videocosine` VALUES (28, 47, 1);
INSERT INTO `videocosine` VALUES (29, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (29, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (29, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (29, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (29, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (29, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (29, 7, 1);
INSERT INTO `videocosine` VALUES (29, 8, 1);
INSERT INTO `videocosine` VALUES (29, 9, 1);
INSERT INTO `videocosine` VALUES (29, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (29, 11, 1);
INSERT INTO `videocosine` VALUES (29, 12, 1);
INSERT INTO `videocosine` VALUES (29, 17, 1);
INSERT INTO `videocosine` VALUES (29, 18, 1);
INSERT INTO `videocosine` VALUES (29, 19, 1);
INSERT INTO `videocosine` VALUES (29, 20, 1);
INSERT INTO `videocosine` VALUES (29, 21, 1);
INSERT INTO `videocosine` VALUES (29, 22, 1);
INSERT INTO `videocosine` VALUES (29, 23, 1);
INSERT INTO `videocosine` VALUES (29, 24, 1);
INSERT INTO `videocosine` VALUES (29, 25, 1);
INSERT INTO `videocosine` VALUES (29, 26, 1);
INSERT INTO `videocosine` VALUES (29, 27, 1);
INSERT INTO `videocosine` VALUES (29, 28, 1);
INSERT INTO `videocosine` VALUES (29, 30, 1);
INSERT INTO `videocosine` VALUES (29, 31, 1);
INSERT INTO `videocosine` VALUES (29, 32, 1);
INSERT INTO `videocosine` VALUES (29, 33, 1);
INSERT INTO `videocosine` VALUES (29, 34, 1);
INSERT INTO `videocosine` VALUES (29, 35, 1);
INSERT INTO `videocosine` VALUES (29, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (29, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (29, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (29, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (29, 40, 1);
INSERT INTO `videocosine` VALUES (29, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (29, 42, 1);
INSERT INTO `videocosine` VALUES (29, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (29, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (29, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (29, 46, 1);
INSERT INTO `videocosine` VALUES (29, 47, 1);
INSERT INTO `videocosine` VALUES (30, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (30, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (30, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (30, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (30, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (30, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (30, 7, 1);
INSERT INTO `videocosine` VALUES (30, 8, 1);
INSERT INTO `videocosine` VALUES (30, 9, 1);
INSERT INTO `videocosine` VALUES (30, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (30, 11, 1);
INSERT INTO `videocosine` VALUES (30, 12, 1);
INSERT INTO `videocosine` VALUES (30, 17, 1);
INSERT INTO `videocosine` VALUES (30, 18, 1);
INSERT INTO `videocosine` VALUES (30, 19, 1);
INSERT INTO `videocosine` VALUES (30, 20, 1);
INSERT INTO `videocosine` VALUES (30, 21, 1);
INSERT INTO `videocosine` VALUES (30, 22, 1);
INSERT INTO `videocosine` VALUES (30, 23, 1);
INSERT INTO `videocosine` VALUES (30, 24, 1);
INSERT INTO `videocosine` VALUES (30, 25, 1);
INSERT INTO `videocosine` VALUES (30, 26, 1);
INSERT INTO `videocosine` VALUES (30, 27, 1);
INSERT INTO `videocosine` VALUES (30, 28, 1);
INSERT INTO `videocosine` VALUES (30, 29, 1);
INSERT INTO `videocosine` VALUES (30, 31, 1);
INSERT INTO `videocosine` VALUES (30, 32, 1);
INSERT INTO `videocosine` VALUES (30, 33, 1);
INSERT INTO `videocosine` VALUES (30, 34, 1);
INSERT INTO `videocosine` VALUES (30, 35, 1);
INSERT INTO `videocosine` VALUES (30, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (30, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (30, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (30, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (30, 40, 1);
INSERT INTO `videocosine` VALUES (30, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (30, 42, 1);
INSERT INTO `videocosine` VALUES (30, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (30, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (30, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (30, 46, 1);
INSERT INTO `videocosine` VALUES (30, 47, 1);
INSERT INTO `videocosine` VALUES (31, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (31, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (31, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (31, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (31, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (31, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (31, 7, 1);
INSERT INTO `videocosine` VALUES (31, 8, 1);
INSERT INTO `videocosine` VALUES (31, 9, 1);
INSERT INTO `videocosine` VALUES (31, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (31, 11, 1);
INSERT INTO `videocosine` VALUES (31, 12, 1);
INSERT INTO `videocosine` VALUES (31, 17, 1);
INSERT INTO `videocosine` VALUES (31, 18, 1);
INSERT INTO `videocosine` VALUES (31, 19, 1);
INSERT INTO `videocosine` VALUES (31, 20, 1);
INSERT INTO `videocosine` VALUES (31, 21, 1);
INSERT INTO `videocosine` VALUES (31, 22, 1);
INSERT INTO `videocosine` VALUES (31, 23, 1);
INSERT INTO `videocosine` VALUES (31, 24, 1);
INSERT INTO `videocosine` VALUES (31, 25, 1);
INSERT INTO `videocosine` VALUES (31, 26, 1);
INSERT INTO `videocosine` VALUES (31, 27, 1);
INSERT INTO `videocosine` VALUES (31, 28, 1);
INSERT INTO `videocosine` VALUES (31, 29, 1);
INSERT INTO `videocosine` VALUES (31, 30, 1);
INSERT INTO `videocosine` VALUES (31, 32, 1);
INSERT INTO `videocosine` VALUES (31, 33, 1);
INSERT INTO `videocosine` VALUES (31, 34, 1);
INSERT INTO `videocosine` VALUES (31, 35, 1);
INSERT INTO `videocosine` VALUES (31, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (31, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (31, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (31, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (31, 40, 1);
INSERT INTO `videocosine` VALUES (31, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (31, 42, 1);
INSERT INTO `videocosine` VALUES (31, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (31, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (31, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (31, 46, 1);
INSERT INTO `videocosine` VALUES (31, 47, 1);
INSERT INTO `videocosine` VALUES (32, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (32, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (32, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (32, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (32, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (32, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (32, 7, 1);
INSERT INTO `videocosine` VALUES (32, 8, 1);
INSERT INTO `videocosine` VALUES (32, 9, 1);
INSERT INTO `videocosine` VALUES (32, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (32, 11, 1);
INSERT INTO `videocosine` VALUES (32, 12, 1);
INSERT INTO `videocosine` VALUES (32, 17, 1);
INSERT INTO `videocosine` VALUES (32, 18, 1);
INSERT INTO `videocosine` VALUES (32, 19, 1);
INSERT INTO `videocosine` VALUES (32, 20, 1);
INSERT INTO `videocosine` VALUES (32, 21, 1);
INSERT INTO `videocosine` VALUES (32, 22, 1);
INSERT INTO `videocosine` VALUES (32, 23, 1);
INSERT INTO `videocosine` VALUES (32, 24, 1);
INSERT INTO `videocosine` VALUES (32, 25, 1);
INSERT INTO `videocosine` VALUES (32, 26, 1);
INSERT INTO `videocosine` VALUES (32, 27, 1);
INSERT INTO `videocosine` VALUES (32, 28, 1);
INSERT INTO `videocosine` VALUES (32, 29, 1);
INSERT INTO `videocosine` VALUES (32, 30, 1);
INSERT INTO `videocosine` VALUES (32, 31, 1);
INSERT INTO `videocosine` VALUES (32, 33, 1);
INSERT INTO `videocosine` VALUES (32, 34, 1);
INSERT INTO `videocosine` VALUES (32, 35, 1);
INSERT INTO `videocosine` VALUES (32, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (32, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (32, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (32, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (32, 40, 1);
INSERT INTO `videocosine` VALUES (32, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (32, 42, 1);
INSERT INTO `videocosine` VALUES (32, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (32, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (32, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (32, 46, 1);
INSERT INTO `videocosine` VALUES (32, 47, 1);
INSERT INTO `videocosine` VALUES (33, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (33, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (33, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (33, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (33, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (33, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (33, 7, 1);
INSERT INTO `videocosine` VALUES (33, 8, 1);
INSERT INTO `videocosine` VALUES (33, 9, 1);
INSERT INTO `videocosine` VALUES (33, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (33, 11, 1);
INSERT INTO `videocosine` VALUES (33, 12, 1);
INSERT INTO `videocosine` VALUES (33, 17, 1);
INSERT INTO `videocosine` VALUES (33, 18, 1);
INSERT INTO `videocosine` VALUES (33, 19, 1);
INSERT INTO `videocosine` VALUES (33, 20, 1);
INSERT INTO `videocosine` VALUES (33, 21, 1);
INSERT INTO `videocosine` VALUES (33, 22, 1);
INSERT INTO `videocosine` VALUES (33, 23, 1);
INSERT INTO `videocosine` VALUES (33, 24, 1);
INSERT INTO `videocosine` VALUES (33, 25, 1);
INSERT INTO `videocosine` VALUES (33, 26, 1);
INSERT INTO `videocosine` VALUES (33, 27, 1);
INSERT INTO `videocosine` VALUES (33, 28, 1);
INSERT INTO `videocosine` VALUES (33, 29, 1);
INSERT INTO `videocosine` VALUES (33, 30, 1);
INSERT INTO `videocosine` VALUES (33, 31, 1);
INSERT INTO `videocosine` VALUES (33, 32, 1);
INSERT INTO `videocosine` VALUES (33, 34, 1);
INSERT INTO `videocosine` VALUES (33, 35, 1);
INSERT INTO `videocosine` VALUES (33, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (33, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (33, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (33, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (33, 40, 1);
INSERT INTO `videocosine` VALUES (33, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (33, 42, 1);
INSERT INTO `videocosine` VALUES (33, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (33, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (33, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (33, 46, 1);
INSERT INTO `videocosine` VALUES (33, 47, 1);
INSERT INTO `videocosine` VALUES (34, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (34, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (34, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (34, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (34, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (34, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (34, 7, 1);
INSERT INTO `videocosine` VALUES (34, 8, 1);
INSERT INTO `videocosine` VALUES (34, 9, 1);
INSERT INTO `videocosine` VALUES (34, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (34, 11, 1);
INSERT INTO `videocosine` VALUES (34, 12, 1);
INSERT INTO `videocosine` VALUES (34, 17, 1);
INSERT INTO `videocosine` VALUES (34, 18, 1);
INSERT INTO `videocosine` VALUES (34, 19, 1);
INSERT INTO `videocosine` VALUES (34, 20, 1);
INSERT INTO `videocosine` VALUES (34, 21, 1);
INSERT INTO `videocosine` VALUES (34, 22, 1);
INSERT INTO `videocosine` VALUES (34, 23, 1);
INSERT INTO `videocosine` VALUES (34, 24, 1);
INSERT INTO `videocosine` VALUES (34, 25, 1);
INSERT INTO `videocosine` VALUES (34, 26, 1);
INSERT INTO `videocosine` VALUES (34, 27, 1);
INSERT INTO `videocosine` VALUES (34, 28, 1);
INSERT INTO `videocosine` VALUES (34, 29, 1);
INSERT INTO `videocosine` VALUES (34, 30, 1);
INSERT INTO `videocosine` VALUES (34, 31, 1);
INSERT INTO `videocosine` VALUES (34, 32, 1);
INSERT INTO `videocosine` VALUES (34, 33, 1);
INSERT INTO `videocosine` VALUES (34, 35, 1);
INSERT INTO `videocosine` VALUES (34, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (34, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (34, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (34, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (34, 40, 1);
INSERT INTO `videocosine` VALUES (34, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (34, 42, 1);
INSERT INTO `videocosine` VALUES (34, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (34, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (34, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (34, 46, 1);
INSERT INTO `videocosine` VALUES (34, 47, 1);
INSERT INTO `videocosine` VALUES (35, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (35, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (35, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (35, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (35, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (35, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (35, 7, 1);
INSERT INTO `videocosine` VALUES (35, 8, 1);
INSERT INTO `videocosine` VALUES (35, 9, 1);
INSERT INTO `videocosine` VALUES (35, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (35, 11, 1);
INSERT INTO `videocosine` VALUES (35, 12, 1);
INSERT INTO `videocosine` VALUES (35, 17, 1);
INSERT INTO `videocosine` VALUES (35, 18, 1);
INSERT INTO `videocosine` VALUES (35, 19, 1);
INSERT INTO `videocosine` VALUES (35, 20, 1);
INSERT INTO `videocosine` VALUES (35, 21, 1);
INSERT INTO `videocosine` VALUES (35, 22, 1);
INSERT INTO `videocosine` VALUES (35, 23, 1);
INSERT INTO `videocosine` VALUES (35, 24, 1);
INSERT INTO `videocosine` VALUES (35, 25, 1);
INSERT INTO `videocosine` VALUES (35, 26, 1);
INSERT INTO `videocosine` VALUES (35, 27, 1);
INSERT INTO `videocosine` VALUES (35, 28, 1);
INSERT INTO `videocosine` VALUES (35, 29, 1);
INSERT INTO `videocosine` VALUES (35, 30, 1);
INSERT INTO `videocosine` VALUES (35, 31, 1);
INSERT INTO `videocosine` VALUES (35, 32, 1);
INSERT INTO `videocosine` VALUES (35, 33, 1);
INSERT INTO `videocosine` VALUES (35, 34, 1);
INSERT INTO `videocosine` VALUES (35, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (35, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (35, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (35, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (35, 40, 1);
INSERT INTO `videocosine` VALUES (35, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (35, 42, 1);
INSERT INTO `videocosine` VALUES (35, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (35, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (35, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (35, 46, 1);
INSERT INTO `videocosine` VALUES (35, 47, 1);
INSERT INTO `videocosine` VALUES (36, 1, 1);
INSERT INTO `videocosine` VALUES (36, 2, 0.5477225575051661);
INSERT INTO `videocosine` VALUES (36, 3, 0.5477225575051661);
INSERT INTO `videocosine` VALUES (36, 4, 0.47140452079103173);
INSERT INTO `videocosine` VALUES (36, 5, 0.408248290463863);
INSERT INTO `videocosine` VALUES (36, 6, 0.408248290463863);
INSERT INTO `videocosine` VALUES (36, 7, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 8, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 9, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 10, 0.24618298195866545);
INSERT INTO `videocosine` VALUES (36, 11, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 12, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 17, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 18, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 19, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 20, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 21, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 22, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 23, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 24, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 25, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 26, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 27, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 28, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 29, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 30, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 31, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 32, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 33, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 34, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 35, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 37, 0.23570226039551587);
INSERT INTO `videocosine` VALUES (36, 38, 0.47140452079103173);
INSERT INTO `videocosine` VALUES (36, 39, 0.5);
INSERT INTO `videocosine` VALUES (36, 40, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 41, 0.2581988897471611);
INSERT INTO `videocosine` VALUES (36, 42, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 43, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (36, 44, 0.4629100498862757);
INSERT INTO `videocosine` VALUES (36, 45, 0.45291081365783825);
INSERT INTO `videocosine` VALUES (36, 46, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (36, 47, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (37, 1, 0.23570226039551587);
INSERT INTO `videocosine` VALUES (37, 2, 0.3872983346207417);
INSERT INTO `videocosine` VALUES (37, 3, 0.3872983346207417);
INSERT INTO `videocosine` VALUES (37, 4, 0.3333333333333333);
INSERT INTO `videocosine` VALUES (37, 5, 0.28867513459481287);
INSERT INTO `videocosine` VALUES (37, 6, 0.28867513459481287);
INSERT INTO `videocosine` VALUES (37, 7, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 8, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 9, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 10, 0.17407765595569785);
INSERT INTO `videocosine` VALUES (37, 11, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 12, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 17, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 18, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 19, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 20, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 21, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 22, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 23, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 24, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 25, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 26, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 27, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 28, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 29, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 30, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 31, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 32, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 33, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 34, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 35, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 36, 0.23570226039551587);
INSERT INTO `videocosine` VALUES (37, 38, 0.3333333333333333);
INSERT INTO `videocosine` VALUES (37, 39, 0.3535533905932738);
INSERT INTO `videocosine` VALUES (37, 40, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 41, 0.18257418583505536);
INSERT INTO `videocosine` VALUES (37, 42, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 43, 0.2886751345948129);
INSERT INTO `videocosine` VALUES (37, 44, 0.3273268353539886);
INSERT INTO `videocosine` VALUES (37, 45, 0.32025630761017426);
INSERT INTO `videocosine` VALUES (37, 46, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (37, 47, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (38, 1, 0.47140452079103173);
INSERT INTO `videocosine` VALUES (38, 2, 0.7745966692414834);
INSERT INTO `videocosine` VALUES (38, 3, 0.7745966692414834);
INSERT INTO `videocosine` VALUES (38, 4, 0.6666666666666666);
INSERT INTO `videocosine` VALUES (38, 5, 0.5773502691896257);
INSERT INTO `videocosine` VALUES (38, 6, 0.5773502691896257);
INSERT INTO `videocosine` VALUES (38, 7, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 8, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 9, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 10, 0.3481553119113957);
INSERT INTO `videocosine` VALUES (38, 11, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 12, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 17, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 18, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 19, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 20, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 21, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 22, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 23, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 24, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 25, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 26, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 27, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 28, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 29, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 30, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 31, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 32, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 33, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 34, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 35, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 36, 0.47140452079103173);
INSERT INTO `videocosine` VALUES (38, 37, 0.3333333333333333);
INSERT INTO `videocosine` VALUES (38, 39, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (38, 40, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 41, 0.3651483716701107);
INSERT INTO `videocosine` VALUES (38, 42, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 43, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (38, 44, 0.6546536707079772);
INSERT INTO `videocosine` VALUES (38, 45, 0.6405126152203485);
INSERT INTO `videocosine` VALUES (38, 46, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (38, 47, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (39, 1, 0.5);
INSERT INTO `videocosine` VALUES (39, 2, 0.7302967433402214);
INSERT INTO `videocosine` VALUES (39, 3, 0.9128709291752769);
INSERT INTO `videocosine` VALUES (39, 4, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (39, 5, 0.816496580927726);
INSERT INTO `videocosine` VALUES (39, 6, 0.6804138174397717);
INSERT INTO `videocosine` VALUES (39, 7, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 8, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 9, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 10, 0.3692744729379982);
INSERT INTO `videocosine` VALUES (39, 11, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 12, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 17, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 18, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 19, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 20, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 21, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 22, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 23, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 24, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 25, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 26, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 27, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 28, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 29, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 30, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 31, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 32, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 33, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 34, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 35, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 36, 0.5);
INSERT INTO `videocosine` VALUES (39, 37, 0.3535533905932738);
INSERT INTO `videocosine` VALUES (39, 38, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (39, 40, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 41, 0.3872983346207417);
INSERT INTO `videocosine` VALUES (39, 42, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 43, 0.6123724356957946);
INSERT INTO `videocosine` VALUES (39, 44, 0.9258200997725514);
INSERT INTO `videocosine` VALUES (39, 45, 0.9058216273156765);
INSERT INTO `videocosine` VALUES (39, 46, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (39, 47, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (40, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (40, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (40, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (40, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (40, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (40, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (40, 7, 1);
INSERT INTO `videocosine` VALUES (40, 8, 1);
INSERT INTO `videocosine` VALUES (40, 9, 1);
INSERT INTO `videocosine` VALUES (40, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (40, 11, 1);
INSERT INTO `videocosine` VALUES (40, 12, 1);
INSERT INTO `videocosine` VALUES (40, 17, 1);
INSERT INTO `videocosine` VALUES (40, 18, 1);
INSERT INTO `videocosine` VALUES (40, 19, 1);
INSERT INTO `videocosine` VALUES (40, 20, 1);
INSERT INTO `videocosine` VALUES (40, 21, 1);
INSERT INTO `videocosine` VALUES (40, 22, 1);
INSERT INTO `videocosine` VALUES (40, 23, 1);
INSERT INTO `videocosine` VALUES (40, 24, 1);
INSERT INTO `videocosine` VALUES (40, 25, 1);
INSERT INTO `videocosine` VALUES (40, 26, 1);
INSERT INTO `videocosine` VALUES (40, 27, 1);
INSERT INTO `videocosine` VALUES (40, 28, 1);
INSERT INTO `videocosine` VALUES (40, 29, 1);
INSERT INTO `videocosine` VALUES (40, 30, 1);
INSERT INTO `videocosine` VALUES (40, 31, 1);
INSERT INTO `videocosine` VALUES (40, 32, 1);
INSERT INTO `videocosine` VALUES (40, 33, 1);
INSERT INTO `videocosine` VALUES (40, 34, 1);
INSERT INTO `videocosine` VALUES (40, 35, 1);
INSERT INTO `videocosine` VALUES (40, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (40, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (40, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (40, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (40, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (40, 42, 1);
INSERT INTO `videocosine` VALUES (40, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (40, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (40, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (40, 46, 1);
INSERT INTO `videocosine` VALUES (40, 47, 1);
INSERT INTO `videocosine` VALUES (41, 1, 0.2581988897471611);
INSERT INTO `videocosine` VALUES (41, 2, 0.4242640687119285);
INSERT INTO `videocosine` VALUES (41, 3, 0.4242640687119285);
INSERT INTO `videocosine` VALUES (41, 4, 0.3651483716701107);
INSERT INTO `videocosine` VALUES (41, 5, 0.31622776601683794);
INSERT INTO `videocosine` VALUES (41, 6, 0.31622776601683794);
INSERT INTO `videocosine` VALUES (41, 7, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 8, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 9, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 10, 0.19069251784911848);
INSERT INTO `videocosine` VALUES (41, 11, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 12, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 17, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 18, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 19, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 20, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 21, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 22, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 23, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 24, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 25, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 26, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 27, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 28, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 29, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 30, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 31, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 32, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 33, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 34, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 35, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 36, 0.2581988897471611);
INSERT INTO `videocosine` VALUES (41, 37, 0.18257418583505536);
INSERT INTO `videocosine` VALUES (41, 38, 0.3651483716701107);
INSERT INTO `videocosine` VALUES (41, 39, 0.3872983346207417);
INSERT INTO `videocosine` VALUES (41, 40, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 42, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 43, 0.31622776601683794);
INSERT INTO `videocosine` VALUES (41, 44, 0.35856858280031806);
INSERT INTO `videocosine` VALUES (41, 45, 0.3508232077228117);
INSERT INTO `videocosine` VALUES (41, 46, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (41, 47, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (42, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (42, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (42, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (42, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (42, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (42, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (42, 7, 1);
INSERT INTO `videocosine` VALUES (42, 8, 1);
INSERT INTO `videocosine` VALUES (42, 9, 1);
INSERT INTO `videocosine` VALUES (42, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (42, 11, 1);
INSERT INTO `videocosine` VALUES (42, 12, 1);
INSERT INTO `videocosine` VALUES (42, 17, 1);
INSERT INTO `videocosine` VALUES (42, 18, 1);
INSERT INTO `videocosine` VALUES (42, 19, 1);
INSERT INTO `videocosine` VALUES (42, 20, 1);
INSERT INTO `videocosine` VALUES (42, 21, 1);
INSERT INTO `videocosine` VALUES (42, 22, 1);
INSERT INTO `videocosine` VALUES (42, 23, 1);
INSERT INTO `videocosine` VALUES (42, 24, 1);
INSERT INTO `videocosine` VALUES (42, 25, 1);
INSERT INTO `videocosine` VALUES (42, 26, 1);
INSERT INTO `videocosine` VALUES (42, 27, 1);
INSERT INTO `videocosine` VALUES (42, 28, 1);
INSERT INTO `videocosine` VALUES (42, 29, 1);
INSERT INTO `videocosine` VALUES (42, 30, 1);
INSERT INTO `videocosine` VALUES (42, 31, 1);
INSERT INTO `videocosine` VALUES (42, 32, 1);
INSERT INTO `videocosine` VALUES (42, 33, 1);
INSERT INTO `videocosine` VALUES (42, 34, 1);
INSERT INTO `videocosine` VALUES (42, 35, 1);
INSERT INTO `videocosine` VALUES (42, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (42, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (42, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (42, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (42, 40, 1);
INSERT INTO `videocosine` VALUES (42, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (42, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (42, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (42, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (42, 46, 1);
INSERT INTO `videocosine` VALUES (42, 47, 1);
INSERT INTO `videocosine` VALUES (43, 1, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (43, 2, 0.6708203932499369);
INSERT INTO `videocosine` VALUES (43, 3, 0.6708203932499369);
INSERT INTO `videocosine` VALUES (43, 4, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (43, 5, 0.5);
INSERT INTO `videocosine` VALUES (43, 6, 0.5);
INSERT INTO `videocosine` VALUES (43, 7, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 8, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 9, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 10, 0.30151134457776363);
INSERT INTO `videocosine` VALUES (43, 11, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 12, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 17, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 18, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 19, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 20, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 21, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 22, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 23, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 24, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 25, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 26, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 27, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 28, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 29, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 30, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 31, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 32, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 33, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 34, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 35, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 36, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (43, 37, 0.2886751345948129);
INSERT INTO `videocosine` VALUES (43, 38, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (43, 39, 0.6123724356957946);
INSERT INTO `videocosine` VALUES (43, 40, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 41, 0.31622776601683794);
INSERT INTO `videocosine` VALUES (43, 42, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 44, 0.5669467095138409);
INSERT INTO `videocosine` VALUES (43, 45, 0.5547001962252291);
INSERT INTO `videocosine` VALUES (43, 46, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (43, 47, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (44, 1, 0.4629100498862757);
INSERT INTO `videocosine` VALUES (44, 2, 0.6761234037828132);
INSERT INTO `videocosine` VALUES (44, 3, 0.8451542547285166);
INSERT INTO `videocosine` VALUES (44, 4, 0.6546536707079772);
INSERT INTO `videocosine` VALUES (44, 5, 0.7559289460184544);
INSERT INTO `videocosine` VALUES (44, 6, 0.629940788348712);
INSERT INTO `videocosine` VALUES (44, 7, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 8, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 9, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 10, 0.3418817293789138);
INSERT INTO `videocosine` VALUES (44, 11, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 12, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 17, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 18, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 19, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 20, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 21, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 22, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 23, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 24, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 25, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 26, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 27, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 28, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 29, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 30, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 31, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 32, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 33, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 34, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 35, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 36, 0.4629100498862757);
INSERT INTO `videocosine` VALUES (44, 37, 0.3273268353539886);
INSERT INTO `videocosine` VALUES (44, 38, 0.6546536707079772);
INSERT INTO `videocosine` VALUES (44, 39, 0.9258200997725514);
INSERT INTO `videocosine` VALUES (44, 40, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 41, 0.35856858280031806);
INSERT INTO `videocosine` VALUES (44, 42, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 43, 0.5669467095138409);
INSERT INTO `videocosine` VALUES (44, 45, 0.8386278693775346);
INSERT INTO `videocosine` VALUES (44, 46, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (44, 47, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (45, 1, 0.45291081365783825);
INSERT INTO `videocosine` VALUES (45, 2, 0.6201736729460423);
INSERT INTO `videocosine` VALUES (45, 3, 0.8682431421244593);
INSERT INTO `videocosine` VALUES (45, 4, 0.6405126152203485);
INSERT INTO `videocosine` VALUES (45, 5, 0.7396002616336388);
INSERT INTO `videocosine` VALUES (45, 6, 0.647150228929434);
INSERT INTO `videocosine` VALUES (45, 7, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 8, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 9, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 10, 0.3344968040028363);
INSERT INTO `videocosine` VALUES (45, 11, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 12, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 17, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 18, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 19, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 20, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 21, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 22, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 23, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 24, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 25, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 26, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 27, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 28, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 29, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 30, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 31, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 32, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 33, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 34, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 35, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 36, 0.45291081365783825);
INSERT INTO `videocosine` VALUES (45, 37, 0.32025630761017426);
INSERT INTO `videocosine` VALUES (45, 38, 0.6405126152203485);
INSERT INTO `videocosine` VALUES (45, 39, 0.9058216273156765);
INSERT INTO `videocosine` VALUES (45, 40, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 41, 0.3508232077228117);
INSERT INTO `videocosine` VALUES (45, 42, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 43, 0.5547001962252291);
INSERT INTO `videocosine` VALUES (45, 44, 0.8386278693775346);
INSERT INTO `videocosine` VALUES (45, 46, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (45, 47, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (46, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (46, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (46, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (46, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (46, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (46, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (46, 7, 1);
INSERT INTO `videocosine` VALUES (46, 8, 1);
INSERT INTO `videocosine` VALUES (46, 9, 1);
INSERT INTO `videocosine` VALUES (46, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (46, 11, 1);
INSERT INTO `videocosine` VALUES (46, 12, 1);
INSERT INTO `videocosine` VALUES (46, 17, 1);
INSERT INTO `videocosine` VALUES (46, 18, 1);
INSERT INTO `videocosine` VALUES (46, 19, 1);
INSERT INTO `videocosine` VALUES (46, 20, 1);
INSERT INTO `videocosine` VALUES (46, 21, 1);
INSERT INTO `videocosine` VALUES (46, 22, 1);
INSERT INTO `videocosine` VALUES (46, 23, 1);
INSERT INTO `videocosine` VALUES (46, 24, 1);
INSERT INTO `videocosine` VALUES (46, 25, 1);
INSERT INTO `videocosine` VALUES (46, 26, 1);
INSERT INTO `videocosine` VALUES (46, 27, 1);
INSERT INTO `videocosine` VALUES (46, 28, 1);
INSERT INTO `videocosine` VALUES (46, 29, 1);
INSERT INTO `videocosine` VALUES (46, 30, 1);
INSERT INTO `videocosine` VALUES (46, 31, 1);
INSERT INTO `videocosine` VALUES (46, 32, 1);
INSERT INTO `videocosine` VALUES (46, 33, 1);
INSERT INTO `videocosine` VALUES (46, 34, 1);
INSERT INTO `videocosine` VALUES (46, 35, 1);
INSERT INTO `videocosine` VALUES (46, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (46, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (46, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (46, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (46, 40, 1);
INSERT INTO `videocosine` VALUES (46, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (46, 42, 1);
INSERT INTO `videocosine` VALUES (46, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (46, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (46, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (46, 47, 1);
INSERT INTO `videocosine` VALUES (47, 1, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (47, 2, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (47, 3, 0.9486832980505138);
INSERT INTO `videocosine` VALUES (47, 4, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (47, 5, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (47, 6, 0.7071067811865476);
INSERT INTO `videocosine` VALUES (47, 7, 1);
INSERT INTO `videocosine` VALUES (47, 8, 1);
INSERT INTO `videocosine` VALUES (47, 9, 1);
INSERT INTO `videocosine` VALUES (47, 10, 0.42640143271122083);
INSERT INTO `videocosine` VALUES (47, 11, 1);
INSERT INTO `videocosine` VALUES (47, 12, 1);
INSERT INTO `videocosine` VALUES (47, 17, 1);
INSERT INTO `videocosine` VALUES (47, 18, 1);
INSERT INTO `videocosine` VALUES (47, 19, 1);
INSERT INTO `videocosine` VALUES (47, 20, 1);
INSERT INTO `videocosine` VALUES (47, 21, 1);
INSERT INTO `videocosine` VALUES (47, 22, 1);
INSERT INTO `videocosine` VALUES (47, 23, 1);
INSERT INTO `videocosine` VALUES (47, 24, 1);
INSERT INTO `videocosine` VALUES (47, 25, 1);
INSERT INTO `videocosine` VALUES (47, 26, 1);
INSERT INTO `videocosine` VALUES (47, 27, 1);
INSERT INTO `videocosine` VALUES (47, 28, 1);
INSERT INTO `videocosine` VALUES (47, 29, 1);
INSERT INTO `videocosine` VALUES (47, 30, 1);
INSERT INTO `videocosine` VALUES (47, 31, 1);
INSERT INTO `videocosine` VALUES (47, 32, 1);
INSERT INTO `videocosine` VALUES (47, 33, 1);
INSERT INTO `videocosine` VALUES (47, 34, 1);
INSERT INTO `videocosine` VALUES (47, 35, 1);
INSERT INTO `videocosine` VALUES (47, 36, 0.5773502691896258);
INSERT INTO `videocosine` VALUES (47, 37, 0.4082482904638631);
INSERT INTO `videocosine` VALUES (47, 38, 0.8164965809277261);
INSERT INTO `videocosine` VALUES (47, 39, 0.8660254037844387);
INSERT INTO `videocosine` VALUES (47, 40, 1);
INSERT INTO `videocosine` VALUES (47, 41, 0.4472135954999579);
INSERT INTO `videocosine` VALUES (47, 42, 1);
INSERT INTO `videocosine` VALUES (47, 43, 0.7071067811865475);
INSERT INTO `videocosine` VALUES (47, 44, 0.8017837257372732);
INSERT INTO `videocosine` VALUES (47, 45, 0.7844645405527362);
INSERT INTO `videocosine` VALUES (47, 46, 1);

-- ----------------------------
-- Table structure for videofavorite
-- ----------------------------
DROP TABLE IF EXISTS `videofavorite`;
CREATE TABLE `videofavorite`  (
  `favoriteId` int(0) NOT NULL,
  `videoId` int(0) NOT NULL,
  `favoriteDate` datetime(0) NULL DEFAULT NULL,
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
INSERT INTO `videofavorite` VALUES (11, 3, '2022-04-14 02:44:31');
INSERT INTO `videofavorite` VALUES (3, 4, '2022-01-26 03:49:00');
INSERT INTO `videofavorite` VALUES (7, 4, '2022-01-26 03:49:00');
INSERT INTO `videofavorite` VALUES (10, 10, '2022-02-22 00:40:32');

-- ----------------------------
-- Table structure for videoheat
-- ----------------------------
DROP TABLE IF EXISTS `videoheat`;
CREATE TABLE `videoheat`  (
  `videoId` int(0) NOT NULL,
  `categoryId` int(0) NULL DEFAULT NULL,
  `dayHeat` double NULL DEFAULT NULL,
  `weekHeat` double NULL DEFAULT NULL,
  `yearHeat` double NULL DEFAULT NULL,
  `cityHeat` double NULL DEFAULT NULL,
  `totalHeat` double NULL DEFAULT NULL,
  PRIMARY KEY (`videoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videoheat
-- ----------------------------
INSERT INTO `videoheat` VALUES (1, 1, 0, 0, 0, 0, 0.10817131025456513);
INSERT INTO `videoheat` VALUES (2, 1, 0, 0, 0, 0, 0.07087085844264612);
INSERT INTO `videoheat` VALUES (3, 2, 0, 0, 0, 0, 50.079722750055694);
INSERT INTO `videoheat` VALUES (4, 1, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (5, 3, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (6, 1, 0, 0, 0, 0, 1.8277221387840314);
INSERT INTO `videoheat` VALUES (7, 3, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (8, 4, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (9, 2, 0, 0, 0, 0, 174.82591676148806);
INSERT INTO `videoheat` VALUES (10, 2, 0, 0, 0, 0, 4975.639883064349);
INSERT INTO `videoheat` VALUES (11, 5, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (12, 1, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (17, 3, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (18, 3, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (19, 7, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (20, 2, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (21, 3, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (22, 6, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (23, 4, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (24, 7, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (25, 3, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (26, 2, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (27, 3, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (28, 3, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (29, 4, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (30, 2, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (31, 2, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (32, 4, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (33, 3, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (34, 0, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (35, 2, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (36, 2, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (37, 2, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (38, 1, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (39, 1, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (40, 1, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (41, 1, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (42, 8, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (43, 2, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (44, 6, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (45, 1, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (46, 5, 0, 0, 0, 0, -1);
INSERT INTO `videoheat` VALUES (47, 1, 0, 0, 0, 0, -1);

-- ----------------------------
-- Table structure for videoscore
-- ----------------------------
DROP TABLE IF EXISTS `videoscore`;
CREATE TABLE `videoscore`  (
  `userId` int(0) NOT NULL,
  `videoId` int(0) NOT NULL,
  `score` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `videoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videoscore
-- ----------------------------
INSERT INTO `videoscore` VALUES (3, 1, 9);
INSERT INTO `videoscore` VALUES (3, 2, 10);
INSERT INTO `videoscore` VALUES (3, 3, 7);
INSERT INTO `videoscore` VALUES (3, 4, 7);
INSERT INTO `videoscore` VALUES (3, 5, 5);
INSERT INTO `videoscore` VALUES (3, 6, 3);
INSERT INTO `videoscore` VALUES (3, 7, 5);
INSERT INTO `videoscore` VALUES (3, 8, 1);
INSERT INTO `videoscore` VALUES (3, 9, 0);
INSERT INTO `videoscore` VALUES (3, 10, 5);
INSERT INTO `videoscore` VALUES (3, 11, 0);
INSERT INTO `videoscore` VALUES (3, 12, 0);
INSERT INTO `videoscore` VALUES (3, 17, 0);
INSERT INTO `videoscore` VALUES (3, 18, 0);
INSERT INTO `videoscore` VALUES (3, 19, 0);
INSERT INTO `videoscore` VALUES (3, 20, 0);
INSERT INTO `videoscore` VALUES (3, 21, 0);
INSERT INTO `videoscore` VALUES (3, 22, 0);
INSERT INTO `videoscore` VALUES (3, 23, 0);
INSERT INTO `videoscore` VALUES (3, 24, 0);
INSERT INTO `videoscore` VALUES (3, 25, 0);
INSERT INTO `videoscore` VALUES (3, 26, 0);
INSERT INTO `videoscore` VALUES (3, 27, 0);
INSERT INTO `videoscore` VALUES (3, 28, 0);
INSERT INTO `videoscore` VALUES (3, 29, 0);
INSERT INTO `videoscore` VALUES (3, 30, 0);
INSERT INTO `videoscore` VALUES (3, 31, 0);
INSERT INTO `videoscore` VALUES (3, 32, 0);
INSERT INTO `videoscore` VALUES (3, 33, 0);
INSERT INTO `videoscore` VALUES (3, 34, 0);
INSERT INTO `videoscore` VALUES (3, 35, 0);
INSERT INTO `videoscore` VALUES (3, 36, 0);
INSERT INTO `videoscore` VALUES (3, 37, 0);
INSERT INTO `videoscore` VALUES (3, 38, 0);
INSERT INTO `videoscore` VALUES (3, 39, 0);
INSERT INTO `videoscore` VALUES (3, 40, 0);
INSERT INTO `videoscore` VALUES (3, 41, 0);
INSERT INTO `videoscore` VALUES (3, 42, 0);
INSERT INTO `videoscore` VALUES (3, 43, 0);
INSERT INTO `videoscore` VALUES (3, 44, 0);
INSERT INTO `videoscore` VALUES (3, 45, 0);
INSERT INTO `videoscore` VALUES (3, 46, 0);
INSERT INTO `videoscore` VALUES (3, 47, 0);
INSERT INTO `videoscore` VALUES (5, 1, 3);
INSERT INTO `videoscore` VALUES (5, 2, 0);
INSERT INTO `videoscore` VALUES (5, 3, 0);
INSERT INTO `videoscore` VALUES (5, 4, 0);
INSERT INTO `videoscore` VALUES (5, 5, 1);
INSERT INTO `videoscore` VALUES (5, 6, 1);
INSERT INTO `videoscore` VALUES (5, 7, 0);
INSERT INTO `videoscore` VALUES (5, 8, 0);
INSERT INTO `videoscore` VALUES (5, 9, 0);
INSERT INTO `videoscore` VALUES (5, 10, 0);
INSERT INTO `videoscore` VALUES (5, 11, 0);
INSERT INTO `videoscore` VALUES (5, 12, 0);
INSERT INTO `videoscore` VALUES (5, 17, 0);
INSERT INTO `videoscore` VALUES (5, 18, 0);
INSERT INTO `videoscore` VALUES (5, 19, 0);
INSERT INTO `videoscore` VALUES (5, 20, 0);
INSERT INTO `videoscore` VALUES (5, 21, 0);
INSERT INTO `videoscore` VALUES (5, 22, 0);
INSERT INTO `videoscore` VALUES (5, 23, 0);
INSERT INTO `videoscore` VALUES (5, 24, 0);
INSERT INTO `videoscore` VALUES (5, 25, 0);
INSERT INTO `videoscore` VALUES (5, 26, 0);
INSERT INTO `videoscore` VALUES (5, 27, 0);
INSERT INTO `videoscore` VALUES (5, 28, 0);
INSERT INTO `videoscore` VALUES (5, 29, 0);
INSERT INTO `videoscore` VALUES (5, 30, 0);
INSERT INTO `videoscore` VALUES (5, 31, 0);
INSERT INTO `videoscore` VALUES (5, 32, 0);
INSERT INTO `videoscore` VALUES (5, 33, 0);
INSERT INTO `videoscore` VALUES (5, 34, 0);
INSERT INTO `videoscore` VALUES (5, 35, 0);
INSERT INTO `videoscore` VALUES (5, 36, 0);
INSERT INTO `videoscore` VALUES (5, 37, 0);
INSERT INTO `videoscore` VALUES (5, 38, 0);
INSERT INTO `videoscore` VALUES (5, 39, 0);
INSERT INTO `videoscore` VALUES (5, 40, 0);
INSERT INTO `videoscore` VALUES (5, 41, 0);
INSERT INTO `videoscore` VALUES (5, 42, 0);
INSERT INTO `videoscore` VALUES (5, 43, 0);
INSERT INTO `videoscore` VALUES (5, 44, 0);
INSERT INTO `videoscore` VALUES (5, 45, 0);
INSERT INTO `videoscore` VALUES (5, 46, 0);
INSERT INTO `videoscore` VALUES (5, 47, 0);
INSERT INTO `videoscore` VALUES (6, 1, 5);
INSERT INTO `videoscore` VALUES (6, 2, 5);
INSERT INTO `videoscore` VALUES (6, 3, 0);
INSERT INTO `videoscore` VALUES (6, 4, 4);
INSERT INTO `videoscore` VALUES (6, 5, 0);
INSERT INTO `videoscore` VALUES (6, 6, 0);
INSERT INTO `videoscore` VALUES (6, 7, 0);
INSERT INTO `videoscore` VALUES (6, 8, 0);
INSERT INTO `videoscore` VALUES (6, 9, 3);
INSERT INTO `videoscore` VALUES (6, 10, 4);
INSERT INTO `videoscore` VALUES (6, 11, 0);
INSERT INTO `videoscore` VALUES (6, 12, 0);
INSERT INTO `videoscore` VALUES (6, 17, 0);
INSERT INTO `videoscore` VALUES (6, 18, 0);
INSERT INTO `videoscore` VALUES (6, 19, 0);
INSERT INTO `videoscore` VALUES (6, 20, 0);
INSERT INTO `videoscore` VALUES (6, 21, 0);
INSERT INTO `videoscore` VALUES (6, 22, 0);
INSERT INTO `videoscore` VALUES (6, 23, 0);
INSERT INTO `videoscore` VALUES (6, 24, 0);
INSERT INTO `videoscore` VALUES (6, 25, 0);
INSERT INTO `videoscore` VALUES (6, 26, 0);
INSERT INTO `videoscore` VALUES (6, 27, 0);
INSERT INTO `videoscore` VALUES (6, 28, 0);
INSERT INTO `videoscore` VALUES (6, 29, 0);
INSERT INTO `videoscore` VALUES (6, 30, 0);
INSERT INTO `videoscore` VALUES (6, 31, 0);
INSERT INTO `videoscore` VALUES (6, 32, 0);
INSERT INTO `videoscore` VALUES (6, 33, 0);
INSERT INTO `videoscore` VALUES (6, 34, 0);
INSERT INTO `videoscore` VALUES (6, 35, 0);
INSERT INTO `videoscore` VALUES (6, 36, 0);
INSERT INTO `videoscore` VALUES (6, 37, 0);
INSERT INTO `videoscore` VALUES (6, 38, 0);
INSERT INTO `videoscore` VALUES (6, 39, 0);
INSERT INTO `videoscore` VALUES (6, 40, 0);
INSERT INTO `videoscore` VALUES (6, 41, 0);
INSERT INTO `videoscore` VALUES (6, 42, 0);
INSERT INTO `videoscore` VALUES (6, 43, 0);
INSERT INTO `videoscore` VALUES (6, 44, 0);
INSERT INTO `videoscore` VALUES (6, 45, 0);
INSERT INTO `videoscore` VALUES (6, 46, 0);
INSERT INTO `videoscore` VALUES (6, 47, 0);
INSERT INTO `videoscore` VALUES (7, 1, 0);
INSERT INTO `videoscore` VALUES (7, 2, 0);
INSERT INTO `videoscore` VALUES (7, 3, 3);
INSERT INTO `videoscore` VALUES (7, 4, 4);
INSERT INTO `videoscore` VALUES (7, 5, 0);
INSERT INTO `videoscore` VALUES (7, 6, 0);
INSERT INTO `videoscore` VALUES (7, 7, 0);
INSERT INTO `videoscore` VALUES (7, 8, 0);
INSERT INTO `videoscore` VALUES (7, 9, 0);
INSERT INTO `videoscore` VALUES (7, 10, 3);
INSERT INTO `videoscore` VALUES (7, 11, 4);
INSERT INTO `videoscore` VALUES (7, 12, 0);
INSERT INTO `videoscore` VALUES (7, 17, 0);
INSERT INTO `videoscore` VALUES (7, 18, 0);
INSERT INTO `videoscore` VALUES (7, 19, 0);
INSERT INTO `videoscore` VALUES (7, 20, 0);
INSERT INTO `videoscore` VALUES (7, 21, 0);
INSERT INTO `videoscore` VALUES (7, 22, 0);
INSERT INTO `videoscore` VALUES (7, 23, 0);
INSERT INTO `videoscore` VALUES (7, 24, 0);
INSERT INTO `videoscore` VALUES (7, 25, 0);
INSERT INTO `videoscore` VALUES (7, 26, 0);
INSERT INTO `videoscore` VALUES (7, 27, 0);
INSERT INTO `videoscore` VALUES (7, 28, 0);
INSERT INTO `videoscore` VALUES (7, 29, 0);
INSERT INTO `videoscore` VALUES (7, 30, 0);
INSERT INTO `videoscore` VALUES (7, 31, 0);
INSERT INTO `videoscore` VALUES (7, 32, 0);
INSERT INTO `videoscore` VALUES (7, 33, 0);
INSERT INTO `videoscore` VALUES (7, 34, 0);
INSERT INTO `videoscore` VALUES (7, 35, 0);
INSERT INTO `videoscore` VALUES (7, 36, 0);
INSERT INTO `videoscore` VALUES (7, 37, 0);
INSERT INTO `videoscore` VALUES (7, 38, 0);
INSERT INTO `videoscore` VALUES (7, 39, 0);
INSERT INTO `videoscore` VALUES (7, 40, 0);
INSERT INTO `videoscore` VALUES (7, 41, 0);
INSERT INTO `videoscore` VALUES (7, 42, 0);
INSERT INTO `videoscore` VALUES (7, 43, 0);
INSERT INTO `videoscore` VALUES (7, 44, 0);
INSERT INTO `videoscore` VALUES (7, 45, 0);
INSERT INTO `videoscore` VALUES (7, 46, 0);
INSERT INTO `videoscore` VALUES (7, 47, 0);
INSERT INTO `videoscore` VALUES (9, 1, 0);
INSERT INTO `videoscore` VALUES (9, 2, 0);
INSERT INTO `videoscore` VALUES (9, 3, 9);
INSERT INTO `videoscore` VALUES (9, 4, 0);
INSERT INTO `videoscore` VALUES (9, 5, 0);
INSERT INTO `videoscore` VALUES (9, 6, 0);
INSERT INTO `videoscore` VALUES (9, 7, 0);
INSERT INTO `videoscore` VALUES (9, 8, 0);
INSERT INTO `videoscore` VALUES (9, 9, 0);
INSERT INTO `videoscore` VALUES (9, 10, 0);
INSERT INTO `videoscore` VALUES (9, 11, 0);
INSERT INTO `videoscore` VALUES (9, 12, 0);
INSERT INTO `videoscore` VALUES (9, 17, 0);
INSERT INTO `videoscore` VALUES (9, 18, 0);
INSERT INTO `videoscore` VALUES (9, 19, 0);
INSERT INTO `videoscore` VALUES (9, 20, 0);
INSERT INTO `videoscore` VALUES (9, 21, 0);
INSERT INTO `videoscore` VALUES (9, 22, 0);
INSERT INTO `videoscore` VALUES (9, 23, 0);
INSERT INTO `videoscore` VALUES (9, 24, 0);
INSERT INTO `videoscore` VALUES (9, 25, 0);
INSERT INTO `videoscore` VALUES (9, 26, 0);
INSERT INTO `videoscore` VALUES (9, 27, 0);
INSERT INTO `videoscore` VALUES (9, 28, 0);
INSERT INTO `videoscore` VALUES (9, 29, 0);
INSERT INTO `videoscore` VALUES (9, 30, 0);
INSERT INTO `videoscore` VALUES (9, 31, 0);
INSERT INTO `videoscore` VALUES (9, 32, 0);
INSERT INTO `videoscore` VALUES (9, 33, 0);
INSERT INTO `videoscore` VALUES (9, 34, 0);
INSERT INTO `videoscore` VALUES (9, 35, 0);
INSERT INTO `videoscore` VALUES (9, 36, 0);
INSERT INTO `videoscore` VALUES (9, 37, 0);
INSERT INTO `videoscore` VALUES (9, 38, 0);
INSERT INTO `videoscore` VALUES (9, 39, 0);
INSERT INTO `videoscore` VALUES (9, 40, 0);
INSERT INTO `videoscore` VALUES (9, 41, 0);
INSERT INTO `videoscore` VALUES (9, 42, 0);
INSERT INTO `videoscore` VALUES (9, 43, 0);
INSERT INTO `videoscore` VALUES (9, 44, 0);
INSERT INTO `videoscore` VALUES (9, 45, 0);
INSERT INTO `videoscore` VALUES (9, 46, 0);
INSERT INTO `videoscore` VALUES (9, 47, 0);
INSERT INTO `videoscore` VALUES (10, 1, 0);
INSERT INTO `videoscore` VALUES (10, 2, 0);
INSERT INTO `videoscore` VALUES (10, 3, 0);
INSERT INTO `videoscore` VALUES (10, 4, 0);
INSERT INTO `videoscore` VALUES (10, 5, 0);
INSERT INTO `videoscore` VALUES (10, 6, 0);
INSERT INTO `videoscore` VALUES (10, 7, 0);
INSERT INTO `videoscore` VALUES (10, 8, 0);
INSERT INTO `videoscore` VALUES (10, 9, 0);
INSERT INTO `videoscore` VALUES (10, 10, 0);
INSERT INTO `videoscore` VALUES (10, 11, 0);
INSERT INTO `videoscore` VALUES (10, 12, 0);
INSERT INTO `videoscore` VALUES (10, 17, 0);
INSERT INTO `videoscore` VALUES (10, 18, 0);
INSERT INTO `videoscore` VALUES (10, 19, 0);
INSERT INTO `videoscore` VALUES (10, 20, 0);
INSERT INTO `videoscore` VALUES (10, 21, 0);
INSERT INTO `videoscore` VALUES (10, 22, 0);
INSERT INTO `videoscore` VALUES (10, 23, 0);
INSERT INTO `videoscore` VALUES (10, 24, 0);
INSERT INTO `videoscore` VALUES (10, 25, 0);
INSERT INTO `videoscore` VALUES (10, 26, 0);
INSERT INTO `videoscore` VALUES (10, 27, 0);
INSERT INTO `videoscore` VALUES (10, 28, 0);
INSERT INTO `videoscore` VALUES (10, 29, 0);
INSERT INTO `videoscore` VALUES (10, 30, 0);
INSERT INTO `videoscore` VALUES (10, 31, 0);
INSERT INTO `videoscore` VALUES (10, 32, 0);
INSERT INTO `videoscore` VALUES (10, 33, 0);
INSERT INTO `videoscore` VALUES (10, 34, 0);
INSERT INTO `videoscore` VALUES (10, 35, 0);
INSERT INTO `videoscore` VALUES (10, 36, 0);
INSERT INTO `videoscore` VALUES (10, 37, 0);
INSERT INTO `videoscore` VALUES (10, 38, 0);
INSERT INTO `videoscore` VALUES (10, 39, 0);
INSERT INTO `videoscore` VALUES (10, 40, 0);
INSERT INTO `videoscore` VALUES (10, 41, 0);
INSERT INTO `videoscore` VALUES (10, 42, 0);
INSERT INTO `videoscore` VALUES (10, 43, 0);
INSERT INTO `videoscore` VALUES (10, 44, 0);
INSERT INTO `videoscore` VALUES (10, 45, 0);
INSERT INTO `videoscore` VALUES (10, 46, 0);
INSERT INTO `videoscore` VALUES (10, 47, 0);

-- ----------------------------
-- Table structure for videotag
-- ----------------------------
DROP TABLE IF EXISTS `videotag`;
CREATE TABLE `videotag`  (
  `tagId` int(0) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoId` int(0) NOT NULL,
  PRIMARY KEY (`tagId`, `videoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videotag
-- ----------------------------
INSERT INTO `videotag` VALUES (1, '1', 0);
INSERT INTO `videotag` VALUES (1, '算法相关', 1);
INSERT INTO `videotag` VALUES (1, '2', 3);
INSERT INTO `videotag` VALUES (2, '你', 2);
INSERT INTO `videotag` VALUES (3, '好', 3);
INSERT INTO `videotag` VALUES (4, '我', 4);
INSERT INTO `videotag` VALUES (5, '好', 5);
INSERT INTO `videotag` VALUES (6, '人工智能', 5);
INSERT INTO `videotag` VALUES (7, '王者荣耀', 6);
INSERT INTO `videotag` VALUES (8, '算法相关', 36);
INSERT INTO `videotag` VALUES (9, '好', 6);
INSERT INTO `videotag` VALUES (13, '22', 0);
INSERT INTO `videotag` VALUES (14, '董嘉辉', 37);
INSERT INTO `videotag` VALUES (15, '大主播', 37);
INSERT INTO `videotag` VALUES (16, '吃鸡厉害', 37);
INSERT INTO `videotag` VALUES (17, '哈哈', 38);
INSERT INTO `videotag` VALUES (18, '你好', 38);
INSERT INTO `videotag` VALUES (19, '好人', 39);
INSERT INTO `videotag` VALUES (20, '', 40);
INSERT INTO `videotag` VALUES (21, '标签1', 41);
INSERT INTO `videotag` VALUES (22, '标签2', 41);
INSERT INTO `videotag` VALUES (23, '141', 42);
INSERT INTO `videotag` VALUES (24, '哲学', 43);
INSERT INTO `videotag` VALUES (25, '帅', 44);
INSERT INTO `videotag` VALUES (26, '好人', 44);
INSERT INTO `videotag` VALUES (27, '666', 44);
INSERT INTO `videotag` VALUES (28, '郁郁症', 10);
INSERT INTO `videotag` VALUES (29, '徐淼', 10);
INSERT INTO `videotag` VALUES (30, '二货', 10);
INSERT INTO `videotag` VALUES (31, '好人', 45);
INSERT INTO `videotag` VALUES (32, '真好啊', 45);
INSERT INTO `videotag` VALUES (33, 'test1', 46);
INSERT INTO `videotag` VALUES (34, 'awd', 47);
INSERT INTO `videotag` VALUES (35, 'wad', 47);
INSERT INTO `videotag` VALUES (36, 'f', 47);
INSERT INTO `videotag` VALUES (37, 'g', 47);
INSERT INTO `videotag` VALUES (38, 'A', 47);

-- ----------------------------
-- Table structure for videotransmit
-- ----------------------------
DROP TABLE IF EXISTS `videotransmit`;
CREATE TABLE `videotransmit`  (
  `userId` int(0) NOT NULL,
  `videoId` int(0) NOT NULL,
  `transmitMode` int(0) NULL DEFAULT 0,
  `transmitDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `videoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videotransmit
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
