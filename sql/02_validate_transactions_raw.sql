-- 1) Row Count

SELECT COUNT(*) 
FROM transactions_raw;

-- 2) Null checks

SELECT
    COUNT(*) FILTER (WHERE invoice_no IS NULL) AS null_invoice,
    COUNT(*) FILTER (WHERE stock_code IS NULL) AS null_stock,
    COUNT(*) FILTER (WHERE invoice_date IS NULL) AS null_date
FROM transactions_raw;

-- 3) Negative or zero values

SELECT
    COUNT(*) FILTER (WHERE quantity <= 0) AS bad_quantity,
    COUNT(*) FILTER (WHERE unit_price <= 0) AS bad_price
FROM transactions_raw;

-- 4) Date range check

SELECT
    MIN(invoice_date),
    MAX(invoice_date)
FROM transactions_raw;

-- 5) Duplicate transactional lines

SELECT invoice_no, stock_code, COUNT(*)
FROM transactions_raw
GROUP BY invoice_no, stock_code
HAVING COUNT(*) > 1
LIMIT 10;
