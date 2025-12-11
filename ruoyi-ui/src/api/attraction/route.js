import request from '@/utils/request'

// 查询游览路线列表
export function listRoute(query) {
  return request({
    url: '/system/route/list',
    method: 'get',
    params: query
  })
}

// 查询游览路线详细
export function getRoute(id) {
  return request({
    url: '/system/route/' + id,
    method: 'get'
  })
}

// 新增游览路线
export function addRoute(data) {
  return request({
    url: '/system/route',
    method: 'post',
    data: data
  })
}

// 修改游览路线
export function updateRoute(data) {
  return request({
    url: '/system/route',
    method: 'put',
    data: data
  })
}

// 删除游览路线
export function delRoute(ids) {
  return request({
    url: '/system/route/' + ids,
    method: 'delete'
  })
}

// 查询路线POI列表
export function listRoutePoi(routeId) {
  return request({
    url: '/system/route/poi/list/' + routeId,
    method: 'get'
  })
}

// 添加POI到路线
export function addPoiToRoute(data) {
  return request({
    url: '/system/route/poi/add',
    method: 'post',
    data: data
  })
}

// 从路线移除POI
export function removePoiFromRoute(id) {
  return request({
    url: '/system/route/poi/' + id,
    method: 'delete'
  })
}

// 更新POI排序
export function updatePoiSort(data) {
  return request({
    url: '/system/route/poi/sort',
    method: 'put',
    data: data
  })
}
