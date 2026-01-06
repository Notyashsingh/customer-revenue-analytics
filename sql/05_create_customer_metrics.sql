DROP TABLE IF EXISTS customer_metrics;

CREATE TABLE customer_metrics AS
SELECT
    customer_id,

    SUM(line_revenue) AS total_revenue,

    COUNT(DISTINCT invoice_no) AS order_count,

    SUM(quantity) AS total_items,

    MIN(invoice_date) AS first_purchase_date,
    MAX(invoice_date) AS last_purchase_date,

    DATE_PART('day', MAX(invoice_date) - MIN(invoice_date)) AS active_days

FROM transactions_clean
WHERE
    is_sale = TRUE
    AND customer_id IS NOT NULL
GROUP BY customer_id;
