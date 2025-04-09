// 购物车功能实现
class Cart {
    constructor() {
        console.log('购物车初始化开始...');
        this.userId = this.getUserId(); // 获取当前用户ID
        this.cartItems = []; // 购物车商品列表
        this.token = this.getToken(); // 获取token
        console.log('用户信息:', {
            userId: this.userId,
            token: this.token ? '已获取' : '未获取'
        });
        this.init();
        this.bindEvents(); // 绑定事件
    }

    // 获取当前用户ID
    getUserId() {
        // 默认返回用户ID为1
        return '1';
    }

    // 获取token
    getToken() {
        return localStorage.getItem('token');
    }

    // 初始化购物车
    async init() {
        try {
            console.log('开始获取购物车列表...');
            const cartList = await this.getUserCart();
            console.log('获取到的购物车列表:', cartList);
            
            if (cartList && cartList.length > 0) {
                this.cartItems = cartList.map(item => ({
                    productId: item.productId,
                    productType: item.productType,
                    name: item.productName,
                    image: item.imageUrl || 'images/product-mini-4-146x132.png',
                    price: item.price,
                    description: item.description,
                    qualityLevel: item.qualityLevel,
                    stock: item.stock,
                    quantity: 1,
                    totalPrice: item.price
                }));
                
                console.log('处理后的购物车数据:', this.cartItems);
                this.renderCart();
            } else {
                console.log('购物车为空');
            }
        } catch (error) {
            console.error('购物车初始化失败:', error);
        }
    }

    // 获取用户购物车列表
    async getUserCart() {
        try {
            const response = await axios.get('http://localhost:8080/system/carts/list', {
                headers: {
                    'Authorization': `Bearer ${this.token}`
                }
            });
            return response.data.rows || [];
        } catch (error) {
            console.error('获取购物车列表失败:', error);
            return [];
        }
    }

    // 添加到购物车
    async addToCart(product) {
        console.log('开始添加商品到购物车:', product);
        try {
            if (!this.userId || !this.token) {
                console.error('用户ID或token未获取');
                this.showMessage('请先登录');
                return;
            }

            // 表名到商品类型的映射
            const tableToType = {
                'hfs_apple': 'red_fuji_apple',
                'hx_apple': 'hongxing_apple',
                'gg_apple': 'guoguang_apple',
                'jg_apple': 'jinguan_apple',
                'g_apple': 'green_apple'
            };

            // 转换商品类型
            const productType = tableToType[product.productType];
            if (!productType) {
                console.error('无效的商品类型:', product.productType);
                this.showMessage('无效的商品类型');
                return;
            }

            // 构建请求数据
            const requestData = {
                userId: this.userId,
                productType: productType,
                productId: product.id,
                quantity: 1
            };
            console.log('发送添加请求:', requestData);

            // 发送请求
            const response = await axios.post('http://localhost:8080/system/cart', requestData, {
                headers: {
                    'Authorization': `Bearer ${this.token}`,
                    'Content-Type': 'application/json'
                }
            });

            console.log('添加商品响应:', response.data);

            if (response.data.code === 200) {
                console.log('商品添加成功，刷新购物车');
                this.init(); // 刷新购物车列表
                this.showMessage('商品已添加到购物车');
            } else {
                console.warn('添加失败:', response.data.msg);
                this.showMessage('添加失败: ' + response.data.msg);
            }
        } catch (error) {
            console.error('添加到购物车失败:', error);
            if (error.response) {
                console.error('错误响应:', error.response.data);
            }
            this.showMessage('添加到购物车失败');
        }
    }

    // 显示消息
    showMessage(message) {
        // 创建消息元素
        const messageElement = document.createElement('div');
        messageElement.className = 'alert alert-success';
        messageElement.textContent = message;
        messageElement.style.position = 'fixed';
        messageElement.style.top = '20px';
        messageElement.style.right = '20px';
        messageElement.style.zIndex = '9999';
        
        // 添加到页面
        document.body.appendChild(messageElement);
        
        // 2秒后移除
        setTimeout(() => {
            messageElement.remove();
        }, 2000);
    }

    // 渲染购物车
    renderCart() {
        const cartTable = document.querySelector('.table-cart tbody');
        if (!cartTable) return;

        // 清空现有内容
        cartTable.innerHTML = '';

        // 渲染每个商品
        this.cartItems.forEach(item => {
            console.log('渲染商品:', item);
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>
                    <a class="table-cart-figure" href="single-product.html?id=${item.productId}">
                        <img src="${item.image}" alt="${item.name}" width="146" height="132"/>
                    </a>
                    <a class="table-cart-link" href="single-product.html?id=${item.productId}" style="font-size: 14px;">${item.name}</a>
                    <div class="table-cart-description" style="font-size: 12px; color: #666;">${item.description || ''}</div>
                    <div class="table-cart-quality" style="font-size: 12px; color: #666;">品质等级: ${item.qualityLevel}</div>
                </td>
                <td style="font-size: 14px;">¥${item.price.toFixed(2)}</td>
                <td>
                    <div class="table-cart-stepper">
                        <input class="form-input" type="number" data-zeros="true" 
                               value="${item.quantity}" min="1" max="${item.stock}" 
                               title="商品数量" placeholder="1"
                               data-product-id="${item.productId}"
                               style="font-size: 14px;">
                    </div>
                </td>
                <td style="font-size: 14px;">¥${item.totalPrice.toFixed(2)}</td>
            `;
            cartTable.appendChild(row);
        });

        // 更新总价
        this.updateTotal();
    }

    // 更新商品数量
    async updateQuantity(productId, quantity) {
        try {
            // 更新本地购物车数据
            const item = this.cartItems.find(item => item.productId === productId);
            if (item) {
                item.quantity = quantity;
                item.totalPrice = item.price * quantity;
                this.renderCart();
            }
        } catch (error) {
            console.error('更新商品数量失败:', error);
        }
    }

    // 删除商品
    async removeItem(productId) {
        try {
            await axios.delete(`http://localhost:8080/system/cart/${productId}`, {
                headers: {
                    'Authorization': `Bearer ${this.token}`
                }
            });
            // 更新本地购物车数据
            this.cartItems = this.cartItems.filter(item => item.productId !== productId);
            this.renderCart();
        } catch (error) {
            console.error('删除商品失败:', error);
        }
    }

    // 更新总价
    updateTotal() {
        const total = this.cartItems.reduce((sum, item) => {
            return sum + item.totalPrice;
        }, 0);
        
        // 更新总计价格
        const totalElement = document.querySelector('.heading-3.fw-normal');
        if (totalElement) {
            totalElement.textContent = `¥${total.toFixed(2)}`;
        }
    }

    // 创建订单
    async createOrder() {
        console.log('开始创建订单...');
        try {
            if (!this.userId || !this.token) {
                console.error('用户ID或token未获取');
                this.showMessage('请先登录');
                return;
            }

            if (this.cartItems.length === 0) {
                console.error('购物车为空');
                this.showMessage('购物车为空');
                return;
            }

            // 生成订单号
            const orderNo = 'ORD' + Date.now() + Math.floor(Math.random() * 1000);

            // 1. 先创建订单
            const orderData = {
                userId: this.userId,
                orderNo: orderNo,
                totalAmount: this.cartItems.reduce((sum, item) => sum + (item.price * item.quantity), 0)
            };

            console.log('发送创建订单请求:', orderData);
            const orderResponse = await axios.post('http://localhost:8080/system/orders', orderData, {
                headers: {
                    'Authorization': `Bearer ${this.token}`,
                    'Content-Type': 'application/json'
                }
            });

            console.log('创建订单响应:', orderResponse.data);

            if (orderResponse.data.code !== 200) {
                console.warn('创建订单失败:', orderResponse.data.msg);
                this.showMessage('创建订单失败: ' + orderResponse.data.msg);
                return;
            }

            // 2. 获取用户的所有订单
            const ordersResponse = await axios.get('http://localhost:8080/system/orders/list', {
                headers: {
                    'Authorization': `Bearer ${this.token}`
                }
            });

            console.log('获取订单列表响应:', ordersResponse.data);

            if (ordersResponse.data.code !== 200) {
                console.warn('获取订单列表失败:', ordersResponse.data.msg);
                this.showMessage('获取订单列表失败: ' + ordersResponse.data.msg);
                return;
            }

            // 获取最新的订单ID
            const orders = ordersResponse.data.rows;
            if (!orders || orders.length === 0) {
                console.warn('未找到订单');
                this.showMessage('未找到订单');
                return;
            }

            // 按创建时间排序，获取最新的订单
            const latestOrder = orders.sort((a, b) => new Date(b.createTime) - new Date(a.createTime))[0];
            const orderId = latestOrder.id;

            // 3. 逐个创建订单详情
            let allDetailsSuccess = true;
            for (const item of this.cartItems) {
                const orderDetail = {
                    orderId: orderId,
                    productId: item.productId,
                    productType: item.productType,
                    quantity: item.quantity,
                    price: item.price
                };

                console.log('发送创建订单详情请求:', orderDetail);
                const detailResponse = await axios.post('http://localhost:8080/system/detail', orderDetail, {
                    headers: {
                        'Authorization': `Bearer ${this.token}`,
                        'Content-Type': 'application/json'
                    }
                });

                console.log('创建订单详情响应:', detailResponse.data);

                if (detailResponse.data.code !== 200) {
                    console.warn('创建订单详情失败:', detailResponse.data.msg);
                    allDetailsSuccess = false;
                    break;
                }
            }

            if (allDetailsSuccess) {
                console.log('订单创建成功');
                this.showMessage('订单创建成功');
                // 清空购物车
                this.cartItems = [];
                this.renderCart();
            } else {
                console.warn('创建订单详情失败');
                this.showMessage('创建订单详情失败');
            }
        } catch (error) {
            console.error('创建订单失败:', error);
            if (error.response) {
                console.error('错误响应:', error.response.data);
            }
            this.showMessage('创建订单失败');
        }
    }

    // 绑定事件
    bindEvents() {
        console.log('开始绑定事件...');
        
        // 监听添加到购物车按钮点击
        document.addEventListener('click', (e) => {
            console.log('点击事件触发:', e.target);
            
            // 检查是否是添加到购物车按钮
            const addToCartButton = e.target.closest('.button-zakaria.fl-bigmug-line-shopping202');
            if (addToCartButton) {
                console.log('找到添加到购物车按钮');
                e.preventDefault();
                
                // 获取商品容器
                const productContainer = e.target.closest('.isotope-item');
                if (productContainer) {
                    console.log('找到商品容器:', productContainer);
                    
                    // 从商品容器中获取商品信息
                    const productLink = productContainer.querySelector('a[href^="single-product.html"]');
                    const href = productLink.getAttribute('href');
                    const params = new URLSearchParams(href.split('?')[1]);
                    
                    const product = {
                        id: params.get('id'),
                        productType: params.get('tableName'),
                        name: productContainer.querySelector('.product-title a').textContent,
                        price: parseFloat(productContainer.querySelector('.product-price').textContent.replace('¥', '')),
                        image: productContainer.querySelector('.product-figure img').getAttribute('src')
                    };
                    
                    console.log('准备添加的商品数据:', product);
                    this.addToCart(product);
                } else {
                    console.warn('未找到商品容器');
                }
            }

            // 检查是否是结算按钮
            const checkoutButton = e.target.closest('.button-lg.button-primary.button-zakaria');
            if (checkoutButton && checkoutButton.textContent.trim() === '去结算') {
                console.log('找到结算按钮');
                e.preventDefault();
                this.createOrder();
            }
        });

        // 监听数量输入框的变化
        const tableCart = document.querySelector('.table-cart');
        if (tableCart) {
            tableCart.addEventListener('change', (e) => {
                if (e.target.matches('input[type="number"]')) {
                    console.log('数量输入框变化:', e.target.value);
                    const productId = e.target.dataset.productId;
                    const newQuantity = parseInt(e.target.value);
                    if (newQuantity > 0) {
                        this.updateQuantity(productId, newQuantity);
                    }
                }
            });

            // 监听数量输入框的输入事件(实时更新)
            tableCart.addEventListener('input', (e) => {
                if (e.target.matches('input[type="number"]')) {
                    console.log('数量输入框实时输入:', e.target.value);
                    const productId = e.target.dataset.productId;
                    const newQuantity = parseInt(e.target.value);
                    if (newQuantity > 0) {
                        this.updateQuantity(productId, newQuantity, true);
                    }
                }
            });
        } else {
            console.warn('未找到购物车表格元素');
        }

        console.log('事件绑定完成');
    }
}

// 初始化购物车
document.addEventListener('DOMContentLoaded', () => {
    console.log('DOM加载完成，初始化购物车');
    const cart = new Cart();
}); 