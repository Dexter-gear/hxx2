import request from '@/utils/request'

// 查询商品视图列表
export function listProducts(query) {
  return request({
    url: '/system/products/list',
    method: 'get',
    params: query
  })
}

// 查询商品视图详细
export function getProducts(productType) {
  return request({
    url: '/system/products/' + productType,
    method: 'get'
  })
}

// 新增商品视图
export function addProducts(data) {
  return request({
    url: '/system/products',
    method: 'post',
    data: data
  })
}

// 修改商品视图
export function updateProducts(data) {
  return request({
    url: '/system/products',
    method: 'put',
    data: data
  })
}

// 删除商品视图
export function delProducts(productType) {
  return request({
    url: '/system/products/' + productType,
    method: 'delete'
  })
}
