/*
 Navicat Premium Data Transfer

 Source Server         : apolloAdminDb
 Source Server Type    : MySQL
 Source Server Version : 50644
 Source Host           : 47.94.214.199:3306
 Source Schema         : ApolloPortalDB

 Target Server Type    : MySQL
 Target Server Version : 50644
 File Encoding         : 65001

 Date: 02/07/2019 18:33:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for App
-- ----------------------------
DROP TABLE IF EXISTS `App`;
CREATE TABLE `App`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Name`(`Name`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of App
-- ----------------------------
INSERT INTO `App` VALUES (1, 'ghost', 'ghost', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');

-- ----------------------------
-- Table structure for AppNamespace
-- ----------------------------
DROP TABLE IF EXISTS `AppNamespace`;
CREATE TABLE `AppNamespace`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppId`(`AppId`) USING BTREE,
  INDEX `Name_AppId`(`Name`, `AppId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用namespace定义' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of AppNamespace
-- ----------------------------
INSERT INTO `AppNamespace` VALUES (1, 'application', 'ghost', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `AppNamespace` VALUES (2, 'zuulconfig', 'ghost', 'properties', b'1', '', b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `AppNamespace` VALUES (3, 'tenants', 'ghost', 'properties', b'0', '', b'1', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 17:54:27');
INSERT INTO `AppNamespace` VALUES (4, 'tenants.yml', 'ghost', 'yml', b'0', '', b'1', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `AppNamespace` VALUES (5, 'tenants.yaml', 'ghost', 'yaml', b'0', '', b'1', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `AppNamespace` VALUES (6, 'tenants.yml', 'ghost', 'yml', b'0', '', b'0', 'apollo', '2019-06-26 18:54:09', 'apollo', '2019-06-26 18:54:09');
INSERT INTO `AppNamespace` VALUES (7, 'toolsconfig', 'ghost', 'properties', b'1', '', b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');

-- ----------------------------
-- Table structure for Authorities
-- ----------------------------
DROP TABLE IF EXISTS `Authorities`;
CREATE TABLE `Authorities`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Authority` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Authorities
-- ----------------------------
INSERT INTO `Authorities` VALUES (1, 'apollo', 'ROLE_user');

-- ----------------------------
-- Table structure for Consumer
-- ----------------------------
DROP TABLE IF EXISTS `Consumer`;
CREATE TABLE `Consumer`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '开放API消费者' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ConsumerAudit
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerAudit`;
CREATE TABLE `ConsumerAudit`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_ConsumerId`(`ConsumerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer审计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ConsumerRole
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerRole`;
CREATE TABLE `ConsumerRole`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_ConsumerId_RoleId`(`ConsumerId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer和role的绑定表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ConsumerToken
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerToken`;
CREATE TABLE `ConsumerToken`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime(0) NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_Token`(`Token`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer token表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Favorite
-- ----------------------------
DROP TABLE IF EXISTS `Favorite`;
CREATE TABLE `Favorite`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT 10000 COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `IX_UserId`(`UserId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用收藏表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Permission
-- ----------------------------
DROP TABLE IF EXISTS `Permission`;
CREATE TABLE `Permission`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_TargetId_PermissionType`(`TargetId`(191), `PermissionType`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'permission表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Permission
-- ----------------------------
INSERT INTO `Permission` VALUES (1, 'CreateNamespace', 'ghost', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `Permission` VALUES (2, 'CreateCluster', 'ghost', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `Permission` VALUES (3, 'AssignRole', 'ghost', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `Permission` VALUES (4, 'ModifyNamespace', 'ghost+application', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `Permission` VALUES (5, 'ReleaseNamespace', 'ghost+application', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `Permission` VALUES (6, 'ModifyNamespace', 'ghost+application+DEV', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `Permission` VALUES (7, 'ReleaseNamespace', 'ghost+application+DEV', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `Permission` VALUES (8, 'ModifyNamespace', 'ghost+zuulconfig', b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `Permission` VALUES (9, 'ReleaseNamespace', 'ghost+zuulconfig', b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `Permission` VALUES (10, 'ModifyNamespace', 'ghost+zuulconfig+DEV', b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `Permission` VALUES (11, 'ReleaseNamespace', 'ghost+zuulconfig+DEV', b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `Permission` VALUES (12, 'ModifyNamespace', 'ghost+tenants', b'1', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 17:54:27');
INSERT INTO `Permission` VALUES (13, 'ReleaseNamespace', 'ghost+tenants', b'1', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 17:54:27');
INSERT INTO `Permission` VALUES (14, 'ModifyNamespace', 'ghost+tenants+DEV', b'0', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 09:46:28');
INSERT INTO `Permission` VALUES (15, 'ReleaseNamespace', 'ghost+tenants+DEV', b'0', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 09:46:28');
INSERT INTO `Permission` VALUES (16, 'ModifyNamespace', 'ghost+tenants.yml', b'1', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Permission` VALUES (17, 'ReleaseNamespace', 'ghost+tenants.yml', b'1', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Permission` VALUES (18, 'ModifyNamespace', 'ghost+tenants.yml+DEV', b'0', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 17:53:14');
INSERT INTO `Permission` VALUES (19, 'ReleaseNamespace', 'ghost+tenants.yml+DEV', b'0', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 17:53:14');
INSERT INTO `Permission` VALUES (20, 'ModifyNamespace', 'ghost+tenants.yaml', b'1', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `Permission` VALUES (21, 'ReleaseNamespace', 'ghost+tenants.yaml', b'1', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `Permission` VALUES (22, 'ModifyNamespace', 'ghost+tenants.yaml+DEV', b'0', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:50:13');
INSERT INTO `Permission` VALUES (23, 'ReleaseNamespace', 'ghost+tenants.yaml+DEV', b'0', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:50:13');
INSERT INTO `Permission` VALUES (24, 'ModifyNamespace', 'ghost+tenants.yml', b'0', 'apollo', '2019-06-26 18:54:09', 'apollo', '2019-06-26 18:54:09');
INSERT INTO `Permission` VALUES (25, 'ReleaseNamespace', 'ghost+tenants.yml', b'0', 'apollo', '2019-06-26 18:54:09', 'apollo', '2019-06-26 18:54:09');
INSERT INTO `Permission` VALUES (26, 'ModifyNamespace', 'ghost+toolsconfig', b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');
INSERT INTO `Permission` VALUES (27, 'ReleaseNamespace', 'ghost+toolsconfig', b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');
INSERT INTO `Permission` VALUES (28, 'ModifyNamespace', 'ghost+toolsconfig+DEV', b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');
INSERT INTO `Permission` VALUES (29, 'ReleaseNamespace', 'ghost+toolsconfig+DEV', b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');

-- ----------------------------
-- Table structure for Role
-- ----------------------------
DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_RoleName`(`RoleName`(191)) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Role
-- ----------------------------
INSERT INTO `Role` VALUES (1, 'Master+ghost', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `Role` VALUES (2, 'ModifyNamespace+ghost+application', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `Role` VALUES (3, 'ReleaseNamespace+ghost+application', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `Role` VALUES (4, 'ModifyNamespace+ghost+application+DEV', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `Role` VALUES (5, 'ReleaseNamespace+ghost+application+DEV', b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `Role` VALUES (6, 'ModifyNamespace+ghost+zuulconfig', b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `Role` VALUES (7, 'ReleaseNamespace+ghost+zuulconfig', b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `Role` VALUES (8, 'ModifyNamespace+ghost+zuulconfig+DEV', b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `Role` VALUES (9, 'ReleaseNamespace+ghost+zuulconfig+DEV', b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `Role` VALUES (10, 'ModifyNamespace+ghost+tenants', b'1', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 17:54:27');
INSERT INTO `Role` VALUES (11, 'ReleaseNamespace+ghost+tenants', b'1', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 17:54:27');
INSERT INTO `Role` VALUES (12, 'ModifyNamespace+ghost+tenants+DEV', b'0', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 09:46:28');
INSERT INTO `Role` VALUES (13, 'ReleaseNamespace+ghost+tenants+DEV', b'0', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 09:46:28');
INSERT INTO `Role` VALUES (14, 'ModifyNamespace+ghost+tenants.yml', b'1', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Role` VALUES (15, 'ReleaseNamespace+ghost+tenants.yml', b'1', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Role` VALUES (16, 'ModifyNamespace+ghost+tenants.yml+DEV', b'0', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 17:53:14');
INSERT INTO `Role` VALUES (17, 'ReleaseNamespace+ghost+tenants.yml+DEV', b'0', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 17:53:14');
INSERT INTO `Role` VALUES (18, 'ModifyNamespace+ghost+tenants.yaml', b'1', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `Role` VALUES (19, 'ReleaseNamespace+ghost+tenants.yaml', b'1', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `Role` VALUES (20, 'ModifyNamespace+ghost+tenants.yaml+DEV', b'0', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:50:13');
INSERT INTO `Role` VALUES (21, 'ReleaseNamespace+ghost+tenants.yaml+DEV', b'0', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:50:13');
INSERT INTO `Role` VALUES (22, 'ModifyNamespace+ghost+tenants.yml', b'0', 'apollo', '2019-06-26 18:54:09', 'apollo', '2019-06-26 18:54:09');
INSERT INTO `Role` VALUES (23, 'ReleaseNamespace+ghost+tenants.yml', b'0', 'apollo', '2019-06-26 18:54:09', 'apollo', '2019-06-26 18:54:09');
INSERT INTO `Role` VALUES (24, 'ModifyNamespace+ghost+toolsconfig', b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');
INSERT INTO `Role` VALUES (25, 'ReleaseNamespace+ghost+toolsconfig', b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');
INSERT INTO `Role` VALUES (26, 'ModifyNamespace+ghost+toolsconfig+DEV', b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');
INSERT INTO `Role` VALUES (27, 'ReleaseNamespace+ghost+toolsconfig+DEV', b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');

-- ----------------------------
-- Table structure for RolePermission
-- ----------------------------
DROP TABLE IF EXISTS `RolePermission`;
CREATE TABLE `RolePermission`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_PermissionId`(`PermissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和权限的绑定表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of RolePermission
-- ----------------------------
INSERT INTO `RolePermission` VALUES (1, 1, 1, b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `RolePermission` VALUES (2, 1, 2, b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `RolePermission` VALUES (3, 1, 3, b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `RolePermission` VALUES (4, 2, 4, b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `RolePermission` VALUES (5, 3, 5, b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `RolePermission` VALUES (6, 4, 6, b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `RolePermission` VALUES (7, 5, 7, b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `RolePermission` VALUES (8, 6, 8, b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `RolePermission` VALUES (9, 7, 9, b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `RolePermission` VALUES (10, 8, 10, b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `RolePermission` VALUES (11, 9, 11, b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `RolePermission` VALUES (12, 10, 12, b'1', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 17:54:27');
INSERT INTO `RolePermission` VALUES (13, 11, 13, b'1', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 17:54:27');
INSERT INTO `RolePermission` VALUES (14, 12, 14, b'0', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 09:46:28');
INSERT INTO `RolePermission` VALUES (15, 13, 15, b'0', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 09:46:28');
INSERT INTO `RolePermission` VALUES (16, 14, 16, b'1', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `RolePermission` VALUES (17, 15, 17, b'1', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `RolePermission` VALUES (18, 16, 18, b'0', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 17:53:14');
INSERT INTO `RolePermission` VALUES (19, 17, 19, b'0', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 17:53:14');
INSERT INTO `RolePermission` VALUES (20, 18, 20, b'1', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `RolePermission` VALUES (21, 19, 21, b'1', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `RolePermission` VALUES (22, 20, 22, b'0', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:50:13');
INSERT INTO `RolePermission` VALUES (23, 21, 23, b'0', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:50:13');
INSERT INTO `RolePermission` VALUES (24, 22, 24, b'0', 'apollo', '2019-06-26 18:54:09', 'apollo', '2019-06-26 18:54:09');
INSERT INTO `RolePermission` VALUES (25, 23, 25, b'0', 'apollo', '2019-06-26 18:54:09', 'apollo', '2019-06-26 18:54:09');
INSERT INTO `RolePermission` VALUES (26, 24, 26, b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');
INSERT INTO `RolePermission` VALUES (27, 25, 27, b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');
INSERT INTO `RolePermission` VALUES (28, 26, 28, b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');
INSERT INTO `RolePermission` VALUES (29, 27, 29, b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Key`(`Key`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置服务自身配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
INSERT INTO `ServerConfig` VALUES (1, 'apollo.portal.envs', 'dev', '可支持的环境列表', b'0', 'default', '2019-06-25 22:08:28', '', '2019-06-25 22:08:28');
INSERT INTO `ServerConfig` VALUES (2, 'organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]', '部门列表', b'0', 'default', '2019-06-25 22:08:28', '', '2019-06-25 22:08:28');
INSERT INTO `ServerConfig` VALUES (3, 'superAdmin', 'apollo', 'Portal超级管理员', b'0', 'default', '2019-06-25 22:08:28', '', '2019-06-25 22:08:28');
INSERT INTO `ServerConfig` VALUES (4, 'api.readTimeout', '10000', 'http接口read timeout', b'0', 'default', '2019-06-25 22:08:28', '', '2019-06-25 22:08:28');
INSERT INTO `ServerConfig` VALUES (5, 'consumer.token.salt', 'someSalt', 'consumer token salt', b'0', 'default', '2019-06-25 22:08:28', '', '2019-06-25 22:08:28');
INSERT INTO `ServerConfig` VALUES (6, 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', b'0', 'default', '2019-06-25 22:08:28', '', '2019-06-25 22:08:28');
INSERT INTO `ServerConfig` VALUES (7, 'configView.memberOnly.envs', 'pro', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', b'0', 'default', '2019-06-25 22:08:28', '', '2019-06-25 22:08:28');

-- ----------------------------
-- Table structure for UserRole
-- ----------------------------
DROP TABLE IF EXISTS `UserRole`;
CREATE TABLE `UserRole`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_UserId_RoleId`(`UserId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和role的绑定表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of UserRole
-- ----------------------------
INSERT INTO `UserRole` VALUES (1, 'apollo', 1, b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `UserRole` VALUES (2, 'apollo', 2, b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `UserRole` VALUES (3, 'apollo', 3, b'0', 'apollo', '2019-06-25 22:09:24', 'apollo', '2019-06-25 22:09:24');
INSERT INTO `UserRole` VALUES (4, 'apollo', 6, b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `UserRole` VALUES (5, 'apollo', 7, b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `UserRole` VALUES (6, 'apollo', 10, b'1', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 17:54:27');
INSERT INTO `UserRole` VALUES (7, 'apollo', 11, b'1', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 17:54:27');
INSERT INTO `UserRole` VALUES (8, 'apollo', 14, b'1', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `UserRole` VALUES (9, 'apollo', 15, b'1', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `UserRole` VALUES (10, 'apollo', 18, b'1', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `UserRole` VALUES (11, 'apollo', 19, b'1', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `UserRole` VALUES (12, 'apollo', 22, b'0', 'apollo', '2019-06-26 18:54:09', 'apollo', '2019-06-26 18:54:09');
INSERT INTO `UserRole` VALUES (13, 'apollo', 23, b'0', 'apollo', '2019-06-26 18:54:09', 'apollo', '2019-06-26 18:54:09');
INSERT INTO `UserRole` VALUES (14, 'apollo', 24, b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');
INSERT INTO `UserRole` VALUES (15, 'apollo', 25, b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) NULL DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Users
-- ----------------------------
INSERT INTO `Users` VALUES (1, 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', 1);

SET FOREIGN_KEY_CHECKS = 1;
