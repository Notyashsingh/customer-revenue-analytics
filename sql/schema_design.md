# Schema Design – Customer Revenue Analytics

## fact_sales
- invoice_no
- invoice_date
- customer_id
- stock_code
- quantity
- unit_price
- revenue

Grain:
- One row per invoice × product

## dim_customer
- customer_id (PK)
- country

## dim_product
- stock_code (PK)
- description

## dim_invoice_date
- invoice_date (PK)
- year
- month
- day
- weekday
