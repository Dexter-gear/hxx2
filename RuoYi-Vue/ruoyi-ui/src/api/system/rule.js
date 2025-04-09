import request from '@/utils/request'

// 查询价格计算规则列表
export function listRule(query) {
  return request({
    url: '/system/rule/list',
    method: 'get',
    params: query
  })
}

// 查询价格计算规则详细
export function getRule(id) {
  return request({
    url: '/system/rule/' + id,
    method: 'get'
  })
}

// 新增价格计算规则
export function addRule(data) {
  return request({
    url: '/system/rule',
    method: 'post',
    data: data
  })
}

// 修改价格计算规则
export function updateRule(data) {
  return request({
    url: '/system/rule',
    method: 'put',
    data: data
  })
}

// 删除价格计算规则
export function delRule(id) {
  return request({
    url: '/system/rule/' + id,
    method: 'delete'
  })
}
