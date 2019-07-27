/*
 Navicat Premium Data Transfer

 Source Server         : 60.205.251.83_3306
 Source Server Type    : MySQL
 Source Server Version : 50644
 Source Host           : 60.205.251.83:3306
 Source Schema         : newim

 Target Server Type    : MySQL
 Target Server Version : 50644
 File Encoding         : 65001

 Date: 27/07/2019 13:39:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for on_IMAdmin
-- ----------------------------
DROP TABLE IF EXISTS `on_IMAdmin`;
CREATE TABLE `on_IMAdmin`  (
  `id` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `pwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户状态 0 :正常 1:删除 可扩展',
  `created` bigint(20) NULL DEFAULT NULL COMMENT '创建时间´',
  `updated` bigint(20) NULL DEFAULT NULL COMMENT '更新时间´',
  `createrUser` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMAudio
-- ----------------------------
DROP TABLE IF EXISTS `on_IMAudio`;
CREATE TABLE `on_IMAudio`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送者Id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收者Id',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '语音存储的地址',
  `size` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `duration` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '语音时长',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_fromId_toId`(`fromId`, `toId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMDepart
-- ----------------------------
DROP TABLE IF EXISTS `on_IMDepart`;
CREATE TABLE `on_IMDepart`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `uid` int(20) NOT NULL DEFAULT 0,
  `departName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '部门名称',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示优先级',
  `parentId` int(11) UNSIGNED NOT NULL COMMENT '上级部门id',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  `updated` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_departName`(`departName`) USING BTREE,
  INDEX `idx_priority_status`(`priority`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMDiscovery
-- ----------------------------
DROP TABLE IF EXISTS `on_IMDiscovery`;
CREATE TABLE `on_IMDiscovery`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `itemName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '名称',
  `itemUrl` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'URL',
  `itemPriority` int(11) UNSIGNED NOT NULL COMMENT '显示优先级',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  `updated` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_itemName`(`itemName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMGroup
-- ----------------------------
DROP TABLE IF EXISTS `on_IMGroup`;
CREATE TABLE `on_IMGroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '群名称',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '群头像',
  `creator` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者用户id',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '群组类型，1-固定;2-临时群',
  `userCnt` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '成员人数',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否删除,0-正常，1-删除',
  `version` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '群版本号',
  `lastChated` int(11) NULL DEFAULT 0 COMMENT '最后聊天时间',
  `updated` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `created` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `secret` tinyint(3) NOT NULL DEFAULT 1 COMMENT '是否私密群组0公开 1私密',
  `topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '群公告',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`(191)) USING BTREE,
  INDEX `idx_creator`(`creator`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'IM群信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMGroupMember
-- ----------------------------
DROP TABLE IF EXISTS `on_IMGroupMember`;
CREATE TABLE `on_IMGroupMember`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '群Id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `status` tinyint(4) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否退出群，0-正常，1-已退出',
  `remak` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_groupId_userId_status`(`groupId`, `userId`, `status`) USING BTREE,
  INDEX `idx_userId_status_updated`(`userId`, `status`, `updated`) USING BTREE,
  INDEX `idx_groupId_updated`(`groupId`, `updated`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和群的关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMGroupMessage_0
-- ----------------------------
DROP TABLE IF EXISTS `on_IMGroupMessage_0`;
CREATE TABLE `on_IMGroupMessage_0`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息状态',
  `updated` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_groupId_status_created`(`groupId`, `status`, `created`) USING BTREE,
  INDEX `idx_groupId_msgId_status_created`(`groupId`, `msgId`, `status`, `created`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'IM群消息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMGroupMessage_1
-- ----------------------------
DROP TABLE IF EXISTS `on_IMGroupMessage_1`;
CREATE TABLE `on_IMGroupMessage_1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息状态',
  `updated` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_groupId_status_created`(`groupId`, `status`, `created`) USING BTREE,
  INDEX `idx_groupId_msgId_status_created`(`groupId`, `msgId`, `status`, `created`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'IM群消息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMGroupMessage_2
-- ----------------------------
DROP TABLE IF EXISTS `on_IMGroupMessage_2`;
CREATE TABLE `on_IMGroupMessage_2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息状态',
  `updated` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_groupId_status_created`(`groupId`, `status`, `created`) USING BTREE,
  INDEX `idx_groupId_msgId_status_created`(`groupId`, `msgId`, `status`, `created`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'IM群消息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMGroupMessage_3
-- ----------------------------
DROP TABLE IF EXISTS `on_IMGroupMessage_3`;
CREATE TABLE `on_IMGroupMessage_3`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息状态',
  `updated` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_groupId_status_created`(`groupId`, `status`, `created`) USING BTREE,
  INDEX `idx_groupId_msgId_status_created`(`groupId`, `msgId`, `status`, `created`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'IM群消息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMGroupMessage_4
-- ----------------------------
DROP TABLE IF EXISTS `on_IMGroupMessage_4`;
CREATE TABLE `on_IMGroupMessage_4`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息状态',
  `updated` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `flag` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_groupId_status_created`(`groupId`, `status`, `created`) USING BTREE,
  INDEX `idx_groupId_msgId_status_created`(`groupId`, `msgId`, `status`, `created`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'IM群消息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMGroupMessage_5
-- ----------------------------
DROP TABLE IF EXISTS `on_IMGroupMessage_5`;
CREATE TABLE `on_IMGroupMessage_5`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息状态',
  `updated` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_groupId_status_created`(`groupId`, `status`, `created`) USING BTREE,
  INDEX `idx_groupId_msgId_status_created`(`groupId`, `msgId`, `status`, `created`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'IM群消息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMGroupMessage_6
-- ----------------------------
DROP TABLE IF EXISTS `on_IMGroupMessage_6`;
CREATE TABLE `on_IMGroupMessage_6`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息状态',
  `updated` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_groupId_status_created`(`groupId`, `status`, `created`) USING BTREE,
  INDEX `idx_groupId_msgId_status_created`(`groupId`, `msgId`, `status`, `created`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'IM群消息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMGroupMessage_7
-- ----------------------------
DROP TABLE IF EXISTS `on_IMGroupMessage_7`;
CREATE TABLE `on_IMGroupMessage_7`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `userId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 2 COMMENT '群消息类型,101为群语音,2为文本',
  `status` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消息状态',
  `updated` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `created` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_groupId_status_created`(`groupId`, `status`, `created`) USING BTREE,
  INDEX `idx_groupId_msgId_status_created`(`groupId`, `msgId`, `status`, `created`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = 'IM群消息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMMessage_0
-- ----------------------------
DROP TABLE IF EXISTS `on_IMMessage_0`;
CREATE TABLE `on_IMMessage_0`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0正常 1被删除',
  `updated` bigint(20) NOT NULL COMMENT '更新时间',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  `flag` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_relateId_status_created`(`relateId`, `status`, `created`) USING BTREE,
  INDEX `idx_relateId_status_msgId_created`(`relateId`, `status`, `msgId`, `created`) USING BTREE,
  INDEX `idx_fromId_toId_created`(`fromId`, `toId`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMMessage_1
-- ----------------------------
DROP TABLE IF EXISTS `on_IMMessage_1`;
CREATE TABLE `on_IMMessage_1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0正常 1被删除',
  `updated` bigint(20) NOT NULL COMMENT '更新时间',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  `flag` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_relateId_status_created`(`relateId`, `status`, `created`) USING BTREE,
  INDEX `idx_relateId_status_msgId_created`(`relateId`, `status`, `msgId`, `created`) USING BTREE,
  INDEX `idx_fromId_toId_created`(`fromId`, `toId`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMMessage_2
-- ----------------------------
DROP TABLE IF EXISTS `on_IMMessage_2`;
CREATE TABLE `on_IMMessage_2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0正常 1被删除',
  `updated` bigint(20) NOT NULL COMMENT '更新时间',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  `flag` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_relateId_status_created`(`relateId`, `status`, `created`) USING BTREE,
  INDEX `idx_relateId_status_msgId_created`(`relateId`, `status`, `msgId`, `created`) USING BTREE,
  INDEX `idx_fromId_toId_created`(`fromId`, `toId`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMMessage_3
-- ----------------------------
DROP TABLE IF EXISTS `on_IMMessage_3`;
CREATE TABLE `on_IMMessage_3`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0正常 1被删除',
  `updated` bigint(20) NOT NULL COMMENT '更新时间',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  `flag` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_relateId_status_created`(`relateId`, `status`, `created`) USING BTREE,
  INDEX `idx_relateId_status_msgId_created`(`relateId`, `status`, `msgId`, `created`) USING BTREE,
  INDEX `idx_fromId_toId_created`(`fromId`, `toId`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMMessage_4
-- ----------------------------
DROP TABLE IF EXISTS `on_IMMessage_4`;
CREATE TABLE `on_IMMessage_4`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0正常 1被删除',
  `updated` bigint(20) NOT NULL COMMENT '更新时间',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  `flag` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_relateId_status_created`(`relateId`, `status`, `created`) USING BTREE,
  INDEX `idx_relateId_status_msgId_created`(`relateId`, `status`, `msgId`, `created`) USING BTREE,
  INDEX `idx_fromId_toId_created`(`fromId`, `toId`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMMessage_5
-- ----------------------------
DROP TABLE IF EXISTS `on_IMMessage_5`;
CREATE TABLE `on_IMMessage_5`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0正常 1被删除',
  `updated` bigint(20) NOT NULL COMMENT '更新时间',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  `flag` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_relateId_status_created`(`relateId`, `status`, `created`) USING BTREE,
  INDEX `idx_relateId_status_msgId_created`(`relateId`, `status`, `msgId`, `created`) USING BTREE,
  INDEX `idx_fromId_toId_created`(`fromId`, `toId`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMMessage_6
-- ----------------------------
DROP TABLE IF EXISTS `on_IMMessage_6`;
CREATE TABLE `on_IMMessage_6`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0正常 1被删除',
  `updated` bigint(20) NOT NULL COMMENT '更新时间',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  `flag` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_relateId_status_created`(`relateId`, `status`, `created`) USING BTREE,
  INDEX `idx_relateId_status_msgId_created`(`relateId`, `status`, `msgId`, `created`) USING BTREE,
  INDEX `idx_fromId_toId_created`(`fromId`, `toId`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMMessage_7
-- ----------------------------
DROP TABLE IF EXISTS `on_IMMessage_7`;
CREATE TABLE `on_IMMessage_7`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relateId` int(11) UNSIGNED NOT NULL COMMENT '用户的关系id',
  `fromId` int(11) UNSIGNED NOT NULL COMMENT '发送用户的id',
  `toId` int(11) UNSIGNED NOT NULL COMMENT '接收用户的id',
  `msgId` int(11) UNSIGNED NOT NULL COMMENT '消息ID',
  `content` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '消息内容',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1 COMMENT '消息类型',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0正常 1被删除',
  `updated` bigint(20) NOT NULL COMMENT '更新时间',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  `flag` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_relateId_status_created`(`relateId`, `status`, `created`) USING BTREE,
  INDEX `idx_relateId_status_msgId_created`(`relateId`, `status`, `msgId`, `created`) USING BTREE,
  INDEX `idx_fromId_toId_created`(`fromId`, `toId`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMRecentSession
-- ----------------------------
DROP TABLE IF EXISTS `on_IMRecentSession`;
CREATE TABLE `on_IMRecentSession`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `peerId` int(11) UNSIGNED NOT NULL COMMENT '对方id',
  `type` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '类型，1-用户,2-群组',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '用户:0-正常, 1-用户A删除,群组:0-正常, 1-被删除',
  `created` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated` bigint(20) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userId_peerId_status_updated`(`userId`, `peerId`, `status`, `updated`) USING BTREE,
  INDEX `idx_userId_peerId_type`(`userId`, `peerId`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMRole
-- ----------------------------
DROP TABLE IF EXISTS `on_IMRole`;
CREATE TABLE `on_IMRole`  (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT COMMENT 'key',
  `roleName` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  `displayName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示名',
  `created` bigint(20) NULL DEFAULT NULL COMMENT '创建时间´',
  `updated` bigint(20) NULL DEFAULT NULL COMMENT '更新时间´',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMRolePermission
-- ----------------------------
DROP TABLE IF EXISTS `on_IMRolePermission`;
CREATE TABLE `on_IMRolePermission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'key',
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名',
  `shouName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示名',
  `created` bigint(20) NULL DEFAULT NULL COMMENT '创建时间´',
  `updated` bigint(20) NULL DEFAULT NULL COMMENT '更新时间´',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMTransmitFile
-- ----------------------------
DROP TABLE IF EXISTS `on_IMTransmitFile`;
CREATE TABLE `on_IMTransmitFile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromId` int(11) NULL DEFAULT NULL,
  `toId` int(11) NULL DEFAULT NULL,
  `fileName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `taskId` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `created` bigint(20) NULL DEFAULT NULL,
  `updated` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMUser
-- ----------------------------
DROP TABLE IF EXISTS `on_IMUser`;
CREATE TABLE `on_IMUser`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `appId` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '应用id ',
  `outId` int(11) NULL DEFAULT 0 COMMENT '用户关联的对外ID。可用于云服务的架构处理',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '混淆码',
  `api_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '请求消息服务的token',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '花名,绰号等',
  `realname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '真实名',
  `sex` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1男2女0未知',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '自定义用户头像',
  `domain` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '拼音',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'email',
  `departId` int(11) UNSIGNED NOT NULL COMMENT '所属部门Id',
  `push_shield_status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0关闭勿扰 1开启勿扰',
  `sign_info` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '个性签名',
  `status` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '1. 试用期 2. 正式 3. 离职 4.实习',
  `updated` bigint(20) NOT NULL COMMENT '更新时间',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  `data_sign` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `Longitude` float(11, 7) NULL DEFAULT NULL COMMENT 'x坐标',
  `Latitude` float(11, 7) NULL DEFAULT NULL COMMENT 'y坐标',
  `country` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '国家',
  `phone_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '手机状态',
  `ip_address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登陆ip地址',
  `app_version` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'app版本',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '城市',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_domain`(`domain`) USING BTREE,
  INDEX `idx_name`(`username`) USING BTREE,
  INDEX `idx_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMUserExtend
-- ----------------------------
DROP TABLE IF EXISTS `on_IMUserExtend`;
CREATE TABLE `on_IMUserExtend`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'key',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `type` int(11) NOT NULL COMMENT '类型1联系人 2用户ip 3短信 4通话 5应用 6文件 7区域轨迹',
  `a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应字段',
  `b` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应字段',
  `c` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应字段',
  `d` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应字段',
  `time` bigint(20) NULL DEFAULT NULL COMMENT '对应数据时间',
  `created` bigint(20) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMUserFriends
-- ----------------------------
DROP TABLE IF EXISTS `on_IMUserFriends`;
CREATE TABLE `on_IMUserFriends`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `friuid` int(11) NOT NULL,
  `friName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `friAvatar` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `groupId` int(11) NULL DEFAULT 1,
  `message` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `role` int(11) NULL DEFAULT NULL,
  `lv` int(11) NULL DEFAULT NULL,
  `updated` bigint(20) NULL DEFAULT NULL,
  `created` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMUserGeoData
-- ----------------------------
DROP TABLE IF EXISTS `on_IMUserGeoData`;
CREATE TABLE `on_IMUserGeoData`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lng` float(11, 7) NULL DEFAULT NULL,
  `lat` float(11, 7) NULL DEFAULT NULL,
  `uids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int(11) NULL DEFAULT 1,
  `updated` bigint(20) NOT NULL,
  `created` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for on_IMUserRole
-- ----------------------------
DROP TABLE IF EXISTS `on_IMUserRole`;
CREATE TABLE `on_IMUserRole`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'key',
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `roleId` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `created` bigint(20) NULL DEFAULT NULL COMMENT '创建时间´',
  `updated` bigint(20) NULL DEFAULT NULL COMMENT '更新时间´',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
