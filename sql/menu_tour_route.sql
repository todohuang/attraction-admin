-- 游览路线管理菜单SQL
-- 注意：执行前需要确认父菜单ID，这里假设"景区管理"的菜单ID为2000

-- 1. 游览路线管理菜单
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('游览路线管理', 2000, 3, 'route', 'attraction/route/index', 1, 0, 'C', '0', '0', 'system:route:list', 'guide', 'admin', sysdate(), '', null, '游览路线管理菜单');

-- 获取刚插入的菜单ID（假设为2003，实际需要查询获取）
-- SELECT @menuId := LAST_INSERT_ID();

-- 2. 游览路线管理按钮权限
-- 注意：下面的 parent_id 需要替换为上面插入的实际菜单ID

-- 查询按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('游览路线查询', 2003, 1, '#', '', 1, 0, 'F', '0', '0', 'system:route:query', '#', 'admin', sysdate(), '', null, '');

-- 新增按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('游览路线新增', 2003, 2, '#', '', 1, 0, 'F', '0', '0', 'system:route:add', '#', 'admin', sysdate(), '', null, '');

-- 修改按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('游览路线修改', 2003, 3, '#', '', 1, 0, 'F', '0', '0', 'system:route:edit', '#', 'admin', sysdate(), '', null, '');

-- 删除按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('游览路线删除', 2003, 4, '#', '', 1, 0, 'F', '0', '0', 'system:route:remove', '#', 'admin', sysdate(), '', null, '');

-- 导出按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('游览路线导出', 2003, 5, '#', '', 1, 0, 'F', '0', '0', 'system:route:export', '#', 'admin', sysdate(), '', null, '');


-- ================================================================================
-- 如果"景区管理"父菜单不存在，使用下面的完整SQL（包含父菜单和子菜单）
-- ================================================================================

-- 一级菜单：景区管理
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- VALUES ('景区管理', 0, 5, 'attraction', null, 1, 0, 'M', '0', '0', '', 'tree', 'admin', sysdate(), '', null, '景区管理目录');

-- 二级菜单：POI分类管理（如果已存在则跳过）
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- VALUES ('POI分类管理', 2000, 1, 'category', 'attraction/category/index', 1, 0, 'C', '0', '0', 'system:category:list', 'list', 'admin', sysdate(), '', null, 'POI分类管理菜单');

-- 二级菜单：POI点位管理（如果已存在则跳过）
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- VALUES ('POI点位管理', 2000, 2, 'poi', 'attraction/poi/index', 1, 0, 'C', '0', '0', 'system:poi:list', 'guide', 'admin', sysdate(), '', null, 'POI点位管理菜单');


-- ================================================================================
-- 执行说明：
-- 1. 先查询"景区管理"父菜单的ID：
--    SELECT menu_id FROM sys_menu WHERE menu_name = '景区管理';
--
-- 2. 如果没有"景区管理"菜单，先执行上面注释的SQL创建父菜单
--
-- 3. 将上面SQL中的 parent_id (2000) 替换为实际查询到的ID
--
-- 4. 执行游览路线管理菜单SQL
--
-- 5. 查询刚插入的"游览路线管理"菜单ID：
--    SELECT menu_id FROM sys_menu WHERE menu_name = '游览路线管理';
--
-- 6. 将按钮权限SQL中的 parent_id (2003) 替换为实际的菜单ID
--
-- 7. 执行按钮权限SQL
-- ================================================================================
