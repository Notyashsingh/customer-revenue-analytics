-- 1) Sanity counts

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE is_sale) AS sale_rows,
    COUNT(*) FILTER (WHERE is_return) AS return_rows
FROM transactions_clean;

-- 2) Revenue should only come from sales

SELECT
    SUM(line_revenue) AS total_revenue,
    SUM(line_revenue) FILTER (WHERE is_sale) AS sale_revenue
FROM transactions_clean;

-- 3) Customer coverage

SELECT
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS anonymous_rows,
    COUNT(*) FILTER (WHERE customer_id IS NOT NULL) AS known_customer_rows
FROM transactions_clean;
