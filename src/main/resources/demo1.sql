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

 Date: 25/10/2020 18:51:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '班级名',
  `class_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '班级编号',
  `class_teacher_id` int(11) DEFAULT NULL COMMENT '班主任id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系部id',
  `dep_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '系部名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `department_head_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系主任',
  `create_time` datetime(0) DEFAULT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系部表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '信息技术(网监)系', '信息技术(网监)系是本校王牌系，曾多次荣获国家级奖励', '王五', '2020-10-24 15:28:39', '1970-01-01 08:00:01');
INSERT INTO `department` VALUES (2, '侦查系', '主要担负侦查学、禁毒学两个本科专业课程的理论与实训教学', '王五', '2020-10-25 18:18:19', '1970-01-01 08:00:01');

-- ----------------------------
-- Table structure for floor
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '楼名',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) DEFAULT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '楼层表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `dep_id` int(11) DEFAULT NULL COMMENT '所属系部id',
  `major_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '专业名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) DEFAULT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, 1, '计算机科学与技术', '计算机科学与技术计算机科学与技术计算机科学与技术', '2020-10-25 18:32:50', '1970-01-01 08:00:01');

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
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, '主页', NULL, '', '主页菜单', 0, 0, 0, NULL, '2020-08-07 18:29:43', 1);
INSERT INTO `resource` VALUES (2, '控制台', NULL, '/console.html', '控制台页面', 1, 0, 1, NULL, '2020-08-07 18:30:38', 1);
INSERT INTO `resource` VALUES (3, '学生管理', NULL, '', '学生管理', 0, 0, 0, NULL, '2020-10-23 19:12:46', 1);
INSERT INTO `resource` VALUES (4, '学生信息', NULL, '/student.html', '学生信息', 3, 0, 1, NULL, '2020-10-24 14:26:15', 1);
INSERT INTO `resource` VALUES (5, '用户设置', NULL, '', '用户菜单', 0, 0, 0, NULL, '2020-10-23 19:11:00', 1);
INSERT INTO `resource` VALUES (6, '用户管理', NULL, '/user.html', '用户管理', 5, 0, 1, NULL, '2020-10-23 19:28:31', 1);
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
INSERT INTO `resource` VALUES (35, '系统日志', NULL, '/systemLog.html', '系统日志', 8, 0, 1, '2020-09-17 16:22:35', '2020-09-17 18:58:47', 1);
INSERT INTO `resource` VALUES (36, '数据字典', NULL, NULL, '数据字典', 0, 0, 0, '2020-10-23 19:13:54', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (37, '班级管理', NULL, '/class.html', '班级管理', 36, 0, 1, '2020-10-23 19:16:55', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (38, '系部管理', NULL, '/department.html', '系部管理', 36, 0, 1, '2020-10-23 19:17:37', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (40, '楼层管理', NULL, '/floor.html', '楼层管理', 36, 0, 1, '2020-10-23 19:19:49', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (41, '专业管理', NULL, '/major.html', '专业管理', 36, 0, 1, '2020-10-23 19:20:18', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (42, '寝室管理', NULL, '/room.html', '寝室管理', 36, 0, 1, '2020-10-23 19:20:57', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (43, '新增系部按钮', NULL, '/addDepartment_btn', '新增系部按钮', 38, 0, 2, '2020-10-24 15:36:08', '2020-10-25 17:40:34', 1);
INSERT INTO `resource` VALUES (44, '查看系部按钮', NULL, '/checkDep_btn', '查看系部按钮', 38, 0, 2, '2020-10-25 17:37:52', '2020-10-25 17:40:14', 1);
INSERT INTO `resource` VALUES (45, '编辑系部按钮', NULL, '/editDep_btn', '编辑系部按钮', 38, 0, 2, '2020-10-25 17:38:20', '2020-10-25 17:39:41', 1);
INSERT INTO `resource` VALUES (46, '新增专业按钮', NULL, '/addMajor_btn', '新增专业按钮', 41, 0, 2, '2020-10-25 17:39:12', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (47, '查看专业按钮', NULL, '/checkMajor_btn', '查看专业按钮', 41, 0, 2, '2020-10-25 17:41:31', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (48, '修改专业按钮', NULL, '/editMajor_btn', '修改专业按钮', 41, 0, 2, '2020-10-25 17:42:12', '1970-01-01 08:00:01', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', '系统级角色', 0, NULL, 1, '2020-08-12 15:56:45', '2020-10-23 19:23:45', 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
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
INSERT INTO `role_resource` VALUES (114, 1, 1, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (115, 1, 2, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (116, 1, 3, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (117, 1, 4, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (118, 1, 5, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (119, 1, 6, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (120, 1, 23, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (121, 1, 24, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (122, 1, 27, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (123, 1, 28, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (124, 1, 8, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (125, 1, 7, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (126, 1, 31, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (127, 1, 32, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (128, 1, 33, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (129, 1, 34, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (130, 1, 9, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (131, 1, 25, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (132, 1, 26, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (133, 1, 29, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (134, 1, 30, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (135, 1, 35, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (136, 1, 36, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (137, 1, 37, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (138, 1, 38, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (139, 1, 43, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (140, 1, 44, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (141, 1, 45, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (142, 1, 40, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (143, 1, 41, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (144, 1, 46, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (145, 1, 47, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (146, 1, 48, '2020-10-25 17:42:43');
INSERT INTO `role_resource` VALUES (147, 1, 42, '2020-10-25 17:42:43');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floor_id` int(11) DEFAULT NULL,
  `room_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '寝室表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stu_number` int(11) NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dep_id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP(0),
  `statue` tinyint(255) NOT NULL DEFAULT 0 COMMENT '0-未毕业 1-已毕业',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `test`(`class_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log`  (
  `sys_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resource_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `create_date` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`sys_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES (1, '192.168.1.2', '用户登录成功', '登录', 1, '2020-09-17 16:19:49');
INSERT INTO `system_log` VALUES (2, '192.168.1.2', '用户登录成功', '登录', 1, '2020-09-17 18:07:24');
INSERT INTO `system_log` VALUES (3, '192.168.1.2', '用户system登录成功', '用户登录', 1, '2020-09-17 19:00:06');
INSERT INTO `system_log` VALUES (4, '192.168.1.2', '用户system登录成功', '用户登录', 1, '2020-09-18 22:24:59');
INSERT INTO `system_log` VALUES (5, '192.168.1.2', '用户system登录成功', '用户登录', 1, '2020-09-22 18:27:24');
INSERT INTO `system_log` VALUES (6, '192.168.1.2', '用户system登录成功', '用户登录', 1, '2020-09-22 18:38:10');
INSERT INTO `system_log` VALUES (7, '192.168.1.2', '用户system登录成功', '用户登录', 1, '2020-09-22 18:44:10');
INSERT INTO `system_log` VALUES (8, '192.168.1.2', '用户zs登录成功', '用户登录', 2, '2020-09-22 18:46:13');
INSERT INTO `system_log` VALUES (9, '192.168.1.2', '用户system登录成功', '用户登录', 1, '2020-09-28 22:03:32');
INSERT INTO `system_log` VALUES (10, '192.168.1.2', '用户system登录成功', '用户登录', 1, '2020-09-28 22:04:52');
INSERT INTO `system_log` VALUES (11, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 15:23:02');
INSERT INTO `system_log` VALUES (12, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 15:26:43');
INSERT INTO `system_log` VALUES (13, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 15:27:46');
INSERT INTO `system_log` VALUES (14, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 16:14:32');
INSERT INTO `system_log` VALUES (15, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 16:16:01');
INSERT INTO `system_log` VALUES (16, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 16:21:48');
INSERT INTO `system_log` VALUES (17, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 16:32:38');
INSERT INTO `system_log` VALUES (18, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 16:33:30');
INSERT INTO `system_log` VALUES (19, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 16:37:26');
INSERT INTO `system_log` VALUES (20, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 16:41:02');
INSERT INTO `system_log` VALUES (21, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 16:49:30');
INSERT INTO `system_log` VALUES (22, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 16:53:22');
INSERT INTO `system_log` VALUES (23, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 16:55:35');
INSERT INTO `system_log` VALUES (24, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 17:01:06');
INSERT INTO `system_log` VALUES (25, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 17:05:34');
INSERT INTO `system_log` VALUES (26, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 17:22:00');
INSERT INTO `system_log` VALUES (27, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 17:23:36');
INSERT INTO `system_log` VALUES (28, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 17:24:22');
INSERT INTO `system_log` VALUES (29, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 17:26:59');
INSERT INTO `system_log` VALUES (30, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 17:30:22');
INSERT INTO `system_log` VALUES (31, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 17:38:38');
INSERT INTO `system_log` VALUES (32, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 17:40:02');
INSERT INTO `system_log` VALUES (33, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 17:41:05');
INSERT INTO `system_log` VALUES (34, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 17:52:45');
INSERT INTO `system_log` VALUES (35, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 17:55:48');
INSERT INTO `system_log` VALUES (36, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 18:02:13');
INSERT INTO `system_log` VALUES (37, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 18:06:30');
INSERT INTO `system_log` VALUES (38, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 18:09:08');
INSERT INTO `system_log` VALUES (39, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-23 19:09:05');
INSERT INTO `system_log` VALUES (40, '192.168.1.5', '修改资源成功', '修改资源', 1, '2020-10-23 19:10:17');
INSERT INTO `system_log` VALUES (41, '192.168.1.5', '修改资源成功', '修改资源', 1, '2020-10-23 19:11:01');
INSERT INTO `system_log` VALUES (42, '192.168.1.5', '修改资源成功', '修改资源', 1, '2020-10-23 19:12:47');
INSERT INTO `system_log` VALUES (43, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-23 19:13:54');
INSERT INTO `system_log` VALUES (44, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-23 19:16:55');
INSERT INTO `system_log` VALUES (45, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-23 19:17:37');
INSERT INTO `system_log` VALUES (46, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-23 19:18:57');
INSERT INTO `system_log` VALUES (47, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-23 19:19:49');
INSERT INTO `system_log` VALUES (48, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-23 19:20:18');
INSERT INTO `system_log` VALUES (49, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-23 19:20:57');
INSERT INTO `system_log` VALUES (50, '192.168.1.5', '修改资源成功', '修改资源', 1, '2020-10-23 19:22:42');
INSERT INTO `system_log` VALUES (51, '192.168.1.5', '修改角色成功', '修改角色', 1, '2020-10-23 19:23:46');
INSERT INTO `system_log` VALUES (52, '192.168.1.5', '修改资源成功', '修改资源', 1, '2020-10-23 19:28:31');
INSERT INTO `system_log` VALUES (53, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-24 15:32:08');
INSERT INTO `system_log` VALUES (54, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-24 15:36:08');
INSERT INTO `system_log` VALUES (55, '192.168.1.5', '修改角色成功', '修改角色', 1, '2020-10-24 15:36:28');
INSERT INTO `system_log` VALUES (56, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-24 15:37:17');
INSERT INTO `system_log` VALUES (57, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-24 15:39:41');
INSERT INTO `system_log` VALUES (58, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-24 15:46:04');
INSERT INTO `system_log` VALUES (59, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-24 15:48:07');
INSERT INTO `system_log` VALUES (60, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-24 15:52:47');
INSERT INTO `system_log` VALUES (61, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-24 15:55:07');
INSERT INTO `system_log` VALUES (62, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-24 16:00:06');
INSERT INTO `system_log` VALUES (63, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-24 16:08:37');
INSERT INTO `system_log` VALUES (64, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-24 18:37:01');
INSERT INTO `system_log` VALUES (65, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-24 19:15:08');
INSERT INTO `system_log` VALUES (66, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-25 17:36:37');
INSERT INTO `system_log` VALUES (67, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-25 17:37:52');
INSERT INTO `system_log` VALUES (68, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-25 17:38:20');
INSERT INTO `system_log` VALUES (69, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-25 17:39:12');
INSERT INTO `system_log` VALUES (70, '192.168.1.5', '修改资源成功', '修改资源', 1, '2020-10-25 17:39:41');
INSERT INTO `system_log` VALUES (71, '192.168.1.5', '修改资源成功', '修改资源', 1, '2020-10-25 17:40:15');
INSERT INTO `system_log` VALUES (72, '192.168.1.5', '修改资源成功', '修改资源', 1, '2020-10-25 17:40:34');
INSERT INTO `system_log` VALUES (73, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-25 17:41:31');
INSERT INTO `system_log` VALUES (74, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-10-25 17:42:12');
INSERT INTO `system_log` VALUES (75, '192.168.1.5', '修改角色成功', '修改角色', 1, '2020-10-25 17:42:43');
INSERT INTO `system_log` VALUES (76, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-25 17:45:01');
INSERT INTO `system_log` VALUES (77, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-25 17:52:31');
INSERT INTO `system_log` VALUES (78, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-25 17:54:58');
INSERT INTO `system_log` VALUES (79, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-25 17:58:19');
INSERT INTO `system_log` VALUES (80, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-25 18:03:38');
INSERT INTO `system_log` VALUES (81, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-25 18:13:28');
INSERT INTO `system_log` VALUES (82, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-25 18:17:59');
INSERT INTO `system_log` VALUES (83, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-25 18:30:19');
INSERT INTO `system_log` VALUES (84, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-25 18:32:18');
INSERT INTO `system_log` VALUES (85, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-25 18:37:19');
INSERT INTO `system_log` VALUES (86, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-10-25 18:43:01');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1, '2020-08-12 16:02:01');
INSERT INTO `user_role` VALUES (2, 2, 2, '2020-08-12 16:02:55');

SET FOREIGN_KEY_CHECKS = 1;
