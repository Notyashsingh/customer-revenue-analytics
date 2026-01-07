-- Grain: one row per invoice_no + stock_code

-- Creating the Fact Sales Table

DROP TABLE IF EXISTS fact_sales;

CREATE TABLE fact_sales (
    fact_key SERIAL PRIMARY KEY,
    invoice_no TEXT,
    stock_code TEXT,
    customer_id INT,
    invoice_date DATE,
    quantity INT,
    unit_price NUMERIC,
    revenue NUMERIC,
    product_key INT,
    customer_key INT,
    date_key INT
);

-- Populate the fact_sales table by joining transactions_clean with dimension tables

INSERT INTO fact_sales (
    invoice_no,
    stock_code,
    customer_id,
    invoice_date,
    quantity,
    unit_price,
    revenue,
    product_key,
    customer_key,
    date_key
)
SELECT
    t.invoice_no,
    t.stock_code,
    t.customer_id,
    t.invoice_date::date,
    t.quantity,
    t.unit_price,
    t.quantity * t.unit_price AS revenue,
    p.product_key,
    c.customer_key,
    d.date_key
FROM transactions_clean t
JOIN dim_product p
  ON t.stock_code = p.stock_code
JOIN dim_customer c
  ON t.customer_id = c.customer_id
JOIN dim_date d
  ON t.invoice_date::date = d.full_date;

-- Validation Queries

-- 1) Row check

SELECT COUNT(*) 
FROM fact_sales;

SELECT COUNT(*) 
FROM transactions_clean;

-- 2) Revenue check

SELECT
    SUM(quantity * unit_price) AS recomputed,
    SUM(revenue) AS stored
FROM fact_sales;

-- 3) Orphan checks

SELECT COUNT(*)
FROM fact_sales f
LEFT JOIN dim_customer c
    ON f.customer_key = c.customer_key
WHERE c.customer_key IS NULL;

-- 4) Indexes for performance

CREATE INDEX idx_fact_sales_date ON fact_sales(date_key);
CREATE INDEX idx_fact_sales_customer ON fact_sales(customer_key);
CREATE INDEX idx_fact_sales_product ON fact_sales(product_key);
