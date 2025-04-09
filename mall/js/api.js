const baseURL = 'http://localhost:8080' // RuoYi-Vue后端地址

const api = axios.create({
  baseURL,
  timeout: 5000
})

// 添加请求拦截器
api.interceptors.request.use(
  config => {
    // 从localStorage获取token
    const token = localStorage.getItem('token')
    if (token) {
      config.headers['Authorization'] = 'Bearer ' + token
    }
    return config
  },
  error => {
    console.error('请求错误:', error)
    return Promise.reject(error)
  }
)

// 添加响应拦截器
api.interceptors.response.use(
  response => {
    // 如果响应成功，直接返回数据
    return response.data
  },
  error => {
    console.error('API请求失败:', error)
    if (error.response && error.response.status === 401) {
      // 未认证，跳转到登录页
      window.location.href = 'login.html'
    }
    return Promise.reject(error)
  }
)

// 获取验证码
function getCaptchaImage() {
  return api.get('/captchaImage')
}

// 获取商品列表
function getProductList(params) {
  return api.get('/system/product/list', { params })
}

// 获取商品详情
function getProductDetail(productId) {
  return api.get(`/system/product/${productId}`)
}

// 获取分类列表
function getCategoryList() {
  return api.get('/system/category/list')
}

// 根据分类获取商品
function getProductsByCategory(categoryId) {
  return api.get(`/system/product/category/${categoryId}`)
}

// 获取上架商品
function getOnSaleProducts() {
  return api.get('/system/product/list', {
    params: {
      status: 1  // 1表示上架状态
    }
  })
}

// 用户登录
function login(username, password, code, uuid) {
  return api.post('/login', {
    username,
    password,
    code,
    uuid
  })
}

// 获取苹果详情
function getAppleDetail(id, productType) {
  const typeMap = {
    'red_fuji_apple': '/system/hfs_apple',
    'hongxing_apple': '/system/hx_apple',
    'guoguang_apple': '/system/gg_apple',
    'jinguan_apple': '/system/jg_apple',
    'green_apple': '/system/g_apple'
  }
  
  const baseUrl = typeMap[productType] || '/system/apples'
  return api.get(`${baseUrl}/${id}`)
}

// 获取所有苹果列表
function getAllApples() {
  return api.get('/system/apples/list')
}

// 获取红富士苹果列表
function getRedFujiApples() {
  return api.get('/system/hfs_apple/list')
}

// 获取红星苹果列表
function getHongxingApples() {
  return api.get('/system/hx_apple/list')
}

// 获取国光苹果列表
function getGuoguangApples() {
  return api.get('/system/gg_apple/list')
}

// 获取金冠苹果列表
function getJinguanApples() {
  return api.get('/system/jg_apple/list')
}

// 获取青苹果列表
function getGreenApples() {
  return api.get('/system/g_apple/list')
}

// 导出API函数
window.api = {
  getProductList,
  getProductDetail,
  getCategoryList,
  getProductsByCategory,
  getOnSaleProducts,
  login,
  getCaptchaImage,
  getAppleDetail,
  getAllApples,
  getRedFujiApples,
  getHongxingApples,
  getGuoguangApples,
  getJinguanApples,
  getGreenApples
} 