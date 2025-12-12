-- ----------------------------
-- 路线POI管理页面隐藏菜单（解决404问题）
-- ----------------------------
-- 说明：此菜单不在左侧导航显示，仅用于路由注册，避免点击"管理POI"时出现404

INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('路线POI管理', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='游览路线管理') t), 6, 'poi', 'attraction/route/poi', 1, 0, 'C', '1', '0', 'system:route:edit', '#', 'admin', sysdate(), '', NULL, '路线POI管理页面（隐藏菜单）');
