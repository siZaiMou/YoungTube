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

 Date: 11/01/2022 15:17:58
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
-- Table structure for click
-- ----------------------------
DROP TABLE IF EXISTS `click`;
CREATE TABLE `click`  (
  `userId` int NOT NULL,
  `videoId` int NOT NULL,
  `clickDate` datetime NULL DEFAULT NULL,
  `clickType` int NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `videoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of click
-- ----------------------------

-- ----------------------------
-- Table structure for coin
-- ----------------------------
DROP TABLE IF EXISTS `coin`;
CREATE TABLE `coin`  (
  `userId` int NOT NULL,
  `videoId` int NOT NULL,
  `coinCount` int NULL DEFAULT NULL,
  `coinDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `videoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coin
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
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
-- Records of comment
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
  `dsize` int NULL DEFAULT NULL,
  `dcolor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dtime` float NULL DEFAULT NULL,
  `dSendTime` datetime NULL DEFAULT NULL,
  `position` int NULL DEFAULT NULL,
  `danmuAuditStatus` int NULL DEFAULT 0,
  PRIMARY KEY (`danmuId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of danmu
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
-- Table structure for transmit
-- ----------------------------
DROP TABLE IF EXISTS `transmit`;
CREATE TABLE `transmit`  (
  `userId` int NOT NULL,
  `videoId` int NOT NULL,
  `transmitMode` int NULL DEFAULT 0,
  `transmitDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `videoId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transmit
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, 'avavaava', '这个人很神秘，什么都没有写', 'e10adc3949ba59abbe56e057f20f883e', '/common/pictures/user/userhead/defaulthead.png', NULL, NULL, NULL, '山东省临沂市', '122.6.184.73', '16865213017', NULL, 0, 100, 0, '2022-01-11 04:52:01', 0);

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
  `vidioSrc` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videoViewCount` int NULL DEFAULT 0,
  `videoIssuingTime` datetime NULL DEFAULT NULL,
  `videoAuditStatus` int NULL DEFAULT 0,
  `videoUpId` int NULL DEFAULT NULL,
  `videoTeenagerMode` int NULL DEFAULT 0,
  PRIMARY KEY (`videoId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of videotag
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
