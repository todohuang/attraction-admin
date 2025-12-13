/*
 Navicat Premium Dump SQL

 Source Server         : jbp-prod
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : 47.120.11.249:3306
 Source Schema         : attraction_db

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 13/12/2025 11:23:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for poi_categories
-- ----------------------------
DROP TABLE IF EXISTS `poi_categories`;
CREATE TABLE `poi_categories`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类图标URL',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `is_active` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_category_name`(`category_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'POI分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poi_categories
-- ----------------------------
INSERT INTO `poi_categories` VALUES (1, '景点', 'default_scenic_icon.png', 1, 1, '2025-12-10 17:57:57', NULL);
INSERT INTO `poi_categories` VALUES (2, '卫生间', 'default_toilet_icon.png', 2, 1, '2025-12-10 17:57:57', NULL);
INSERT INTO `poi_categories` VALUES (3, '住宿', 'default_hotel_icon.png', 3, 1, '2025-12-10 17:57:57', '2025-12-12 13:47:02');
INSERT INTO `poi_categories` VALUES (4, '餐饮', 'default_food_icon.png', 4, 1, '2025-12-10 17:57:57', NULL);
INSERT INTO `poi_categories` VALUES (5, '演出地点', 'default_show_icon.png', 5, 1, '2025-12-10 17:57:57', NULL);
INSERT INTO `poi_categories` VALUES (6, '停车场', 'default_parking_icon.png', 6, 1, '2025-12-10 17:57:57', NULL);
INSERT INTO `poi_categories` VALUES (7, '购物', 'default_shopping_icon.png', 7, 1, '2025-12-10 17:57:57', NULL);
INSERT INTO `poi_categories` VALUES (8, '吸烟点', 'default_smoking_icon.png', 8, 1, '2025-12-10 17:57:57', NULL);

-- ----------------------------
-- Table structure for poi_category_relations
-- ----------------------------
DROP TABLE IF EXISTS `poi_category_relations`;
CREATE TABLE `poi_category_relations`  (
  `poi_id` bigint NOT NULL COMMENT 'POI ID',
  `category_id` bigint NOT NULL COMMENT 'Category ID',
  PRIMARY KEY (`poi_id`, `category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'POI辅分类关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poi_category_relations
-- ----------------------------
INSERT INTO `poi_category_relations` VALUES (1081, 5);

-- ----------------------------
-- Table structure for poi_points
-- ----------------------------
DROP TABLE IF EXISTS `poi_points`;
CREATE TABLE `poi_points`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_id` bigint NOT NULL COMMENT '所属分类ID',
  `poi_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'POI名称',
  `longitude` decimal(10, 6) NOT NULL COMMENT '经度',
  `latitude` decimal(10, 6) NOT NULL COMMENT '纬度',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '详细简介',
  `tags` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'POI标签（多个用逗号分隔）',
  `operating_hours` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '营业时间',
  `voice_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '语音导览URL',
  `voice_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'TTS语音文本内容（优先级低于voice_url）',
  `voice_duration` int NULL DEFAULT NULL COMMENT '语音时长（秒），仅音频文件有值',
  `main_image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主要图片URL',
  `visit_count` int NULL DEFAULT 0 COMMENT '访问热度',
  `is_published` tinyint(1) NULL DEFAULT 0 COMMENT '是否发布',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `fk_poi_category` FOREIGN KEY (`category_id`) REFERENCES `poi_categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'POI点位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poi_points
-- ----------------------------
INSERT INTO `poi_points` VALUES (1041, 6, '停车场', 114.956963, 27.071353, '停车场', NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:05:37', '2025-12-12 22:08:11');
INSERT INTO `poi_points` VALUES (1042, 1, '游客服务中心', 114.958235, 27.072358, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:09:41', '2025-12-13 10:01:01');
INSERT INTO `poi_points` VALUES (1043, 2, '卫生间', 114.958224, 27.072494, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:09:49', '2025-12-12 22:22:28');
INSERT INTO `poi_points` VALUES (1044, 2, '卫生间', 114.957766, 27.072795, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:10:02', '2025-12-12 22:22:22');
INSERT INTO `poi_points` VALUES (1045, 1, '医务室', 114.958332, 27.073033, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:10:19', '2025-12-13 10:00:54');
INSERT INTO `poi_points` VALUES (1046, 1, '行李寄存处', 114.958334, 27.072938, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:10:33', '2025-12-13 10:00:46');
INSERT INTO `poi_points` VALUES (1047, 2, '卫生间', 114.957841, 27.073077, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:10:52', '2025-12-12 22:21:56');
INSERT INTO `poi_points` VALUES (1048, 3, '酒店5号楼客房', 114.957089, 27.073321, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:11:10', '2025-12-12 22:21:51');
INSERT INTO `poi_points` VALUES (1049, 2, '卫生间', 114.956931, 27.073025, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:11:17', '2025-12-12 22:21:46');
INSERT INTO `poi_points` VALUES (1050, 3, '酒店4号楼客房', 114.956927, 27.072877, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:11:29', '2025-12-12 22:21:38');
INSERT INTO `poi_points` VALUES (1051, 3, '酒店6号楼客房', 114.957436, 27.073021, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:11:45', '2025-12-12 22:21:31');
INSERT INTO `poi_points` VALUES (1052, 3, '酒店3号楼客房', 114.957048, 27.072504, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:11:57', '2025-12-12 22:21:24');
INSERT INTO `poi_points` VALUES (1053, 3, '吉安欢乐世界度假酒店', 114.957143, 27.071963, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:12:25', '2025-12-12 22:21:19');
INSERT INTO `poi_points` VALUES (1054, 3, '酒店1号楼客房', 114.957381, 27.071755, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:12:38', '2025-12-12 22:21:11');
INSERT INTO `poi_points` VALUES (1055, 2, '卫生间', 114.956340, 27.071928, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:12:48', '2025-12-12 22:21:02');
INSERT INTO `poi_points` VALUES (1056, 3, '酒店2号楼客房', 114.956785, 27.072088, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:13:07', '2025-12-12 22:20:56');
INSERT INTO `poi_points` VALUES (1057, 1, '长颈鹿花园', 114.955907, 27.071431, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:13:19', '2025-12-12 22:20:47');
INSERT INTO `poi_points` VALUES (1058, 1, '火烈鸟', 114.955767, 27.072580, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:13:34', '2025-12-12 22:20:42');
INSERT INTO `poi_points` VALUES (1059, 2, '卫生间', 114.956940, 27.073028, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:13:44', '2025-12-12 22:20:36');
INSERT INTO `poi_points` VALUES (1060, 2, '卫生间', 114.957540, 27.074453, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:13:59', '2025-12-12 22:20:30');
INSERT INTO `poi_points` VALUES (1061, 1, '丛林狙击', 114.957788, 27.074553, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:14:11', '2025-12-12 22:20:21');
INSERT INTO `poi_points` VALUES (1062, 1, '量子飞车', 114.958261, 27.074793, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:14:20', '2025-12-12 22:20:17');
INSERT INTO `poi_points` VALUES (1063, 4, '摩天轮餐厅', 114.958021, 27.076043, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:14:34', '2025-12-12 22:20:12');
INSERT INTO `poi_points` VALUES (1064, 2, '卫生间', 114.958312, 27.076201, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:14:42', '2025-12-12 22:20:06');
INSERT INTO `poi_points` VALUES (1065, 2, '卫生间', 114.958229, 27.075858, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:14:49', '2025-12-12 22:20:00');
INSERT INTO `poi_points` VALUES (1066, 1, '造浪池', 114.958851, 27.076183, '浪池是乐园内最受欢迎的水上项目之一，占地面积约1万平方米，是赣中地区首个大型造浪池，模拟真实海浪的起伏，让游客仿佛置身于海边。无论是冲浪高手还是只想戏水的游客，都能在这里找到属于自己的乐趣。', NULL, NULL, NULL, '浪池是乐园内最受欢迎的水上项目之一，占地面积约1万平方米，是赣中地区首个大型造浪池，模拟真实海浪的起伏，让游客仿佛置身于海边。无论是冲浪高手还是只想戏水的游客，都能在这里找到属于自己的乐趣。', 0, NULL, 0, 1, '2025-12-12 22:15:00', '2025-12-13 10:40:55');
INSERT INTO `poi_points` VALUES (1067, 4, '雪山餐厅', 114.959736, 27.076146, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:15:11', '2025-12-12 22:19:49');
INSERT INTO `poi_points` VALUES (1068, 1, '雪域水堡', 114.959778, 27.076559, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:15:25', '2025-12-12 22:19:44');
INSERT INTO `poi_points` VALUES (1069, 2, '卫生间', 114.959272, 27.076885, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:15:35', '2025-12-12 22:19:36');
INSERT INTO `poi_points` VALUES (1070, 2, '卫生间', 114.960294, 27.076614, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:15:41', '2025-12-12 22:19:30');
INSERT INTO `poi_points` VALUES (1071, 4, '清风茶肆', 114.960385, 27.076419, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:15:56', '2025-12-12 22:19:17');
INSERT INTO `poi_points` VALUES (1072, 4, '大峡谷餐厅', 114.960471, 27.076302, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:16:03', '2025-12-12 22:19:23');
INSERT INTO `poi_points` VALUES (1073, 1, '浪花潮玩店', 114.960442, 27.075852, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:16:16', '2025-12-12 22:19:10');
INSERT INTO `poi_points` VALUES (1074, 1, '萌宝嬉水乐园', 114.959791, 27.075521, '萌宝嬉水乐园', NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:16:33', '2025-12-12 22:19:01');
INSERT INTO `poi_points` VALUES (1075, 1, '冲浪飞毯', 114.959425, 27.075481, '冲浪飞毯', NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:16:42', '2025-12-12 22:18:55');
INSERT INTO `poi_points` VALUES (1076, 1, '淋浴中心', 114.960197, 27.074973, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:16:52', '2025-12-12 22:18:48');
INSERT INTO `poi_points` VALUES (1077, 2, '卫生间', 114.959979, 27.074851, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:16:58', '2025-12-12 22:18:39');
INSERT INTO `poi_points` VALUES (1078, 1, '冲天回旋', 114.959103, 27.075726, '冲天回旋', NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:17:10', '2025-12-12 22:18:33');
INSERT INTO `poi_points` VALUES (1079, 1, '翼龙腾飞', 114.958369, 27.075180, '作为乐园最刺激的项目之一，这架过山车的轨道总长377米，最高运行速度可达63千米每小时，过山车以其高速俯冲、急速转弯和360度旋转，带给游客肾上腺素飙升的快感。无论是初次体验还是过山车爱好者，都能在这里找到心跳加速的乐趣。', NULL, NULL, NULL, '作为乐园最刺激的项目之一，这架过山车的轨道总长377米，最高运行速度可达63千米每小时，过山车以其高速俯冲、急速转弯和360度旋转，带给游客肾上腺素飙升的快感。无论是初次体验还是过山车爱好者，都能在这里找到心跳加速的乐趣。', 0, NULL, 0, 1, '2025-12-12 22:17:23', '2025-12-13 10:40:40');
INSERT INTO `poi_points` VALUES (1080, 6, '停车场', 114.959947, 27.074458, '停车场', NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-12 22:17:38', '2025-12-12 22:18:14');
INSERT INTO `poi_points` VALUES (1081, 1, '童梦剧场', 114.958294, 27.073973, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:22:29', '2025-12-13 11:22:28');
INSERT INTO `poi_points` VALUES (1082, 1, '极速飞轮', 114.957142, 27.073633, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:22:52', '2025-12-13 10:47:00');
INSERT INTO `poi_points` VALUES (1083, 1, '欢乐食堂', 114.957057, 27.073907, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:23:09', '2025-12-13 10:46:53');
INSERT INTO `poi_points` VALUES (1084, 1, '小小飞行家', 114.957695, 27.073738, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:23:22', '2025-12-13 10:46:49');
INSERT INTO `poi_points` VALUES (1085, 1, '海盗宝藏', 114.957154, 27.074458, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:23:41', '2025-12-13 10:46:46');
INSERT INTO `poi_points` VALUES (1087, 1, '大峡谷', 114.961009, 27.076175, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:28:03', '2025-12-13 10:46:34');
INSERT INTO `poi_points` VALUES (1088, 1, '欢乐对对碰', 114.957470, 27.075084, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:28:29', '2025-12-13 10:46:30');
INSERT INTO `poi_points` VALUES (1089, 1, '风暴湾检票口', 114.959560, 27.074817, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:30:55', '2025-12-13 10:46:24');
INSERT INTO `poi_points` VALUES (1090, 1, '机械部落检票口', 114.958193, 27.072882, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:32:48', '2025-12-13 10:46:22');
INSERT INTO `poi_points` VALUES (1091, 1, '机械部落售票处', 114.958410, 27.072871, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:33:10', '2025-12-13 10:46:19');
INSERT INTO `poi_points` VALUES (1092, 1, '动物王国售票处', 114.956553, 27.072631, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:33:47', '2025-12-13 10:46:16');
INSERT INTO `poi_points` VALUES (1093, 1, '动物王国检票口', 114.956577, 27.072551, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:33:54', '2025-12-13 10:46:12');
INSERT INTO `poi_points` VALUES (1094, 1, '土拨鼠', 114.956273, 27.072607, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:34:23', '2025-12-13 10:46:08');
INSERT INTO `poi_points` VALUES (1095, 4, '奇妙美食屋', 114.956334, 27.072301, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:34:44', '2025-12-13 10:46:03');
INSERT INTO `poi_points` VALUES (1096, 1, '袋鼠', 114.955785, 27.072101, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:34:56', '2025-12-13 10:45:57');
INSERT INTO `poi_points` VALUES (1097, 1, '鸵鸟', 114.955732, 27.071884, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:35:04', '2025-12-13 10:45:53');
INSERT INTO `poi_points` VALUES (1098, 1, '黑熊', 114.956450, 27.071816, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:35:20', '2025-12-13 10:45:48');
INSERT INTO `poi_points` VALUES (1099, 1, '春天来了', 114.957476, 27.072329, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:35:58', '2025-12-13 10:45:40');
INSERT INTO `poi_points` VALUES (1100, 4, '吉安老茶馆', 114.957353, 27.072542, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:36:13', '2025-12-13 10:45:35');
INSERT INTO `poi_points` VALUES (1101, 1, '后河之星', 114.958048, 27.075935, '在吉安欢乐世界的西北方向，“后河之星”摩天轮临河而立，总高 88米，是这座城市的璀璨明珠与标志性建筑。48个太空舱整齐排列，每 个舱可轻松容纳6-8人。步入舱内，液晶电视、冷暖空调、对讲机一应俱 全，给你带来舒适又便捷的体验。缓缓上升，窗外景色如诗如画，河畔风 光与外滩美景相互映衬，尽收眼底。', NULL, NULL, NULL, '在吉安欢乐世界的西北方向，“后河之星”摩天轮临河而立，总高 88米，是这座城市的璀璨明珠与标志性建筑。48个太空舱整齐排列，每 个舱可轻松容纳6-8人。步入舱内，液晶电视、冷暖空调、对讲机一应俱 全，给你带来舒适又便捷的体验。缓缓上升，窗外景色如诗如画，河畔风 光与外滩美景相互映衬，尽收眼底。作为乐园的标志性建筑，摩天轮不仅是浪漫的代名词，更是俯瞰整个吉安欢乐世界的最佳观景台。随着缓缓上升，游客可以将乐园的全景尽收眼底，尤其是在黄昏或夜晚，灯光璀璨的乐园景色令人陶醉。', 0, NULL, 0, 1, '2025-12-13 10:37:08', '2025-12-13 10:40:18');
INSERT INTO `poi_points` VALUES (1102, 1, '童趣幻想城', 114.957955, 27.075523, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:37:27', '2025-12-13 10:45:29');
INSERT INTO `poi_points` VALUES (1103, 4, '湖畔餐厅', 114.957494, 27.075450, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:37:35', '2025-12-13 10:45:18');
INSERT INTO `poi_points` VALUES (1104, 1, '趣浪方舟', 114.957298, 27.075686, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:37:46', '2025-12-13 10:45:09');
INSERT INTO `poi_points` VALUES (1105, 1, '缤纷小栈', 114.960121, 27.076151, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:38:17', '2025-12-13 10:45:02');
INSERT INTO `poi_points` VALUES (1106, 1, '欢跃浪池', 114.960116, 27.075925, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:38:37', '2025-12-13 10:44:55');
INSERT INTO `poi_points` VALUES (1107, 1, '迷你旋风碗', 114.960097, 27.075650, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:38:52', '2025-12-13 10:44:51');
INSERT INTO `poi_points` VALUES (1108, 1, '欢乐畅行桥', 114.956631, 27.072919, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:42:55', '2025-12-13 10:44:46');
INSERT INTO `poi_points` VALUES (1109, 1, '冰雪世界', 114.959191, 27.073628, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:49:45', '2025-12-13 10:54:39');
INSERT INTO `poi_points` VALUES (1110, 1, '解忧杂货铺', 114.958985, 27.073811, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:49:57', '2025-12-13 10:54:35');
INSERT INTO `poi_points` VALUES (1111, 1, '丛林探险', 114.958843, 27.074002, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:50:08', '2025-12-13 10:54:32');
INSERT INTO `poi_points` VALUES (1112, 1, '星际云游', 114.958848, 27.073687, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:50:22', '2025-12-13 10:54:29');
INSERT INTO `poi_points` VALUES (1113, 1, '云顶飞翼', 114.958932, 27.073426, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:50:43', '2025-12-13 10:54:24');
INSERT INTO `poi_points` VALUES (1114, 1, '云霄飞塔', 114.957776, 27.073421, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:51:03', '2025-12-13 10:54:22');
INSERT INTO `poi_points` VALUES (1115, 1, '旋转木马', 114.957598, 27.073435, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:51:11', '2025-12-13 10:54:18');
INSERT INTO `poi_points` VALUES (1116, 1, '霹雳炫舞', 114.957322, 27.073448, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:51:26', '2025-12-13 10:54:09');
INSERT INTO `poi_points` VALUES (1117, 1, '神秘小屋', 114.958398, 27.073254, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:51:44', '2025-12-13 10:54:06');
INSERT INTO `poi_points` VALUES (1118, 1, '贪玩派对', 114.958487, 27.074270, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:52:03', '2025-12-13 10:54:03');
INSERT INTO `poi_points` VALUES (1119, 1, '飓风飞椅', 114.959064, 27.074289, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:52:25', '2025-12-13 10:54:00');
INSERT INTO `poi_points` VALUES (1120, 1, '狂野牛仔', 114.957939, 27.074883, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:52:40', '2025-12-13 10:53:56');
INSERT INTO `poi_points` VALUES (1121, 4, '美味驿站', 114.958597, 27.074679, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:52:53', '2025-12-13 10:53:53');
INSERT INTO `poi_points` VALUES (1122, 1, '激流旋涡', 114.958814, 27.075828, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, '2025-12-13 10:53:23', '2025-12-13 10:53:47');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-12-10 14:39:06', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-12-10 14:39:06', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-12-10 14:39:06', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-12-10 14:39:06', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-12-10 14:39:06', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-12-10 14:39:06', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-12-10 14:39:06', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-12-10 14:39:07', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-10 14:38:57', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-10 14:38:57', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-10 14:38:57', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-10 14:38:57', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-10 14:38:58', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-10 14:38:58', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-10 14:38:58', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-10 14:38:58', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-10 14:38:58', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-10 14:38:58', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-12-10 14:39:06', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-12-10 14:39:05', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-12-10 14:39:07', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-12-10 14:39:07', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-12-10 14:39:07', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '1', '验证码错误', '2025-12-10 15:01:32');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-10 15:01:32');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '1', '验证码错误', '2025-12-10 15:01:35');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-10 15:01:40');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-10 19:26:30');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '1', '验证码错误', '2025-12-10 19:26:30');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-11 18:45:48');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-11 20:39:26');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-12 09:51:58');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '退出成功', '2025-12-12 09:57:27');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-12 09:57:30');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '退出成功', '2025-12-12 10:06:55');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-12 10:07:00');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '退出成功', '2025-12-12 10:23:44');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-12 10:23:50');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-12 13:43:11');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-12 14:48:46');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-12 21:41:14');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-13 09:48:05');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '1', '验证码错误', '2025-12-13 10:40:17');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-13 10:40:22');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 143', 'Windows10', '0', '登录成功', '2025-12-13 11:21:38');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2018 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-12-10 14:38:58', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-12-10 14:38:58', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-12-10 14:38:58', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2025-12-10 14:38:58', 'admin', '2025-12-10 19:27:01', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-12-10 14:38:58', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-12-10 14:38:58', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-12-10 14:38:58', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-12-10 14:38:59', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-12-10 14:38:59', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-12-10 14:38:59', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-12-10 14:38:59', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-12-10 14:38:59', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-12-10 14:38:59', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-12-10 14:38:59', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-12-10 14:38:59', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-12-10 14:38:59', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-12-10 14:38:59', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-12-10 14:38:59', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-12-10 14:38:59', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-12-10 14:38:59', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-12-10 14:38:59', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-12-10 14:38:59', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-12-10 14:38:59', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-12-10 14:38:59', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-12-10 14:38:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-12-10 14:39:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-12-10 14:39:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '景点管理', 0, 0, 'attraction', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'star', 'admin', '2025-12-10 19:24:22', 'admin', '2025-12-10 19:27:36', '景点管理目录');
INSERT INTO `sys_menu` VALUES (2001, '分类管理', 2000, 1, 'category', 'attraction/category/index', NULL, '', 1, 0, 'C', '0', '0', 'system:category:list', 'tree', 'admin', '2025-12-10 19:24:22', 'admin', '2025-12-10 19:28:04', '分类管理菜单');
INSERT INTO `sys_menu` VALUES (2002, '点位管理', 2000, 2, 'poi', 'attraction/poi/index', NULL, '', 1, 0, 'C', '0', '0', 'system:poi:list', 'example', 'admin', '2025-12-10 19:24:22', 'admin', '2025-12-10 19:28:22', '点位管理菜单');
INSERT INTO `sys_menu` VALUES (2003, '分类查询', 2001, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:category:query', '#', 'admin', '2025-12-10 19:24:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '分类新增', 2001, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:category:add', '#', 'admin', '2025-12-10 19:24:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '分类修改', 2001, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:category:edit', '#', 'admin', '2025-12-10 19:24:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '分类删除', 2001, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:category:remove', '#', 'admin', '2025-12-10 19:24:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '点位查询', 2002, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:poi:query', '#', 'admin', '2025-12-10 19:24:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '点位新增', 2002, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:poi:add', '#', 'admin', '2025-12-10 19:24:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '点位修改', 2002, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:poi:edit', '#', 'admin', '2025-12-10 19:24:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '点位删除', 2002, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:poi:remove', '#', 'admin', '2025-12-10 19:24:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '游览路线管理', 2000, 3, 'route', 'attraction/route/index', NULL, '', 1, 0, 'C', '0', '0', 'system:route:list', 'guide', 'admin', '2025-12-12 10:01:25', 'admin', '2025-12-12 10:02:04', '游览路线管理菜单');
INSERT INTO `sys_menu` VALUES (2012, '路线查询', 2011, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:route:query', '#', 'admin', '2025-12-12 10:01:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '路线新增', 2011, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:route:add', '#', 'admin', '2025-12-12 10:01:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '路线修改', 2011, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:route:edit', '#', 'admin', '2025-12-12 10:01:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '路线删除', 2011, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:route:remove', '#', 'admin', '2025-12-12 10:01:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '路线导出', 2011, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:route:export', '#', 'admin', '2025-12-12 10:01:25', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-12-10 14:39:07', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-12-10 14:39:07', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 250 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-10 14:38:58\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-10 19:27:01', 136);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-10 19:24:22\",\"icon\":\"el-icon-map-location\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"景点管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"attraction\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-10 19:27:14', 96);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-10 19:24:22\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"景点管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"attraction\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-10 19:27:36', 103);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"attraction/category/index\",\"createTime\":\"2025-12-10 19:24:22\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"分类管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"category\",\"perms\":\"system:category:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-10 19:28:05', 89);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"attraction/poi/index\",\"createTime\":\"2025-12-10 19:24:22\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"点位管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"poi\",\"perms\":\"system:poi:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-10 19:28:22', 95);
INSERT INTO `sys_oper_log` VALUES (105, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-10 17:57:57\",\"description\":\"吉安欢乐世界主入口，开启您的欢乐之旅。\",\"id\":1000,\"isPublished\":true,\"latitude\":27.073938,\"longitude\":114.958173,\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"欢乐世界大门\",\"updateTime\":\"2025-12-11 18:45:34\",\"visitCount\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 18:46:12', 86);
INSERT INTO `sys_oper_log` VALUES (106, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-10 17:57:57\",\"description\":\"吉安欢乐世界主入口，开启您的欢乐之旅。\",\"id\":1000,\"isPublished\":true,\"latitude\":27.073938,\"longitude\":114.958173,\"mainImageUrl\":\"111\",\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"欢乐世界大门\",\"updateTime\":\"2025-12-11 18:45:48\",\"visitCount\":0,\"voiceUrl\":\"111\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 18:46:26', 68);
INSERT INTO `sys_oper_log` VALUES (107, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"卫生间\",\"createTime\":\"2025-12-10 17:57:57\",\"description\":\"位于大门右侧，方便游客使用。\",\"id\":1001,\"isPublished\":true,\"latitude\":27.0738,\"longitude\":114.9585,\"mainImageUrl\":\"111\",\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"入口卫生间\",\"updateTime\":\"2025-12-11 18:45:52\",\"visitCount\":0,\"voiceUrl\":\"111\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 18:46:30', 65);
INSERT INTO `sys_oper_log` VALUES (108, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-10 17:57:57\",\"description\":\"俯瞰整个园区的最佳视角。\",\"id\":1002,\"isPublished\":true,\"latitude\":27.075,\"longitude\":114.959,\"mainImageUrl\":\"111\",\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"摩天轮\",\"updateTime\":\"2025-12-11 18:45:57\",\"visitCount\":0,\"voiceUrl\":\"111\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 18:46:35', 67);
INSERT INTO `sys_oper_log` VALUES (109, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-10 17:57:57\",\"description\":\"吉安欢乐世界主入口，开启您的欢乐之旅。\",\"id\":1000,\"isPublished\":true,\"latitude\":27.073938,\"longitude\":114.958173,\"mainImageUrl\":\"111\",\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"欢乐世界大门\",\"updateTime\":\"2025-12-11 19:35:56\",\"visitCount\":0,\"voiceDuration\":0,\"voiceUrl\":\"\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 19:36:34', 107);
INSERT INTO `sys_oper_log` VALUES (110, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-10 17:57:57\",\"description\":\"吉安欢乐世界主入口，开启您的欢乐之旅。\",\"id\":1000,\"isPublished\":true,\"latitude\":27.073938,\"longitude\":114.958173,\"mainImageUrl\":\"111\",\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"欢乐世界大门\",\"updateTime\":\"2025-12-11 19:36:24\",\"visitCount\":0,\"voiceDuration\":0,\"voiceText\":\"这里是测试语音\",\"voiceUrl\":\"\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 19:37:02', 46);
INSERT INTO `sys_oper_log` VALUES (111, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"卫生间\",\"createTime\":\"2025-12-10 17:57:57\",\"description\":\"位于大门右侧，方便游客使用。\",\"id\":1001,\"isPublished\":true,\"latitude\":27.0738,\"longitude\":114.9585,\"mainImageUrl\":\"111\",\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"入口卫生间\",\"updateTime\":\"2025-12-11 20:39:00\",\"visitCount\":0,\"voiceDuration\":0,\"voiceUrl\":\"\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 20:39:38', 62);
INSERT INTO `sys_oper_log` VALUES (112, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-10 17:57:57\",\"description\":\"俯瞰整个园区的最佳视角。\",\"id\":1002,\"isPublished\":true,\"latitude\":27.075,\"longitude\":114.959,\"mainImageUrl\":\"111\",\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"摩天轮\",\"updateTime\":\"2025-12-11 20:39:04\",\"visitCount\":0,\"voiceDuration\":0,\"voiceUrl\":\"\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 20:39:41', 58);
INSERT INTO `sys_oper_log` VALUES (113, 'POI点位信息', 1, 'com.ruoyi.web.controller.attraction.PoiPointController.add()', 'POST', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"createTime\":\"2025-12-11 21:08:11\",\"description\":\"卫生间\",\"id\":1003,\"isPublished\":true,\"latitude\":0,\"longitude\":0,\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"卫生间2\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 21:08:49', 140);
INSERT INTO `sys_oper_log` VALUES (114, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"卫生间\",\"createTime\":\"2025-12-11 21:08:12\",\"description\":\"卫生间\",\"id\":1003,\"isPublished\":true,\"latitude\":114.9585,\"longitude\":114.9585,\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"卫生间2\",\"updateTime\":\"2025-12-11 21:08:23\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 21:09:00', 69);
INSERT INTO `sys_oper_log` VALUES (115, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"卫生间\",\"createTime\":\"2025-12-11 21:08:12\",\"description\":\"卫生间\",\"id\":1003,\"isPublished\":true,\"latitude\":27.0798,\"longitude\":114.9589,\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"卫生间2\",\"updateTime\":\"2025-12-11 21:08:43\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 21:09:20', 64);
INSERT INTO `sys_oper_log` VALUES (116, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"卫生间\",\"createTime\":\"2025-12-11 21:08:12\",\"description\":\"卫生间\",\"id\":1003,\"isPublished\":true,\"latitude\":27.0788,\"longitude\":114.9589,\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"卫生间2\",\"updateTime\":\"2025-12-11 21:09:23\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 21:10:01', 79);
INSERT INTO `sys_oper_log` VALUES (117, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"卫生间\",\"createTime\":\"2025-12-11 21:08:12\",\"description\":\"卫生间\",\"id\":1003,\"isPublished\":true,\"latitude\":27.0781,\"longitude\":114.9589,\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"卫生间2\",\"updateTime\":\"2025-12-11 21:10:21\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 21:10:59', 61);
INSERT INTO `sys_oper_log` VALUES (118, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"卫生间\",\"createTime\":\"2025-12-11 21:08:12\",\"description\":\"卫生间\",\"id\":1003,\"isPublished\":true,\"latitude\":27.077555,\"longitude\":114.9589,\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"卫生间2\",\"updateTime\":\"2025-12-11 21:10:40\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 21:11:18', 58);
INSERT INTO `sys_oper_log` VALUES (119, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"卫生间\",\"createTime\":\"2025-12-11 21:08:12\",\"description\":\"卫生间\",\"id\":1003,\"isPublished\":true,\"latitude\":27.075555,\"longitude\":114.9589,\"operatingHours\":\"09:00-18:00\",\"params\":{},\"poiName\":\"卫生间2\",\"updateTime\":\"2025-12-11 21:11:01\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-11 21:11:38', 70);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"attraction/route/index\",\"createTime\":\"2025-12-12 10:01:25\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"游览路线管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"route\",\"perms\":\"system:route:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 10:02:04', 126);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"attraction/route/poi\",\"createTime\":\"2025-12-12 10:05:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"路线POI管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2011,\"path\":\"route\",\"perms\":\"system:route:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 10:14:36', 124);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"attraction/route/poi\",\"createTime\":\"2025-12-12 10:05:16\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"路线POI管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2011,\"path\":\"poi\",\"perms\":\"system:route:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 10:16:03', 127);
INSERT INTO `sys_oper_log` VALUES (123, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"1\",\"poiIds\":[1018,1013,1012,1015,1014,1036]} ', NULL, 1, 'java.lang.Integer cannot be cast to java.lang.Long', '2025-12-12 10:49:14', 57);
INSERT INTO `sys_oper_log` VALUES (124, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"1\",\"poiIds\":[1018,1015,1014]} ', NULL, 1, 'java.lang.Integer cannot be cast to java.lang.Long', '2025-12-12 10:49:24', 34);
INSERT INTO `sys_oper_log` VALUES (125, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"1\",\"poiIds\":[1018]} ', NULL, 1, 'java.lang.Integer cannot be cast to java.lang.Long', '2025-12-12 10:49:26', 66);
INSERT INTO `sys_oper_log` VALUES (126, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"1\",\"poiIds\":[1018,1012,1013,1014]} ', NULL, 1, 'java.lang.Integer cannot be cast to java.lang.Long', '2025-12-12 10:50:17', 33);
INSERT INTO `sys_oper_log` VALUES (127, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"1\",\"poiIds\":[1018,1012,1013,1014]} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 10:53:13', 193);
INSERT INTO `sys_oper_log` VALUES (128, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"1\",\"poiIds\":[1021,1023,1024]} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 10:53:34', 108);
INSERT INTO `sys_oper_log` VALUES (129, '路线POI排序', 2, 'com.ruoyi.web.controller.system.TourRouteController.updatePoiSort()', 'PUT', 1, 'admin', '研发部门', '/system/route/poi/sort', '127.0.0.1', '内网IP', '[{\"id\":1018,\"sortOrder\":1},{\"id\":1013,\"sortOrder\":2},{\"id\":1012,\"sortOrder\":3},{\"id\":1014,\"sortOrder\":4},{\"id\":1021,\"sortOrder\":5},{\"id\":1023,\"sortOrder\":6},{\"id\":1024,\"sortOrder\":7}] ', '{\"msg\":\"更新POI排序失败：null\",\"code\":500}', 0, NULL, '2025-12-12 10:54:31', 9);
INSERT INTO `sys_oper_log` VALUES (130, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"1\",\"poiIds\":[1031,1022,1023]} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-1023\' for key \'tour_route_pois.uk_route_poi\'\r\n### The error may exist in file [D:\\company\\tt\\code\\attraction-jian\\attraction-admin\\ruoyi-system\\target\\classes\\mapper\\attraction\\TourRoutePoiMapper.xml]\r\n### The error may involve com.ruoyi.attraction.mapper.TourRoutePoiMapper.batchInsertTourRoutePoi-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tour_route_pois (route_id, poi_id, sequence_order, create_time)         values                        (?, ?, ?, ?)          ,              (?, ?, ?, ?)          ,              (?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-1023\' for key \'tour_route_pois.uk_route_poi\'\n; Duplicate entry \'1-1023\' for key \'tour_route_pois.uk_route_poi\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-1023\' for key \'tour_route_pois.uk_route_poi\'', '2025-12-12 10:57:58', 240);
INSERT INTO `sys_oper_log` VALUES (131, '路线POI管理', 3, 'com.ruoyi.web.controller.system.TourRouteController.removePoiFromRoute()', 'DELETE', 1, 'admin', '研发部门', '/system/route/poi/1018', '127.0.0.1', '内网IP', '1018 ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-12-12 10:58:03', 60);
INSERT INTO `sys_oper_log` VALUES (132, '路线POI管理', 3, 'com.ruoyi.web.controller.system.TourRouteController.removePoiFromRoute()', 'DELETE', 1, 'admin', '研发部门', '/system/route/poi/1018', '127.0.0.1', '内网IP', '1018 ', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2025-12-12 10:58:04', 58);
INSERT INTO `sys_oper_log` VALUES (133, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"1\",\"poiIds\":[1031,1021,1023]} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 10:59:10', 92);
INSERT INTO `sys_oper_log` VALUES (134, '路线POI排序', 2, 'com.ruoyi.web.controller.system.TourRouteController.updatePoiSort()', 'PUT', 1, 'admin', '研发部门', '/system/route/poi/sort', '127.0.0.1', '内网IP', '[{\"id\":33,\"sortOrder\":1},{\"id\":32,\"sortOrder\":2},{\"id\":34,\"sortOrder\":3}] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 11:03:38', 190);
INSERT INTO `sys_oper_log` VALUES (135, '路线POI排序', 2, 'com.ruoyi.web.controller.system.TourRouteController.updatePoiSort()', 'PUT', 1, 'admin', '研发部门', '/system/route/poi/sort', '127.0.0.1', '内网IP', '[{\"id\":32,\"sortOrder\":1},{\"id\":33,\"sortOrder\":2},{\"id\":34,\"sortOrder\":3}] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 11:03:40', 187);
INSERT INTO `sys_oper_log` VALUES (136, '路线POI排序', 2, 'com.ruoyi.web.controller.system.TourRouteController.updatePoiSort()', 'PUT', 1, 'admin', '研发部门', '/system/route/poi/sort', '127.0.0.1', '内网IP', '[{\"id\":33,\"sortOrder\":1},{\"id\":32,\"sortOrder\":2},{\"id\":34,\"sortOrder\":3}] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 11:03:40', 194);
INSERT INTO `sys_oper_log` VALUES (137, '路线POI排序', 2, 'com.ruoyi.web.controller.system.TourRouteController.updatePoiSort()', 'PUT', 1, 'admin', '研发部门', '/system/route/poi/sort', '127.0.0.1', '内网IP', '[{\"id\":32,\"sortOrder\":1},{\"id\":33,\"sortOrder\":2},{\"id\":34,\"sortOrder\":3}] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 11:03:41', 228);
INSERT INTO `sys_oper_log` VALUES (138, '路线POI排序', 2, 'com.ruoyi.web.controller.system.TourRouteController.updatePoiSort()', 'PUT', 1, 'admin', '研发部门', '/system/route/poi/sort', '127.0.0.1', '内网IP', '[{\"id\":32,\"sortOrder\":1},{\"id\":34,\"sortOrder\":2},{\"id\":33,\"sortOrder\":3}] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 11:03:42', 308);
INSERT INTO `sys_oper_log` VALUES (139, '游览路线', 2, 'com.ruoyi.web.controller.system.TourRouteController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/route', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-12-12 09:44:08\",\"estimatedDuration\":\"2小时\",\"id\":1,\"isPublished\":true,\"params\":{},\"poiCount\":3,\"routeDescription\":\"一路进吃进吃\",\"routeName\":\"吃货路线\",\"sortOrder\":1,\"updateBy\":\"\",\"updateTime\":\"2025-12-12 11:07:43\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 11:08:19', 84);
INSERT INTO `sys_oper_log` VALUES (140, '游览路线', 2, 'com.ruoyi.web.controller.system.TourRouteController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/route', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-12-12 09:44:08\",\"estimatedDuration\":\"2小时\",\"id\":1,\"isPublished\":true,\"params\":{},\"poiCount\":3,\"routeDescription\":\"一路进吃进吃\",\"routeName\":\"吃货路线\",\"sortOrder\":1,\"updateBy\":\"\",\"updateTime\":\"2025-12-12 11:07:51\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 11:08:27', 60);
INSERT INTO `sys_oper_log` VALUES (141, '游览路线', 2, 'com.ruoyi.web.controller.system.TourRouteController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/route', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2025-12-12 09:44:08\",\"estimatedDuration\":\"2小时\",\"id\":1,\"isPublished\":true,\"params\":{},\"poiCount\":3,\"routeDescription\":\"一路进吃进吃\",\"routeName\":\"吃货路线\",\"sortOrder\":1,\"updateBy\":\"\",\"updateTime\":\"2025-12-12 11:07:58\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 11:08:34', 80);
INSERT INTO `sys_oper_log` VALUES (142, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"2\",\"poiIds\":[1022,1024,1026]} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 11:11:44', 94);
INSERT INTO `sys_oper_log` VALUES (143, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"2\",\"poiIds\":[1019]} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 11:11:53', 89);
INSERT INTO `sys_oper_log` VALUES (144, 'POI分类', 1, 'com.ruoyi.web.controller.attraction.PoiCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/system/category', '127.0.0.1', '内网IP', '{\"categoryName\":\"酒店\",\"createTime\":\"2025-12-12 13:46:39\",\"id\":100,\"isActive\":true,\"params\":{},\"sortOrder\":9} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 13:47:15', 92);
INSERT INTO `sys_oper_log` VALUES (145, 'POI分类', 2, 'com.ruoyi.web.controller.attraction.PoiCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/category', '127.0.0.1', '内网IP', '{\"categoryName\":\"住宿\",\"createTime\":\"2025-12-10 17:57:57\",\"iconUrl\":\"default_hotel_icon.png\",\"id\":3,\"isActive\":true,\"params\":{},\"sortOrder\":3,\"updateTime\":\"2025-12-12 13:47:01\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 13:47:38', 101);
INSERT INTO `sys_oper_log` VALUES (146, 'POI分类', 3, 'com.ruoyi.web.controller.attraction.PoiCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/category/100', '127.0.0.1', '内网IP', '[100] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 13:47:41', 112);
INSERT INTO `sys_oper_log` VALUES (147, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"1\",\"poiIds\":[1028,1030,1029,1020,1033]} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 14:49:01', 107);
INSERT INTO `sys_oper_log` VALUES (148, '路线POI管理', 3, 'com.ruoyi.web.controller.system.TourRouteController.removePoiFromRoute()', 'DELETE', 1, 'admin', '研发部门', '/system/route/poi/32', '127.0.0.1', '内网IP', '32 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 14:49:03', 60);
INSERT INTO `sys_oper_log` VALUES (149, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":6,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:05:37\",\"description\":\"停车场\",\"id\":1041,\"isPublished\":true,\"latitude\":27.071353,\"longitude\":114.956963,\"params\":{},\"poiName\":\"停车场\",\"updateTime\":\"2025-12-12 22:08:11\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:08:51', 87);
INSERT INTO `sys_oper_log` VALUES (150, 'POI点位信息', 3, 'com.ruoyi.web.controller.attraction.PoiPointController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/poi/1012,1013,1014,1015,1016,1017,1018,1019,1003,1000', '127.0.0.1', '内网IP', '[1012,1013,1014,1015,1016,1017,1018,1019,1003,1000] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:09:18', 67);
INSERT INTO `sys_oper_log` VALUES (151, 'POI点位信息', 3, 'com.ruoyi.web.controller.attraction.PoiPointController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/poi/1021,1020,1011,1010,1009,1008,1007,1006,1005,1004', '127.0.0.1', '内网IP', '[1021,1020,1011,1010,1009,1008,1007,1006,1005,1004] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:09:23', 68);
INSERT INTO `sys_oper_log` VALUES (152, 'POI点位信息', 3, 'com.ruoyi.web.controller.attraction.PoiPointController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/poi/1032,1030,1029,1028,1027,1026,1025,1024,1023,1022', '127.0.0.1', '内网IP', '[1032,1030,1029,1028,1027,1026,1025,1024,1023,1022] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:09:27', 61);
INSERT INTO `sys_oper_log` VALUES (153, 'POI点位信息', 3, 'com.ruoyi.web.controller.attraction.PoiPointController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/poi/1001,1002', '127.0.0.1', '内网IP', '[1001,1002] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:09:32', 61);
INSERT INTO `sys_oper_log` VALUES (154, 'POI点位信息', 3, 'com.ruoyi.web.controller.attraction.PoiPointController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/poi/1031,1033,1034,1035,1036,1037,1038,1039,1040', '127.0.0.1', '内网IP', '[1031,1033,1034,1035,1036,1037,1038,1039,1040] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:09:37', 63);
INSERT INTO `sys_oper_log` VALUES (155, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":6,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:17:38\",\"description\":\"停车场\",\"id\":1080,\"isPublished\":true,\"latitude\":27.074458,\"longitude\":114.959947,\"params\":{},\"poiName\":\"停车场\",\"updateTime\":\"2025-12-12 22:18:14\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:18:54', 65);
INSERT INTO `sys_oper_log` VALUES (156, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:17:23\",\"id\":1079,\"isPublished\":true,\"latitude\":27.07518,\"longitude\":114.958369,\"params\":{},\"poiName\":\"翼龙腾飞\",\"updateTime\":\"2025-12-12 22:18:20\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:19:01', 68);
INSERT INTO `sys_oper_log` VALUES (157, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:17:23\",\"description\":\"翼龙腾飞\",\"id\":1079,\"isPublished\":true,\"latitude\":27.07518,\"longitude\":114.958369,\"params\":{},\"poiName\":\"翼龙腾飞\",\"updateTime\":\"2025-12-12 22:18:26\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:19:07', 76);
INSERT INTO `sys_oper_log` VALUES (158, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:17:10\",\"description\":\"冲天回旋\",\"id\":1078,\"isPublished\":true,\"latitude\":27.075726,\"longitude\":114.959103,\"params\":{},\"poiName\":\"冲天回旋\",\"updateTime\":\"2025-12-12 22:18:32\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:19:12', 68);
INSERT INTO `sys_oper_log` VALUES (159, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:16:58\",\"id\":1077,\"isPublished\":true,\"latitude\":27.074851,\"longitude\":114.959979,\"params\":{},\"poiName\":\"卫生间\",\"updateTime\":\"2025-12-12 22:18:38\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:19:19', 64);
INSERT INTO `sys_oper_log` VALUES (160, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:16:52\",\"id\":1076,\"isPublished\":true,\"latitude\":27.074973,\"longitude\":114.960197,\"params\":{},\"poiName\":\"淋浴中心\",\"updateTime\":\"2025-12-12 22:18:48\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:19:28', 67);
INSERT INTO `sys_oper_log` VALUES (161, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:16:42\",\"description\":\"冲浪飞毯\",\"id\":1075,\"isPublished\":true,\"latitude\":27.075481,\"longitude\":114.959425,\"params\":{},\"poiName\":\"冲浪飞毯\",\"updateTime\":\"2025-12-12 22:18:54\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:19:35', 64);
INSERT INTO `sys_oper_log` VALUES (162, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:16:33\",\"description\":\"萌宝嬉水乐园\",\"id\":1074,\"isPublished\":true,\"latitude\":27.075521,\"longitude\":114.959791,\"params\":{},\"poiName\":\"萌宝嬉水乐园\",\"updateTime\":\"2025-12-12 22:19:01\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:19:41', 66);
INSERT INTO `sys_oper_log` VALUES (163, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:16:16\",\"id\":1073,\"isPublished\":true,\"latitude\":27.075852,\"longitude\":114.960442,\"params\":{},\"poiName\":\"浪花潮玩店\",\"updateTime\":\"2025-12-12 22:19:10\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:19:50', 70);
INSERT INTO `sys_oper_log` VALUES (164, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":4,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:15:56\",\"id\":1071,\"isPublished\":true,\"latitude\":27.076419,\"longitude\":114.960385,\"params\":{},\"poiName\":\"清风茶肆\",\"updateTime\":\"2025-12-12 22:19:17\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:19:57', 63);
INSERT INTO `sys_oper_log` VALUES (165, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":4,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:16:03\",\"id\":1072,\"isPublished\":true,\"latitude\":27.076302,\"longitude\":114.960471,\"params\":{},\"poiName\":\"大峡谷餐厅\",\"updateTime\":\"2025-12-12 22:19:23\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:20:03', 66);
INSERT INTO `sys_oper_log` VALUES (166, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:15:41\",\"id\":1070,\"isPublished\":true,\"latitude\":27.076614,\"longitude\":114.960294,\"params\":{},\"poiName\":\"卫生间\",\"updateTime\":\"2025-12-12 22:19:30\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:20:10', 66);
INSERT INTO `sys_oper_log` VALUES (167, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:15:35\",\"id\":1069,\"isPublished\":true,\"latitude\":27.076885,\"longitude\":114.959272,\"params\":{},\"poiName\":\"卫生间\",\"updateTime\":\"2025-12-12 22:19:36\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:20:16', 64);
INSERT INTO `sys_oper_log` VALUES (168, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:15:25\",\"id\":1068,\"isPublished\":true,\"latitude\":27.076559,\"longitude\":114.959778,\"params\":{},\"poiName\":\"雪域水堡\",\"updateTime\":\"2025-12-12 22:19:44\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:20:24', 69);
INSERT INTO `sys_oper_log` VALUES (169, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":4,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:15:11\",\"id\":1067,\"isPublished\":true,\"latitude\":27.076146,\"longitude\":114.959736,\"params\":{},\"poiName\":\"雪山餐厅\",\"updateTime\":\"2025-12-12 22:19:49\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:20:29', 74);
INSERT INTO `sys_oper_log` VALUES (170, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:15:00\",\"id\":1066,\"isPublished\":true,\"latitude\":27.076183,\"longitude\":114.958851,\"params\":{},\"poiName\":\"造浪池\",\"updateTime\":\"2025-12-12 22:19:54\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:20:35', 70);
INSERT INTO `sys_oper_log` VALUES (171, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:14:49\",\"id\":1065,\"isPublished\":true,\"latitude\":27.075858,\"longitude\":114.958229,\"params\":{},\"poiName\":\"卫生间\",\"updateTime\":\"2025-12-12 22:19:59\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:20:40', 62);
INSERT INTO `sys_oper_log` VALUES (172, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:14:42\",\"id\":1064,\"isPublished\":true,\"latitude\":27.076201,\"longitude\":114.958312,\"params\":{},\"poiName\":\"卫生间\",\"updateTime\":\"2025-12-12 22:20:05\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:20:46', 64);
INSERT INTO `sys_oper_log` VALUES (173, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":4,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:14:34\",\"id\":1063,\"isPublished\":true,\"latitude\":27.076043,\"longitude\":114.958021,\"params\":{},\"poiName\":\"摩天轮餐厅\",\"updateTime\":\"2025-12-12 22:20:12\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:20:52', 65);
INSERT INTO `sys_oper_log` VALUES (174, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:14:20\",\"id\":1062,\"isPublished\":true,\"latitude\":27.074793,\"longitude\":114.958261,\"params\":{},\"poiName\":\"量子飞车\",\"updateTime\":\"2025-12-12 22:20:16\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:20:57', 60);
INSERT INTO `sys_oper_log` VALUES (175, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:14:11\",\"id\":1061,\"isPublished\":true,\"latitude\":27.074553,\"longitude\":114.957788,\"params\":{},\"poiName\":\"丛林狙击\",\"updateTime\":\"2025-12-12 22:20:21\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:21:01', 63);
INSERT INTO `sys_oper_log` VALUES (176, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:13:59\",\"id\":1060,\"isPublished\":true,\"latitude\":27.074453,\"longitude\":114.95754,\"params\":{},\"poiName\":\"卫生间\",\"updateTime\":\"2025-12-12 22:20:29\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:21:10', 66);
INSERT INTO `sys_oper_log` VALUES (177, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:13:44\",\"id\":1059,\"isPublished\":true,\"latitude\":27.073028,\"longitude\":114.95694,\"params\":{},\"poiName\":\"卫生间\",\"updateTime\":\"2025-12-12 22:20:35\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:21:16', 66);
INSERT INTO `sys_oper_log` VALUES (178, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:13:34\",\"id\":1058,\"isPublished\":true,\"latitude\":27.07258,\"longitude\":114.955767,\"params\":{},\"poiName\":\"火烈鸟\",\"updateTime\":\"2025-12-12 22:20:41\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:21:21', 63);
INSERT INTO `sys_oper_log` VALUES (179, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:13:19\",\"id\":1057,\"isPublished\":true,\"latitude\":27.071431,\"longitude\":114.955907,\"params\":{},\"poiName\":\"长颈鹿花园\",\"updateTime\":\"2025-12-12 22:20:46\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:21:26', 61);
INSERT INTO `sys_oper_log` VALUES (180, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":3,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:13:07\",\"id\":1056,\"isPublished\":true,\"latitude\":27.072088,\"longitude\":114.956785,\"params\":{},\"poiName\":\"酒店2号楼客房\",\"updateTime\":\"2025-12-12 22:20:56\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:21:36', 66);
INSERT INTO `sys_oper_log` VALUES (181, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:12:48\",\"id\":1055,\"isPublished\":true,\"latitude\":27.071928,\"longitude\":114.95634,\"params\":{},\"poiName\":\"卫生间\",\"updateTime\":\"2025-12-12 22:21:01\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:21:42', 64);
INSERT INTO `sys_oper_log` VALUES (182, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":3,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:12:38\",\"id\":1054,\"isPublished\":true,\"latitude\":27.071755,\"longitude\":114.957381,\"params\":{},\"poiName\":\"酒店1号楼客房\",\"updateTime\":\"2025-12-12 22:21:10\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:21:51', 71);
INSERT INTO `sys_oper_log` VALUES (183, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":3,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:12:25\",\"id\":1053,\"isPublished\":true,\"latitude\":27.071963,\"longitude\":114.957143,\"params\":{},\"poiName\":\"吉安欢乐世界度假酒店\",\"updateTime\":\"2025-12-12 22:21:19\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:21:59', 70);
INSERT INTO `sys_oper_log` VALUES (184, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":3,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:11:57\",\"id\":1052,\"isPublished\":true,\"latitude\":27.072504,\"longitude\":114.957048,\"params\":{},\"poiName\":\"酒店3号楼客房\",\"updateTime\":\"2025-12-12 22:21:24\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:22:04', 66);
INSERT INTO `sys_oper_log` VALUES (185, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":3,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:11:45\",\"id\":1051,\"isPublished\":true,\"latitude\":27.073021,\"longitude\":114.957436,\"params\":{},\"poiName\":\"酒店6号楼客房\",\"updateTime\":\"2025-12-12 22:21:30\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:22:11', 67);
INSERT INTO `sys_oper_log` VALUES (186, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":3,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:11:29\",\"id\":1050,\"isPublished\":true,\"latitude\":27.072877,\"longitude\":114.956927,\"params\":{},\"poiName\":\"酒店4号楼客房\",\"updateTime\":\"2025-12-12 22:21:38\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:22:18', 69);
INSERT INTO `sys_oper_log` VALUES (187, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:11:17\",\"id\":1049,\"isPublished\":true,\"latitude\":27.073025,\"longitude\":114.956931,\"params\":{},\"poiName\":\"卫生间\",\"updateTime\":\"2025-12-12 22:21:45\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:22:26', 63);
INSERT INTO `sys_oper_log` VALUES (188, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":3,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:11:10\",\"id\":1048,\"isPublished\":true,\"latitude\":27.073321,\"longitude\":114.957089,\"params\":{},\"poiName\":\"酒店5号楼客房\",\"updateTime\":\"2025-12-12 22:21:51\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:22:31', 67);
INSERT INTO `sys_oper_log` VALUES (189, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:10:52\",\"id\":1047,\"isPublished\":true,\"latitude\":27.073077,\"longitude\":114.957841,\"params\":{},\"poiName\":\"卫生间\",\"updateTime\":\"2025-12-12 22:21:56\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:22:36', 66);
INSERT INTO `sys_oper_log` VALUES (190, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":3,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:10:33\",\"id\":1046,\"isPublished\":true,\"latitude\":27.072938,\"longitude\":114.958334,\"params\":{},\"poiName\":\"行李寄存处\",\"updateTime\":\"2025-12-12 22:22:09\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:22:49', 63);
INSERT INTO `sys_oper_log` VALUES (191, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":3,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:10:19\",\"id\":1045,\"isPublished\":true,\"latitude\":27.073033,\"longitude\":114.958332,\"params\":{},\"poiName\":\"医务室\",\"updateTime\":\"2025-12-12 22:22:15\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:22:56', 65);
INSERT INTO `sys_oper_log` VALUES (192, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:10:02\",\"id\":1044,\"isPublished\":true,\"latitude\":27.072795,\"longitude\":114.957766,\"params\":{},\"poiName\":\"卫生间\",\"updateTime\":\"2025-12-12 22:22:22\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:23:02', 65);
INSERT INTO `sys_oper_log` VALUES (193, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:09:49\",\"id\":1043,\"isPublished\":true,\"latitude\":27.072494,\"longitude\":114.958224,\"params\":{},\"poiName\":\"卫生间\",\"updateTime\":\"2025-12-12 22:22:27\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:23:07', 61);
INSERT INTO `sys_oper_log` VALUES (194, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":3,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:09:41\",\"id\":1042,\"isPublished\":true,\"latitude\":27.072358,\"longitude\":114.958235,\"params\":{},\"poiName\":\"游客服务中心\",\"updateTime\":\"2025-12-12 22:22:38\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:23:18', 61);
INSERT INTO `sys_oper_log` VALUES (195, 'POI分类', 1, 'com.ruoyi.web.controller.attraction.PoiCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/system/category', '127.0.0.1', '内网IP', '{\"categoryName\":\"其他\",\"createTime\":\"2025-12-12 22:22:45\",\"id\":101,\"isActive\":true,\"params\":{},\"sortOrder\":9} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:23:26', 70);
INSERT INTO `sys_oper_log` VALUES (196, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":101,\"categoryName\":\"住宿\",\"createTime\":\"2025-12-12 22:10:19\",\"id\":1045,\"isPublished\":true,\"latitude\":27.073033,\"longitude\":114.958332,\"params\":{},\"poiName\":\"医务室\",\"updateTime\":\"2025-12-12 22:23:16\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:23:56', 76);
INSERT INTO `sys_oper_log` VALUES (197, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":101,\"categoryName\":\"住宿\",\"createTime\":\"2025-12-12 22:10:33\",\"id\":1046,\"isPublished\":true,\"latitude\":27.072938,\"longitude\":114.958334,\"params\":{},\"poiName\":\"行李寄存处\",\"updateTime\":\"2025-12-12 22:23:21\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:24:02', 63);
INSERT INTO `sys_oper_log` VALUES (198, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":101,\"categoryName\":\"住宿\",\"createTime\":\"2025-12-12 22:09:41\",\"id\":1042,\"isPublished\":true,\"latitude\":27.072358,\"longitude\":114.958235,\"params\":{},\"poiName\":\"游客服务中心\",\"updateTime\":\"2025-12-12 22:23:35\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:24:15', 67);
INSERT INTO `sys_oper_log` VALUES (199, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"1\",\"poiIds\":[1079,1077,1074,1073]} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:24:43', 104);
INSERT INTO `sys_oper_log` VALUES (200, '路线POI管理', 1, 'com.ruoyi.web.controller.system.TourRouteController.addPoiToRoute()', 'POST', 1, 'admin', '研发部门', '/system/route/poi/add', '127.0.0.1', '内网IP', '{\"routeId\":\"2\",\"poiIds\":[1056,1058,1060,1061]} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-12 22:25:16', 101);
INSERT INTO `sys_oper_log` VALUES (201, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"其他\",\"createTime\":\"2025-12-12 22:10:33\",\"id\":1046,\"isPublished\":true,\"latitude\":27.072938,\"longitude\":114.958334,\"params\":{},\"poiName\":\"行李寄存处\",\"updateTime\":\"2025-12-13 10:00:45\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:01:27', 102);
INSERT INTO `sys_oper_log` VALUES (202, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"其他\",\"createTime\":\"2025-12-12 22:10:19\",\"id\":1045,\"isPublished\":true,\"latitude\":27.073033,\"longitude\":114.958332,\"params\":{},\"poiName\":\"医务室\",\"updateTime\":\"2025-12-13 10:00:54\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:01:35', 70);
INSERT INTO `sys_oper_log` VALUES (203, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"其他\",\"createTime\":\"2025-12-12 22:09:41\",\"id\":1042,\"isPublished\":true,\"latitude\":27.072358,\"longitude\":114.958235,\"params\":{},\"poiName\":\"游客服务中心\",\"updateTime\":\"2025-12-13 10:01:01\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:01:42', 70);
INSERT INTO `sys_oper_log` VALUES (204, 'POI分类', 3, 'com.ruoyi.web.controller.attraction.PoiCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/category/101', '127.0.0.1', '内网IP', '[101] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:01:51', 73);
INSERT INTO `sys_oper_log` VALUES (205, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:37:08\",\"description\":\"在吉安欢乐世界的西北方向，“后河之星”摩天轮临河而立，总高 88米，是这座城市的璀璨明珠与标志性建筑。48个太空舱整齐排列，每 个舱可轻松容纳6-8人。步入舱内，液晶电视、冷暖空调、对讲机一应俱 全，给你带来舒适又便捷的体验。缓缓上升，窗外景色如诗如画，河畔风 光与外滩美景相互映衬，尽收眼底。\",\"id\":1101,\"isPublished\":true,\"latitude\":27.075935,\"longitude\":114.958048,\"params\":{},\"poiName\":\"后河之星\",\"updateTime\":\"2025-12-13 10:40:17\",\"visitCount\":0,\"voiceDuration\":0,\"voiceText\":\"在吉安欢乐世界的西北方向，“后河之星”摩天轮临河而立，总高 88米，是这座城市的璀璨明珠与标志性建筑。48个太空舱整齐排列，每 个舱可轻松容纳6-8人。步入舱内，液晶电视、冷暖空调、对讲机一应俱 全，给你带来舒适又便捷的体验。缓缓上升，窗外景色如诗如画，河畔风 光与外滩美景相互映衬，尽收眼底。作为乐园的标志性建筑，摩天轮不仅是浪漫的代名词，更是俯瞰整个吉安欢乐世界的最佳观景台。随着缓缓上升，游客可以将乐园的全景尽收眼底，尤其是在黄昏或夜晚，灯光璀璨的乐园景色令人陶醉。\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:40:59', 79);
INSERT INTO `sys_oper_log` VALUES (206, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:17:23\",\"description\":\"作为乐园最刺激的项目之一，这架过山车的轨道总长377米，最高运行速度可达63千米每小时，过山车以其高速俯冲、急速转弯和360度旋转，带给游客肾上腺素飙升的快感。无论是初次体验还是过山车爱好者，都能在这里找到心跳加速的乐趣。\",\"id\":1079,\"isPublished\":true,\"latitude\":27.07518,\"longitude\":114.958369,\"params\":{},\"poiName\":\"翼龙腾飞\",\"updateTime\":\"2025-12-13 10:40:40\",\"visitCount\":0,\"voiceDuration\":0,\"voiceText\":\"作为乐园最刺激的项目之一，这架过山车的轨道总长377米，最高运行速度可达63千米每小时，过山车以其高速俯冲、急速转弯和360度旋转，带给游客肾上腺素飙升的快感。无论是初次体验还是过山车爱好者，都能在这里找到心跳加速的乐趣。\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:41:21', 79);
INSERT INTO `sys_oper_log` VALUES (207, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-12 22:15:00\",\"description\":\"浪池是乐园内最受欢迎的水上项目之一，占地面积约1万平方米，是赣中地区首个大型造浪池，模拟真实海浪的起伏，让游客仿佛置身于海边。无论是冲浪高手还是只想戏水的游客，都能在这里找到属于自己的乐趣。\",\"id\":1066,\"isPublished\":true,\"latitude\":27.076183,\"longitude\":114.958851,\"params\":{},\"poiName\":\"造浪池\",\"updateTime\":\"2025-12-13 10:40:54\",\"visitCount\":0,\"voiceDuration\":0,\"voiceText\":\"浪池是乐园内最受欢迎的水上项目之一，占地面积约1万平方米，是赣中地区首个大型造浪池，模拟真实海浪的起伏，让游客仿佛置身于海边。无论是冲浪高手还是只想戏水的游客，都能在这里找到属于自己的乐趣。\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:41:36', 75);
INSERT INTO `sys_oper_log` VALUES (208, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:42:55\",\"id\":1108,\"isPublished\":true,\"latitude\":27.072919,\"longitude\":114.956631,\"params\":{},\"poiName\":\"欢乐畅行桥\",\"updateTime\":\"2025-12-13 10:44:45\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:45:27', 74);
INSERT INTO `sys_oper_log` VALUES (209, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:38:52\",\"id\":1107,\"isPublished\":true,\"latitude\":27.07565,\"longitude\":114.960097,\"params\":{},\"poiName\":\"迷你旋风碗\",\"updateTime\":\"2025-12-13 10:44:50\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:45:32', 72);
INSERT INTO `sys_oper_log` VALUES (210, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:38:37\",\"id\":1106,\"isPublished\":true,\"latitude\":27.075925,\"longitude\":114.960116,\"params\":{},\"poiName\":\"欢跃浪池\",\"updateTime\":\"2025-12-13 10:44:54\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:45:36', 71);
INSERT INTO `sys_oper_log` VALUES (211, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:38:17\",\"id\":1105,\"isPublished\":true,\"latitude\":27.076151,\"longitude\":114.960121,\"params\":{},\"poiName\":\"缤纷小栈\",\"updateTime\":\"2025-12-13 10:45:02\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:45:43', 72);
INSERT INTO `sys_oper_log` VALUES (212, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:37:46\",\"id\":1104,\"isPublished\":true,\"latitude\":27.075686,\"longitude\":114.957298,\"params\":{},\"poiName\":\"趣浪方舟\",\"updateTime\":\"2025-12-13 10:45:09\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:45:50', 72);
INSERT INTO `sys_oper_log` VALUES (213, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":4,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:37:35\",\"id\":1103,\"isPublished\":true,\"latitude\":27.07545,\"longitude\":114.957494,\"params\":{},\"poiName\":\"湖畔餐厅\",\"updateTime\":\"2025-12-13 10:45:18\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:45:59', 71);
INSERT INTO `sys_oper_log` VALUES (214, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:37:27\",\"id\":1102,\"isPublished\":true,\"latitude\":27.075523,\"longitude\":114.957955,\"params\":{},\"poiName\":\"童趣幻想城\",\"updateTime\":\"2025-12-13 10:45:28\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:46:10', 321);
INSERT INTO `sys_oper_log` VALUES (215, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":4,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:36:13\",\"id\":1100,\"isPublished\":true,\"latitude\":27.072542,\"longitude\":114.957353,\"params\":{},\"poiName\":\"吉安老茶馆\",\"updateTime\":\"2025-12-13 10:45:35\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:46:16', 72);
INSERT INTO `sys_oper_log` VALUES (216, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:35:58\",\"id\":1099,\"isPublished\":true,\"latitude\":27.072329,\"longitude\":114.957476,\"params\":{},\"poiName\":\"春天来了\",\"updateTime\":\"2025-12-13 10:45:39\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:46:20', 69);
INSERT INTO `sys_oper_log` VALUES (217, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:35:20\",\"id\":1098,\"isPublished\":true,\"latitude\":27.071816,\"longitude\":114.95645,\"params\":{},\"poiName\":\"黑熊\",\"updateTime\":\"2025-12-13 10:45:48\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:46:29', 84);
INSERT INTO `sys_oper_log` VALUES (218, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:35:04\",\"id\":1097,\"isPublished\":true,\"latitude\":27.071884,\"longitude\":114.955732,\"params\":{},\"poiName\":\"鸵鸟\",\"updateTime\":\"2025-12-13 10:45:52\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:46:34', 70);
INSERT INTO `sys_oper_log` VALUES (219, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:34:56\",\"id\":1096,\"isPublished\":true,\"latitude\":27.072101,\"longitude\":114.955785,\"params\":{},\"poiName\":\"袋鼠\",\"updateTime\":\"2025-12-13 10:45:56\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:46:38', 72);
INSERT INTO `sys_oper_log` VALUES (220, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":4,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:34:44\",\"id\":1095,\"isPublished\":true,\"latitude\":27.072301,\"longitude\":114.956334,\"params\":{},\"poiName\":\"奇妙美食屋\",\"updateTime\":\"2025-12-13 10:46:03\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:46:44', 69);
INSERT INTO `sys_oper_log` VALUES (221, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:34:23\",\"id\":1094,\"isPublished\":true,\"latitude\":27.072607,\"longitude\":114.956273,\"params\":{},\"poiName\":\"土拨鼠\",\"updateTime\":\"2025-12-13 10:46:07\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:46:49', 69);
INSERT INTO `sys_oper_log` VALUES (222, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:33:54\",\"id\":1093,\"isPublished\":true,\"latitude\":27.072551,\"longitude\":114.956577,\"params\":{},\"poiName\":\"动物王国检票口\",\"updateTime\":\"2025-12-13 10:46:11\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:46:53', 69);
INSERT INTO `sys_oper_log` VALUES (223, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:33:47\",\"id\":1092,\"isPublished\":true,\"latitude\":27.072631,\"longitude\":114.956553,\"params\":{},\"poiName\":\"动物王国售票处\",\"updateTime\":\"2025-12-13 10:46:16\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:46:57', 71);
INSERT INTO `sys_oper_log` VALUES (224, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:33:10\",\"id\":1091,\"isPublished\":true,\"latitude\":27.072871,\"longitude\":114.95841,\"params\":{},\"poiName\":\"机械部落售票处\",\"updateTime\":\"2025-12-13 10:46:18\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:47:00', 70);
INSERT INTO `sys_oper_log` VALUES (225, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:32:48\",\"id\":1090,\"isPublished\":true,\"latitude\":27.072882,\"longitude\":114.958193,\"params\":{},\"poiName\":\"机械部落检票口\",\"updateTime\":\"2025-12-13 10:46:21\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:47:02', 69);
INSERT INTO `sys_oper_log` VALUES (226, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:30:55\",\"id\":1089,\"isPublished\":true,\"latitude\":27.074817,\"longitude\":114.95956,\"params\":{},\"poiName\":\"风暴湾检票口\",\"updateTime\":\"2025-12-13 10:46:24\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:47:05', 72);
INSERT INTO `sys_oper_log` VALUES (227, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:28:29\",\"id\":1088,\"isPublished\":true,\"latitude\":27.075084,\"longitude\":114.95747,\"params\":{},\"poiName\":\"欢乐对对碰\",\"updateTime\":\"2025-12-13 10:46:29\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:47:11', 71);
INSERT INTO `sys_oper_log` VALUES (228, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:28:03\",\"id\":1087,\"isPublished\":true,\"latitude\":27.076175,\"longitude\":114.961009,\"params\":{},\"poiName\":\"大峡谷\",\"updateTime\":\"2025-12-13 10:46:34\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:47:15', 69);
INSERT INTO `sys_oper_log` VALUES (229, 'POI点位信息', 3, 'com.ruoyi.web.controller.attraction.PoiPointController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/poi/1086', '127.0.0.1', '内网IP', '[1086] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:47:23', 71);
INSERT INTO `sys_oper_log` VALUES (230, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:23:41\",\"id\":1085,\"isPublished\":true,\"latitude\":27.074458,\"longitude\":114.957154,\"params\":{},\"poiName\":\"海盗宝藏\",\"updateTime\":\"2025-12-13 10:46:46\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:47:27', 74);
INSERT INTO `sys_oper_log` VALUES (231, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:23:22\",\"id\":1084,\"isPublished\":true,\"latitude\":27.073738,\"longitude\":114.957695,\"params\":{},\"poiName\":\"小小飞行家\",\"updateTime\":\"2025-12-13 10:46:49\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:47:30', 70);
INSERT INTO `sys_oper_log` VALUES (232, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:23:09\",\"id\":1083,\"isPublished\":true,\"latitude\":27.073907,\"longitude\":114.957057,\"params\":{},\"poiName\":\"欢乐食堂\",\"updateTime\":\"2025-12-13 10:46:52\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:47:34', 70);
INSERT INTO `sys_oper_log` VALUES (233, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:22:29\",\"id\":1081,\"isPublished\":true,\"latitude\":27.073973,\"longitude\":114.958294,\"params\":{},\"poiName\":\"童梦剧场\",\"updateTime\":\"2025-12-13 10:46:56\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:47:37', 70);
INSERT INTO `sys_oper_log` VALUES (234, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:22:52\",\"id\":1082,\"isPublished\":true,\"latitude\":27.073633,\"longitude\":114.957142,\"params\":{},\"poiName\":\"极速飞轮\",\"updateTime\":\"2025-12-13 10:47:00\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:47:41', 72);
INSERT INTO `sys_oper_log` VALUES (235, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:53:23\",\"id\":1122,\"isPublished\":true,\"latitude\":27.075828,\"longitude\":114.958814,\"params\":{},\"poiName\":\"激流旋涡\",\"updateTime\":\"2025-12-13 10:53:46\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:54:28', 70);
INSERT INTO `sys_oper_log` VALUES (236, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":4,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:52:53\",\"id\":1121,\"isPublished\":true,\"latitude\":27.074679,\"longitude\":114.958597,\"params\":{},\"poiName\":\"美味驿站\",\"updateTime\":\"2025-12-13 10:53:52\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:54:34', 71);
INSERT INTO `sys_oper_log` VALUES (237, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:52:40\",\"id\":1120,\"isPublished\":true,\"latitude\":27.074883,\"longitude\":114.957939,\"params\":{},\"poiName\":\"狂野牛仔\",\"updateTime\":\"2025-12-13 10:53:55\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:54:37', 69);
INSERT INTO `sys_oper_log` VALUES (238, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:52:25\",\"id\":1119,\"isPublished\":true,\"latitude\":27.074289,\"longitude\":114.959064,\"params\":{},\"poiName\":\"飓风飞椅\",\"updateTime\":\"2025-12-13 10:54:00\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:54:41', 72);
INSERT INTO `sys_oper_log` VALUES (239, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:52:03\",\"id\":1118,\"isPublished\":true,\"latitude\":27.07427,\"longitude\":114.958487,\"params\":{},\"poiName\":\"贪玩派对\",\"updateTime\":\"2025-12-13 10:54:03\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:54:44', 70);
INSERT INTO `sys_oper_log` VALUES (240, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:51:44\",\"id\":1117,\"isPublished\":true,\"latitude\":27.073254,\"longitude\":114.958398,\"params\":{},\"poiName\":\"神秘小屋\",\"updateTime\":\"2025-12-13 10:54:06\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:54:47', 71);
INSERT INTO `sys_oper_log` VALUES (241, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:51:26\",\"id\":1116,\"isPublished\":true,\"latitude\":27.073448,\"longitude\":114.957322,\"params\":{},\"poiName\":\"霹雳炫舞\",\"updateTime\":\"2025-12-13 10:54:08\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:54:50', 72);
INSERT INTO `sys_oper_log` VALUES (242, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:51:11\",\"id\":1115,\"isPublished\":true,\"latitude\":27.073435,\"longitude\":114.957598,\"params\":{},\"poiName\":\"旋转木马\",\"updateTime\":\"2025-12-13 10:54:17\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:54:59', 70);
INSERT INTO `sys_oper_log` VALUES (243, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:51:03\",\"id\":1114,\"isPublished\":true,\"latitude\":27.073421,\"longitude\":114.957776,\"params\":{},\"poiName\":\"云霄飞塔\",\"updateTime\":\"2025-12-13 10:54:21\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:55:03', 69);
INSERT INTO `sys_oper_log` VALUES (244, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:50:43\",\"id\":1113,\"isPublished\":true,\"latitude\":27.073426,\"longitude\":114.958932,\"params\":{},\"poiName\":\"云顶飞翼\",\"updateTime\":\"2025-12-13 10:54:24\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:55:05', 69);
INSERT INTO `sys_oper_log` VALUES (245, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:50:22\",\"id\":1112,\"isPublished\":true,\"latitude\":27.073687,\"longitude\":114.958848,\"params\":{},\"poiName\":\"星际云游\",\"updateTime\":\"2025-12-13 10:54:28\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:55:09', 71);
INSERT INTO `sys_oper_log` VALUES (246, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:50:08\",\"id\":1111,\"isPublished\":true,\"latitude\":27.074002,\"longitude\":114.958843,\"params\":{},\"poiName\":\"丛林探险\",\"updateTime\":\"2025-12-13 10:54:32\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:55:13', 68);
INSERT INTO `sys_oper_log` VALUES (247, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:49:57\",\"id\":1110,\"isPublished\":true,\"latitude\":27.073811,\"longitude\":114.958985,\"params\":{},\"poiName\":\"解忧杂货铺\",\"updateTime\":\"2025-12-13 10:54:34\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:55:16', 69);
INSERT INTO `sys_oper_log` VALUES (248, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:49:45\",\"id\":1109,\"isPublished\":true,\"latitude\":27.073628,\"longitude\":114.959191,\"params\":{},\"poiName\":\"冰雪世界\",\"updateTime\":\"2025-12-13 10:54:38\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 10:55:19', 69);
INSERT INTO `sys_oper_log` VALUES (249, 'POI点位信息', 2, 'com.ruoyi.web.controller.attraction.PoiPointController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/poi', '127.0.0.1', '内网IP', '{\"categoryId\":1,\"categoryName\":\"景点\",\"createTime\":\"2025-12-13 10:22:29\",\"id\":1081,\"isPublished\":true,\"latitude\":27.073973,\"longitude\":114.958294,\"params\":{},\"poiName\":\"童梦剧场\",\"secondaryCategoryIds\":[5],\"updateTime\":\"2025-12-13 11:22:27\",\"visitCount\":0,\"voiceDuration\":0} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-13 11:23:09', 220);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-12-10 14:38:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-12-10 14:38:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-12-10 14:38:58', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-12-10 14:38:58', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-12-10 14:38:58', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-12-10 14:38:58', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-12-13 11:20:53', '2025-12-10 14:38:58', 'admin', '2025-12-10 14:38:58', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-12-10 14:38:58', '2025-12-10 14:38:58', 'admin', '2025-12-10 14:38:58', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for tour_route_pois
-- ----------------------------
DROP TABLE IF EXISTS `tour_route_pois`;
CREATE TABLE `tour_route_pois`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `route_id` bigint NOT NULL COMMENT '路线ID',
  `poi_id` bigint NOT NULL COMMENT 'POI点位ID',
  `sequence_order` int NOT NULL COMMENT '序号（1,2,3...用于排序）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_route_poi`(`route_id` ASC, `poi_id` ASC) USING BTREE,
  INDEX `idx_route_id`(`route_id` ASC) USING BTREE,
  INDEX `idx_poi_id`(`poi_id` ASC) USING BTREE,
  INDEX `idx_sequence_order`(`sequence_order` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '路线POI关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tour_route_pois
-- ----------------------------
INSERT INTO `tour_route_pois` VALUES (33, 1, 1021, 3, '2025-12-12 10:58:34');
INSERT INTO `tour_route_pois` VALUES (34, 1, 1023, 2, '2025-12-12 10:58:34');
INSERT INTO `tour_route_pois` VALUES (35, 2, 1022, 1, '2025-12-12 11:11:08');
INSERT INTO `tour_route_pois` VALUES (36, 2, 1024, 2, '2025-12-12 11:11:08');
INSERT INTO `tour_route_pois` VALUES (37, 2, 1026, 3, '2025-12-12 11:11:08');
INSERT INTO `tour_route_pois` VALUES (38, 2, 1019, 4, '2025-12-12 11:11:17');
INSERT INTO `tour_route_pois` VALUES (39, 1, 1028, 4, '2025-12-12 14:48:25');
INSERT INTO `tour_route_pois` VALUES (40, 1, 1030, 5, '2025-12-12 14:48:25');
INSERT INTO `tour_route_pois` VALUES (41, 1, 1029, 6, '2025-12-12 14:48:25');
INSERT INTO `tour_route_pois` VALUES (42, 1, 1020, 7, '2025-12-12 14:48:25');
INSERT INTO `tour_route_pois` VALUES (43, 1, 1033, 8, '2025-12-12 14:48:25');
INSERT INTO `tour_route_pois` VALUES (44, 1, 1079, 9, '2025-12-12 22:24:03');
INSERT INTO `tour_route_pois` VALUES (45, 1, 1077, 10, '2025-12-12 22:24:03');
INSERT INTO `tour_route_pois` VALUES (46, 1, 1074, 11, '2025-12-12 22:24:03');
INSERT INTO `tour_route_pois` VALUES (47, 1, 1073, 12, '2025-12-12 22:24:03');
INSERT INTO `tour_route_pois` VALUES (48, 2, 1056, 5, '2025-12-12 22:24:36');
INSERT INTO `tour_route_pois` VALUES (49, 2, 1058, 6, '2025-12-12 22:24:36');
INSERT INTO `tour_route_pois` VALUES (50, 2, 1060, 7, '2025-12-12 22:24:36');
INSERT INTO `tour_route_pois` VALUES (51, 2, 1061, 8, '2025-12-12 22:24:36');

-- ----------------------------
-- Table structure for tour_routes
-- ----------------------------
DROP TABLE IF EXISTS `tour_routes`;
CREATE TABLE `tour_routes`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '路线ID',
  `route_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '路线名称（如：吃货路线）',
  `route_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路线描述（如：一路进吃进吃）',
  `thumbnail_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路线缩略图URL（默认使用第一个POI的图片）',
  `estimated_duration` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '建议游览时长（如：3小时）',
  `poi_count` int NULL DEFAULT 0 COMMENT 'POI数量（冗余字段，便于展示）',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序权重（数字越大越靠前）',
  `is_published` tinyint(1) NULL DEFAULT 1 COMMENT '是否发布（0否1是）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_is_published`(`is_published` ASC) USING BTREE,
  INDEX `idx_sort_order`(`sort_order` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '游览路线表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tour_routes
-- ----------------------------
INSERT INTO `tour_routes` VALUES (1, '吃货路线', '一路进吃进吃', NULL, '2小时', 3, 1, 1, '', '2025-12-12 09:44:08', '', '2025-12-12 11:07:58', NULL);
INSERT INTO `tour_routes` VALUES (2, '游玩路线', '建议3个小时', NULL, '3小时', 9, 2, 1, '', '2025-12-12 09:44:08', '', '2025-12-12 11:07:17', NULL);

SET FOREIGN_KEY_CHECKS = 1;
