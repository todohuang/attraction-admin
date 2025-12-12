-- 游览路线管理菜单SQL（自动获取父菜单ID版本）
-- 使用说明：直接执行即可，会自动查找"景区管理"父菜单ID

-- 方案一：如果"景区管理"菜单已存在
-- ================================================================================

-- 1. 插入游览路线管理菜单（自动获取父菜单ID）
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT '游览路线管理', menu_id, 3, 'route', 'attraction/route/index', 1, 0, 'C', '0', '0', 'system:route:list', 'guide', 'admin', sysdate(), '', null, '游览路线管理菜单'
FROM sys_menu WHERE menu_name = '景区管理' AND parent_id = 0;

-- 2. 插入按钮权限（自动获取刚插入的菜单ID）
-- 查询按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT '游览路线查询', menu_id, 1, '#', '', 1, 0, 'F', '0', '0', 'system:route:query', '#', 'admin', sysdate(), '', null, ''
FROM sys_menu WHERE menu_name = '游览路线管理' AND menu_type = 'C';

-- 新增按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT '游览路线新增', menu_id, 2, '#', '', 1, 0, 'F', '0', '0', 'system:route:add', '#', 'admin', sysdate(), '', null, ''
FROM sys_menu WHERE menu_name = '游览路线管理' AND menu_type = 'C';

-- 修改按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT '游览路线修改', menu_id, 3, '#', '', 1, 0, 'F', '0', '0', 'system:route:edit', '#', 'admin', sysdate(), '', null, ''
FROM sys_menu WHERE menu_name = '游览路线管理' AND menu_type = 'C';

-- 删除按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT '游览路线删除', menu_id, 4, '#', '', 1, 0, 'F', '0', '0', 'system:route:remove', '#', 'admin', sysdate(), '', null, ''
FROM sys_menu WHERE menu_name = '游览路线管理' AND menu_type = 'C';

-- 导出按钮
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
SELECT '游览路线导出', menu_id, 5, '#', '', 1, 0, 'F', '0', '0', 'system:route:export', '#', 'admin', sysdate(), '', null, ''
FROM sys_menu WHERE menu_name = '游览路线管理' AND menu_type = 'C';


-- ================================================================================
-- 方案二：如果"景区管理"菜单不存在，执行完整创建（父菜单+所有子菜单）
-- ================================================================================

-- 取消下面注释执行：

-- -- 1. 创建一级菜单：景区管理
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- VALUES ('景区管理', 0, 5, 'attraction', null, 1, 0, 'M', '0', '0', '', 'tree', 'admin', sysdate(), '', null, '景区管理目录');
--
-- -- 2. 创建二级菜单：POI分类管理
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- SELECT 'POI分类管理', menu_id, 1, 'category', 'attraction/category/index', 1, 0, 'C', '0', '0', 'system:category:list', 'list', 'admin', sysdate(), '', null, 'POI分类管理菜单'
-- FROM sys_menu WHERE menu_name = '景区管理' AND parent_id = 0;
--
-- -- 3. 创建二级菜单：POI点位管理
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- SELECT 'POI点位管理', menu_id, 2, 'poi', 'attraction/poi/index', 1, 0, 'C', '0', '0', 'system:poi:list', 'guide', 'admin', sysdate(), '', null, 'POI点位管理菜单'
-- FROM sys_menu WHERE menu_name = '景区管理' AND parent_id = 0;
--
-- -- 4. 创建二级菜单：游览路线管理
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- SELECT '游览路线管理', menu_id, 3, 'route', 'attraction/route/index', 1, 0, 'C', '0', '0', 'system:route:list', 'guide', 'admin', sysdate(), '', null, '游览路线管理菜单'
-- FROM sys_menu WHERE menu_name = '景区管理' AND parent_id = 0;
--
-- -- 5. 游览路线管理按钮权限（同方案一）
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- SELECT '游览路线查询', menu_id, 1, '#', '', 1, 0, 'F', '0', '0', 'system:route:query', '#', 'admin', sysdate(), '', null, ''
-- FROM sys_menu WHERE menu_name = '游览路线管理' AND menu_type = 'C';
--
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- SELECT '游览路线新增', menu_id, 2, '#', '', 1, 0, 'F', '0', '0', 'system:route:add', '#', 'admin', sysdate(), '', null, ''
-- FROM sys_menu WHERE menu_name = '游览路线管理' AND menu_type = 'C';
--
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- SELECT '游览路线修改', menu_id, 3, '#', '', 1, 0, 'F', '0', '0', 'system:route:edit', '#', 'admin', sysdate(), '', null, ''
-- FROM sys_menu WHERE menu_name = '游览路线管理' AND menu_type = 'C';
--
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- SELECT '游览路线删除', menu_id, 4, '#', '', 1, 0, 'F', '0', '0', 'system:route:remove', '#', 'admin', sysdate(), '', null, ''
-- FROM sys_menu WHERE menu_name = '游览路线管理' AND menu_type = 'C';
--
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- SELECT '游览路线导出', menu_id, 5, '#', '', 1, 0, 'F', '0', '0', 'system:route:export', '#', 'admin', sysdate(), '', null, ''
-- FROM sys_menu WHERE menu_name = '游览路线管理' AND menu_type = 'C';


-- ================================================================================
-- 验证SQL（执行后检查菜单是否创建成功）
-- ================================================================================

-- 查看景区管理菜单结构
SELECT menu_id, menu_name, parent_id, order_num, path, perms, menu_type
FROM sys_menu
WHERE menu_name LIKE '%景区%' OR menu_name LIKE '%POI%' OR menu_name LIKE '%路线%'
ORDER BY parent_id, order_num;
