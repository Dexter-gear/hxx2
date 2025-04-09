class Review {
    constructor() {
        console.log('Review类初始化开始');
        this.token = this.getToken();
        if (!this.token) {
            console.warn('未检测到登录状态，跳转到登录页面');
            window.location.href = 'login.html';
            return;
        }
        this.productId = this.getProductId();
        this.productType = this.getProductType();
        console.log('Review类初始化完成', {
            token: this.token ? '已获取' : '未获取',
            productId: this.productId,
            productType: this.productType
        });
        this.init();
    }

    // 获取token
    getToken() {
        const token = localStorage.getItem('token');
        console.log('获取token:', token ? '成功' : '失败');
        if (!token) {
            console.warn('未找到token，用户未登录');
            return null;
        }
        return token;
    }

    // 获取产品ID
    getProductId() {
        const urlParams = new URLSearchParams(window.location.search);
        const productId = urlParams.get('id');
        console.log('获取产品ID:', productId || '未找到');
        return productId;
    }

    // 获取产品类型
    getProductType() {
        const urlParams = new URLSearchParams(window.location.search);
        const tableName = urlParams.get('tableName');
        console.log('获取表名:', tableName || '未找到');
        
        // 将表名映射为产品类型
        const tableToType = {
            'hfs_apple': 'red_fuji_apple',
            'hx_apple': 'hongxing_apple',
            'gg_apple': 'guoguang_apple',
            'jg_apple': 'jinguan_apple',
            'g_apple': 'green_apple'
        };
        
        const productType = tableToType[tableName] || 'red_fuji_apple';
        console.log('映射后的产品类型:', productType);
        return productType;
    }

    // 初始化
    async init() {
        try {
            console.log('开始初始化评论系统');
            console.log('检查必要参数:', {
                productId: this.productId,
                productType: this.productType,
                token: this.token ? '已设置' : '未设置'
            });

            if (!this.token) {
                console.warn('用户未登录，跳转到登录页面');
                window.location.href = 'login.html';
                return;
            }

            if (!this.productId || !this.productType) {
                console.error('产品信息不完整');
                this.showMessage('产品信息不完整', 'error');
                return;
            }

            console.log('开始获取评论列表');
            await this.getReviews();
            
            console.log('绑定提交评论事件');
            this.bindSubmitEvent();
            
            console.log('评论系统初始化完成');
        } catch (error) {
            console.error('初始化失败:', error);
            if (error.response && error.response.status === 401) {
                console.warn('登录已过期，清除token并跳转到登录页面');
                localStorage.removeItem('token');
                window.location.href = 'login.html';
                return;
            }
            this.showMessage('获取评论失败', 'error');
        }
    }

    // 获取评论列表
    async getReviews() {
        try {
            console.log('开始获取评论列表，请求参数:', {
                productId: this.productId,
                productType: this.productType
            });

            const response = await axios.get(`http://localhost:8080/system/comment/list`, {
                headers: {
                    'Authorization': `Bearer ${this.token}`
                },
                params: {
                    productId: this.productId,
                    productType: this.productType
                }
            });

            console.log('评论列表响应:', response.data);

            if (response.data.code === 200) {
                const reviews = response.data.rows;
                console.log('成功获取评论列表，评论数量:', reviews.length);
                this.renderReviews(reviews);
            } else {
                console.error('获取评论列表失败:', response.data.msg);
                this.showMessage(response.data.msg || '获取评论失败', 'error');
            }
        } catch (error) {
            console.error('获取评论列表失败:', error);
            if (error.response && error.response.status === 401) {
                console.warn('登录已过期，清除token并跳转到登录页面');
                localStorage.removeItem('token');
                window.location.href = 'login.html';
                return;
            }
            this.showMessage('获取评论失败', 'error');
        }
    }

    // 渲染评论列表
    renderReviews(reviews) {
        console.log('开始渲染评论列表');
        const reviewContainer = document.querySelector('.box-comment');
        if (!reviewContainer) {
            console.error('未找到评论容器元素');
            return;
        }

        // 清空现有评论
        reviewContainer.innerHTML = '';

        if (reviews && reviews.length > 0) {
            console.log('渲染评论数量:', reviews.length);
            reviews.forEach((review, index) => {
                console.log(`渲染第${index + 1}条评论:`, review);
                const reviewElement = document.createElement('div');
                reviewElement.className = 'unit flex-column flex-sm-row unit-spacing-md';
                reviewElement.innerHTML = `
                    <div class="unit-left">
                        <a class="box-comment-figure" href="#">
                            <img src="images/user-1-119x119.jpg" alt="" width="119" height="119"/>
                        </a>
                    </div>
                    <div class="unit-body">
                        <div class="group-sm group-justify">
                            <div>
                                <div class="group-xs group-middle">
                                    <h5 class="box-comment-author">用户${review.user_id}</h5>
                                    <div class="box-comment-rating">
                                        ${this.renderRating(review.rating)}
                                    </div>
                                </div>
                            </div>
                            <div class="box-comment-time">
                                <time datetime="${review.create_time}">${this.formatDate(review.create_time)}</time>
                            </div>
                        </div>
                        <p class="box-comment-text">${review.content}</p>
                    </div>
                `;
                reviewContainer.appendChild(reviewElement);
            });
        } else {
            console.log('没有评论数据，显示空提示');
            reviewContainer.innerHTML = '<p class="text-center">暂无评论</p>';
        }
    }

    // 渲染评分
    renderRating(rating) {
        let stars = '';
        for (let i = 1; i <= 5; i++) {
            if (i <= rating) {
                stars += '<span class="icon mdi mdi-star"></span>';
            } else {
                stars += '<span class="icon mdi mdi-star-outline"></span>';
            }
        }
        return stars;
    }

    // 格式化日期为 yyyy-MM-dd HH:mm:ss
    formatDateForBackend(date) {
        const d = new Date(date);
        const year = d.getFullYear();
        const month = String(d.getMonth() + 1).padStart(2, '0');
        const day = String(d.getDate()).padStart(2, '0');
        const hours = String(d.getHours()).padStart(2, '0');
        const minutes = String(d.getMinutes()).padStart(2, '0');
        const seconds = String(d.getSeconds()).padStart(2, '0');
        return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    }

    // 绑定提交评论事件
    bindSubmitEvent() {
        console.log('开始绑定提交评论事件');
        const form = document.querySelector('.rd-form');
        if (!form) {
            console.error('未找到评论表单元素');
            return;
        }

        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            console.log('评论表单提交');
            
            const content = document.getElementById('contact-message-2').value;
            const rating = document.querySelector('input[name="rating"]:checked')?.value || 5;
            console.log('评论内容:', content, '评分:', rating);

            if (!content) {
                console.warn('评论内容为空');
                this.showMessage('请输入评论内容', 'error');
                return;
            }

            try {
                const commentData = {
                    userId: 1,
                    productId: this.productId,
                    productType: this.productType,
                    content: content,
                    rating: rating,
                    createTime: this.formatDateForBackend(new Date())  // 使用新的日期格式化方法
                };

                console.log('开始提交评论，请求参数:', commentData);

                const response = await axios.post('http://localhost:8080/system/comment', commentData, {
                    headers: {
                        'Authorization': `Bearer ${this.token}`
                    }
                });

                console.log('评论提交响应:', response.data);

                if (response.data.code === 200) {
                    console.log('评论提交成功');
                    this.showMessage('评论提交成功', 'success');
                    // 清空表单
                    form.reset();
                    // 刷新评论列表
                    await this.getReviews();
                } else {
                    console.error('评论提交失败:', response.data.msg);
                    this.showMessage(response.data.msg || '评论提交失败', 'error');
                }
            } catch (error) {
                console.error('提交评论失败:', error);
                if (error.response && error.response.status === 401) {
                    console.warn('登录已过期，清除token并跳转到登录页面');
                    localStorage.removeItem('token');
                    window.location.href = 'login.html';
                    return;
                }
                this.showMessage('评论提交失败', 'error');
            }
        });
    }

    // 格式化日期
    formatDate(dateString) {
        if (!dateString) {
            console.warn('日期字符串为空');
            return '暂无';
        }
        const date = new Date(dateString);
        const formattedDate = date.toLocaleString('zh-CN', {
            year: 'numeric',
            month: '2-digit',
            day: '2-digit',
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit'
        });
        console.log('格式化日期:', {原始日期: dateString, 格式化后: formattedDate});
        return formattedDate;
    }

    // 显示消息
    showMessage(message, type = 'success') {
        console.log(`显示${type}消息:`, message);
        const messageDiv = document.createElement('div');
        messageDiv.className = `message ${type}`;
        messageDiv.textContent = message;
        document.body.appendChild(messageDiv);

        setTimeout(() => {
            messageDiv.remove();
            console.log('消息已移除');
        }, 2000);
    }
}

// 初始化评论页面
console.log('页面加载完成，开始初始化评论系统');
document.addEventListener('DOMContentLoaded', () => {
    new Review();
}); 