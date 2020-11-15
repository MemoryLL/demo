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

 Date: 15/11/2020 19:15:36
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
  `major_id` int(11) NOT NULL COMMENT '专业id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-正常 1-已毕业',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '计科01', 1, '2020-11-11 16:03:53', '1970-01-01 08:00:01', 0);
INSERT INTO `class` VALUES (2, '计科02', 1, '2020-11-11 16:04:07', '1970-01-01 08:00:01', 0);
INSERT INTO `class` VALUES (3, '信安01', 2, '2020-11-11 16:04:27', '1970-01-01 08:00:01', 0);
INSERT INTO `class` VALUES (4, '信安02', 2, '2020-11-11 16:04:39', '1970-01-01 08:00:01', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系部表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '信息技术(网监)系', '信息技术(网监)系是本校王牌系，曾多次荣获国家级奖励', '王五', '2020-10-24 15:28:39', '1970-01-01 08:00:01');
INSERT INTO `department` VALUES (2, '侦查系', '主要担负侦查学、禁毒学两个本科专业课程的理论与实训教学', '王五', '2020-10-25 18:18:19', '1970-01-01 08:00:01');
INSERT INTO `department` VALUES (3, '土木工程系', '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试', '张全蛋', '2020-10-26 20:44:20', '1970-01-01 08:00:01');

-- ----------------------------
-- Table structure for floor
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '楼名',
  `descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) DEFAULT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '楼层表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of floor
-- ----------------------------
INSERT INTO `floor` VALUES (1, '一栋宿舍', '一栋宿舍一栋宿舍一栋宿舍一栋宿舍一栋宿舍一栋宿舍一栋宿舍一栋宿舍一栋宿舍一栋宿舍', '2020-11-11 16:48:02', '1970-01-01 08:00:01');
INSERT INTO `floor` VALUES (2, '二栋宿舍', '二栋宿舍二栋宿舍二栋宿舍二栋宿舍二栋宿舍二栋宿舍二栋宿舍二栋宿舍二栋宿舍二栋宿舍二栋宿舍二栋宿舍二栋宿舍', '2020-11-11 16:48:19', '1970-01-01 08:00:01');
INSERT INTO `floor` VALUES (3, '三栋宿舍', '三栋宿舍三栋宿舍三栋宿舍三栋宿舍三栋宿舍三栋宿舍三栋宿舍三栋宿舍三栋宿舍三栋宿舍', '2020-11-11 16:48:30', '1970-01-01 08:00:01');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, 1, '计算机科学与技术', '计算机科学与技术计算机科学与技术计算机科学与技术', '2020-10-25 18:32:50', '1970-01-01 08:00:01');
INSERT INTO `major` VALUES (2, 1, '信息安全', '信息安全信息安全信息安全信息安全信息安全信息安全信息安全信息安全', '2020-11-11 15:44:37', '1970-01-01 08:00:01');

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
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源表' ROW_FORMAT = Dynamic;

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
INSERT INTO `resource` VALUES (49, '教职工管理', NULL, '/staff.html', '教职工管理', 36, 0, 1, '2020-10-26 20:01:02', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (50, '添加教职工按钮', NULL, '/addStaff_btn', '添加教职工按钮', 49, 0, 2, '2020-10-26 20:01:45', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (51, '查看教职工按钮', NULL, '/checkStaff_btn', '查看教职工按钮', 49, 0, 2, '2020-10-26 20:02:23', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (52, '编辑教职工按钮', NULL, '/editStaff_btn', '编辑教职工按钮', 49, 0, 2, '2020-10-26 20:02:47', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (53, '新增班级按钮', NULL, '/addClass_btn', '新增班级按钮', 37, 0, 2, '2020-11-11 15:22:34', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (54, '班级详情按钮', NULL, '/checkClass_btn', '班级详情按钮', 37, 0, 2, '2020-11-11 15:23:11', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (55, '编辑班级按钮', NULL, '/editClass_btn', '编辑班级按钮', 37, 0, 2, '2020-11-11 15:23:42', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (56, '修改班级状态按钮', NULL, '/updateClassStatus_btn', '修改班级状态按钮', 37, 0, 2, '2020-11-11 15:24:11', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (57, '添加宿舍楼按钮', NULL, '/addFloor_btn', '添加宿舍楼按钮', 40, 0, 2, '2020-11-11 16:46:21', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (58, '查看宿舍楼详情按钮', NULL, '/checkFloor_btn', '查看宿舍楼详情按钮', 40, 0, 2, '2020-11-11 16:46:53', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (59, '编辑宿舍楼按钮', NULL, '/editFloor_btn', '编辑宿舍楼按钮', 40, 0, 2, '2020-11-11 16:47:20', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (60, '查看宿舍详情按钮', NULL, '/checkRoom_btn', '查看宿舍详情按钮', 42, 0, 2, '2020-11-12 16:40:47', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (61, '编辑宿舍按钮', NULL, '/editRoom_btn', '编辑宿舍按钮', 42, 0, 2, '2020-11-12 16:41:15', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (62, '添加宿舍按钮', NULL, '/addRoom_btn', '添加宿舍按钮', 42, 0, 2, '2020-11-12 16:41:46', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (63, '添加学生信息按钮', NULL, '/addStudent_btn', '添加学生信息按钮', 4, 0, 2, '2020-11-15 18:32:04', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (64, '查看学生信息详情按钮', NULL, '/checkStudent_btn', '查看学生信息详情按钮', 4, 0, 2, '2020-11-15 18:32:34', '1970-01-01 08:00:01', 1);
INSERT INTO `resource` VALUES (65, '修改学生信息按钮', NULL, '/editStudent_btn', '修改学生信息按钮', 4, 0, 2, '2020-11-15 18:32:59', '1970-01-01 08:00:01', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 372 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色资源表' ROW_FORMAT = Dynamic;

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
INSERT INTO `role_resource` VALUES (321, 1, 1, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (322, 1, 2, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (323, 1, 3, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (324, 1, 4, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (325, 1, 63, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (326, 1, 64, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (327, 1, 65, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (328, 1, 5, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (329, 1, 6, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (330, 1, 23, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (331, 1, 24, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (332, 1, 27, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (333, 1, 28, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (334, 1, 8, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (335, 1, 7, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (336, 1, 31, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (337, 1, 32, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (338, 1, 33, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (339, 1, 34, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (340, 1, 9, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (341, 1, 25, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (342, 1, 26, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (343, 1, 29, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (344, 1, 30, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (345, 1, 35, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (346, 1, 36, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (347, 1, 37, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (348, 1, 53, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (349, 1, 54, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (350, 1, 55, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (351, 1, 56, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (352, 1, 38, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (353, 1, 43, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (354, 1, 44, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (355, 1, 45, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (356, 1, 40, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (357, 1, 57, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (358, 1, 58, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (359, 1, 59, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (360, 1, 41, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (361, 1, 46, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (362, 1, 47, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (363, 1, 48, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (364, 1, 42, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (365, 1, 60, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (366, 1, 61, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (367, 1, 62, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (368, 1, 49, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (369, 1, 50, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (370, 1, 51, '2020-11-15 18:33:09');
INSERT INTO `role_resource` VALUES (371, 1, 52, '2020-11-15 18:33:09');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '寝室表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES (1, 1, '101', '2020-11-12 16:43:05', '1970-01-01 08:00:01');
INSERT INTO `room` VALUES (2, 1, '102', '2020-11-12 16:43:21', '1970-01-01 08:00:01');
INSERT INTO `room` VALUES (3, 2, '101', '2020-11-12 16:43:29', '1970-01-01 08:00:01');
INSERT INTO `room` VALUES (4, 2, '102', '2020-11-12 16:43:36', '1970-01-01 08:00:01');
INSERT INTO `room` VALUES (5, 3, '101', '2020-11-12 16:43:43', '1970-01-01 08:00:01');
INSERT INTO `room` VALUES (6, 3, '102', '2020-11-12 16:43:50', '1970-01-01 08:00:01');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `create_time` datetime(0) DEFAULT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01' ON UPDATE CURRENT_TIMESTAMP(0),
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教职工' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (1, '张三', '15896853698', '阿水电费第三方阿士大夫士大夫', '2020-10-26 20:22:58', '1970-01-01 08:00:01', '副教授');
INSERT INTO `staff` VALUES (2, '李四', '12369874444', '二位二翁瑞文热无为', '2020-10-26 20:23:25', '1970-01-01 08:00:01', '讲师');
INSERT INTO `staff` VALUES (3, '王五', '715700693698', '骷髅精灵苦酒水电费水电费', '2020-10-26 20:24:07', '1970-01-01 08:00:01', '副教授');
INSERT INTO `staff` VALUES (4, '赵六', '15698569856', '所答非所问任务温热无若', '2020-10-26 20:24:27', '1970-01-01 08:00:01', '教授');
INSERT INTO `staff` VALUES (5, '张全蛋', '12388889999', '似懂非懂是范德萨范德萨范德萨范德萨', '2020-10-26 20:41:16', '1970-01-01 08:00:01', '助教');

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu`  (
  `stu_number` int(11) NOT NULL,
  `stu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dep_id` int(11) NOT NULL,
  `major_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(255) NOT NULL DEFAULT 0 COMMENT '0-在校生 1-毕业生 2-休学',
  `create_time` datetime(0) DEFAULT NULL,
  `update_time` timestamp(0) NOT NULL DEFAULT '1970-01-01 08:00:01',
  PRIMARY KEY (`stu_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES (1407070344, '李红民', '15700764031', '湖南省长沙市', 1, 1, 1, 5, '男', 0, '2020-11-15 18:33:56', '1970-01-01 08:00:01');

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
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

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
INSERT INTO `system_log` VALUES (87, '169.254.110.232', '用户system登录成功', '用户登录', 1, '2020-10-26 20:00:25');
INSERT INTO `system_log` VALUES (88, '169.254.110.232', '添加资源成功', '添加资源', 1, '2020-10-26 20:01:02');
INSERT INTO `system_log` VALUES (89, '169.254.110.232', '添加资源成功', '添加资源', 1, '2020-10-26 20:01:45');
INSERT INTO `system_log` VALUES (90, '169.254.110.232', '添加资源成功', '添加资源', 1, '2020-10-26 20:02:23');
INSERT INTO `system_log` VALUES (91, '169.254.110.232', '添加资源成功', '添加资源', 1, '2020-10-26 20:02:47');
INSERT INTO `system_log` VALUES (92, '169.254.110.232', '修改角色成功', '修改角色', 1, '2020-10-26 20:02:58');
INSERT INTO `system_log` VALUES (93, '169.254.110.232', '用户system登录成功', '用户登录', 1, '2020-10-26 20:03:07');
INSERT INTO `system_log` VALUES (94, '169.254.110.232', '用户system登录成功', '用户登录', 1, '2020-10-26 20:22:15');
INSERT INTO `system_log` VALUES (95, '169.254.110.232', '用户system登录成功', '用户登录', 1, '2020-10-26 20:39:46');
INSERT INTO `system_log` VALUES (96, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-01 16:43:23');
INSERT INTO `system_log` VALUES (97, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-01 16:48:10');
INSERT INTO `system_log` VALUES (98, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-01 16:50:48');
INSERT INTO `system_log` VALUES (99, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-01 17:51:38');
INSERT INTO `system_log` VALUES (100, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-09 18:22:19');
INSERT INTO `system_log` VALUES (101, '192.168.1.5', '修改用户状态成功', '修改用户状态', 1, '2020-11-09 18:22:32');
INSERT INTO `system_log` VALUES (102, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-09 18:22:58');
INSERT INTO `system_log` VALUES (103, '192.168.1.5', '修改用户状态成功', '修改用户状态', 1, '2020-11-09 18:23:04');
INSERT INTO `system_log` VALUES (104, '192.168.1.5', '用户zs登录成功', '用户登录', 2, '2020-11-09 18:25:14');
INSERT INTO `system_log` VALUES (105, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-09 19:27:38');
INSERT INTO `system_log` VALUES (106, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-09 19:48:20');
INSERT INTO `system_log` VALUES (107, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-09 19:50:25');
INSERT INTO `system_log` VALUES (108, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-11 14:16:39');
INSERT INTO `system_log` VALUES (109, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-11 15:20:38');
INSERT INTO `system_log` VALUES (110, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-11-11 15:22:34');
INSERT INTO `system_log` VALUES (111, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-11-11 15:23:11');
INSERT INTO `system_log` VALUES (112, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-11-11 15:23:42');
INSERT INTO `system_log` VALUES (113, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-11-11 15:24:11');
INSERT INTO `system_log` VALUES (114, '192.168.1.5', '修改角色成功', '修改角色', 1, '2020-11-11 15:24:50');
INSERT INTO `system_log` VALUES (115, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-11 15:26:16');
INSERT INTO `system_log` VALUES (116, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-11 15:40:55');
INSERT INTO `system_log` VALUES (117, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-11 15:43:52');
INSERT INTO `system_log` VALUES (118, '192.168.1.5', '添加专业成功', '添加专业', 1, '2020-11-11 15:44:37');
INSERT INTO `system_log` VALUES (119, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-11 15:57:00');
INSERT INTO `system_log` VALUES (120, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-11 16:03:42');
INSERT INTO `system_log` VALUES (121, '192.168.1.5', '添加班级成功', '添加班级', 1, '2020-11-11 16:03:53');
INSERT INTO `system_log` VALUES (122, '192.168.1.5', '添加班级成功', '添加班级', 1, '2020-11-11 16:04:07');
INSERT INTO `system_log` VALUES (123, '192.168.1.5', '添加班级成功', '添加班级', 1, '2020-11-11 16:04:27');
INSERT INTO `system_log` VALUES (124, '192.168.1.5', '添加班级成功', '添加班级', 1, '2020-11-11 16:04:39');
INSERT INTO `system_log` VALUES (125, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-11 16:06:42');
INSERT INTO `system_log` VALUES (126, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-11 16:45:30');
INSERT INTO `system_log` VALUES (127, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-11-11 16:46:21');
INSERT INTO `system_log` VALUES (128, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-11-11 16:46:53');
INSERT INTO `system_log` VALUES (129, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-11-11 16:47:20');
INSERT INTO `system_log` VALUES (130, '192.168.1.5', '修改角色成功', '修改角色', 1, '2020-11-11 16:47:31');
INSERT INTO `system_log` VALUES (131, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-11 16:47:42');
INSERT INTO `system_log` VALUES (132, '192.168.1.5', '添加楼层成功', '添加楼层', 1, '2020-11-11 16:48:02');
INSERT INTO `system_log` VALUES (133, '192.168.1.5', '添加楼层成功', '添加楼层', 1, '2020-11-11 16:48:19');
INSERT INTO `system_log` VALUES (134, '192.168.1.5', '添加楼层成功', '添加楼层', 1, '2020-11-11 16:48:30');
INSERT INTO `system_log` VALUES (135, '169.254.110.232', '用户system登录成功', '用户登录', 1, '2020-11-12 16:25:32');
INSERT INTO `system_log` VALUES (136, '169.254.110.232', '用户system登录成功', '用户登录', 1, '2020-11-12 16:27:37');
INSERT INTO `system_log` VALUES (137, '169.254.110.232', '用户system登录成功', '用户登录', 1, '2020-11-12 16:34:08');
INSERT INTO `system_log` VALUES (138, '169.254.110.232', '用户system登录成功', '用户登录', 1, '2020-11-12 16:39:24');
INSERT INTO `system_log` VALUES (139, '169.254.110.232', '添加资源成功', '添加资源', 1, '2020-11-12 16:40:47');
INSERT INTO `system_log` VALUES (140, '169.254.110.232', '添加资源成功', '添加资源', 1, '2020-11-12 16:41:15');
INSERT INTO `system_log` VALUES (141, '169.254.110.232', '添加资源成功', '添加资源', 1, '2020-11-12 16:41:46');
INSERT INTO `system_log` VALUES (142, '169.254.110.232', '修改角色成功', '修改角色', 1, '2020-11-12 16:42:02');
INSERT INTO `system_log` VALUES (143, '169.254.110.232', '用户system登录成功', '用户登录', 1, '2020-11-12 16:42:13');
INSERT INTO `system_log` VALUES (144, '169.254.110.232', '用户system登录成功', '用户登录', 1, '2020-11-12 16:49:54');
INSERT INTO `system_log` VALUES (145, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-15 18:31:11');
INSERT INTO `system_log` VALUES (146, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-11-15 18:32:04');
INSERT INTO `system_log` VALUES (147, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-11-15 18:32:34');
INSERT INTO `system_log` VALUES (148, '192.168.1.5', '添加资源成功', '添加资源', 1, '2020-11-15 18:32:59');
INSERT INTO `system_log` VALUES (149, '192.168.1.5', '修改角色成功', '修改角色', 1, '2020-11-15 18:33:09');
INSERT INTO `system_log` VALUES (150, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-15 18:33:21');
INSERT INTO `system_log` VALUES (151, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-15 18:36:28');
INSERT INTO `system_log` VALUES (152, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-15 18:39:18');
INSERT INTO `system_log` VALUES (153, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-15 18:40:38');
INSERT INTO `system_log` VALUES (154, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-15 18:43:19');
INSERT INTO `system_log` VALUES (155, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-15 18:49:24');
INSERT INTO `system_log` VALUES (156, '192.168.1.5', '用户system登录成功', '用户登录', 1, '2020-11-15 18:55:11');

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
INSERT INTO `user` VALUES (2, 'zs', '4dab168d05369c15371c7d75844635d9', 21, '789@qq.com', '1597219369904_小和尚.jpg', '女', '深圳', 0, '2020-08-12 16:02:55', '2020-11-09 18:23:03');

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
