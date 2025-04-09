import request from '@/utils/request'

// 查询红星苹果列表
export function listHx_apple(query) {
  return request({
    url: '/system/hx_apple/list',
    method: 'get',
    params: query
  })
}

// 查询红星苹果详细
export function getHx_apple(id) {
  return request({
    url: '/system/hx_apple/' + id,
    method: 'get'
  })
}

// 新增红星苹果
export function addHx_apple(data) {
  return request({
    url: '/system/hx_apple',
    method: 'post',
    data: data
  })
}

// 修改红星苹果
export function updateHx_apple(data) {
  return request({
    url: '/system/hx_apple',
    method: 'put',
    data: data
  })
}

// 删除红星苹果
export function delHx_apple(id) {
  return request({
    url: '/system/hx_apple/' + id,
    method: 'delete'
  })
}
