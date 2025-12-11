-- ----------------------------
-- 为 poi_points 表添加语音文本和时长字段
-- 用于支持TTS文本朗读功能
-- 执行日期: 2025-12-11
-- ----------------------------

-- 添加 voice_text 字段（TTS文本内容）
ALTER TABLE `poi_points`
ADD COLUMN `voice_text` TEXT COMMENT 'TTS语音文本内容（优先级低于voice_url）' AFTER `voice_url`;

-- 添加 voice_duration 字段（音频时长，秒）
ALTER TABLE `poi_points`
ADD COLUMN `voice_duration` INT DEFAULT NULL COMMENT '语音时长（秒），仅音频文件有值' AFTER `voice_text`;

-- 更新说明：
-- 1. voice_url: 音频文件URL，优先使用
-- 2. voice_text: TTS朗读文本，当voice_url为空时使用
-- 3. voice_duration: 音频时长，仅音频文件模式有值，TTS模式为NULL
-- 4. 如果voice_url和voice_text都为空，前端将使用description字段进行TTS朗读

-- 示例数据更新（可选）
-- UPDATE `poi_points` SET `voice_text` = '吉安欢乐世界主入口，开启您的欢乐之旅。' WHERE `id` = 1;
-- UPDATE `poi_points` SET `voice_text` = '位于大门右侧的卫生间，方便游客使用。' WHERE `id` = 2;
