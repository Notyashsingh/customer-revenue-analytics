Customer Revenue Analytics



Goal:

Analyze customer revenue patterns using transactional retail data.



Status:

Week 1 – Data ingestion and database setup

## Data Ingestion Contract

Source:
- File: online_retail.xlsx
- Location: data/raw/
- Sheets:
  - 2009–2010
  - 2010–2011

Rules:
- Raw data is immutable
- No manual edits, merges, or filters
- All transformations happen via code
- Processed outputs go to data/processed/

Known Issues:
- Some months missing in certain years
- Data quality issues expected and handled downstream


