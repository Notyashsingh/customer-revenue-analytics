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
SELECT
    stock_code,
    description
FROM (
    SELECT
        stock_code,
        description,
        ROW_NUMBER() OVER (
            PARTITION BY stock_code
            ORDER BY 
                CASE 
                    WHEN description IS NOT NULL THEN 1 
                    ELSE 2 
                END,
                invoice_date DESC
        ) AS rn
    FROM transactions_clean
    WHERE stock_code IS NOT NULL
) t
WHERE rn = 1;


-- Alternative simpler approach (may lead to duplicates if stock_code appears with different descriptions)
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

-- 3) Check for duplicates in dim_product

SELECT stock_code, COUNT(*)
FROM dim_product
GROUP BY stock_code
HAVING COUNT(*) > 1;

-- 4) Sample data check
SELECT *
FROM dim_product
LIMIT 10;