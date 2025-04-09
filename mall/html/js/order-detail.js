class OrderDetail {
    constructor() {
        this.userId = this.getUserId();
        this.token = this.getToken();
        this.orderId = this.getOrderId();
        this.init();
    }

    // 获取用户ID
    getUserId() {
        return '1'; // 默认返回用户ID为1
    }

    // 获取token
    getToken() {
        return localStorage.getItem('token');
    }

    // 获取订单ID
    getOrderId() {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get('orderId');
    }

    // 初始化
    async init() {
        try {
            console.log('初始化订单详情页面');
            console.log('用户ID:', this.userId);
            console.log('Token:', this.token);
            console.log('订单ID:', this.orderId);

            if (!this.userId || !this.token) {
                this.showMessage('请先登录', 'error');
                setTimeout(() => {
                    window.location.href = 'login.html';
                }, 1500);
                return;
            }

            if (!this.orderId) {
                this.showMessage('订单ID不存在', 'error');
                return;
            }

            // 获取订单详情
            await this.getOrderDetail();
        } catch (error) {
            console.error('初始化失败:', error);
            this.showMessage('获取订单详情失败', 'error');
        }
    }

    // 获取订单详情
    async getOrderDetail() {
        try {
            console.log('开始获取订单详情，订单ID:', this.orderId);
            const response = await axios.get(`http://localhost:8080/system/detail/list`, {
                headers: {
                    'Authorization': `Bearer ${this.token}`
                }
            });

            console.log('订单详情响应:', response.data);

            if (response.data.code === 200) {
                // 根据orderId筛选订单详情
                const orderDetails = response.data.rows.filter(item => item.orderId == this.orderId);
                console.log('筛选后的订单详情:', orderDetails);

                if (orderDetails.length === 0) {
                    this.showMessage('未找到订单详情', 'error');
                    return;
                }

                // 计算订单总金额
                const totalAmount = orderDetails.reduce((sum, item) => sum + (item.price * item.quantity), 0);
                console.log('订单总金额:', totalAmount);

                // 获取订单创建时间（使用第一条记录的创建时间）
                const createTime = orderDetails[0].createTime;
                console.log('订单创建时间:', createTime);

                // 构建订单对象
                const order = {
                    orderNo: this.orderId,
                    createTime: createTime,
                    status: 1, // 默认状态为已付款
                    totalAmount: totalAmount,
                    items: orderDetails.map(item => ({
                        productName: this.getProductName(item.productType),
                        price: item.price,
                        quantity: item.quantity
                    }))
                };

                console.log('处理后的订单数据:', order);
                this.renderOrderDetail(order);
            } else {
                console.error('获取订单详情失败:', response.data.msg);
                this.showMessage(response.data.msg || '获取订单详情失败', 'error');
            }
        } catch (error) {
            console.error('获取订单详情失败:', error);
            this.showMessage('获取订单详情失败', 'error');
        }
    }

    // 根据产品类型获取产品名称
    getProductName(productType) {
        const productTypeMap = {
            'hongxing_apple': '红星苹果',
            'red_fuji_apple': '红富士苹果'
        };
        return productTypeMap[productType] || productType;
    }

    renderOrderDetail(order) {
        console.log('开始渲染订单详情:', order);
        // 渲染订单基本信息
        document.getElementById('orderNo').textContent = order.orderNo || '暂无';
        document.getElementById('createTime').textContent = this.formatDate(order.createTime);
        document.getElementById('status').textContent = this.getStatusText(order.status);
        document.getElementById('totalAmount').textContent = `¥${order.totalAmount.toFixed(2) || '0.00'}`;

        // 渲染订单商品列表
        const tbody = document.querySelector('#orderItems tbody');
        tbody.innerHTML = '';

        if (order.items && order.items.length > 0) {
            order.items.forEach(item => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>${item.productName || '暂无'}</td>
                    <td>¥${item.price || '0.00'}</td>
                    <td>${item.quantity || '0'}</td>
                    <td>¥${(item.price * item.quantity).toFixed(2) || '0.00'}</td>
                `;
                tbody.appendChild(tr);
            });
        } else {
            const tr = document.createElement('tr');
            tr.innerHTML = '<td colspan="4" class="text-center">暂无商品</td>';
            tbody.appendChild(tr);
        }
    }

    formatDate(dateString) {
        if (!dateString) return '暂无';
        const date = new Date(dateString);
        return date.toLocaleString('zh-CN', {
            year: 'numeric',
            month: '2-digit',
            day: '2-digit',
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit'
        });
    }

    getStatusText(status) {
        const statusMap = {
            0: '待付款',
            1: '已付款',
            2: '已发货',
            3: '已完成',
            4: '已取消'
        };
        return statusMap[status] || '未知状态';
    }

    showMessage(message, type = 'success') {
        const messageDiv = document.createElement('div');
        messageDiv.className = `message ${type}`;
        messageDiv.textContent = message;
        document.body.appendChild(messageDiv);

        setTimeout(() => {
            messageDiv.remove();
        }, 2000);
    }
}

// 初始化订单详情页面
document.addEventListener('DOMContentLoaded', () => {
    new OrderDetail();
}); 