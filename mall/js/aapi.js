new Vue({
  el: '#product-container',
  data: {
    products: [],
    isotope: null,
    priceRules: [] // 存储价格规则,
  },
  mounted() {
    this.getProducts();
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

            // 合并所有苹果数据并过滤出状态为1（已上架）的商品
            // 使用双等号而不是三等号，并转换为数字类型进行比较
            this.products = allProducts.filter(product => {
              // 检查status字段是否存在，若不存在则默认为上架
              if (product.status === undefined || product.status === null) {
                console.log('产品缺少status字段，默认显示:', product);
                return true;
              }
              return Number(product.status) == 1;
            });
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

          // 合并所有苹果数据并过滤出状态为1（已上架）的商品
          // 使用双等号而不是三等号，并转换为数字类型进行比较
          this.products = allProducts.filter(product => {
            // 检查status字段是否存在，若不存在则默认为上架
            if (product.status === undefined || product.status === null) {
              console.log('备用流程 - 产品缺少status字段，默认显示:', product);
              return true;
            }
            return Number(product.status) == 1;
          });
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
    addToCart(product) {
      let cart = JSON.parse(localStorage.getItem('cart') || '[]')
      const existingItem = cart.find(item => item.productId === product.productId)

      if (existingItem) {
        if (existingItem.quantity >= product.stock) {
          alert('库存不足')
          return
        }
        existingItem.quantity += 1
      } else {
        cart.push({
          ...product,
          quantity: 1
        })
      }

      localStorage.setItem('cart', JSON.stringify(cart))
      alert('已添加到购物车')
    }
  }
});
