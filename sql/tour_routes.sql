-- 游览路线功能数据库表设计
-- 创建时间：2025-12-11

-- 1. 给 poi_points 表增加 tags 字段（用于显示标签，如"打卡"、"瀑布"等）
ALTER TABLE poi_points ADD COLUMN tags VARCHAR(100) DEFAULT NULL COMMENT 'POI标签（多个用逗号分隔）' AFTER description;

-- 2. 创建游览路线主表
DROP TABLE IF EXISTS `tour_routes`;
CREATE TABLE `tour_routes` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '路线ID',
  `route_name` VARCHAR(100) NOT NULL COMMENT '路线名称（如：吃货路线）',
  `route_description` VARCHAR(255) DEFAULT NULL COMMENT '路线描述（如：一路进吃进吃）',
  `thumbnail_url` VARCHAR(255) DEFAULT NULL COMMENT '路线缩略图URL（默认使用第一个POI的图片）',
  `estimated_duration` VARCHAR(50) DEFAULT NULL COMMENT '建议游览时长（如：3小时）',
  `poi_count` INT DEFAULT 0 COMMENT 'POI数量（冗余字段，便于展示）',
  `sort_order` INT DEFAULT 0 COMMENT '排序权重（数字越大越靠前）',
  `is_published` TINYINT(1) DEFAULT 1 COMMENT '是否发布（0否1是）',
  `create_by` VARCHAR(64) DEFAULT '' COMMENT '创建者',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` VARCHAR(64) DEFAULT '' COMMENT '更新者',
  `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` VARCHAR(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `idx_is_published` (`is_published`),
  KEY `idx_sort_order` (`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='游览路线表';

-- 3. 创建路线-POI关联表
DROP TABLE IF EXISTS `tour_route_pois`;
CREATE TABLE `tour_route_pois` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `route_id` BIGINT NOT NULL COMMENT '路线ID',
  `poi_id` BIGINT NOT NULL COMMENT 'POI点位ID',
  `sequence_order` INT NOT NULL COMMENT '序号（1,2,3...用于排序）',
  `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_route_poi` (`route_id`, `poi_id`),
  KEY `idx_route_id` (`route_id`),
  KEY `idx_poi_id` (`poi_id`),
  KEY `idx_sequence_order` (`sequence_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='路线POI关联表';

-- 4. 插入测试路线数据
INSERT INTO `tour_routes` (`route_name`, `route_description`, `estimated_duration`, `poi_count`, `sort_order`, `is_published`) VALUES
('吃货路线', '一路进吃进吃', '2小时', 12, 1, 1),
('寻桥路线', '建议3个小时', '3小时', 9, 2, 1);

-- 注意：路线-POI关联数据需要等POI测试数据生成后再插入
