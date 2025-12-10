import request from '@/utils/request'

// 查询POI点位信息列表
export function listPoi(query) {
  return request({
    url: '/system/poi/list',
    method: 'get',
    params: query
  })
}

// 查询POI点位信息详细
export function getPoi(id) {
  return request({
    url: '/system/poi/' + id,
    method: 'get'
  })
}

// 新增POI点位信息
export function addPoi(data) {
  return request({
    url: '/system/poi',
    method: 'post',
    data: data
  })
}

// 修改POI点位信息
export function updatePoi(data) {
  return request({
    url: '/system/poi',
    method: 'put',
    data: data
  })
}

// 删除POI点位信息
export function delPoi(id) {
  return request({
    url: '/system/poi/' + id,
    method: 'delete'
  })
}
