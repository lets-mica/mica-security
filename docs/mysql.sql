/*
 Navicat Premium Data Transfer

 Source Server         : 01-localhost-mysql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : dream

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 02/08/2019 22:37:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
BEGIN;
INSERT INTO `persistent_logins` VALUES ('admin', 'k47XTanrygFwcDhWszYYnw==', 'UWLSUH+44k2My8lu7sQyTQ==', '2019-08-02 09:22:58');
COMMIT;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(10) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(36) NOT NULL COMMENT '邮箱',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` tinyint(2) DEFAULT '0' COMMENT '年龄',
  `user_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '用户类别[0:管理员,1:普通员工]',
  `organization_id` int(11) DEFAULT NULL COMMENT '组织id',
  `locked` tinyint(2) DEFAULT '0' COMMENT '是否锁定[0:正常,1:锁定]',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态[0:失效,1:正常]',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_admin_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
BEGIN;
INSERT INTO `t_admin` VALUES (1, 'admin', '$2a$11$VzpOQ9qEgqD3O2suUJ1ZVuD6IEkUr5DPeRHk0fwx1TO0Iv9zBTOtC', '管理员', '596392912@qq.com', '15321111111', 0, 0, 0, 1, 0, 1, '2018-01-30 10:08:41', '2018-04-16 14:59:38');
INSERT INTO `t_admin` VALUES (2, 'test', '$2a$11$VzpOQ9qEgqD3O2suUJ1ZVuD6IEkUr5DPeRHk0fwx1TO0Iv9zBTOtC', '测试', '596392912@qq.com', NULL, 0, 0, 1, 6, 0, 1, '2018-03-28 04:26:31', '2018-04-14 23:21:52');
COMMIT;

-- ----------------------------
-- Table structure for t_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `t_admin_role`;
CREATE TABLE `t_admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `admin_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `idx_user_role_ids` (`admin_id`,`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='用户角色';

-- ----------------------------
-- Records of t_admin_role
-- ----------------------------
BEGIN;
INSERT INTO `t_admin_role` VALUES (74, 1, 1);
INSERT INTO `t_admin_role` VALUES (75, 1, 2);
INSERT INTO `t_admin_role` VALUES (76, 1, 7);
INSERT INTO `t_admin_role` VALUES (77, 1, 8);
INSERT INTO `t_admin_role` VALUES (78, 2, 8);
INSERT INTO `t_admin_role` VALUES (63, 13, 2);
INSERT INTO `t_admin_role` VALUES (64, 14, 7);
INSERT INTO `t_admin_role` VALUES (53, 15, 8);
COMMIT;

-- ----------------------------
-- Table structure for t_organization
-- ----------------------------
DROP TABLE IF EXISTS `t_organization`;
CREATE TABLE `t_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '组织名',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `code` varchar(64) NOT NULL COMMENT '编号',
  `icon_cls` varchar(32) DEFAULT NULL COMMENT '图标',
  `pid` int(11) DEFAULT NULL COMMENT '父级主键',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态[0:失效,1:正常]',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='组织机构';

-- ----------------------------
-- Records of t_organization
-- ----------------------------
BEGIN;
INSERT INTO `t_organization` VALUES (1, '总经办', '王家桥', '01', 'glyphicon-apple', NULL, 0, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_organization` VALUES (3, '技术部', '', '02', 'glyphicon-heart', NULL, 1, 1, '2015-10-01 13:10:42', '2018-04-14 16:30:15');
INSERT INTO `t_organization` VALUES (5, '产品部', '', '03', 'glyphicon-glass', NULL, 2, 1, '2015-12-06 12:15:30', '2018-04-14 16:30:10');
INSERT INTO `t_organization` VALUES (6, '测试组', '', '04', 'glyphicon-retweet ', 3, 0, 1, '2015-12-06 13:12:18', '2018-03-24 04:33:21');
COMMIT;

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '资源名称',
  `permissions` varchar(32) DEFAULT NULL COMMENT '资源的权限',
  `url` varchar(100) DEFAULT NULL COMMENT '资源路径',
  `open_mode` varchar(32) DEFAULT NULL COMMENT '打开方式 ajax,iframe',
  `description` varchar(255) DEFAULT NULL COMMENT '资源介绍',
  `icon_cls` varchar(32) DEFAULT NULL COMMENT '资源图标',
  `pid` int(11) DEFAULT NULL COMMENT '父级资源id',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态[0:失效,1:正常]',
  `opened` tinyint(1) NOT NULL DEFAULT '0' COMMENT '打开状态',
  `resource_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '资源类别',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of t_resource
-- ----------------------------
BEGIN;
INSERT INTO `t_resource` VALUES (1, '权限管理', '', '', NULL, '系统管理', 'glyphicon-th ', NULL, 0, 1, 1, 0, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (11, '资源管理', '', '/resource/manager', 'ajax', '资源管理', 'glyphicon-list-alt', 1, 1, 1, 1, 0, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (12, '角色管理', '', '/role/manager', 'ajax', '角色管理', 'glyphicon-lock', 1, 2, 1, 1, 0, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (13, '用户管理', '', '/admin/manager', 'ajax', '用户管理', 'glyphicon-user', 1, 3, 1, 1, 0, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (14, '部门管理', '', '/organization/manager', 'ajax', '部门管理', 'glyphicon-globe', 1, 4, 1, 1, 0, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (111, '列表', '', '/resource/treeGrid', 'ajax', '资源列表', 'glyphicon-th-list', 11, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (112, '添加', 'resource:add', '/resource/add', 'ajax', '资源添加', 'glyphicon-plus', 11, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (113, '编辑', 'resource:edit', '/resource/edit', 'ajax', '资源编辑', 'glyphicon-pencil', 11, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (114, '删除', 'resource:delete', '/resource/delete', 'ajax', '资源删除', 'glyphicon-remove', 11, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (121, '列表', '', '/role/dataGrid', 'ajax', '角色列表', 'glyphicon-th-list', 12, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (122, '添加', 'role:add', '/role/add', 'ajax', '角色添加', 'glyphicon-plus', 12, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (123, '编辑', 'role:edit', '/role/edit', 'ajax', '角色编辑', 'glyphicon-pencil', 12, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (124, '删除', 'role:delete', '/role/delete', 'ajax', '角色删除', 'glyphicon-remove', 12, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (125, '授权', 'role:grant', '/role/grant', 'ajax', '角色授权', 'glyphicon-ok ', 12, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (131, '列表', '', '/admin/dataGrid', 'ajax', '用户列表', 'glyphicon-th-list', 13, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (132, '添加', 'admin:add', '/admin/add', 'ajax', '用户添加', 'glyphicon-plus', 13, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (133, '编辑', 'admin:edit', '/admin/edit', 'ajax', '用户编辑', 'glyphicon-pencil', 13, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (134, '删除', 'admin:delete', '/admin/delete', 'ajax', '用户删除', 'glyphicon-remove', 13, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (141, '列表', '', '/organization/treeGrid', 'ajax', '用户列表', 'glyphicon-th-list', 14, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (142, '添加', 'organization:add', '/organization/add', 'ajax', '部门添加', 'glyphicon-plus', 14, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (143, '编辑', 'organization:edit', '/organization/edit', 'ajax', '部门编辑', 'glyphicon-pencil', 14, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (144, '删除', 'organization:delete', '/organization/delete', 'ajax', '部门删除', 'glyphicon-remove', 14, 0, 1, 1, 1, '2014-02-19 01:00:00', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (221, '系统管理', '', '', NULL, NULL, 'glyphicon-cog ', NULL, 3, 1, 0, 0, '2015-12-01 11:44:20', '2018-04-15 21:41:32');
INSERT INTO `t_resource` VALUES (226, '修改密码', 'admin:edit:pwd', '/admin/editPwdPage', 'ajax', NULL, 'glyphicon-warning-sign', NULL, 4, 1, 1, 1, '2015-12-07 20:23:06', '2018-03-24 04:33:21');
INSERT INTO `t_resource` VALUES (227, '登录日志', '', '/sysLog/manager', 'ajax', NULL, 'glyphicon-info-sign', 221, 2, 1, 1, 0, '2016-09-30 22:10:53', '2018-04-15 21:47:58');
INSERT INTO `t_resource` VALUES (229, '系统图标', '', '/icons.html', 'ajax', NULL, 'glyphicon-picture', 221, 1, 1, 1, 0, '2016-12-24 15:53:47', '2018-04-15 21:48:18');
INSERT INTO `t_resource` VALUES (235, '字典管理', 'sysDict:manager', '/sysDict/manager', NULL, '字典管理', 'glyphicon-list-alt ', 221, 0, 1, 1, 0, '2018-04-15 20:17:32', '2018-04-15 21:48:26');
INSERT INTO `t_resource` VALUES (236, '列表', 'sysDict:dataGrid', '/sysDict/dataGrid', 'ajax', '资源列表', 'glyphicon-th-list', 235, 0, 1, 1, 1, '2018-04-15 20:17:32', '2018-04-15 21:59:40');
INSERT INTO `t_resource` VALUES (237, '添加', 'sysDict:add', '/sysDict/add', 'ajax', '资源添加', 'glyphicon-plus', 235, 0, 1, 1, 1, '2018-04-15 20:17:32', '2018-04-15 21:32:45');
INSERT INTO `t_resource` VALUES (238, '编辑', 'sysDict:edit', '/sysDict/edit', 'ajax', '资源编辑', 'glyphicon-pencil', 235, 0, 1, 1, 1, '2018-04-15 20:17:32', '2018-04-15 21:32:55');
COMMIT;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) NOT NULL COMMENT '角色名',
  `description` varchar(255) DEFAULT NULL COMMENT '简介',
  `icon_cls` varchar(32) DEFAULT NULL COMMENT '角色图标',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态[0:失效,1:正常]',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of t_role
-- ----------------------------
BEGIN;
INSERT INTO `t_role` VALUES (1, 'admin', '超级管理员', 'glyphicon-lock ', 0, 1, '2018-03-24 04:33:21', '2018-04-14 16:32:35');
INSERT INTO `t_role` VALUES (2, 'de', '技术部经理', 'glyphicon-plane ', 0, 1, '2018-03-24 04:33:21', '2018-04-14 16:32:42');
INSERT INTO `t_role` VALUES (7, 'pm', '产品部经理', 'glyphicon-ok-circle ', 0, 1, '2018-03-24 04:33:21', '2018-04-14 16:32:47');
INSERT INTO `t_role` VALUES (8, 'test', '测试账户', 'glyphicon-calendar ', 0, 1, '2018-03-24 04:33:21', '2018-04-14 16:32:52');
COMMIT;

-- ----------------------------
-- Table structure for t_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resource`;
CREATE TABLE `t_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `resource_id` int(11) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`),
  KEY `idx_role_resource_ids` (`role_id`,`resource_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=683 DEFAULT CHARSET=utf8 COMMENT='角色资源';

-- ----------------------------
-- Records of t_role_resource
-- ----------------------------
BEGIN;
INSERT INTO `t_role_resource` VALUES (644, 1, 1);
INSERT INTO `t_role_resource` VALUES (645, 1, 11);
INSERT INTO `t_role_resource` VALUES (650, 1, 12);
INSERT INTO `t_role_resource` VALUES (656, 1, 13);
INSERT INTO `t_role_resource` VALUES (661, 1, 14);
INSERT INTO `t_role_resource` VALUES (646, 1, 111);
INSERT INTO `t_role_resource` VALUES (647, 1, 112);
INSERT INTO `t_role_resource` VALUES (648, 1, 113);
INSERT INTO `t_role_resource` VALUES (649, 1, 114);
INSERT INTO `t_role_resource` VALUES (651, 1, 121);
INSERT INTO `t_role_resource` VALUES (652, 1, 122);
INSERT INTO `t_role_resource` VALUES (653, 1, 123);
INSERT INTO `t_role_resource` VALUES (654, 1, 124);
INSERT INTO `t_role_resource` VALUES (655, 1, 125);
INSERT INTO `t_role_resource` VALUES (657, 1, 131);
INSERT INTO `t_role_resource` VALUES (658, 1, 132);
INSERT INTO `t_role_resource` VALUES (659, 1, 133);
INSERT INTO `t_role_resource` VALUES (660, 1, 134);
INSERT INTO `t_role_resource` VALUES (662, 1, 141);
INSERT INTO `t_role_resource` VALUES (663, 1, 142);
INSERT INTO `t_role_resource` VALUES (664, 1, 143);
INSERT INTO `t_role_resource` VALUES (665, 1, 144);
INSERT INTO `t_role_resource` VALUES (674, 1, 221);
INSERT INTO `t_role_resource` VALUES (671, 1, 222);
INSERT INTO `t_role_resource` VALUES (672, 1, 223);
INSERT INTO `t_role_resource` VALUES (673, 1, 224);
INSERT INTO `t_role_resource` VALUES (682, 1, 226);
INSERT INTO `t_role_resource` VALUES (680, 1, 227);
INSERT INTO `t_role_resource` VALUES (681, 1, 228);
INSERT INTO `t_role_resource` VALUES (679, 1, 229);
INSERT INTO `t_role_resource` VALUES (666, 1, 230);
INSERT INTO `t_role_resource` VALUES (667, 1, 231);
INSERT INTO `t_role_resource` VALUES (668, 1, 232);
INSERT INTO `t_role_resource` VALUES (669, 1, 233);
INSERT INTO `t_role_resource` VALUES (670, 1, 234);
INSERT INTO `t_role_resource` VALUES (675, 1, 235);
INSERT INTO `t_role_resource` VALUES (676, 1, 236);
INSERT INTO `t_role_resource` VALUES (677, 1, 237);
INSERT INTO `t_role_resource` VALUES (678, 1, 238);
INSERT INTO `t_role_resource` VALUES (437, 2, 1);
INSERT INTO `t_role_resource` VALUES (438, 2, 13);
INSERT INTO `t_role_resource` VALUES (439, 2, 131);
INSERT INTO `t_role_resource` VALUES (440, 2, 132);
INSERT INTO `t_role_resource` VALUES (441, 2, 133);
INSERT INTO `t_role_resource` VALUES (445, 2, 221);
INSERT INTO `t_role_resource` VALUES (442, 2, 222);
INSERT INTO `t_role_resource` VALUES (443, 2, 223);
INSERT INTO `t_role_resource` VALUES (444, 2, 224);
INSERT INTO `t_role_resource` VALUES (446, 2, 227);
INSERT INTO `t_role_resource` VALUES (447, 2, 228);
INSERT INTO `t_role_resource` VALUES (158, 3, 1);
INSERT INTO `t_role_resource` VALUES (159, 3, 11);
INSERT INTO `t_role_resource` VALUES (164, 3, 12);
INSERT INTO `t_role_resource` VALUES (170, 3, 13);
INSERT INTO `t_role_resource` VALUES (175, 3, 14);
INSERT INTO `t_role_resource` VALUES (160, 3, 111);
INSERT INTO `t_role_resource` VALUES (161, 3, 112);
INSERT INTO `t_role_resource` VALUES (162, 3, 113);
INSERT INTO `t_role_resource` VALUES (163, 3, 114);
INSERT INTO `t_role_resource` VALUES (165, 3, 121);
INSERT INTO `t_role_resource` VALUES (166, 3, 122);
INSERT INTO `t_role_resource` VALUES (167, 3, 123);
INSERT INTO `t_role_resource` VALUES (168, 3, 124);
INSERT INTO `t_role_resource` VALUES (169, 3, 125);
INSERT INTO `t_role_resource` VALUES (171, 3, 131);
INSERT INTO `t_role_resource` VALUES (172, 3, 132);
INSERT INTO `t_role_resource` VALUES (173, 3, 133);
INSERT INTO `t_role_resource` VALUES (174, 3, 134);
INSERT INTO `t_role_resource` VALUES (176, 3, 141);
INSERT INTO `t_role_resource` VALUES (177, 3, 142);
INSERT INTO `t_role_resource` VALUES (178, 3, 143);
INSERT INTO `t_role_resource` VALUES (179, 3, 144);
INSERT INTO `t_role_resource` VALUES (359, 7, 1);
INSERT INTO `t_role_resource` VALUES (360, 7, 14);
INSERT INTO `t_role_resource` VALUES (361, 7, 141);
INSERT INTO `t_role_resource` VALUES (362, 7, 142);
INSERT INTO `t_role_resource` VALUES (363, 7, 143);
INSERT INTO `t_role_resource` VALUES (367, 7, 221);
INSERT INTO `t_role_resource` VALUES (364, 7, 222);
INSERT INTO `t_role_resource` VALUES (365, 7, 223);
INSERT INTO `t_role_resource` VALUES (366, 7, 224);
INSERT INTO `t_role_resource` VALUES (368, 7, 226);
INSERT INTO `t_role_resource` VALUES (546, 8, 1);
INSERT INTO `t_role_resource` VALUES (547, 8, 11);
INSERT INTO `t_role_resource` VALUES (549, 8, 12);
INSERT INTO `t_role_resource` VALUES (551, 8, 13);
INSERT INTO `t_role_resource` VALUES (553, 8, 14);
INSERT INTO `t_role_resource` VALUES (548, 8, 111);
INSERT INTO `t_role_resource` VALUES (550, 8, 121);
INSERT INTO `t_role_resource` VALUES (552, 8, 131);
INSERT INTO `t_role_resource` VALUES (554, 8, 141);
INSERT INTO `t_role_resource` VALUES (563, 8, 221);
INSERT INTO `t_role_resource` VALUES (560, 8, 222);
INSERT INTO `t_role_resource` VALUES (561, 8, 223);
INSERT INTO `t_role_resource` VALUES (562, 8, 224);
INSERT INTO `t_role_resource` VALUES (564, 8, 227);
INSERT INTO `t_role_resource` VALUES (565, 8, 228);
INSERT INTO `t_role_resource` VALUES (566, 8, 229);
INSERT INTO `t_role_resource` VALUES (555, 8, 230);
INSERT INTO `t_role_resource` VALUES (556, 8, 231);
INSERT INTO `t_role_resource` VALUES (557, 8, 232);
INSERT INTO `t_role_resource` VALUES (558, 8, 233);
INSERT INTO `t_role_resource` VALUES (559, 8, 234);
COMMIT;

-- ----------------------------
-- Table structure for t_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict`;
CREATE TABLE `t_sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编码ID',
  `dict_type` varchar(64) DEFAULT NULL COMMENT '类别',
  `dict_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `dict_key` varchar(64) NOT NULL DEFAULT '' COMMENT '键',
  `dict_value` varchar(128) NOT NULL DEFAULT '' COMMENT '值',
  `seq` tinyint(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='字典';

-- ----------------------------
-- Records of t_sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_dict` VALUES (1, 'adminSex', '性别-男', '0', '男', 0, '2018-04-21 12:45:34');
INSERT INTO `t_sys_dict` VALUES (2, 'adminSex', '性别-女', '1', '女', 1, '2018-04-21 12:45:34');
INSERT INTO `t_sys_dict` VALUES (3, 'dbStatus', '数据库状态-失效', '0', '失效', 0, '2018-04-21 12:46:37');
INSERT INTO `t_sys_dict` VALUES (4, 'dbStatus', '数据库状态-正常', '1', '正常', 1, '2018-04-21 12:46:59');
INSERT INTO `t_sys_dict` VALUES (5, 'adminLocked', '锁定-否', '0', '否', 0, '2018-04-21 12:50:56');
INSERT INTO `t_sys_dict` VALUES (6, 'adminLocked', '锁定-是', '1', '是', 1, '2018-04-21 12:51:15');
INSERT INTO `t_sys_dict` VALUES (7, 'adminType', 'admin类型-管理员', '0', '管理员', 1, '2018-04-21 12:52:27');
INSERT INTO `t_sys_dict` VALUES (8, 'adminType', 'admin类型-用户', '1', '用户', 0, '2018-04-21 12:52:49');
INSERT INTO `t_sys_dict` VALUES (9, 'resourceType', '资源类型-菜单', '0', '菜单', 0, '2018-04-21 12:53:51');
INSERT INTO `t_sys_dict` VALUES (10, 'resourceType', '资源类型-按钮', '1', '按钮', 1, '2018-04-21 12:54:09');
INSERT INTO `t_sys_dict` VALUES (11, 'resourceOpened', '资源菜单打开状态-打开', '1', '打开', 0, '2018-04-21 12:55:41');
INSERT INTO `t_sys_dict` VALUES (12, 'resourceOpened', '资源菜单打开状态-关闭', '0', '关闭', 1, '2018-04-21 12:56:07');
INSERT INTO `t_sys_dict` VALUES (13, 'resourceOpenMode', '资源打开方式-ajax', 'ajax', 'ajax', 0, '2018-04-21 15:17:03');
INSERT INTO `t_sys_dict` VALUES (14, 'resourceOpenMode', '资源打开方式-iframe', 'iframe', 'iframe', 0, '2018-04-21 15:17:25');
COMMIT;

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(20) DEFAULT NULL COMMENT '登陆名',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `operation` varchar(64) DEFAULT NULL COMMENT '操作',
  `class_method` varchar(100) NOT NULL COMMENT '类-方法',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `client_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '客户端ip',
  `create_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of t_sys_log
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_log` VALUES (1, 'admin', 'admin,de,pm,test', '登录成功', 'net.dreamlu.secrity.auth.DreamAuthHandler.onAuthenticationSuccess();', '/session?username＝admin＆password＝******＆code＝6s4u＆remember-me＝true', '0:0:0:0:0:0:0:1', '2019-08-02 09:22:59');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
