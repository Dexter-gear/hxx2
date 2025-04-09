import request from '@/utils/request'

// 查询购物车视图列表
export function listCarts(query) {
  return request({
    url: '/system/carts/list',
    method: 'get',
    params: query
  })
}

// 查询购物车视图详细
export function getCarts(cartId) {
  return request({
    url: '/system/carts/' + cartId,
    method: 'get'
  })
}

// 新增购物车视图
export function addCarts(data) {
  return request({
    url: '/system/carts',
    method: 'post',
    data: data
  })
}

// 修改购物车视图
export function updateCarts(data) {
  return request({
    url: '/system/carts',
    method: 'put',
    data: data
  })
}

// 删除购物车视图
export function delCarts(cartId) {
  return request({
    url: '/system/carts/' + cartId,
    method: 'delete'
  })
}
