-- ----------------------------
-- 1. POI 分类表 (poi_categories)
-- ----------------------------
DROP TABLE IF EXISTS `poi_categories`;
CREATE TABLE `poi_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_name` varchar(50) NOT NULL COMMENT '分类名称',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '分类图标URL',
  `sort_order` int(11) DEFAULT '0' COMMENT '排序',
  `is_active` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='POI分类表';

-- ----------------------------
-- 初始化分类数据
-- ----------------------------
INSERT INTO `poi_categories` (`id`, `category_name`, `icon_url`, `sort_order`) VALUES
(1, '景点', 'default_scenic_icon.png', 1),
(2, '卫生间', 'default_toilet_icon.png', 2),
(3, '民宿', 'default_hotel_icon.png', 3),
(4, '餐饮', 'default_food_icon.png', 4),
(5, '演出地点', 'default_show_icon.png', 5),
(6, '停车场', 'default_parking_icon.png', 6),
(7, '购物', 'default_shopping_icon.png', 7),
(8, '吸烟点', 'default_smoking_icon.png', 8);


-- ----------------------------
-- 2. POI 点位信息表 (poi_points)
-- ----------------------------
DROP TABLE IF EXISTS `poi_points`;
CREATE TABLE `poi_points` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_id` bigint(20) NOT NULL COMMENT '所属分类ID',
  `poi_name` varchar(100) NOT NULL COMMENT 'POI名称',
  `longitude` decimal(10,6) NOT NULL COMMENT '经度',
  `latitude` decimal(10,6) NOT NULL COMMENT '纬度',
  `description` text COMMENT '详细简介',
  `operating_hours` varchar(100) DEFAULT NULL COMMENT '营业时间',
  `voice_url` varchar(255) DEFAULT NULL COMMENT '语音导览URL',
  `main_image_url` varchar(255) DEFAULT NULL COMMENT '主要图片URL',
  `visit_count` int(11) DEFAULT '0' COMMENT '访问热度',
  `is_published` tinyint(1) DEFAULT '0' COMMENT '是否发布',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`),
  CONSTRAINT `fk_poi_category` FOREIGN KEY (`category_id`) REFERENCES `poi_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COMMENT='POI点位信息表';

-- ----------------------------
-- 初始化 POI 测试数据 (吉安欢乐世界大门附近)
-- ----------------------------
INSERT INTO `poi_points` (`category_id`, `poi_name`, `longitude`, `latitude`, `description`, `is_published`) VALUES
(1, '欢乐世界大门', 114.958173, 27.073938, '吉安欢乐世界主入口，开启您的欢乐之旅。', 1),
(2, '入口卫生间', 114.958500, 27.073800, '位于大门右侧，方便游客使用。', 1),
(1, '摩天轮', 114.959000, 27.075000, '俯瞰整个园区的最佳视角。', 1);
