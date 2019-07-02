/*
 Navicat Premium Data Transfer

 Source Server         : ApolloConfigDB
 Source Server Type    : MySQL
 Source Server Version : 50644
 Source Host           : 47.94.214.199:3306
 Source Schema         : ApolloConfigDB

 Target Server Type    : MySQL
 Target Server Version : 50644
 File Encoding         : 65001

 Date: 02/07/2019 18:34:39
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
INSERT INTO `AppNamespace` VALUES (1, 'application', 'ghost', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2019-06-26 09:45:51', 'apollo', '2019-06-26 09:45:51');
INSERT INTO `AppNamespace` VALUES (2, 'zuulconfig', 'ghost', 'properties', b'1', '', b'0', 'apollo', '2019-06-26 09:46:09', 'apollo', '2019-06-26 09:46:09');
INSERT INTO `AppNamespace` VALUES (3, 'tenants', 'ghost', 'properties', b'0', '', b'1', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 17:54:27');
INSERT INTO `AppNamespace` VALUES (4, 'tenants.yml', 'ghost', 'yml', b'0', '', b'1', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `AppNamespace` VALUES (5, 'tenants.yaml', 'ghost', 'yaml', b'0', '', b'1', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `AppNamespace` VALUES (6, 'tenants.yml', 'ghost', 'yml', b'0', '', b'0', 'apollo', '2019-06-26 18:54:09', 'apollo', '2019-06-26 18:54:09');
INSERT INTO `AppNamespace` VALUES (7, 'toolsconfig', 'ghost', 'properties', b'1', '', b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');

-- ----------------------------
-- Table structure for Audit
-- ----------------------------
DROP TABLE IF EXISTS `Audit`;
CREATE TABLE `Audit`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `EntityName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '表名',
  `EntityId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '记录ID',
  `OpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '操作类型',
  `Comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志审计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Audit
-- ----------------------------
INSERT INTO `Audit` VALUES (1, 'App', 1, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 09:45:51', NULL, '2019-06-26 09:45:51');
INSERT INTO `Audit` VALUES (2, 'AppNamespace', 1, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 09:45:51', NULL, '2019-06-26 09:45:51');
INSERT INTO `Audit` VALUES (3, 'Cluster', 1, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 09:45:51', NULL, '2019-06-26 09:45:51');
INSERT INTO `Audit` VALUES (4, 'Namespace', 1, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 09:45:51', NULL, '2019-06-26 09:45:51');
INSERT INTO `Audit` VALUES (5, 'Namespace', 2, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 09:46:10', NULL, '2019-06-26 09:46:10');
INSERT INTO `Audit` VALUES (6, 'AppNamespace', 2, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 09:46:10', NULL, '2019-06-26 09:46:10');
INSERT INTO `Audit` VALUES (7, 'Namespace', 3, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 09:46:28', NULL, '2019-06-26 09:46:28');
INSERT INTO `Audit` VALUES (8, 'AppNamespace', 3, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 09:46:28', NULL, '2019-06-26 09:46:28');
INSERT INTO `Audit` VALUES (9, 'Namespace', 3, 'DELETE', NULL, b'0', 'apollo', '2019-06-26 17:53:01', NULL, '2019-06-26 17:53:01');
INSERT INTO `Audit` VALUES (10, 'Namespace', 4, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 17:53:14', NULL, '2019-06-26 17:53:14');
INSERT INTO `Audit` VALUES (11, 'AppNamespace', 4, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 17:53:14', NULL, '2019-06-26 17:53:14');
INSERT INTO `Audit` VALUES (12, 'Namespace', 5, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 17:53:20', NULL, '2019-06-26 17:53:20');
INSERT INTO `Audit` VALUES (13, 'Namespace', 5, 'DELETE', NULL, b'0', 'apollo', '2019-06-26 17:54:27', NULL, '2019-06-26 17:54:27');
INSERT INTO `Audit` VALUES (14, 'Item', 1, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 17:56:02', NULL, '2019-06-26 17:56:02');
INSERT INTO `Audit` VALUES (15, 'Item', 2, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 17:56:02', NULL, '2019-06-26 17:56:02');
INSERT INTO `Audit` VALUES (16, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 17:56:02', NULL, '2019-06-26 17:56:02');
INSERT INTO `Audit` VALUES (17, 'Release', 1, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 17:56:06', NULL, '2019-06-26 17:56:06');
INSERT INTO `Audit` VALUES (18, 'ReleaseHistory', 1, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 17:56:06', NULL, '2019-06-26 17:56:06');
INSERT INTO `Audit` VALUES (19, 'Item', 3, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 17:57:51', NULL, '2019-06-26 17:57:51');
INSERT INTO `Audit` VALUES (20, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 17:57:51', NULL, '2019-06-26 17:57:51');
INSERT INTO `Audit` VALUES (21, 'Release', 2, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 17:57:54', NULL, '2019-06-26 17:57:54');
INSERT INTO `Audit` VALUES (22, 'ReleaseHistory', 2, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 17:57:54', NULL, '2019-06-26 17:57:54');
INSERT INTO `Audit` VALUES (23, 'Release', 3, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:00:20', NULL, '2019-06-26 18:00:20');
INSERT INTO `Audit` VALUES (24, 'ReleaseHistory', 3, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:00:20', NULL, '2019-06-26 18:00:20');
INSERT INTO `Audit` VALUES (25, 'Item', 4, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:26:10', NULL, '2019-06-26 18:26:10');
INSERT INTO `Audit` VALUES (26, 'Item', 5, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:26:10', NULL, '2019-06-26 18:26:10');
INSERT INTO `Audit` VALUES (27, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:26:10', NULL, '2019-06-26 18:26:10');
INSERT INTO `Audit` VALUES (28, 'Item', 1, 'DELETE', NULL, b'0', 'apollo', '2019-06-26 18:26:10', NULL, '2019-06-26 18:26:10');
INSERT INTO `Audit` VALUES (29, 'Item', 2, 'DELETE', NULL, b'0', 'apollo', '2019-06-26 18:26:10', NULL, '2019-06-26 18:26:10');
INSERT INTO `Audit` VALUES (30, 'ItemSet', NULL, 'DELETE', NULL, b'0', 'apollo', '2019-06-26 18:26:10', NULL, '2019-06-26 18:26:10');
INSERT INTO `Audit` VALUES (31, 'Release', 4, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:26:13', NULL, '2019-06-26 18:26:13');
INSERT INTO `Audit` VALUES (32, 'ReleaseHistory', 4, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:26:13', NULL, '2019-06-26 18:26:13');
INSERT INTO `Audit` VALUES (33, 'Item', 3, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 18:29:48', NULL, '2019-06-26 18:29:48');
INSERT INTO `Audit` VALUES (34, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 18:29:48', NULL, '2019-06-26 18:29:48');
INSERT INTO `Audit` VALUES (35, 'Release', 5, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:29:51', NULL, '2019-06-26 18:29:51');
INSERT INTO `Audit` VALUES (36, 'ReleaseHistory', 5, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:29:51', NULL, '2019-06-26 18:29:51');
INSERT INTO `Audit` VALUES (37, 'Item', 3, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 18:44:06', NULL, '2019-06-26 18:44:06');
INSERT INTO `Audit` VALUES (38, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 18:44:06', NULL, '2019-06-26 18:44:06');
INSERT INTO `Audit` VALUES (39, 'Release', 6, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:44:08', NULL, '2019-06-26 18:44:08');
INSERT INTO `Audit` VALUES (40, 'ReleaseHistory', 6, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:44:08', NULL, '2019-06-26 18:44:08');
INSERT INTO `Audit` VALUES (41, 'Item', 3, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 18:46:02', NULL, '2019-06-26 18:46:02');
INSERT INTO `Audit` VALUES (42, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 18:46:02', NULL, '2019-06-26 18:46:02');
INSERT INTO `Audit` VALUES (43, 'Release', 7, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:46:04', NULL, '2019-06-26 18:46:04');
INSERT INTO `Audit` VALUES (44, 'ReleaseHistory', 7, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:46:04', NULL, '2019-06-26 18:46:04');
INSERT INTO `Audit` VALUES (45, 'Item', 3, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 18:47:19', NULL, '2019-06-26 18:47:19');
INSERT INTO `Audit` VALUES (46, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 18:47:19', NULL, '2019-06-26 18:47:19');
INSERT INTO `Audit` VALUES (47, 'Release', 8, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:47:22', NULL, '2019-06-26 18:47:22');
INSERT INTO `Audit` VALUES (48, 'ReleaseHistory', 8, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:47:22', NULL, '2019-06-26 18:47:22');
INSERT INTO `Audit` VALUES (49, 'Namespace', 4, 'DELETE', NULL, b'0', 'apollo', '2019-06-26 18:49:49', NULL, '2019-06-26 18:49:49');
INSERT INTO `Audit` VALUES (50, 'Namespace', 6, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:50:13', NULL, '2019-06-26 18:50:13');
INSERT INTO `Audit` VALUES (51, 'AppNamespace', 5, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:50:13', NULL, '2019-06-26 18:50:13');
INSERT INTO `Audit` VALUES (52, 'Item', 6, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:50:31', NULL, '2019-06-26 18:50:31');
INSERT INTO `Audit` VALUES (53, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:50:31', NULL, '2019-06-26 18:50:31');
INSERT INTO `Audit` VALUES (54, 'Release', 9, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:50:33', NULL, '2019-06-26 18:50:33');
INSERT INTO `Audit` VALUES (55, 'ReleaseHistory', 9, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:50:33', NULL, '2019-06-26 18:50:33');
INSERT INTO `Audit` VALUES (56, 'Namespace', 6, 'DELETE', NULL, b'0', 'apollo', '2019-06-26 18:53:47', NULL, '2019-06-26 18:53:47');
INSERT INTO `Audit` VALUES (57, 'Namespace', 7, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:54:09', NULL, '2019-06-26 18:54:09');
INSERT INTO `Audit` VALUES (58, 'AppNamespace', 6, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:54:09', NULL, '2019-06-26 18:54:09');
INSERT INTO `Audit` VALUES (59, 'Item', 7, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:54:35', NULL, '2019-06-26 18:54:35');
INSERT INTO `Audit` VALUES (60, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:54:35', NULL, '2019-06-26 18:54:35');
INSERT INTO `Audit` VALUES (61, 'Release', 10, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:54:37', NULL, '2019-06-26 18:54:37');
INSERT INTO `Audit` VALUES (62, 'ReleaseHistory', 10, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:54:37', NULL, '2019-06-26 18:54:37');
INSERT INTO `Audit` VALUES (63, 'Item', 7, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 18:57:37', NULL, '2019-06-26 18:57:37');
INSERT INTO `Audit` VALUES (64, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 18:57:37', NULL, '2019-06-26 18:57:37');
INSERT INTO `Audit` VALUES (65, 'Release', 11, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:57:39', NULL, '2019-06-26 18:57:39');
INSERT INTO `Audit` VALUES (66, 'ReleaseHistory', 11, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:57:39', NULL, '2019-06-26 18:57:39');
INSERT INTO `Audit` VALUES (67, 'Item', 7, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 18:58:36', NULL, '2019-06-26 18:58:36');
INSERT INTO `Audit` VALUES (68, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 18:58:36', NULL, '2019-06-26 18:58:36');
INSERT INTO `Audit` VALUES (69, 'Release', 12, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:58:38', NULL, '2019-06-26 18:58:38');
INSERT INTO `Audit` VALUES (70, 'ReleaseHistory', 12, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 18:58:38', NULL, '2019-06-26 18:58:38');
INSERT INTO `Audit` VALUES (71, 'Item', 7, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 19:02:20', NULL, '2019-06-26 19:02:20');
INSERT INTO `Audit` VALUES (72, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 19:02:20', NULL, '2019-06-26 19:02:20');
INSERT INTO `Audit` VALUES (73, 'Release', 13, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:02:22', NULL, '2019-06-26 19:02:22');
INSERT INTO `Audit` VALUES (74, 'ReleaseHistory', 13, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:02:22', NULL, '2019-06-26 19:02:22');
INSERT INTO `Audit` VALUES (75, 'Item', 7, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 19:06:04', NULL, '2019-06-26 19:06:04');
INSERT INTO `Audit` VALUES (76, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 19:06:04', NULL, '2019-06-26 19:06:04');
INSERT INTO `Audit` VALUES (77, 'Release', 14, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:06:07', NULL, '2019-06-26 19:06:07');
INSERT INTO `Audit` VALUES (78, 'ReleaseHistory', 14, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:06:07', NULL, '2019-06-26 19:06:07');
INSERT INTO `Audit` VALUES (79, 'Item', 8, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:08:53', NULL, '2019-06-26 19:08:53');
INSERT INTO `Audit` VALUES (80, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:08:53', NULL, '2019-06-26 19:08:53');
INSERT INTO `Audit` VALUES (81, 'Release', 15, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:08:56', NULL, '2019-06-26 19:08:56');
INSERT INTO `Audit` VALUES (82, 'ReleaseHistory', 15, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:08:56', NULL, '2019-06-26 19:08:56');
INSERT INTO `Audit` VALUES (83, 'Item', 8, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 19:11:43', NULL, '2019-06-26 19:11:43');
INSERT INTO `Audit` VALUES (84, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 19:11:43', NULL, '2019-06-26 19:11:43');
INSERT INTO `Audit` VALUES (85, 'Release', 16, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:11:45', NULL, '2019-06-26 19:11:45');
INSERT INTO `Audit` VALUES (86, 'ReleaseHistory', 16, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:11:45', NULL, '2019-06-26 19:11:45');
INSERT INTO `Audit` VALUES (87, 'Item', 9, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:12:36', NULL, '2019-06-26 19:12:36');
INSERT INTO `Audit` VALUES (88, 'Release', 17, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:12:39', NULL, '2019-06-26 19:12:39');
INSERT INTO `Audit` VALUES (89, 'ReleaseHistory', 17, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:12:39', NULL, '2019-06-26 19:12:39');
INSERT INTO `Audit` VALUES (90, 'Namespace', 8, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:15:53', NULL, '2019-06-26 19:15:53');
INSERT INTO `Audit` VALUES (91, 'AppNamespace', 7, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:15:53', NULL, '2019-06-26 19:15:53');
INSERT INTO `Audit` VALUES (92, 'Item', 10, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:16:13', NULL, '2019-06-26 19:16:13');
INSERT INTO `Audit` VALUES (93, 'Release', 18, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:16:15', NULL, '2019-06-26 19:16:15');
INSERT INTO `Audit` VALUES (94, 'ReleaseHistory', 18, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:16:15', NULL, '2019-06-26 19:16:15');
INSERT INTO `Audit` VALUES (95, 'Item', 9, 'DELETE', NULL, b'0', 'apollo', '2019-06-26 19:16:27', NULL, '2019-06-26 19:16:27');
INSERT INTO `Audit` VALUES (96, 'Item', 8, 'DELETE', NULL, b'0', 'apollo', '2019-06-26 19:16:31', NULL, '2019-06-26 19:16:31');
INSERT INTO `Audit` VALUES (97, 'Release', 19, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:16:33', NULL, '2019-06-26 19:16:33');
INSERT INTO `Audit` VALUES (98, 'ReleaseHistory', 19, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:16:33', NULL, '2019-06-26 19:16:33');
INSERT INTO `Audit` VALUES (99, 'ReleaseHistory', 20, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:19:15', NULL, '2019-06-26 19:19:15');
INSERT INTO `Audit` VALUES (100, 'Release', 20, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:19:18', NULL, '2019-06-26 19:19:18');
INSERT INTO `Audit` VALUES (101, 'ReleaseHistory', 21, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:19:18', NULL, '2019-06-26 19:19:18');
INSERT INTO `Audit` VALUES (102, 'ReleaseHistory', 22, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:19:29', NULL, '2019-06-26 19:19:29');
INSERT INTO `Audit` VALUES (103, 'Release', 21, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:20:21', NULL, '2019-06-26 19:20:21');
INSERT INTO `Audit` VALUES (104, 'ReleaseHistory', 23, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:20:21', NULL, '2019-06-26 19:20:21');
INSERT INTO `Audit` VALUES (105, 'Item', 11, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:20:25', NULL, '2019-06-26 19:20:25');
INSERT INTO `Audit` VALUES (106, 'Item', 11, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 19:20:35', NULL, '2019-06-26 19:20:35');
INSERT INTO `Audit` VALUES (107, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 19:20:35', NULL, '2019-06-26 19:20:35');
INSERT INTO `Audit` VALUES (108, 'Release', 22, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:20:39', NULL, '2019-06-26 19:20:39');
INSERT INTO `Audit` VALUES (109, 'ReleaseHistory', 24, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:20:39', NULL, '2019-06-26 19:20:39');
INSERT INTO `Audit` VALUES (110, 'Item', 11, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 19:22:34', NULL, '2019-06-26 19:22:34');
INSERT INTO `Audit` VALUES (111, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-06-26 19:22:34', NULL, '2019-06-26 19:22:34');
INSERT INTO `Audit` VALUES (112, 'Release', 23, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:22:36', NULL, '2019-06-26 19:22:36');
INSERT INTO `Audit` VALUES (113, 'ReleaseHistory', 25, 'INSERT', NULL, b'0', 'apollo', '2019-06-26 19:22:36', NULL, '2019-06-26 19:22:36');
INSERT INTO `Audit` VALUES (114, 'Item', 7, 'UPDATE', NULL, b'0', 'apollo', '2019-07-01 12:12:33', NULL, '2019-07-01 12:12:33');
INSERT INTO `Audit` VALUES (115, 'ItemSet', NULL, 'UPDATE', NULL, b'0', 'apollo', '2019-07-01 12:12:33', NULL, '2019-07-01 12:12:33');
INSERT INTO `Audit` VALUES (116, 'Release', 24, 'INSERT', NULL, b'0', 'apollo', '2019-07-01 12:12:35', NULL, '2019-07-01 12:12:35');
INSERT INTO `Audit` VALUES (117, 'ReleaseHistory', 26, 'INSERT', NULL, b'0', 'apollo', '2019-07-01 12:12:35', NULL, '2019-07-01 12:12:35');

-- ----------------------------
-- Table structure for Cluster
-- ----------------------------
DROP TABLE IF EXISTS `Cluster`;
CREATE TABLE `Cluster`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '集群名字',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'App id',
  `ParentClusterId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父cluster',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppId_Name`(`AppId`, `Name`) USING BTREE,
  INDEX `IX_ParentClusterId`(`ParentClusterId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '集群' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Cluster
-- ----------------------------
INSERT INTO `Cluster` VALUES (1, 'default', 'ghost', 0, b'0', 'apollo', '2019-06-26 09:45:51', 'apollo', '2019-06-26 09:45:51');

-- ----------------------------
-- Table structure for Commit
-- ----------------------------
DROP TABLE IF EXISTS `Commit`;
CREATE TABLE `Commit`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ChangeSets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '修改变更集',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `ClusterName`(`ClusterName`(191)) USING BTREE,
  INDEX `NamespaceName`(`NamespaceName`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'commit 历史表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Commit
-- ----------------------------
INSERT INTO `Commit` VALUES (1, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"zuul.routes.users.path\",\"value\":\"/**\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:56:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 17:56:02\"},{\"namespaceId\":2,\"key\":\"zuul.routes.users.url\",\"value\":\"https://www.baidu.com\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:56:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 17:56:02\"}],\"updateItems\":[],\"deleteItems\":[]}', 'ghost', 'default', 'zuulconfig', NULL, b'0', 'apollo', '2019-06-26 17:56:02', 'apollo', '2019-06-26 17:56:02');
INSERT INTO `Commit` VALUES (2, '{\"createItems\":[{\"namespaceId\":4,\"key\":\"content\",\"value\":\"tenantconfig:\\n  tenantCount:1\\n  orgCodeHeader: tenantId  \\n  general:\\n    maxPoolSize: 10\\n    minIdle: 3\\n    defaultTenant : account\\n  tenants:\\n    -jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:57:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 17:57:51\"}],\"updateItems\":[],\"deleteItems\":[]}', 'ghost', 'default', 'tenants.yml', NULL, b'1', 'apollo', '2019-06-26 17:57:51', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Commit` VALUES (3, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"zuul.routes.account.path\",\"value\":\"/business/**\",\"comment\":\"\",\"lineNum\":1,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:26:10\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:26:10\"},{\"namespaceId\":2,\"key\":\"zuul.routes.account.serviceId\",\"value\":\"account\",\"comment\":\"\",\"lineNum\":2,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:26:10\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:26:10\"}],\"updateItems\":[],\"deleteItems\":[{\"namespaceId\":2,\"key\":\"zuul.routes.users.path\",\"value\":\"/**\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:56:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:26:10\"},{\"namespaceId\":2,\"key\":\"zuul.routes.users.url\",\"value\":\"https://www.baidu.com\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:56:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:26:10\"}]}', 'ghost', 'default', 'zuulconfig', NULL, b'0', 'apollo', '2019-06-26 18:26:10', 'apollo', '2019-06-26 18:26:10');
INSERT INTO `Commit` VALUES (4, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":4,\"key\":\"content\",\"value\":\"tenantconfig:\\n  tenantCount:1\\n  orgCodeHeader: tenantId  \\n  general:\\n    maxPoolSize: 10\\n    minIdle: 3\\n    defaultTenant : account\\n  tenants:\\n    -jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:57:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 17:57:51\"},\"newItem\":{\"namespaceId\":4,\"key\":\"content\",\"value\":\"tenantconfig:\\n  tenantCount:1\\n  tenantId: tenantName  \\n  general:\\n    maxPoolSize: 10\\n    minIdle: 3\\n    defaultTenant : account\\n  tenants:\\n    -jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:57:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:29:48\"}}],\"deleteItems\":[]}', 'ghost', 'default', 'tenants.yml', NULL, b'1', 'apollo', '2019-06-26 18:29:48', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Commit` VALUES (5, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":4,\"key\":\"content\",\"value\":\"tenantconfig:\\n  tenantCount:1\\n  tenantId: tenantName  \\n  general:\\n    maxPoolSize: 10\\n    minIdle: 3\\n    defaultTenant : account\\n  tenants:\\n    -jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:57:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:29:48\"},\"newItem\":{\"namespaceId\":4,\"key\":\"content\",\"value\":\"tenantconfig:\\n  tenantCount:5\\n  tenantId: tenantName  \\n  general:\\n    maxPoolSize: 10\\n    minIdle: 3\\n    defaultTenant : account\\n  tenants:\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:57:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:44:05\"}}],\"deleteItems\":[]}', 'ghost', 'default', 'tenants.yml', NULL, b'1', 'apollo', '2019-06-26 18:44:06', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Commit` VALUES (6, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":4,\"key\":\"content\",\"value\":\"tenantconfig:\\n  tenantCount:5\\n  tenantId: tenantName  \\n  general:\\n    maxPoolSize: 10\\n    minIdle: 3\\n    defaultTenant : account\\n  tenants:\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:57:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:44:06\"},\"newItem\":{\"namespaceId\":4,\"key\":\"content\",\"value\":\"tenantconfig:\\n  tenantCount:5\\n  tenantId:tenantName  \\n  general:\\n    maxPoolSize: 10\\n    minIdle: 3\\n    defaultTenant : account\\n  tenants:\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:57:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:46:01\"}}],\"deleteItems\":[]}', 'ghost', 'default', 'tenants.yml', NULL, b'1', 'apollo', '2019-06-26 18:46:02', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Commit` VALUES (7, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":4,\"key\":\"content\",\"value\":\"tenantconfig:\\n  tenantCount:5\\n  tenantId:tenantName  \\n  general:\\n    maxPoolSize: 10\\n    minIdle: 3\\n    defaultTenant : account\\n  tenants:\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:57:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:46:02\"},\"newItem\":{\"namespaceId\":4,\"key\":\"content\",\"value\":\"tenantconfig:\\n  tenantCount:5\\n  tenantId:tenantName  \\n  general:\\n    maxPoolSize:10\\n    minIdle:3\\n    defaultTenant:account\\n  tenants:\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 17:57:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:47:19\"}}],\"deleteItems\":[]}', 'ghost', 'default', 'tenants.yml', NULL, b'1', 'apollo', '2019-06-26 18:47:19', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Commit` VALUES (8, '{\"createItems\":[{\"namespaceId\":6,\"key\":\"content\",\"value\":\"tenantconfig:\\r\\n  tenantCount:5\\r\\n  tenantId:tenantName  \\r\\n  general:\\r\\n    maxPoolSize:10\\r\\n    minIdle:3\\r\\n    defaultTenant:account\\r\\n  tenants:\\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":6,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:50:30\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:50:31\"}],\"updateItems\":[],\"deleteItems\":[]}', 'ghost', 'default', 'tenants.yaml', NULL, b'1', 'apollo', '2019-06-26 18:50:31', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `Commit` VALUES (9, '{\"createItems\":[{\"namespaceId\":7,\"key\":\"content\",\"value\":\"tenantconfig:\\r\\n  tenantCount:5\\r\\n  tenantId:tenantName\\r\\n  general:\\r\\n    maxPoolSize:10\\r\\n    minIdle:3\\r\\n    defaultTenant:account\\r\\n  tenants:\\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:54:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:54:35\"}],\"updateItems\":[],\"deleteItems\":[]}', 'ghost', 'default', 'tenants.yml', NULL, b'0', 'apollo', '2019-06-26 18:54:35', 'apollo', '2019-06-26 18:54:35');
INSERT INTO `Commit` VALUES (10, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":7,\"key\":\"content\",\"value\":\"tenantconfig:\\r\\n  tenantCount:5\\r\\n  tenantId:tenantName\\r\\n  general:\\r\\n    maxPoolSize:10\\r\\n    minIdle:3\\r\\n    defaultTenant:account\\r\\n  tenants:\\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:54:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:54:35\"},\"newItem\":{\"namespaceId\":7,\"key\":\"content\",\"value\":\"tenantconfig:\\r\\n  tenantCount:5\\r\\n  tenantId:3\\r\\n  general:\\r\\n    maxPoolSize:10\\r\\n    minIdle:3\\r\\n    defaultTenant:account\\r\\n  tenants:\\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:54:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:57:37\"}}],\"deleteItems\":[]}', 'ghost', 'default', 'tenants.yml', NULL, b'0', 'apollo', '2019-06-26 18:57:37', 'apollo', '2019-06-26 18:57:37');
INSERT INTO `Commit` VALUES (11, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":7,\"key\":\"content\",\"value\":\"tenantconfig:\\r\\n  tenantCount:5\\r\\n  tenantId:3\\r\\n  general:\\r\\n    maxPoolSize:10\\r\\n    minIdle:3\\r\\n    defaultTenant:account\\r\\n  tenants:\\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:54:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:57:37\"},\"newItem\":{\"namespaceId\":7,\"key\":\"content\",\"value\":\"tenantconfig:\\r\\n  general:\\r\\n    maxPoolSize:10\\r\\n    minIdle:3\\r\\n    defaultTenant:account\\r\\n  tenantCount:5\\r\\n  tenantId:3\\r\\n  tenants:\\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:54:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:58:35\"}}],\"deleteItems\":[]}', 'ghost', 'default', 'tenants.yml', NULL, b'0', 'apollo', '2019-06-26 18:58:36', 'apollo', '2019-06-26 18:58:36');
INSERT INTO `Commit` VALUES (12, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":7,\"key\":\"content\",\"value\":\"tenantconfig:\\r\\n  general:\\r\\n    maxPoolSize:10\\r\\n    minIdle:3\\r\\n    defaultTenant:account\\r\\n  tenantCount:5\\r\\n  tenantId:3\\r\\n  tenants:\\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:54:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 18:58:36\"},\"newItem\":{\"namespaceId\":7,\"key\":\"content\",\"value\":\"tenantconfig:\\r\\n  general:\\r\\n    maxPoolSize: 10\\r\\n    minIdle: 3\\r\\n    defaultTenant: account\\r\\n  tenantCount: 5\\r\\n  tenantId: 3\\r\\n  tenants: \\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:54:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:02:20\"}}],\"deleteItems\":[]}', 'ghost', 'default', 'tenants.yml', NULL, b'0', 'apollo', '2019-06-26 19:02:20', 'apollo', '2019-06-26 19:02:20');
INSERT INTO `Commit` VALUES (13, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":7,\"key\":\"content\",\"value\":\"tenantconfig:\\r\\n  general:\\r\\n    maxPoolSize: 10\\r\\n    minIdle: 3\\r\\n    defaultTenant: account\\r\\n  tenantCount: 5\\r\\n  tenantId: 3\\r\\n  tenants: \\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\",\"lineNum\":1,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:54:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:02:20\"},\"newItem\":{\"namespaceId\":7,\"key\":\"content\",\"value\":\"tenantconfig:\\r\\n  general:\\r\\n    maxPoolSize: 10\\r\\n    minIdle: 3\\r\\n    defaultTenant: account\\r\\n  tenantCount: 5\\r\\n  tenantId: 3\\r\\n  tenants: \\r\\n    - jdbc:mysql://47.94.214.199:3306/newim,account,newim,zwy0410\",\"lineNum\":1,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:54:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:06:04\"}}],\"deleteItems\":[]}', 'ghost', 'default', 'tenants.yml', NULL, b'0', 'apollo', '2019-06-26 19:06:04', 'apollo', '2019-06-26 19:06:04');
INSERT INTO `Commit` VALUES (14, '{\"createItems\":[{\"namespaceId\":1,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"http://host:47.94.214.1999001/eureka/\",\"comment\":\"\",\"lineNum\":1,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 19:08:53\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:08:53\"}],\"updateItems\":[],\"deleteItems\":[]}', 'ghost', 'default', 'application', NULL, b'0', 'apollo', '2019-06-26 19:08:53', 'apollo', '2019-06-26 19:08:53');
INSERT INTO `Commit` VALUES (15, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"http://host:47.94.214.1999001/eureka/\",\"comment\":\"\",\"lineNum\":1,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 19:08:53\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:08:53\"},\"newItem\":{\"namespaceId\":1,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"http://47.94.214.1999001/eureka/\",\"comment\":\"\",\"lineNum\":1,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 19:08:53\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:11:42\"}}],\"deleteItems\":[]}', 'ghost', 'default', 'application', NULL, b'0', 'apollo', '2019-06-26 19:11:43', 'apollo', '2019-06-26 19:11:43');
INSERT INTO `Commit` VALUES (16, '{\"createItems\":[{\"namespaceId\":1,\"key\":\"host\",\"value\":\"47.94.214.199\",\"lineNum\":2,\"id\":9,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 19:12:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:12:35\"}],\"updateItems\":[],\"deleteItems\":[]}', 'ghost', 'default', 'application', NULL, b'0', 'apollo', '2019-06-26 19:12:36', 'apollo', '2019-06-26 19:12:36');
INSERT INTO `Commit` VALUES (17, '{\"createItems\":[{\"namespaceId\":8,\"key\":\"host\",\"value\":\"47.94.214.199\",\"lineNum\":1,\"id\":10,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 19:16:13\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:16:13\"}],\"updateItems\":[],\"deleteItems\":[]}', 'ghost', 'default', 'toolsconfig', NULL, b'0', 'apollo', '2019-06-26 19:16:13', 'apollo', '2019-06-26 19:16:13');
INSERT INTO `Commit` VALUES (18, '{\"createItems\":[],\"updateItems\":[],\"deleteItems\":[{\"namespaceId\":1,\"key\":\"host\",\"value\":\"47.94.214.199\",\"lineNum\":2,\"id\":9,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 19:12:36\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:16:27\"}]}', 'ghost', 'default', 'application', NULL, b'0', 'apollo', '2019-06-26 19:16:27', 'apollo', '2019-06-26 19:16:27');
INSERT INTO `Commit` VALUES (19, '{\"createItems\":[],\"updateItems\":[],\"deleteItems\":[{\"namespaceId\":1,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"http://47.94.214.1999001/eureka/\",\"comment\":\"\",\"lineNum\":1,\"id\":8,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 19:08:53\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:16:31\"}]}', 'ghost', 'default', 'application', NULL, b'0', 'apollo', '2019-06-26 19:16:31', 'apollo', '2019-06-26 19:16:31');
INSERT INTO `Commit` VALUES (20, '{\"createItems\":[{\"namespaceId\":1,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"a\",\"lineNum\":1,\"id\":11,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 19:20:24\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:20:24\"}],\"updateItems\":[],\"deleteItems\":[]}', 'ghost', 'default', 'application', NULL, b'0', 'apollo', '2019-06-26 19:20:25', 'apollo', '2019-06-26 19:20:25');
INSERT INTO `Commit` VALUES (21, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"a\",\"lineNum\":1,\"id\":11,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 19:20:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:20:25\"},\"newItem\":{\"namespaceId\":1,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"http://47.94.214.1999001/eureka/\",\"lineNum\":1,\"id\":11,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 19:20:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:20:35\"}}],\"deleteItems\":[]}', 'ghost', 'default', 'application', NULL, b'0', 'apollo', '2019-06-26 19:20:35', 'apollo', '2019-06-26 19:20:35');
INSERT INTO `Commit` VALUES (22, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"http://47.94.214.1999001/eureka/\",\"lineNum\":1,\"id\":11,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 19:20:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:20:35\"},\"newItem\":{\"namespaceId\":1,\"key\":\"eureka.client.serviceUrl.defaultZone\",\"value\":\"http://47.94.214.199:9001/eureka/\",\"lineNum\":1,\"id\":11,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 19:20:25\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:22:34\"}}],\"deleteItems\":[]}', 'ghost', 'default', 'application', NULL, b'0', 'apollo', '2019-06-26 19:22:34', 'apollo', '2019-06-26 19:22:34');
INSERT INTO `Commit` VALUES (23, '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":7,\"key\":\"content\",\"value\":\"tenantconfig:\\r\\n  general:\\r\\n    maxPoolSize: 10\\r\\n    minIdle: 3\\r\\n    defaultTenant: account\\r\\n  tenantCount: 5\\r\\n  tenantId: 3\\r\\n  tenants: \\r\\n    - jdbc:mysql://47.94.214.199:3306/newim,account,newim,zwy0410\",\"lineNum\":1,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:54:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-06-26 19:06:04\"},\"newItem\":{\"namespaceId\":7,\"key\":\"content\",\"value\":\"tenantconfig:\\r\\n  general:\\r\\n    maxPoolSize: 10\\r\\n    minIdle: 3\\r\\n    defaultTenant: account\\r\\n  tenantCount: 5\\r\\n  tenantId: tenantName\\r\\n  tenants: \\r\\n    - jdbc:mysql://47.94.214.199:3306/newim,account,newim,zwy0410\",\"lineNum\":1,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2019-06-26 18:54:35\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2019-07-01 12:12:33\"}}],\"deleteItems\":[]}', 'ghost', 'default', 'tenants.yml', NULL, b'0', 'apollo', '2019-07-01 12:12:33', 'apollo', '2019-07-01 12:12:33');

-- ----------------------------
-- Table structure for GrayReleaseRule
-- ----------------------------
DROP TABLE IF EXISTS `GrayReleaseRule`;
CREATE TABLE `GrayReleaseRule`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `BranchName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'branch name',
  `Rules` varchar(16000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '[]' COMMENT '灰度规则',
  `ReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '灰度对应的release',
  `BranchStatus` tinyint(2) NULL DEFAULT 1 COMMENT '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Namespace`(`AppId`, `ClusterName`, `NamespaceName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '灰度规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Instance
-- ----------------------------
DROP TABLE IF EXISTS `Instance`;
CREATE TABLE `Instance`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `DataCenter` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Data Center Name',
  `Ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'instance ip',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_UNIQUE_KEY`(`AppId`, `ClusterName`, `Ip`, `DataCenter`) USING BTREE,
  INDEX `IX_IP`(`Ip`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '使用配置的应用实例' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Instance
-- ----------------------------
INSERT INTO `Instance` VALUES (1, 'ghost', 'default', '', '172.17.250.138', '2019-06-26 18:03:26', '2019-06-26 18:03:26');
INSERT INTO `Instance` VALUES (2, 'ghost', 'default', '', '192.168.8.101', '2019-06-26 18:23:29', '2019-06-26 18:23:29');
INSERT INTO `Instance` VALUES (3, 'ghost', 'default', '', '192.168.8.102', '2019-07-01 12:01:07', '2019-07-01 12:01:07');

-- ----------------------------
-- Table structure for InstanceConfig
-- ----------------------------
DROP TABLE IF EXISTS `InstanceConfig`;
CREATE TABLE `InstanceConfig`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `InstanceId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Instance Id',
  `ConfigAppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config App Id',
  `ConfigClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config Cluster Name',
  `ConfigNamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config Namespace Name',
  `ReleaseKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的Key',
  `ReleaseDeliveryTime` timestamp(0) NULL DEFAULT NULL COMMENT '配置获取时间',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_UNIQUE_KEY`(`InstanceId`, `ConfigAppId`, `ConfigNamespaceName`) USING BTREE,
  INDEX `IX_ReleaseKey`(`ReleaseKey`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Valid_Namespace`(`ConfigAppId`, `ConfigClusterName`, `ConfigNamespaceName`, `DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用实例的配置信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of InstanceConfig
-- ----------------------------
INSERT INTO `InstanceConfig` VALUES (1, 1, 'ghost', 'default', 'application', '20190626192236-6e5de3e989c07b1f', '2019-06-26 19:22:37', '2019-06-26 18:03:25', '2019-07-01 19:43:24');
INSERT INTO `InstanceConfig` VALUES (2, 2, 'ghost', 'default', 'zuulconfig', '20190626182613-11e1e3e989c07b0c', '2019-06-26 18:26:14', '2019-06-26 18:23:28', '2019-06-26 18:26:15');
INSERT INTO `InstanceConfig` VALUES (3, 2, 'ghost', 'default', 'application', '20190626192236-6e5de3e989c07b1f', '2019-06-26 19:22:37', '2019-06-26 18:23:29', '2019-07-02 18:13:37');
INSERT INTO `InstanceConfig` VALUES (6, 2, 'ghost', 'default', 'tenants.yml', '20190701121235-a680e3e989c07b20', '2019-07-02 18:13:41', '2019-06-26 18:55:02', '2019-07-02 18:13:42');
INSERT INTO `InstanceConfig` VALUES (7, 2, 'ghost', 'default', 'toolsconfig', '20190626191615-a5eae3e989c07b1a', '2019-06-26 19:16:43', '2019-06-26 19:16:43', '2019-07-02 18:13:37');
INSERT INTO `InstanceConfig` VALUES (8, 3, 'ghost', 'default', 'application', '20190626192236-6e5de3e989c07b1f', '2019-07-01 12:01:07', '2019-07-01 12:01:07', '2019-07-01 12:01:07');
INSERT INTO `InstanceConfig` VALUES (9, 3, 'ghost', 'default', 'toolsconfig', '20190626191615-a5eae3e989c07b1a', '2019-07-01 12:01:07', '2019-07-01 12:01:07', '2019-07-01 12:01:07');
INSERT INTO `InstanceConfig` VALUES (10, 3, 'ghost', 'default', 'tenants.yml', '20190701121235-a680e3e989c07b20', '2019-07-01 12:12:47', '2019-07-01 12:01:12', '2019-07-01 12:12:47');

-- ----------------------------
-- Table structure for Item
-- ----------------------------
DROP TABLE IF EXISTS `Item`;
CREATE TABLE `Item`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `NamespaceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '集群NamespaceId',
  `Key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置项值',
  `Comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '注释',
  `LineNum` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '行号',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_GroupId`(`NamespaceId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置项目' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Item
-- ----------------------------
INSERT INTO `Item` VALUES (1, 2, 'zuul.routes.users.path', '/**', '', 1, b'1', 'apollo', '2019-06-26 17:56:02', 'apollo', '2019-06-26 18:26:10');
INSERT INTO `Item` VALUES (2, 2, 'zuul.routes.users.url', 'https://www.baidu.com', '', 2, b'1', 'apollo', '2019-06-26 17:56:02', 'apollo', '2019-06-26 18:26:10');
INSERT INTO `Item` VALUES (3, 4, 'content', 'tenantconfig:\n  tenantCount:5\n  tenantId:tenantName  \n  general:\n    maxPoolSize:10\n    minIdle:3\n    defaultTenant:account\n  tenants:\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!&', NULL, 1, b'1', 'apollo', '2019-06-26 17:57:51', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Item` VALUES (4, 2, 'zuul.routes.account.path', '/business/**', '', 1, b'0', 'apollo', '2019-06-26 18:26:10', 'apollo', '2019-06-26 18:26:10');
INSERT INTO `Item` VALUES (5, 2, 'zuul.routes.account.serviceId', 'account', '', 2, b'0', 'apollo', '2019-06-26 18:26:10', 'apollo', '2019-06-26 18:26:10');
INSERT INTO `Item` VALUES (6, 6, 'content', 'tenantconfig:\r\n  tenantCount:5\r\n  tenantId:tenantName  \r\n  general:\r\n    maxPoolSize:10\r\n    minIdle:3\r\n    defaultTenant:account\r\n  tenants:\r\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!&', NULL, 1, b'1', 'apollo', '2019-06-26 18:50:31', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `Item` VALUES (7, 7, 'content', 'tenantconfig:\r\n  general:\r\n    maxPoolSize: 10\r\n    minIdle: 3\r\n    defaultTenant: account\r\n  tenantCount: 5\r\n  tenantId: tenantName\r\n  tenants: \r\n    - jdbc:mysql://47.94.214.199:3306/newim,account,newim,zwy0410', NULL, 1, b'0', 'apollo', '2019-06-26 18:54:35', 'apollo', '2019-07-01 12:12:33');
INSERT INTO `Item` VALUES (8, 1, 'eureka.client.serviceUrl.defaultZone', 'http://47.94.214.1999001/eureka/', '', 1, b'1', 'apollo', '2019-06-26 19:08:53', 'apollo', '2019-06-26 19:16:31');
INSERT INTO `Item` VALUES (9, 1, 'host', '47.94.214.199', NULL, 2, b'1', 'apollo', '2019-06-26 19:12:36', 'apollo', '2019-06-26 19:16:27');
INSERT INTO `Item` VALUES (10, 8, 'host', '47.94.214.199', NULL, 1, b'0', 'apollo', '2019-06-26 19:16:13', 'apollo', '2019-06-26 19:16:13');
INSERT INTO `Item` VALUES (11, 1, 'eureka.client.serviceUrl.defaultZone', 'http://47.94.214.199:9001/eureka/', NULL, 1, b'0', 'apollo', '2019-06-26 19:20:25', 'apollo', '2019-06-26 19:22:34');

-- ----------------------------
-- Table structure for Namespace
-- ----------------------------
DROP TABLE IF EXISTS `Namespace`;
CREATE TABLE `Namespace`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId_ClusterName_NamespaceName`(`AppId`(191), `ClusterName`(191), `NamespaceName`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_NamespaceName`(`NamespaceName`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '命名空间' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Namespace
-- ----------------------------
INSERT INTO `Namespace` VALUES (1, 'ghost', 'default', 'application', b'0', 'apollo', '2019-06-26 09:45:51', 'apollo', '2019-06-26 09:45:51');
INSERT INTO `Namespace` VALUES (2, 'ghost', 'default', 'zuulconfig', b'0', 'apollo', '2019-06-26 09:46:10', 'apollo', '2019-06-26 09:46:10');
INSERT INTO `Namespace` VALUES (3, 'ghost', 'default', 'tenants', b'1', 'apollo', '2019-06-26 09:46:28', 'apollo', '2019-06-26 17:53:01');
INSERT INTO `Namespace` VALUES (4, 'ghost', 'default', 'tenants.yml', b'1', 'apollo', '2019-06-26 17:53:14', 'apollo', '2019-06-26 18:49:49');
INSERT INTO `Namespace` VALUES (5, 'ghost', 'default', 'tenants', b'1', 'apollo', '2019-06-26 17:53:20', 'apollo', '2019-06-26 17:54:27');
INSERT INTO `Namespace` VALUES (6, 'ghost', 'default', 'tenants.yaml', b'1', 'apollo', '2019-06-26 18:50:13', 'apollo', '2019-06-26 18:53:47');
INSERT INTO `Namespace` VALUES (7, 'ghost', 'default', 'tenants.yml', b'0', 'apollo', '2019-06-26 18:54:09', 'apollo', '2019-06-26 18:54:09');
INSERT INTO `Namespace` VALUES (8, 'ghost', 'default', 'toolsconfig', b'0', 'apollo', '2019-06-26 19:15:53', 'apollo', '2019-06-26 19:15:53');

-- ----------------------------
-- Table structure for NamespaceLock
-- ----------------------------
DROP TABLE IF EXISTS `NamespaceLock`;
CREATE TABLE `NamespaceLock`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `NamespaceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '集群NamespaceId',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `IsDeleted` bit(1) NULL DEFAULT b'0' COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_NamespaceId`(`NamespaceId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'namespace的编辑锁' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for Release
-- ----------------------------
DROP TABLE IF EXISTS `Release`;
CREATE TABLE `Release`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ReleaseKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的Key',
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '发布名字',
  `Comment` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布说明',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Configurations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布配置',
  `IsAbandoned` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否废弃',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId_ClusterName_GroupName`(`AppId`(191), `ClusterName`(191), `NamespaceName`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_ReleaseKey`(`ReleaseKey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of Release
-- ----------------------------
INSERT INTO `Release` VALUES (1, '20190626175605-11e1e3e98991a3b0', '20190626175603-release', '', 'ghost', 'default', 'zuulconfig', '{\"zuul.routes.users.path\":\"/**\",\"zuul.routes.users.url\":\"https://www.baidu.com\"}', b'0', b'0', 'apollo', '2019-06-26 17:56:05', 'apollo', '2019-06-26 17:56:06');
INSERT INTO `Release` VALUES (2, '20190626175753-a680e3e98991a3b1', '20190626175752-release', '', 'ghost', 'default', 'tenants.yml', '{\"content\":\"tenantconfig:\\n  tenantCount:1\\n  orgCodeHeader: tenantId  \\n  general:\\n    maxPoolSize: 10\\n    minIdle: 3\\n    defaultTenant : account\\n  tenants:\\n    -jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\"}', b'0', b'1', 'apollo', '2019-06-26 17:57:54', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Release` VALUES (3, '20190626180019-6e5de3e98991a3b2', '20190626180018-release', '', 'ghost', 'default', 'application', '{}', b'0', b'0', 'apollo', '2019-06-26 18:00:20', 'apollo', '2019-06-26 18:00:20');
INSERT INTO `Release` VALUES (4, '20190626182613-11e1e3e989c07b0c', '20190626182612-release', '', 'ghost', 'default', 'zuulconfig', '{\"zuul.routes.account.serviceId\":\"account\",\"zuul.routes.account.path\":\"/business/**\"}', b'0', b'0', 'apollo', '2019-06-26 18:26:13', 'apollo', '2019-06-26 18:26:13');
INSERT INTO `Release` VALUES (5, '20190626182951-a680e3e989c07b0d', '20190626182949-release', '', 'ghost', 'default', 'tenants.yml', '{\"content\":\"tenantconfig:\\n  tenantCount:1\\n  tenantId: tenantName  \\n  general:\\n    maxPoolSize: 10\\n    minIdle: 3\\n    defaultTenant : account\\n  tenants:\\n    -jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\"}', b'0', b'1', 'apollo', '2019-06-26 18:29:51', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Release` VALUES (6, '20190626184408-a680e3e989c07b0e', '20190626184406-release', '', 'ghost', 'default', 'tenants.yml', '{\"content\":\"tenantconfig:\\n  tenantCount:5\\n  tenantId: tenantName  \\n  general:\\n    maxPoolSize: 10\\n    minIdle: 3\\n    defaultTenant : account\\n  tenants:\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\"}', b'0', b'1', 'apollo', '2019-06-26 18:44:08', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Release` VALUES (7, '20190626184604-a680e3e989c07b0f', '20190626184602-release', '', 'ghost', 'default', 'tenants.yml', '{\"content\":\"tenantconfig:\\n  tenantCount:5\\n  tenantId:tenantName  \\n  general:\\n    maxPoolSize: 10\\n    minIdle: 3\\n    defaultTenant : account\\n  tenants:\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\"}', b'0', b'1', 'apollo', '2019-06-26 18:46:04', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Release` VALUES (8, '20190626184721-a680e3e989c07b10', '20190626184720-release', '', 'ghost', 'default', 'tenants.yml', '{\"content\":\"tenantconfig:\\n  tenantCount:5\\n  tenantId:tenantName  \\n  general:\\n    maxPoolSize:10\\n    minIdle:3\\n    defaultTenant:account\\n  tenants:\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\"}', b'0', b'1', 'apollo', '2019-06-26 18:47:22', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `Release` VALUES (9, '20190626185032-ad79e3e989c07b11', '20190626185031-release', '', 'ghost', 'default', 'tenants.yaml', '{\"content\":\"tenantconfig:\\r\\n  tenantCount:5\\r\\n  tenantId:tenantName  \\r\\n  general:\\r\\n    maxPoolSize:10\\r\\n    minIdle:3\\r\\n    defaultTenant:account\\r\\n  tenants:\\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\"}', b'0', b'1', 'apollo', '2019-06-26 18:50:33', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `Release` VALUES (10, '20190626185437-a680e3e989c07b12', '20190626185436-release', '', 'ghost', 'default', 'tenants.yml', '{\"content\":\"tenantconfig:\\r\\n  tenantCount:5\\r\\n  tenantId:tenantName\\r\\n  general:\\r\\n    maxPoolSize:10\\r\\n    minIdle:3\\r\\n    defaultTenant:account\\r\\n  tenants:\\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\"}', b'0', b'0', 'apollo', '2019-06-26 18:54:37', 'apollo', '2019-06-26 18:54:37');
INSERT INTO `Release` VALUES (11, '20190626185739-a680e3e989c07b13', '20190626185737-release', '', 'ghost', 'default', 'tenants.yml', '{\"content\":\"tenantconfig:\\r\\n  tenantCount:5\\r\\n  tenantId:3\\r\\n  general:\\r\\n    maxPoolSize:10\\r\\n    minIdle:3\\r\\n    defaultTenant:account\\r\\n  tenants:\\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\"}', b'0', b'0', 'apollo', '2019-06-26 18:57:39', 'apollo', '2019-06-26 18:57:39');
INSERT INTO `Release` VALUES (12, '20190626185838-a680e3e989c07b14', '20190626185836-release', '', 'ghost', 'default', 'tenants.yml', '{\"content\":\"tenantconfig:\\r\\n  general:\\r\\n    maxPoolSize:10\\r\\n    minIdle:3\\r\\n    defaultTenant:account\\r\\n  tenantCount:5\\r\\n  tenantId:3\\r\\n  tenants:\\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\"}', b'0', b'0', 'apollo', '2019-06-26 18:58:38', 'apollo', '2019-06-26 18:58:38');
INSERT INTO `Release` VALUES (13, '20190626190222-a680e3e989c07b15', '20190626190220-release', '', 'ghost', 'default', 'tenants.yml', '{\"content\":\"tenantconfig:\\r\\n  general:\\r\\n    maxPoolSize: 10\\r\\n    minIdle: 3\\r\\n    defaultTenant: account\\r\\n  tenantCount: 5\\r\\n  tenantId: 3\\r\\n  tenants: \\r\\n    - jdbc:mysql://47.94.214.199:3306/ghost,account,root,Dizhu20!\\u0026\"}', b'0', b'0', 'apollo', '2019-06-26 19:02:22', 'apollo', '2019-06-26 19:02:22');
INSERT INTO `Release` VALUES (14, '20190626190606-a680e3e989c07b16', '20190626190605-release', '', 'ghost', 'default', 'tenants.yml', '{\"content\":\"tenantconfig:\\r\\n  general:\\r\\n    maxPoolSize: 10\\r\\n    minIdle: 3\\r\\n    defaultTenant: account\\r\\n  tenantCount: 5\\r\\n  tenantId: 3\\r\\n  tenants: \\r\\n    - jdbc:mysql://47.94.214.199:3306/newim,account,newim,zwy0410\"}', b'0', b'0', 'apollo', '2019-06-26 19:06:07', 'apollo', '2019-06-26 19:06:07');
INSERT INTO `Release` VALUES (15, '20190626190856-6e5de3e989c07b17', '20190626190854-release', '', 'ghost', 'default', 'application', '{\"eureka.client.serviceUrl.defaultZone\":\"http://host:47.94.214.1999001/eureka/\"}', b'0', b'0', 'apollo', '2019-06-26 19:08:56', 'apollo', '2019-06-26 19:08:56');
INSERT INTO `Release` VALUES (16, '20190626191145-6e5de3e989c07b18', '20190626191143-release', '', 'ghost', 'default', 'application', '{\"eureka.client.serviceUrl.defaultZone\":\"http://47.94.214.1999001/eureka/\"}', b'0', b'0', 'apollo', '2019-06-26 19:11:45', 'apollo', '2019-06-26 19:11:45');
INSERT INTO `Release` VALUES (17, '20190626191238-6e5de3e989c07b19', '20190626191237-release', '', 'ghost', 'default', 'application', '{\"host\":\"47.94.214.199\",\"eureka.client.serviceUrl.defaultZone\":\"http://47.94.214.1999001/eureka/\"}', b'0', b'0', 'apollo', '2019-06-26 19:12:39', 'apollo', '2019-06-26 19:12:39');
INSERT INTO `Release` VALUES (18, '20190626191615-a5eae3e989c07b1a', '20190626191614-release', '', 'ghost', 'default', 'toolsconfig', '{\"host\":\"47.94.214.199\"}', b'0', b'0', 'apollo', '2019-06-26 19:16:15', 'apollo', '2019-06-26 19:16:15');
INSERT INTO `Release` VALUES (19, '20190626191632-6e5de3e989c07b1b', '20190626191631-release', '', 'ghost', 'default', 'application', '{}', b'1', b'0', 'apollo', '2019-06-26 19:16:33', 'apollo', '2019-06-26 19:19:15');
INSERT INTO `Release` VALUES (20, '20190626191918-6e5de3e989c07b1c', '20190626191916-release', '', 'ghost', 'default', 'application', '{}', b'1', b'0', 'apollo', '2019-06-26 19:19:18', 'apollo', '2019-06-26 19:19:29');
INSERT INTO `Release` VALUES (21, '20190626192020-6e5de3e989c07b1d', '20190626192019-release', '', 'ghost', 'default', 'application', '{}', b'0', b'0', 'apollo', '2019-06-26 19:20:21', 'apollo', '2019-06-26 19:20:21');
INSERT INTO `Release` VALUES (22, '20190626192039-6e5de3e989c07b1e', '20190626192037-release', '', 'ghost', 'default', 'application', '{\"eureka.client.serviceUrl.defaultZone\":\"http://47.94.214.1999001/eureka/\"}', b'0', b'0', 'apollo', '2019-06-26 19:20:39', 'apollo', '2019-06-26 19:20:39');
INSERT INTO `Release` VALUES (23, '20190626192236-6e5de3e989c07b1f', '20190626192234-release', '', 'ghost', 'default', 'application', '{\"eureka.client.serviceUrl.defaultZone\":\"http://47.94.214.199:9001/eureka/\"}', b'0', b'0', 'apollo', '2019-06-26 19:22:36', 'apollo', '2019-06-26 19:22:36');
INSERT INTO `Release` VALUES (24, '20190701121235-a680e3e989c07b20', '20190701121233-release', '', 'ghost', 'default', 'tenants.yml', '{\"content\":\"tenantconfig:\\r\\n  general:\\r\\n    maxPoolSize: 10\\r\\n    minIdle: 3\\r\\n    defaultTenant: account\\r\\n  tenantCount: 5\\r\\n  tenantId: tenantName\\r\\n  tenants: \\r\\n    - jdbc:mysql://47.94.214.199:3306/newim,account,newim,zwy0410\"}', b'0', b'0', 'apollo', '2019-07-01 12:12:35', 'apollo', '2019-07-01 12:12:35');

-- ----------------------------
-- Table structure for ReleaseHistory
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseHistory`;
CREATE TABLE `ReleaseHistory`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `BranchName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '发布分支名',
  `ReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联的Release Id',
  `PreviousReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '前一次发布的ReleaseId',
  `Operation` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度',
  `OperationContext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布上下文信息',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Namespace`(`AppId`, `ClusterName`, `NamespaceName`, `BranchName`) USING BTREE,
  INDEX `IX_ReleaseId`(`ReleaseId`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布历史' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ReleaseHistory
-- ----------------------------
INSERT INTO `ReleaseHistory` VALUES (1, 'ghost', 'default', 'zuulconfig', 'default', 1, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 17:56:06', 'apollo', '2019-06-26 17:56:06');
INSERT INTO `ReleaseHistory` VALUES (2, 'ghost', 'default', 'tenants.yml', 'default', 2, 0, 0, '{\"isEmergencyPublish\":false}', b'1', 'apollo', '2019-06-26 17:57:54', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `ReleaseHistory` VALUES (3, 'ghost', 'default', 'application', 'default', 3, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 18:00:20', 'apollo', '2019-06-26 18:00:20');
INSERT INTO `ReleaseHistory` VALUES (4, 'ghost', 'default', 'zuulconfig', 'default', 4, 1, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 18:26:13', 'apollo', '2019-06-26 18:26:13');
INSERT INTO `ReleaseHistory` VALUES (5, 'ghost', 'default', 'tenants.yml', 'default', 5, 2, 0, '{\"isEmergencyPublish\":false}', b'1', 'apollo', '2019-06-26 18:29:51', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `ReleaseHistory` VALUES (6, 'ghost', 'default', 'tenants.yml', 'default', 6, 5, 0, '{\"isEmergencyPublish\":false}', b'1', 'apollo', '2019-06-26 18:44:08', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `ReleaseHistory` VALUES (7, 'ghost', 'default', 'tenants.yml', 'default', 7, 6, 0, '{\"isEmergencyPublish\":false}', b'1', 'apollo', '2019-06-26 18:46:04', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `ReleaseHistory` VALUES (8, 'ghost', 'default', 'tenants.yml', 'default', 8, 7, 0, '{\"isEmergencyPublish\":false}', b'1', 'apollo', '2019-06-26 18:47:22', 'apollo', '2019-06-26 18:49:48');
INSERT INTO `ReleaseHistory` VALUES (9, 'ghost', 'default', 'tenants.yaml', 'default', 9, 0, 0, '{\"isEmergencyPublish\":false}', b'1', 'apollo', '2019-06-26 18:50:33', 'apollo', '2019-06-26 18:53:46');
INSERT INTO `ReleaseHistory` VALUES (10, 'ghost', 'default', 'tenants.yml', 'default', 10, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 18:54:37', 'apollo', '2019-06-26 18:54:37');
INSERT INTO `ReleaseHistory` VALUES (11, 'ghost', 'default', 'tenants.yml', 'default', 11, 10, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 18:57:39', 'apollo', '2019-06-26 18:57:39');
INSERT INTO `ReleaseHistory` VALUES (12, 'ghost', 'default', 'tenants.yml', 'default', 12, 11, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 18:58:38', 'apollo', '2019-06-26 18:58:38');
INSERT INTO `ReleaseHistory` VALUES (13, 'ghost', 'default', 'tenants.yml', 'default', 13, 12, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 19:02:22', 'apollo', '2019-06-26 19:02:22');
INSERT INTO `ReleaseHistory` VALUES (14, 'ghost', 'default', 'tenants.yml', 'default', 14, 13, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 19:06:07', 'apollo', '2019-06-26 19:06:07');
INSERT INTO `ReleaseHistory` VALUES (15, 'ghost', 'default', 'application', 'default', 15, 3, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 19:08:56', 'apollo', '2019-06-26 19:08:56');
INSERT INTO `ReleaseHistory` VALUES (16, 'ghost', 'default', 'application', 'default', 16, 15, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 19:11:45', 'apollo', '2019-06-26 19:11:45');
INSERT INTO `ReleaseHistory` VALUES (17, 'ghost', 'default', 'application', 'default', 17, 16, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 19:12:39', 'apollo', '2019-06-26 19:12:39');
INSERT INTO `ReleaseHistory` VALUES (18, 'ghost', 'default', 'toolsconfig', 'default', 18, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 19:16:15', 'apollo', '2019-06-26 19:16:15');
INSERT INTO `ReleaseHistory` VALUES (19, 'ghost', 'default', 'application', 'default', 19, 17, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 19:16:33', 'apollo', '2019-06-26 19:16:33');
INSERT INTO `ReleaseHistory` VALUES (20, 'ghost', 'default', 'application', 'default', 17, 19, 1, '{}', b'0', 'apollo', '2019-06-26 19:19:15', 'apollo', '2019-06-26 19:19:15');
INSERT INTO `ReleaseHistory` VALUES (21, 'ghost', 'default', 'application', 'default', 20, 17, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 19:19:18', 'apollo', '2019-06-26 19:19:18');
INSERT INTO `ReleaseHistory` VALUES (22, 'ghost', 'default', 'application', 'default', 17, 20, 1, '{}', b'0', 'apollo', '2019-06-26 19:19:29', 'apollo', '2019-06-26 19:19:29');
INSERT INTO `ReleaseHistory` VALUES (23, 'ghost', 'default', 'application', 'default', 21, 17, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 19:20:21', 'apollo', '2019-06-26 19:20:21');
INSERT INTO `ReleaseHistory` VALUES (24, 'ghost', 'default', 'application', 'default', 22, 21, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 19:20:39', 'apollo', '2019-06-26 19:20:39');
INSERT INTO `ReleaseHistory` VALUES (25, 'ghost', 'default', 'application', 'default', 23, 22, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-06-26 19:22:36', 'apollo', '2019-06-26 19:22:36');
INSERT INTO `ReleaseHistory` VALUES (26, 'ghost', 'default', 'tenants.yml', 'default', 24, 14, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2019-07-01 12:12:35', 'apollo', '2019-07-01 12:12:35');

-- ----------------------------
-- Table structure for ReleaseMessage
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseMessage`;
CREATE TABLE `ReleaseMessage`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Message` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的消息内容',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Message`(`Message`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布消息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ReleaseMessage
-- ----------------------------
INSERT INTO `ReleaseMessage` VALUES (2, 'ghost+default+tenants', '2019-06-26 17:54:27');
INSERT INTO `ReleaseMessage` VALUES (6, 'ghost+default+zuulconfig', '2019-06-26 18:26:14');
INSERT INTO `ReleaseMessage` VALUES (13, 'ghost+default+tenants.yaml', '2019-06-26 18:53:47');
INSERT INTO `ReleaseMessage` VALUES (22, 'ghost+default+toolsconfig', '2019-06-26 19:16:15');
INSERT INTO `ReleaseMessage` VALUES (28, 'ghost+default+application', '2019-06-26 19:20:39');
INSERT INTO `ReleaseMessage` VALUES (29, 'ghost+default+application', '2019-06-26 19:22:36');
INSERT INTO `ReleaseMessage` VALUES (30, 'ghost+default+tenants.yml', '2019-07-01 12:12:35');

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Cluster` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置对应的集群，default为不针对特定的集群',
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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置服务自身配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
INSERT INTO `ServerConfig` VALUES (1, 'eureka.service.url', 'default', 'http://localhost:9001/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', b'0', 'default', '2019-06-25 22:09:03', '', '2019-06-26 18:16:46');
INSERT INTO `ServerConfig` VALUES (2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', b'0', 'default', '2019-06-25 22:09:03', '', '2019-06-25 22:09:03');
INSERT INTO `ServerConfig` VALUES (3, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', b'0', 'default', '2019-06-25 22:09:03', '', '2019-06-25 22:09:03');
INSERT INTO `ServerConfig` VALUES (4, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', b'0', 'default', '2019-06-25 22:09:03', '', '2019-06-25 22:09:03');
INSERT INTO `ServerConfig` VALUES (5, 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', b'0', 'default', '2019-06-25 22:09:03', '', '2019-06-25 22:09:03');

SET FOREIGN_KEY_CHECKS = 1;
