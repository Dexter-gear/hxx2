import request from '@/utils/request'

// 查询VIEW列表
export function listApples(query) {
  return request({
    url: '/system/apples/list',
    method: 'get',
    params: query
  })
}

// 查询VIEW详细
export function getApples(productType) {
  return request({
    url: '/system/apples/' + productType,
    method: 'get'
  })
}

// 新增VIEW
export function addApples(data) {
  return request({
    url: '/system/apples',
    method: 'post',
    data: data
  })
}

// 修改VIEW
export function updateApples(data) {
  return request({
    url: '/system/apples',
    method: 'put',
    data: data
  })
}

// 删除VIEW
export function delApples(productType) {
  return request({
    url: '/system/apples/' + productType,
    method: 'delete'
  })
}
