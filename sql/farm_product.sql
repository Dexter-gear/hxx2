-- 创建红富士苹果表
CREATE TABLE IF NOT EXISTS red_fuji_apple (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    product_name VARCHAR(100) NOT NULL COMMENT '产品名称',
    quality_level ENUM('特级', '一级', '二级', '三级') NOT NULL COMMENT '品质等级',
    stock INT NOT NULL COMMENT '库存数量',
    description TEXT COMMENT '产品描述',
    image_url VARCHAR(255) COMMENT '产品图片URL',
    status CHAR(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
    create_by VARCHAR(64) DEFAULT '' COMMENT '创建者',
    create_time DATETIME COMMENT '创建时间',
    update_by VARCHAR(64) DEFAULT '' COMMENT '更新者',
    update_time DATETIME COMMENT '更新时间',
    remark VARCHAR(500) DEFAULT NULL COMMENT '备注'
) COMMENT '红富士苹果表';

-- 创建青苹果表
CREATE TABLE IF NOT EXISTS green_apple (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    product_name VARCHAR(100) NOT NULL COMMENT '产品名称',
    quality_level ENUM('特级', '一级', '二级', '三级') NOT NULL COMMENT '品质等级',
    stock INT NOT NULL COMMENT '库存数量',
    description TEXT COMMENT '产品描述',
    image_url VARCHAR(255) COMMENT '产品图片URL',
    status CHAR(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
    create_by VARCHAR(64) DEFAULT '' COMMENT '创建者',
    create_time DATETIME COMMENT '创建时间',
    update_by VARCHAR(64) DEFAULT '' COMMENT '更新者',
    update_time DATETIME COMMENT '更新时间',
    remark VARCHAR(500) DEFAULT NULL COMMENT '备注'
) COMMENT '青苹果表';

-- 创建国光苹果表
CREATE TABLE IF NOT EXISTS guoguang_apple (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    product_name VARCHAR(100) NOT NULL COMMENT '产品名称',
    quality_level ENUM('特级', '一级', '二级', '三级') NOT NULL COMMENT '品质等级',
    stock INT NOT NULL COMMENT '库存数量',
    description TEXT COMMENT '产品描述',
    image_url VARCHAR(255) COMMENT '产品图片URL',
    status CHAR(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
    create_by VARCHAR(64) DEFAULT '' COMMENT '创建者',
    create_time DATETIME COMMENT '创建时间',
    update_by VARCHAR(64) DEFAULT '' COMMENT '更新者',
    update_time DATETIME COMMENT '更新时间',
    remark VARCHAR(500) DEFAULT NULL COMMENT '备注'
) COMMENT '国光苹果表';

-- 创建红星苹果表
CREATE TABLE IF NOT EXISTS hongxing_apple (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    product_name VARCHAR(100) NOT NULL COMMENT '产品名称',
    quality_level ENUM('特级', '一级', '二级', '三级') NOT NULL COMMENT '品质等级',
    stock INT NOT NULL COMMENT '库存数量',
    description TEXT COMMENT '产品描述',
    image_url VARCHAR(255) COMMENT '产品图片URL',
    status CHAR(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
    create_by VARCHAR(64) DEFAULT '' COMMENT '创建者',
    create_time DATETIME COMMENT '创建时间',
    update_by VARCHAR(64) DEFAULT '' COMMENT '更新者',
    update_time DATETIME COMMENT '更新时间',
    remark VARCHAR(500) DEFAULT NULL COMMENT '备注'
) COMMENT '红星苹果表';

-- 创建金冠苹果表
CREATE TABLE IF NOT EXISTS jinguan_apple (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    product_name VARCHAR(100) NOT NULL COMMENT '产品名称',
    quality_level ENUM('特级', '一级', '二级', '三级') NOT NULL COMMENT '品质等级',
    stock INT NOT NULL COMMENT '库存数量',
    description TEXT COMMENT '产品描述',
    image_url VARCHAR(255) COMMENT '产品图片URL',
    status CHAR(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
    create_by VARCHAR(64) DEFAULT '' COMMENT '创建者',
    create_time DATETIME COMMENT '创建时间',
    update_by VARCHAR(64) DEFAULT '' COMMENT '更新者',
    update_time DATETIME COMMENT '更新时间',
    remark VARCHAR(500) DEFAULT NULL COMMENT '备注'
) COMMENT '金冠苹果表';

-- 插入示例数据
-- 红富士苹果示例数据
INSERT INTO red_fuji_apple (product_name, quality_level, stock, description, status, create_time) VALUES
('平山红富士特级果', '特级', 1000, '产自平山县优质果园，果形端正，色泽红润，口感甜脆', '0', NOW()),
('平山红富士一级果', '一级', 2000, '产自平山县优质果园，果形良好，色泽红润，口感甜脆', '0', NOW()),
('平山红富士二级果', '二级', 3000, '产自平山县优质果园，果形正常，色泽红润，口感良好', '0', NOW());

-- 青苹果示例数据
INSERT INTO green_apple (product_name, quality_level, stock, description, status, create_time) VALUES
('平山青苹果特级果', '特级', 800, '产自平山县优质果园，果形端正，色泽青翠，口感清脆', '0', NOW()),
('平山青苹果一级果', '一级', 1500, '产自平山县优质果园，果形良好，色泽青翠，口感清脆', '0', NOW()),
('平山青苹果二级果', '二级', 2500, '产自平山县优质果园，果形正常，色泽青翠，口感良好', '0', NOW());

-- 国光苹果示例数据
INSERT INTO guoguang_apple (product_name, quality_level, stock, description, status, create_time) VALUES
('平山国光特级果', '特级', 600, '产自平山县优质果园，果形端正，色泽金黄，口感香甜', '0', NOW()),
('平山国光一级果', '一级', 1200, '产自平山县优质果园，果形良好，色泽金黄，口感香甜', '0', NOW()),
('平山国光二级果', '二级', 2000, '产自平山县优质果园，果形正常，色泽金黄，口感良好', '0', NOW());

-- 红星苹果示例数据
INSERT INTO hongxing_apple (product_name, quality_level, stock, description, status, create_time) VALUES
('平山红星特级果', '特级', 500, '产自平山县优质果园，果形端正，色泽红艳，口感香甜', '0', NOW()),
('平山红星一级果', '一级', 1000, '产自平山县优质果园，果形良好，色泽红艳，口感香甜', '0', NOW()),
('平山红星二级果', '二级', 1800, '产自平山县优质果园，果形正常，色泽红艳，口感良好', '0', NOW());

-- 金冠苹果示例数据
INSERT INTO jinguan_apple (product_name, quality_level, stock, description, status, create_time) VALUES
('平山金冠特级果', '特级', 400, '产自平山县优质果园，果形端正，色泽金黄，口感香甜', '0', NOW()),
('平山金冠一级果', '一级', 800, '产自平山县优质果园，果形良好，色泽金黄，口感香甜', '0', NOW()),
('平山金冠二级果', '二级', 1500, '产自平山县优质果园，果形正常，色泽金黄，口感良好', '0', NOW());

-- 创建购物车表
CREATE TABLE IF NOT EXISTS shopping_cart (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    user_id BIGINT NOT NULL COMMENT '用户ID',
    product_type VARCHAR(50) NOT NULL COMMENT '产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）',
    product_id BIGINT NOT NULL COMMENT '产品ID',
    quantity INT NOT NULL COMMENT '购买数量',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    INDEX idx_user_id (user_id)
) COMMENT '购物车表';

-- 创建评论表
CREATE TABLE IF NOT EXISTS product_comment (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    user_id BIGINT NOT NULL COMMENT '用户ID',
    product_type VARCHAR(50) NOT NULL COMMENT '产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）',
    product_id BIGINT NOT NULL COMMENT '产品ID',
    rating INT NOT NULL COMMENT '评分（1-5）',
    content TEXT NOT NULL COMMENT '评论内容',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    INDEX idx_user_id (user_id)
) COMMENT '评论表';

-- 创建价格计算规则表
CREATE TABLE IF NOT EXISTS price_rule (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    product_type VARCHAR(50) NOT NULL COMMENT '产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）',
    quality_level ENUM('特级', '一级', '二级', '三级') NOT NULL COMMENT '品质等级',
    base_price DECIMAL(10,2) NOT NULL COMMENT '基础价格',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间'
) COMMENT '价格计算规则表';

-- 插入价格规则示例数据
INSERT INTO price_rule (product_type, quality_level, base_price, create_time) VALUES
('red_fuji_apple', '特级', 15.00, NOW()),
('red_fuji_apple', '一级', 12.00, NOW()),
('red_fuji_apple', '二级', 9.00, NOW()),
('green_apple', '特级', 13.00, NOW()),
('green_apple', '一级', 10.00, NOW()),
('green_apple', '二级', 7.00, NOW()),
('guoguang_apple', '特级', 14.00, NOW()),
('guoguang_apple', '一级', 11.00, NOW()),
('guoguang_apple', '二级', 8.00, NOW()),
('hongxing_apple', '特级', 16.00, NOW()),
('hongxing_apple', '一级', 13.00, NOW()),
('hongxing_apple', '二级', 10.00, NOW()),
('jinguan_apple', '特级', 15.00, NOW()),
('jinguan_apple', '一级', 12.00, NOW()),
('jinguan_apple', '二级', 9.00, NOW());

-- 创建所有苹果产品的视图
CREATE OR REPLACE VIEW all_apples AS
SELECT 
    'red_fuji_apple' as product_type,
    id,
    product_name,
    quality_level,
    stock,
    description,
    image_url,
    status,
    create_time,
    update_time
FROM red_fuji_apple
UNION ALL
SELECT 
    'green_apple' as product_type,
    id,
    product_name,
    quality_level,
    stock,
    description,
    image_url,
    status,
    create_time,
    update_time
FROM green_apple
UNION ALL
SELECT 
    'guoguang_apple' as product_type,
    id,
    product_name,
    quality_level,
    stock,
    description,
    image_url,
    status,
    create_time,
    update_time
FROM guoguang_apple
UNION ALL
SELECT 
    'hongxing_apple' as product_type,
    id,
    product_name,
    quality_level,
    stock,
    description,
    image_url,
    status,
    create_time,
    update_time
FROM hongxing_apple
UNION ALL
SELECT 
    'jinguan_apple' as product_type,
    id,
    product_name,
    quality_level,
    stock,
    description,
    image_url,
    status,
    create_time,
    update_time
FROM jinguan_apple;

-- 创建订单表
CREATE TABLE IF NOT EXISTS orders (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    order_no VARCHAR(50) NOT NULL COMMENT '订单编号',
    user_id BIGINT NOT NULL COMMENT '用户ID',
    total_amount DECIMAL(10,2) NOT NULL COMMENT '订单总金额',
    status CHAR(1) DEFAULT '0' COMMENT '订单状态（0待付款 1已付款 2已发货 3已完成 4已取消）',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    INDEX idx_user_id (user_id)
) COMMENT '订单表';

-- 创建订单详情表
CREATE TABLE IF NOT EXISTS order_detail (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    order_id BIGINT NOT NULL COMMENT '订单ID',
    product_type VARCHAR(50) NOT NULL COMMENT '产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple）',
    product_id BIGINT NOT NULL COMMENT '产品ID',
    quantity INT NOT NULL COMMENT '购买数量',
    price DECIMAL(10,2) NOT NULL COMMENT '购买时价格',
    create_time DATETIME COMMENT '创建时间',
    INDEX idx_order_id (order_id)
) COMMENT '订单详情表'; 