class Order {
    constructor() {
        this.userId = this.getUserId();
        this.token = this.getToken();
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

    // 初始化
    async init() {
        try {
            if (!this.userId || !this.token) {
                this.showMessage('请先登录');
                return;
            }

            // 获取订单列表
            const orders = await this.getOrders();
            if (orders && orders.length > 0) {
                this.renderOrders(orders);
            } else {
                this.showEmptyMessage();
            }
        } catch (error) {
            console.error('初始化失败:', error);
            this.showMessage('获取订单失败');
        }
    }

    // 获取订单列表
    async getOrders() {
        try {
            const response = await axios.get('http://localhost:8080/system/orders/list', {
                headers: {
                    'Authorization': `Bearer ${this.token}`
                }
            });

            if (response.data.code === 200) {
                return response.data.rows;
            } else {
                console.warn('获取订单列表失败:', response.data.msg);
                return [];
            }
        } catch (error) {
            console.error('获取订单列表失败:', error);
            return [];
        }
    }

    // 渲染订单列表
    renderOrders(orders) {
        const orderList = document.querySelector('.table-cart tbody');
        if (!orderList) return;

        // 清空现有内容
        orderList.innerHTML = '';

        // 渲染每个订单
        orders.forEach(order => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>
                    <div class="table-cart-order-info">
                        <div class="order-no">订单号：${order.orderNo}</div>
                        <div class="order-time">创建时间：${this.formatDate(order.createTime)}</div>
                        <div class="order-status">状态：${this.getStatusText(order.status)}</div>
                    </div>
                </td>
                <td>¥${order.totalAmount.toFixed(2)}</td>
                <td>
                    <button class="button button-sm button-primary" onclick="window.location.href='order-detail.html?orderId=${order.id}'">
                        查看详情
                    </button>
                </td>
            `;
            orderList.appendChild(row);
        });

        // 更新表格标题
        const tableHeader = document.querySelector('.table-cart thead tr');
        if (tableHeader) {
            tableHeader.innerHTML = `
                <th>订单信息</th>
                <th>总金额</th>
                <th>操作</th>
            `;
        }
    }

    // 显示空消息
    showEmptyMessage() {
        const orderList = document.querySelector('.table-cart tbody');
        if (orderList) {
            orderList.innerHTML = `
                <tr>
                    <td colspan="3" class="text-center">
                        <div class="empty-message">
                            <i class="fa fa-shopping-cart"></i>
                            <p>暂无订单</p>
                        </div>
                    </td>
                </tr>
            `;
        }
    }

    // 格式化日期
    formatDate(dateString) {
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

    // 获取状态文本
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

    // 显示消息
    showMessage(message) {
        const messageElement = document.createElement('div');
        messageElement.className = 'alert alert-info';
        messageElement.textContent = message;
        messageElement.style.position = 'fixed';
        messageElement.style.top = '20px';
        messageElement.style.right = '20px';
        messageElement.style.zIndex = '9999';
        
        document.body.appendChild(messageElement);
        
        setTimeout(() => {
            messageElement.remove();
        }, 2000);
    }
}

// 初始化订单页面
document.addEventListener('DOMContentLoaded', () => {
    new Order();
}); 