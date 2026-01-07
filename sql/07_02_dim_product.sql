-- Making the Product Dimension Table

DROP TABLE IF EXISTS dim_product;

CREATE TABLE dim_product (
    product_key BIGSERIAL PRIMARY KEY,
    stock_code TEXT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Populate the dim_product table with unique products from transactions_clean

INSERT INTO dim_product (stock_code, description)
SELECT DISTINCT
    stock_code,
    description
FROM transactions_clean;

-- Validation Queries

-- 1) Count of records in dim_product

SELECT COUNT(*) 
FROM dim_product;

-- 2) Count of unique stock_codes in transactions_clean

SELECT COUNT(DISTINCT stock_code) 
FROM transactions_clean;
