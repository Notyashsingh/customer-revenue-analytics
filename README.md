# 📊 Customer Revenue Analytics Platform

An end-to-end analytics project that transforms raw transactional data into decision-ready insights using **industry-grade data modeling, SQL, Python, and analytics workflows**.

This project mirrors how real analytics teams build, validate, and ship analytical systems — not just notebooks.

---

## 🚀 What this project does

Starting from raw Excel transaction files, the project:

- Cleans and validates messy real-world transactional data
- Models data into **fact and dimension tables**
- Builds reusable customer, product, and time-based metrics
- Performs retention and cohort analysis
- Generates time-series insights and simple revenue forecasts
- Produces executive-ready analytical outputs and visuals

The result is a **reproducible analytics pipeline** that can support dashboards, reporting, and business decision-making.

---

## 🧱 Project Architecture

Raw Excel Data
↓
Python Ingestion & Cleaning
↓
PostgreSQL (Staging → Clean Tables)
↓
Fact & Dimension Modeling
↓
Metrics & Analytics
↓
Visualizations & Dashboard

Clear separation of concerns is maintained throughout:
- Python for ingestion and transformation
- SQL for modeling and validation
- BI-ready outputs for visualization

---

## 🛠 Tech Stack

- **Python**: pandas, matplotlib, seaborn  
- **SQL**: PostgreSQL  
- **Data Modeling**: Star-schema style (facts & dimensions)  
- **Notebooks**: Jupyter  
- **Version Control**: Git & GitHub  
- **Visualization**: Python charts and Power BI

---

## 📁 Repository Structure

```
📁 customer-revenue-analytics/
├── 📁 data/
│   ├── 📁 raw/                   # Raw CSVs
│   └── 📁 processed/             # Cleaned data
├── 📁 sql/
│   ├── 📁 Queries/               
├── 📁 notebooks/
    ├── 📁 Queries/               
├── 📁 visualaizations/           
├── 📁 Dashboard/
└── 📄 README.md

Each notebook and SQL file has a **single responsibility**, following production analytics best practices.
```
---

## 🧩 Data Model

### Fact Table
- **fact_sales**
  - One row per transaction line
  - Quantity, revenue, dates, customer & product references

### Dimension Tables
- **dim_customer** — unique customers with geographic context  
- **dim_product** — unique products with stable descriptions  
- **dim_date** — calendar attributes for time-based analysis  

This structure enables:
- Consistent metric computation
- Clean joins
- Scalable analytics as data grows

<img width="1060" height="598" alt="image" src="https://github.com/user-attachments/assets/622d67a7-4fd2-483e-89ff-9353e0a78f53" />

---

## 📈 Key Analyses & Insights

### Customer Analytics
- Revenue concentration among top customers
- Identification of high-value repeat buyers

### Product Performance
- Revenue distribution across products
- Clear Pareto-style concentration patterns

### Time-Series Analysis
- Monthly revenue trends
- Short-term volatility with long-term growth signals

### Cohort & Retention Analysis
- Customer retention decay over time
- Differences in cohort quality across acquisition periods

### Forecasting
- Baseline revenue forecasting using moving averages
- Forward-looking view grounded in historical trends

---

## 📊 Visual Outputs

The project produces clean, executive-ready visuals including:

- Monthly revenue trend with smoothing
- Top customers and products by revenue
- Cohort retention heatmaps
- Historical vs forecasted revenue

## 📊 Final Dashboard

<img width="2000" height="1148" alt="image" src="https://github.com/user-attachments/assets/cbe9ca26-4f92-485c-8ffd-44b09c226e15" />

---

## ⚠️ Assumptions & Limitations

- Some transactions lack customer identifiers (handled explicitly)
- Returns and negative quantities are retained and analyzed
- Forecasting is intentionally simple and serves as a baseline, not a prediction engine
- This is a batch analytics pipeline, not real-time streaming

All assumptions are documented and reflected consistently in metrics.

---

## 🎯 Why this project matters

This project demonstrates the ability to:

- Work with messy, real-world data
- Apply proper data modeling principles
- Validate metrics rigorously
- Separate analytics logic from presentation
- Build systems that scale beyond a single notebook

It reflects **how analytics is actually done in industry**.

---

## 🧠 What could be next

If extended further, this system could support:
- Automated data refreshes
- Advanced forecasting models
- Customer segmentation and lifetime value modeling
- Production orchestration

These are intentionally out of scope to keep the focus on analytics fundamentals done right.

---

## 👋 Final Note

This project prioritizes **clarity, correctness, and discipline** over flashy tools.

If you can trust the numbers, the insights will follow.
