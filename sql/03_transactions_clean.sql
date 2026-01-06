-- 1) Create a cleaned version of the transactions table

DROP TABLE IF EXISTS transactions_clean;

CREATE TABLE transactions_clean AS
SELECT
    invoice_no,
    stock_code,
    description,
    quantity,
    unit_price,
    invoice_date,
    customer_id,
    country,

-- 2) Add derived fields: line_revenue, is_sale, is_return
 
    quantity * unit_price AS line_revenue,

    CASE
        WHEN quantity > 0 AND unit_price > 0 THEN TRUE
        ELSE FALSE
    END AS is_sale,

    CASE
        WHEN quantity < 0 THEN TRUE
        ELSE FALSE
    END AS is_return

FROM transactions_raw;

-- 3) Preview the cleaned transactions table

SELECT *
FROM transactions_clean
LIMIT 10;
