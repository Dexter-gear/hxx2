import request from '@/utils/request'

// 查询国光苹果列表
export function listGg_apple(query) {
  return request({
    url: '/system/gg_apple/list',
    method: 'get',
    params: query
  })
}

// 查询国光苹果详细
export function getGg_apple(id) {
  return request({
    url: '/system/gg_apple/' + id,
    method: 'get'
  })
}

// 新增国光苹果
export function addGg_apple(data) {
  return request({
    url: '/system/gg_apple',
    method: 'post',
    data: data
  })
}

// 修改国光苹果
export function updateGg_apple(data) {
  return request({
    url: '/system/gg_apple',
    method: 'put',
    data: data
  })
}

// 删除国光苹果
export function delGg_apple(id) {
  return request({
    url: '/system/gg_apple/' + id,
    method: 'delete'
  })
}
