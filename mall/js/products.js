new Vue({
  el: '#product-container',
  data: {
    products: [],
    isotope: null,
    priceRules: [], // 存储价格规则
  },
  mounted() {
    this.initIsotope();
    this.getProducts();
    this.initUploadArea();
    this.bindSubmitEvent();
  },
  updated() {
    this.$nextTick(() => {
      if (!this.isotope) {
        this.initIsotope();
      } else {
        this.isotope.reloadItems();
        this.isotope.arrange({
          transitionDuration: '0.4s'
        });
      }
    });
  },
  methods: {
    initIsotope() {
      const grid = this.$el;
      const options = {
        itemSelector: '.isotope-item',
        layoutMode: 'fitRows',
        fitRows: {
          gutter: 30
        },
        transitionDuration: '0.4s',
        percentPosition: true,
        masonry: {
          columnWidth: '.isotope-item'
        }
      };

      this.isotope = new Isotope(grid, options);

      // 初始化过滤器
      document.querySelectorAll('.isotope-filters-list a').forEach(filter => {
        filter.addEventListener('click', (e) => {
          e.preventDefault();
          const filterValue = filter.getAttribute('data-isotope-filter');
          this.isotope.arrange({
            filter: filterValue === '*' ? '*' : `[data-filter="${filterValue}"]`,
            transitionDuration: '0.4s'
          });

          // 更新active类
          document.querySelector('.isotope-filters-list a.active').classList.remove('active');
          filter.classList.add('active');
        });
      });

      // 监听图片加载完成事件
      grid.querySelectorAll('img').forEach(img => {
        img.addEventListener('load', () => {
          this.isotope.layout();
        });
      });
    },
    getProducts() {
      const token = localStorage.getItem('token');
      if (!token) {
        window.location.href = 'login.html';
        return;
      }

      // 先获取价格规则表
      this.getPriceRules().then(() => {
        // 苹果等级列表
        const qualityLevels = ['特级', '一级', '二级'];
        const headers = {
          'Authorization': 'Bearer ' + token
        };

        // 苹果品种对应的表名
        const typeToTable = {
          'red_fuji_apple': 'hfs_apple',
          'hongxing_apple': 'hx_apple',
          'guoguang_apple': 'gg_apple',
          'jinguan_apple': 'jg_apple',
          'green_apple': 'g_apple'
        };

        // 分别从不同表获取苹果数据
        const requests = [];

        // 遍历所有表名
        for (const [type, tableName] of Object.entries(typeToTable)) {
          // 为每个表和品质等级创建请求
          for (const level of qualityLevels) {
            const request = fetch(`http://localhost:8080/system/${tableName}/list?qualityLevel=${encodeURIComponent(level)}`, {
              headers: headers
            })
              .then(response => {
                if (response.status === 401) {
                  throw new Error('unauthorized');
                }
                if (!response.ok) {
                  throw new Error(`获取${tableName}表${level}苹果数据失败`);
                }
                return response.json();
              })
              .then(data => {
                if (data && data.rows) {
                  // 确保每个产品都有qualityLevel和tableName属性，同时计算价格
                  return data.rows.map(product => {
                    const productWithExtra = {
                      ...product,
                      qualityLevel: level,
                      tableName: tableName,
                      productType: this.getProductTypeFromTable(tableName),
                      createTime: new Date().toISOString()
                    };
                    // 计算价格
                    productWithExtra.calculatedPrice = this.calculatePrice(productWithExtra.productType, level, product.price);
                    return productWithExtra;
                  });
                }
                return [];
              });

            requests.push(request);
          }
        }

        // 等待所有请求完成并合并结果
        Promise.all(requests)
          .then(results => {
            // 先看一下所有数据
            const allProducts = results.flat();
            console.log('所有产品数据:', allProducts);

            // 检查status字段的类型
            if (allProducts.length > 0) {
              console.log('第一个产品的status类型:', typeof allProducts[0].status);
              console.log('第一个产品的status值:', allProducts[0].status);
            }

            // 合并所有苹果数据
            this.products = allProducts;
            console.log(`成功获取了${this.products.length}个苹果产品`);
          })
          .catch(error => {
            console.error('请求失败:', error);
            if (error.message === 'unauthorized') {
              localStorage.removeItem('token');
              window.location.href = 'login.html';
            } else {
              alert('获取商品列表失败，请检查网络连接');
            }
          });
      }).catch(error => {
        console.error('获取价格规则失败:', error);
        alert('获取价格规则失败，将使用默认价格');
        this.loadProductsWithDefaultPrice();
      });
    },

    // 根据表名获取产品类型
    getProductTypeFromTable(tableName) {
      const tableToType = {
        'hfs_apple': 'red_fuji_apple',
        'hx_apple': 'hongxing_apple',
        'gg_apple': 'guoguang_apple',
        'jg_apple': 'jinguan_apple',
        'g_apple': 'green_apple'
      };
      return tableToType[tableName] || 'unknown';
    },

    // 获取价格规则表
    getPriceRules() {
      const token = localStorage.getItem('token');
      return fetch('http://localhost:8080/system/rule/list', {
        headers: {
          'Authorization': 'Bearer ' + token
        }
      })
        .then(response => {
          if (response.status === 401) {
            throw new Error('unauthorized');
          }
          if (!response.ok) {
            throw new Error('获取价格规则表失败');
          }
          return response.json();
        })
        .then(data => {
          if (data && data.rows) {
            this.priceRules = data.rows;
            console.log('成功获取价格规则:', this.priceRules);
          }
          return this.priceRules;
        });
    },

    // 根据产品类型和品质等级计算价格
    calculatePrice(productType, qualityLevel, defaultPrice) {
      // 查找匹配的价格规则
      const priceRule = this.priceRules.find(rule =>
        rule.productType === productType && rule.qualityLevel === qualityLevel
      );

      // 如果找到匹配的规则，返回基础价格
      if (priceRule && priceRule.basePrice) {
        return priceRule.basePrice;
      }

      // 否则返回默认价格
      return defaultPrice;
    },

    // 如果获取价格规则失败，使用默认价格加载产品
    loadProductsWithDefaultPrice() {
      // 执行与getProducts相同的逻辑，但不尝试计算价格
      const token = localStorage.getItem('token');
      if (!token) {
        window.location.href = 'login.html';
        return;
      }

      // 苹果等级列表
      const qualityLevels = ['特级', '一级', '二级'];
      const headers = {
        'Authorization': 'Bearer ' + token
      };

      // 苹果品种对应的表名
      const typeToTable = {
        'red_fuji_apple': 'hfs_apple',
        'hongxing_apple': 'hx_apple',
        'guoguang_apple': 'gg_apple',
        'jinguan_apple': 'jg_apple',
        'green_apple': 'g_apple'
      };

      // 分别从不同表获取苹果数据
      const requests = [];

      // 遍历所有表名
      for (const [type, tableName] of Object.entries(typeToTable)) {
        // 为每个表和品质等级创建请求
        for (const level of qualityLevels) {
          const request = fetch(`http://localhost:8080/system/${tableName}/list?qualityLevel=${encodeURIComponent(level)}`, {
            headers: headers
          })
            .then(response => {
              if (response.status === 401) {
                throw new Error('unauthorized');
              }
              if (!response.ok) {
                throw new Error(`获取${tableName}表${level}苹果数据失败`);
              }
              return response.json();
            })
            .then(data => {
              if (data && data.rows) {
                // 确保每个产品都有qualityLevel和tableName属性
                return data.rows.map(product => ({
                  ...product,
                  qualityLevel: level,
                  tableName: tableName,
                  createTime: new Date().toISOString()
                }));
              }
              return [];
            });

          requests.push(request);
        }
      }

      // 等待所有请求完成并合并结果
      Promise.all(requests)
        .then(results => {
          // 先看一下所有数据
          const allProducts = results.flat();
          console.log('备用流程 - 所有产品数据:', allProducts);

          // 检查status字段的类型
          if (allProducts.length > 0) {
            console.log('备用流程 - 第一个产品的status类型:', typeof allProducts[0].status);
            console.log('备用流程 - 第一个产品的status值:', allProducts[0].status);
          }

          // 合并所有苹果数据
          this.products = allProducts;
          console.log(`成功获取了${this.products.length}个苹果产品（使用默认价格）`);
        })
        .catch(error => {
          console.error('请求失败:', error);
          if (error.message === 'unauthorized') {
            localStorage.removeItem('token');
            window.location.href = 'login.html';
          } else {
            alert('获取商品列表失败，请检查网络连接');
          }
        });
    },

    // 格式化日期为后端期望的格式
    formatDate(date) {
      const d = new Date(date);
      const year = d.getFullYear();
      const month = String(d.getMonth() + 1).padStart(2, '0');
      const day = String(d.getDate()).padStart(2, '0');
      const hours = String(d.getHours()).padStart(2, '0');
      const minutes = String(d.getMinutes()).padStart(2, '0');
      const seconds = String(d.getSeconds()).padStart(2, '0');
      return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    },

    // 切换商品上下架状态
    async toggleProductStatus(product) {
      try {
        const token = localStorage.getItem('token');
        if (!token) {
          window.location.href = 'login.html';
          return;
        }

        // 确定新的状态值
        const newStatus = product.status == 1 ? 0 : 1;
        console.log(`准备${newStatus == 1 ? '上架' : '下架'}商品:`, product);

        // 构建更新请求
        const updateData = {
          ...product,
          status: newStatus,
          createTime: this.formatDate(new Date()) // 使用格式化后的日期
        };

        // 发送更新请求
        const response = await axios.put(`http://localhost:8080/system/${product.tableName}`, updateData, {
          headers: {
            'Authorization': `Bearer ${token}`
          }
        });

        console.log('更新商品状态响应:', response.data);

        if (response.data.code === 200) {
          // 更新本地数据
          product.status = newStatus;
          this.showMessage(`商品已${newStatus == 1 ? '上架' : '下架'}`, 'success');
        } else {
          this.showMessage(response.data.msg || '操作失败', 'error');
        }
      } catch (error) {
        console.error('更新商品状态失败:', error);
        if (error.response && error.response.status === 401) {
          localStorage.removeItem('token');
          window.location.href = 'login.html';
          return;
        }
        this.showMessage('操作失败，请稍后重试', 'error');
      }
    },

    // 显示消息提示
    showMessage(message, type = 'success') {
      const messageDiv = document.createElement('div');
      messageDiv.className = `message ${type}`;
      messageDiv.textContent = message;
      document.body.appendChild(messageDiv);

      setTimeout(() => {
        messageDiv.remove();
      }, 3000);
    },

    // 初始化图片上传区域
    initUploadArea() {
      const uploadArea = document.getElementById('uploadArea');
      const imageInput = document.getElementById('imageInput');
      const imagePreview = document.getElementById('imagePreview');

      // 点击上传区域触发文件选择
      uploadArea.addEventListener('click', () => {
        imageInput.click();
      });

      // 处理文件选择
      imageInput.addEventListener('change', (e) => {
        this.handleFiles(e.target.files);
      });

      // 处理拖拽
      uploadArea.addEventListener('dragover', (e) => {
        e.preventDefault();
        uploadArea.classList.add('dragover');
      });

      uploadArea.addEventListener('dragleave', () => {
        uploadArea.classList.remove('dragover');
      });

      uploadArea.addEventListener('drop', (e) => {
        e.preventDefault();
        uploadArea.classList.remove('dragover');
        this.handleFiles(e.dataTransfer.files);
      });
    },

    // 处理上传的文件
    handleFiles(files) {
      const imagePreview = document.getElementById('imagePreview');
      
      for (let file of files) {
        if (file.type.startsWith('image/')) {
          const reader = new FileReader();
          reader.onload = (e) => {
            const previewItem = document.createElement('div');
            previewItem.className = 'image-preview-item';
            
            const img = document.createElement('img');
            img.src = e.target.result;
            img.className = 'preview-image';
            
            const removeBtn = document.createElement('span');
            removeBtn.className = 'remove-image';
            removeBtn.innerHTML = '×';
            removeBtn.onclick = () => previewItem.remove();
            
            previewItem.appendChild(img);
            previewItem.appendChild(removeBtn);
            imagePreview.appendChild(previewItem);
          };
          reader.readAsDataURL(file);
        }
      }
    },

    // 绑定提交事件
    bindSubmitEvent() {
      const submitBtn = document.getElementById('submitProduct');
      submitBtn.addEventListener('click', async () => {
        try {
          const token = localStorage.getItem('token');
          if (!token) {
            window.location.href = 'login.html';
            return;
          }

          const formData = new FormData();
          formData.append('productName', document.getElementById('productName').value);
          formData.append('productType', document.getElementById('productType').value);
          formData.append('qualityLevel', document.getElementById('qualityLevel').value);
          formData.append('price', document.getElementById('price').value);
          formData.append('status', '1'); // 默认上架状态
          formData.append('createTime', this.formatDate(new Date()));

          // 添加图片
          const imageInput = document.getElementById('imageInput');
          if (imageInput.files.length > 0) {
            for (let file of imageInput.files) {
              formData.append('images', file);
            }
          }

          const response = await axios.post('http://localhost:8080/system/product/add', formData, {
            headers: {
              'Authorization': `Bearer ${token}`,
              'Content-Type': 'multipart/form-data'
            }
          });

          if (response.data.code === 200) {
            this.showMessage('商品添加成功', 'success');
            $('#addProductModal').modal('hide');
            this.getProducts(); // 刷新商品列表
          } else {
            this.showMessage(response.data.msg || '添加失败', 'error');
          }
        } catch (error) {
          console.error('添加商品失败:', error);
          if (error.response && error.response.status === 401) {
            localStorage.removeItem('token');
            window.location.href = 'login.html';
            return;
          }
          this.showMessage('添加失败，请稍后重试', 'error');
        }
      });
    },
  }
}); 