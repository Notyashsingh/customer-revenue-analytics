-- Making the Customer Dimension Table

DROP TABLE IF EXISTS dim_customer;

CREATE TABLE dim_customer (
    customer_key BIGSERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    country TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Populate the dim_customer table with unique customers from transactions_clean

INSERT INTO dim_customer (customer_id, country)
SELECT DISTINCT
    customer_id,
    country
FROM transactions_clean
WHERE customer_id IS NOT NULL;

-- Validation Queries

-- 1) Count of records in dim_customer

SELECT COUNT(*) 
FROM dim_customer;

-- 2) Count of unique customer_ids in transactions_clean

SELECT COUNT(DISTINCT customer_id) 
FROM transactions_clean;
