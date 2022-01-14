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

 Date: 14/01/2022 17:57:47
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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for dynamic
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic`  (
  `dynamicId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `dynamicContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dynamicIsTop` int NULL DEFAULT 0,
  PRIMARY KEY (`dynamicId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dynamic
-- ----------------------------

-- ----------------------------
-- Table structure for dynamiccomment
-- ----------------------------
DROP TABLE IF EXISTS `dynamiccomment`;
CREATE TABLE `dynamiccomment`  (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `dynamicId` int NULL DEFAULT NULL,
  `commentContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `commentPraise` int NULL DEFAULT NULL,
  `commentDislike` int NULL DEFAULT NULL,
  `commentDate` datetime NULL DEFAULT NULL,
  `fatherCommentId` int NULL DEFAULT NULL,
  `commentAuditStatus` int NULL DEFAULT 0,
  `dynamicCommentIsTop` int NULL DEFAULT 0,
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dynamiccomment
-- ----------------------------

-- ----------------------------
-- Table structure for dynamicpraise
-- ----------------------------
DROP TABLE IF EXISTS `dynamicpraise`;
CREATE TABLE `dynamicpraise`  (
  `dynamicId` int NULL DEFAULT NULL,
  `userId` int NULL DEFAULT NULL,
  `praiseDate` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dynamicpraise
-- ----------------------------

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `favoriteId` int NOT NULL AUTO_INCREMENT,
  `favoriteName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userId` int NULL DEFAULT NULL,
  PRIMARY KEY (`favoriteId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, 'avavaava', '这个人很神秘，什么都没有写', 'e10adc3949ba59abbe56e057f20f883e', '/common/pictures/user/userhead/defaulthead.png', NULL, NULL, NULL, '山东省临沂市', '122.6.184.73', '16865213017', NULL, 0, 100, 0, '2022-01-11 04:52:01', 0);
INSERT INTO `user` VALUES (5, '资深up主', '这个人很神秘，什么都没有写', 'e10adc3949ba59abbe56e057f20f883e', '/common/pictures/user/userhead/defaulthead.png', NULL, NULL, NULL, '山东省临沂市', '122.6.184.73', '19812323123', NULL, 0, 100, 0, '2022-01-12 00:39:31', 0);

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video`  (
  `videoId` int NOT NULL AUTO_INCREMENT,
  `videoName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoIntroduction` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoCategory` int NULL DEFAULT NULL,
  `videoFrontSrc` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoSrc` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoViewCount` int NULL DEFAULT 0,
  `videoIssuingTime` datetime NULL DEFAULT NULL,
  `videoAuditStatus` int NULL DEFAULT 0,
  `videoUpId` int NULL DEFAULT NULL,
  `videoTeenagerMode` int NULL DEFAULT 0,
  `videoDuring` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`videoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES (1, '某科学的超电磁炮精剪', '喜欢我二次元吗?', 1, '/video/videoFont/paojie.png', '/video/paojie.mp4', 0, '2022-01-12 09:03:12', 0, 5, 0, '02:29');
INSERT INTO `video` VALUES (2, '刀剑神域', '喜欢我刀剑神域吗?', 1, '/video/videoFont/daojian.png', '/video/meimei.mp4', 0, '2022-01-12 09:03:14', 0, 5, 0, '04:31');
INSERT INTO `video` VALUES (3, '随机对对子不要笑蹭饭大挑战', '喜欢我p大将吗?', 2, '/video/videoFont/wuyu.png', '/video/xiaoyuan.mp4', 11021, '2022-01-12 09:03:16', 0, 5, 0, '01:25');
INSERT INTO `video` VALUES (4, '嘉然的战争', '欧内的手哈嘉嘉', 1, '/video/videoFont/bilansuo.png', '/video/longnvpu.mp4', 0, '2022-01-12 09:05:08', 0, 5, 0, '03:02');
INSERT INTO `video` VALUES (5, '小艾锐评', '早该图图了', 3, '/video/videoFont/zhiyuxiang.png', '/video/longnvpu.mp4', 0, '2022-01-12 12:18:41', 0, 3, 0, '02:15');
INSERT INTO `video` VALUES (6, '温暖二次元', '闹挺大', 1, '/video/videoFont/zhongerbing.png', '/video/longnvpu.mp4', 231, '2022-01-12 12:19:44', 0, 5, 0, '05:23');
INSERT INTO `video` VALUES (7, '美国疫情现状', 'winwin', 3, '/video/videoFont/daojian.png', '/video/longnvpu.mp4', 0, '2022-01-12 13:05:28', 0, 5, 0, '06:44');
INSERT INTO `video` VALUES (8, '回家', '下北泽金曲', 4, '/video/videoFont/wuyu.png', '/video/paojie.mp4', 31, '2022-01-12 13:06:35', 0, 3, 0, '01:58');

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
  `clickType` int NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `videoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videoclick
-- ----------------------------

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

-- ----------------------------
-- Table structure for videocomment
-- ----------------------------
DROP TABLE IF EXISTS `videocomment`;
CREATE TABLE `videocomment`  (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `videoId` int NULL DEFAULT NULL,
  `commentContent` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `commentPraise` int NULL DEFAULT NULL,
  `commentDislike` int NULL DEFAULT NULL,
  `commentDate` datetime NULL DEFAULT NULL,
  `fatherCommentId` int NULL DEFAULT NULL,
  `commentAuditStatus` int NULL DEFAULT 0,
  `videoCommentIsTop` int NULL DEFAULT 0,
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videocomment
-- ----------------------------
INSERT INTO `videocomment` VALUES (1, 3, 1, '私密马赛test111', 0, 0, '2022-01-14 07:47:16', 0, 0, 0);
INSERT INTO `videocomment` VALUES (2, 3, 1, 'hello hello 听得到吗', 0, 0, '2022-01-14 07:47:41', 0, 0, 0);
INSERT INTO `videocomment` VALUES (3, 3, 1, '捏麻麻地', 0, 0, '2022-01-14 08:57:22', 0, 0, 0);
INSERT INTO `videocomment` VALUES (4, 3, 1, '你好你好', 0, 0, '2022-01-14 08:59:58', 0, 0, 0);

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

-- ----------------------------
-- Table structure for videotag
-- ----------------------------
DROP TABLE IF EXISTS `videotag`;
CREATE TABLE `videotag`  (
  `tagId` int NOT NULL AUTO_INCREMENT,
  `tagName` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoId` int NULL DEFAULT NULL,
  PRIMARY KEY (`tagId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
