import request from '@/utils/request'

// 查询红富士苹果列表
export function listHfs_apple(query) {
  return request({
    url: '/system/hfs_apple/list',
    method: 'get',
    params: query
  })
}

// 查询红富士苹果详细
export function getHfs_apple(id) {
  return request({
    url: '/system/hfs_apple/' + id,
    method: 'get'
  })
}

// 新增红富士苹果
export function addHfs_apple(data) {
  return request({
    url: '/system/hfs_apple',
    method: 'post',
    data: data
  })
}

// 修改红富士苹果
export function updateHfs_apple(data) {
  return request({
    url: '/system/hfs_apple',
    method: 'put',
    data: data
  })
}

// 删除红富士苹果
export function delHfs_apple(id) {
  return request({
    url: '/system/hfs_apple/' + id,
    method: 'delete'
  })
}
