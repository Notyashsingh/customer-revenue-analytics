-- Making the Date Dimension Table

DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    year INT,
    month INT,
    day INT,
    weekday INT,
    week INT
);

-- Populate the dim_date table with unique dates from transactions_clean

INSERT INTO dim_date
SELECT DISTINCT
    TO_CHAR(invoice_date, 'YYYYMMDD')::INT AS date_key,
    DATE(invoice_date) AS full_date,
    EXTRACT(YEAR FROM invoice_date),
    EXTRACT(MONTH FROM invoice_date),
    EXTRACT(DAY FROM invoice_date),
    EXTRACT(DOW FROM invoice_date),
    EXTRACT(WEEK FROM invoice_date)
FROM transactions_clean;

-- Validation Queries

-- 1) Count of records in dim_date

SELECT COUNT(*) 
FROM dim_date;

-- 2) Count of unique dates in transactions_clean

SELECT COUNT(DISTINCT DATE(invoice_date)) 
FROM transactions_clean;

SELECT *
FROM dim_date
LIMIT 10;