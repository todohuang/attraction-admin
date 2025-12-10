-- ----------------------------
-- 景点管理菜单脚本
-- ----------------------------

-- 1. 景点管理目录
INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('景点管理', 0, 10, 'attraction', NULL, 1, 0, 'M', '0', '0', '', 'el-icon-map-location', 'admin', sysdate(), '', NULL, '景点管理目录');

-- 2. 分类管理菜单
INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('分类管理', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='景点管理' AND parent_id=0) t), 1, 'category', 'attraction/category/index', 1, 0, 'C', '0', '0', 'system:category:list', 'el-icon-menu', 'admin', sysdate(), '', NULL, '分类管理菜单');

-- 3. 点位管理菜单
INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('点位管理', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='景点管理' AND parent_id=0) t), 2, 'poi', 'attraction/poi/index', 1, 0, 'C', '0', '0', 'system:poi:list', 'el-icon-location', 'admin', sysdate(), '', NULL, '点位管理菜单');

-- 4. 按钮权限 (分类管理)
INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('分类查询', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='分类管理') t), 1, '#', '', 1, 0, 'F', '0', '0', 'system:category:query', '#', 'admin', sysdate(), '', NULL, '');

INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('分类新增', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='分类管理') t), 2, '#', '', 1, 0, 'F', '0', '0', 'system:category:add', '#', 'admin', sysdate(), '', NULL, '');

INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('分类修改', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='分类管理') t), 3, '#', '', 1, 0, 'F', '0', '0', 'system:category:edit', '#', 'admin', sysdate(), '', NULL, '');

INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('分类删除', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='分类管理') t), 4, '#', '', 1, 0, 'F', '0', '0', 'system:category:remove', '#', 'admin', sysdate(), '', NULL, '');

-- 5. 按钮权限 (点位管理)
INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('点位查询', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='点位管理') t), 1, '#', '', 1, 0, 'F', '0', '0', 'system:poi:query', '#', 'admin', sysdate(), '', NULL, '');

INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('点位新增', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='点位管理') t), 2, '#', '', 1, 0, 'F', '0', '0', 'system:poi:add', '#', 'admin', sysdate(), '', NULL, '');

INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('点位修改', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='点位管理') t), 3, '#', '', 1, 0, 'F', '0', '0', 'system:poi:edit', '#', 'admin', sysdate(), '', NULL, '');

INSERT INTO sys_menu(menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('点位删除', (SELECT menu_id FROM (SELECT menu_id FROM sys_menu WHERE menu_name='点位管理') t), 4, '#', '', 1, 0, 'F', '0', '0', 'system:poi:remove', '#', 'admin', sysdate(), '', NULL, '');

