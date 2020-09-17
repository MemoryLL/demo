/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 127.0.0.1:3306
 Source Schema         : demo1

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 17/09/2020 18:49:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `p_id` int(11) NOT NULL COMMENT '父id',
  `status` tinyint(255) NOT NULL DEFAULT 0 COMMENT '状态 0-正常 1-禁用（删除）',
  `resource_type` tinyint(255) NOT NULL COMMENT '类型 0-菜单 1-页面 2-按钮',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_check` tinyint(255) NOT NULL DEFAULT 1 COMMENT '是否选中 0-是 1否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, '主页', NULL, '', '主页菜单', 0, 0, 0, NULL, '2020-08-07 18:29:43', 1);
INSERT INTO `resource` VALUES (2, '控制台', NULL, '/console.html', '控制台页面', 1, 0, 1, NULL, '2020-08-07 18:30:38', 1);
INSERT INTO `resource` VALUES (3, '页面', NULL, '', '页面菜单', 0, 0, 0, NULL, '2020-08-07 18:32:18', 1);
INSERT INTO `resource` VALUES (4, '表单', NULL, '/form.html', '表单页面', 3, 0, 1, NULL, '2020-08-07 18:32:41', 1);
INSERT INTO `resource` VALUES (5, '用户', NULL, '', '用户菜单', 0, 0, 0, NULL, '2020-08-07 18:36:48', 1);
INSERT INTO `resource` VALUES (6, '用户组', NULL, '/user.html', '用户组', 5, 0, 1, NULL, '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (7, '角色配置', NULL, '/role.html', '角色配置', 8, 0, 1, NULL, '2020-08-07 17:33:52', 1);
INSERT INTO `resource` VALUES (8, '系统设置', NULL, NULL, '系统设置', 0, 0, 0, NULL, '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (9, '资源配置', NULL, '/resources.html', '资源配置', 8, 0, 1, NULL, '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (23, '添加用户', NULL, '/addUser_btn', '添加用户', 6, 0, 2, '2020-08-10 18:48:17', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (24, '编辑用户', NULL, '/editUser_btn', '编辑用户', 6, 0, 2, '2020-08-10 18:49:16', '2020-08-10 18:50:25', 1);
INSERT INTO `resource` VALUES (25, '添加资源', NULL, '/addResource_btn', '添加资源', 9, 0, 2, '2020-08-10 18:50:07', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (26, '修改资源', NULL, '/editResource_btn', '修改资源', 9, 0, 2, '2020-08-10 18:51:35', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (27, '查看用户', NULL, '/checkUser_btn', '查看用户', 6, 0, 2, '2020-08-12 15:36:22', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (28, '修改用户状态', NULL, '/updateUserStatus_btn', '修改用户状态', 6, 0, 2, '2020-08-12 15:37:03', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (29, '查看资源', NULL, '/checkResource_btn', '查看资源', 9, 0, 2, '2020-08-12 15:37:42', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (30, '修改资源状态', NULL, '/updateResourceStatus_btn', '修改资源状态', 9, 0, 2, '2020-08-12 15:38:29', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (31, '添加角色', NULL, '/addRole_btn', '添加角色', 7, 0, 2, '2020-08-12 15:40:02', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (32, '查看角色', NULL, '/checkRole_btn', '查看角色', 7, 0, 2, '2020-08-12 15:40:28', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (33, '编辑角色', NULL, '/editRole_btn', '编辑角色', 7, 0, 2, '2020-08-12 15:41:01', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (34, '修改角色状态', NULL, '/updateRoleStatus_btn', '修改角色状态', 7, 0, 2, '2020-08-12 15:41:36', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (35, '系统日志', NULL, '/systemLog', '系统日志', 8, 0, 1, '2020-09-17 16:22:35', '1970-01-01 08:00:01', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `role_level` tinyint(255) DEFAULT NULL COMMENT '角色级别  0-系统 1-普通',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建用户主键',
  `update_user_id` int(11) DEFAULT NULL COMMENT '修改用户主键',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `status` tinyint(255) NOT NULL DEFAULT 0 COMMENT '状态 0-正常 1-禁用(删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', '系统级角色', 0, NULL, NULL, '2020-08-12 15:56:45', '1970-01-01 08:00:01', 0);
INSERT INTO `role` VALUES (2, 'user', '普通角色', 1, NULL, 1, '2020-08-12 16:00:20', '2020-09-17 18:08:34', 0);

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `resource_id` int(11) DEFAULT NULL COMMENT '资源id',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (1, 1, 1, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (2, 1, 2, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (3, 1, 3, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (4, 1, 4, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (5, 1, 5, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (6, 1, 6, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (7, 1, 23, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (8, 1, 24, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (9, 1, 27, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (10, 1, 28, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (11, 1, 8, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (12, 1, 7, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (13, 1, 31, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (14, 1, 32, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (15, 1, 33, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (16, 1, 34, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (17, 1, 9, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (18, 1, 25, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (19, 1, 26, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (20, 1, 29, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (21, 1, 30, '2020-08-12 15:56:45');
INSERT INTO `role_resource` VALUES (37, 1, 35, '2020-09-17 16:26:23');
INSERT INTO `role_resource` VALUES (39, 2, 1, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (40, 2, 2, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (41, 2, 3, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (42, 2, 4, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (43, 2, 5, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (44, 2, 6, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (45, 2, 27, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (46, 2, 8, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (47, 2, 7, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (48, 2, 32, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (49, 2, 9, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (50, 2, 25, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (51, 2, 26, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (52, 2, 29, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (53, 2, 30, '2020-09-17 18:09:31');
INSERT INTO `role_resource` VALUES (54, 2, 35, '2020-09-17 18:09:31');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log`  (
  `sys_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `c_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `create_date` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`sys_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES (1, '192.168.1.2', '用户登录成功', '登录', 1, '2020-09-17 16:19:49');
INSERT INTO `system_log` VALUES (2, '192.168.1.2', '用户登录成功', '登录', 1, '2020-09-17 18:07:24');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件/头像',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '城市',
  `state` tinyint(255) DEFAULT 0 COMMENT '状态 0-正常 1-禁用(删除)',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'system', '4dab168d05369c15371c7d75844635d9', 20, '123@qq,com', '1597219313349_小和尚.jpg', '男', '杭州', 0, '2020-08-12 16:02:01', '2020-09-16 22:23:37');
INSERT INTO `user` VALUES (2, 'zs', '4dab168d05369c15371c7d75844635d9', 21, '789@qq.com', '1597219369904_小和尚.jpg', '女', '深圳', 0, '2020-08-12 16:02:55', '2020-09-16 22:23:39');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1, '2020-08-12 16:02:01');
INSERT INTO `user_role` VALUES (2, 2, 2, '2020-08-12 16:02:55');

SET FOREIGN_KEY_CHECKS = 1;
