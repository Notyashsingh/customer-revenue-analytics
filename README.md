# Customer Revenue Analytics Platform

An end-to-end analytics project that transforms raw transactional data into structured, decision-ready business insights.

This project demonstrates how real-world revenue data can be cleaned, modeled, and analyzed using industry-standard data warehousing and analytics practices.

---

## Project Objectives

- Ingest and clean raw transactional data  
- Design and implement fact and dimension tables  
- Enable scalable customer, product, and time-based analytics  
- Generate retention, trend, and forecasting insights  
- Deliver executive-ready analytical outputs with clear business interpretation  

---

## Tech Stack

- Python (pandas, SQLAlchemy)
- PostgreSQL
- SQL
- Jupyter Notebook
- Git & GitHub

---

## Data Modeling Approach

The project follows a warehouse-style star schema designed for analytical workloads.

**Fact Table**
- `fact_sales`  
  One row per transaction line capturing quantity and revenue

**Dimension Tables**
- `dim_customer`
- `dim_product`
- `dim_date`

This structure ensures:
- Clean and reliable joins  
- Consistent metric definitions  
- Scalable analytics as data volume grows  

---

## Analytics & Insights

The analytics layer builds on the modeled data to deliver:

- Customer revenue and order behavior analysis  
- Product performance and contribution analysis  
- Monthly revenue time-series trends  
- Cohort-based customer retention analysis  
- Short-term revenue forecasting using explainable moving averages  

---

## Key Business Insights

- Revenue exhibits strong overall growth with short-term volatility  
- Retention analysis reveals repeat purchasing behavior across cohorts  
- A relatively small set of customers and products contributes a significant share of revenue  
- Near-term revenue forecasts indicate stability based on recent performance trends  

---

## Repository Structure

data/
├── raw/
├── processed/
notebooks/
├── 01_ingest_raw_excel.ipynb
├── 02_customer_product_metrics.ipynb
├── 03_time_series_analysis.ipynb
├── 04_cohort_retention_analysis.ipynb
├── 05_forecasting_and_insights.ipynb
sql/
├── 01_create_transactions_raw.sql
├── 02_validate_transactions_raw.sql
├── 03_transactions_clean.sql
├── 04_validate_transactions_clean.sql
├── 05_create_customer_metrics.sql
├── 06_validate_customer_metrics
├── 07_01_dim_customer
├── 07_02_dim_product
├── 07_03_dim_date
├── 07_04_fact_sales
