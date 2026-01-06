DROP TABLE IF EXISTS transactions_raw;

CREATE TABLE transactions_raw (
    invoice_no      TEXT,
    stock_code      TEXT,
    description     TEXT,
    quantity        INTEGER,
    invoice_date    TIMESTAMP,
    unit_price      NUMERIC(10, 2),
    customer_id     INTEGER,
    country         TEXT
);
