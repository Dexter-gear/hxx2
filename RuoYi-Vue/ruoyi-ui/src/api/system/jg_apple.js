import request from '@/utils/request'

// 查询金冠苹果列表
export function listJg_apple(query) {
  return request({
    url: '/system/jg_apple/list',
    method: 'get',
    params: query
  })
}

// 查询金冠苹果详细
export function getJg_apple(id) {
  return request({
    url: '/system/jg_apple/' + id,
    method: 'get'
  })
}

// 新增金冠苹果
export function addJg_apple(data) {
  return request({
    url: '/system/jg_apple',
    method: 'post',
    data: data
  })
}

// 修改金冠苹果
export function updateJg_apple(data) {
  return request({
    url: '/system/jg_apple',
    method: 'put',
    data: data
  })
}

// 删除金冠苹果
export function delJg_apple(id) {
  return request({
    url: '/system/jg_apple/' + id,
    method: 'delete'
  })
}
