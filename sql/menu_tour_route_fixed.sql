-- ----------------------------
-- 游览路线管理菜单脚本（修正版）
-- ----------------------------

-- 1. 游览路线管理菜单
INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('游览路线管理', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='景点管理' AND parent_id=0) t), 3, 'route', 'attraction/route/index', 1, 0, 'C', '0', '0', 'system:route:list', 'el-icon-guide', 'admin', sysdate(), '', NULL, '游览路线管理菜单');

-- 2. 按钮权限（游览路线管理）

-- 查询按钮
INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('路线查询', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='游览路线管理') t), 1, '#', '', 1, 0, 'F', '0', '0', 'system:route:query', '#', 'admin', sysdate(), '', NULL, '');

-- 新增按钮
INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('路线新增', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='游览路线管理') t), 2, '#', '', 1, 0, 'F', '0', '0', 'system:route:add', '#', 'admin', sysdate(), '', NULL, '');

-- 修改按钮
INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('路线修改', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='游览路线管理') t), 3, '#', '', 1, 0, 'F', '0', '0', 'system:route:edit', '#', 'admin', sysdate(), '', NULL, '');

-- 删除按钮
INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('路线删除', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='游览路线管理') t), 4, '#', '', 1, 0, 'F', '0', '0', 'system:route:remove', '#', 'admin', sysdate(), '', NULL, '');

-- 导出按钮
INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('路线导出', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='游览路线管理') t), 5, '#', '', 1, 0, 'F', '0', '0', 'system:route:export', '#', 'admin', sysdate(), '', NULL, '');
