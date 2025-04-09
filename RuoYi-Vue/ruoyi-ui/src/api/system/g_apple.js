import request from '@/utils/request'

// 查询青苹果列表
export function listG_apple(query) {
  return request({
    url: '/system/g_apple/list',
    method: 'get',
    params: query
  })
}

// 查询青苹果详细
export function getG_apple(id) {
  return request({
    url: '/system/g_apple/' + id,
    method: 'get'
  })
}

// 新增青苹果
export function addG_apple(data) {
  return request({
    url: '/system/g_apple',
    method: 'post',
    data: data
  })
}

// 修改青苹果
export function updateG_apple(data) {
  return request({
    url: '/system/g_apple',
    method: 'put',
    data: data
  })
}

// 删除青苹果
export function delG_apple(id) {
  return request({
    url: '/system/g_apple/' + id,
    method: 'delete'
  })
}
