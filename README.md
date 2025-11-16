# 📘 E-Commerce Sales & Customer Analytics  
*End-to-end BI project combining Python, Power BI, DAX, Cohorts, and RFM Segmentation.*

---

## 🚀 1. Project Overview

This project delivers a complete analytics solution for an e-commerce business using a full modern BI workflow:

- **Python** for data cleaning, feature engineering, and analytics  
- **Power BI** for data modeling, DAX, dashboards, and time-intelligence  
- **Cohort retention analysis** and **RFM segmentation**  
- Final metrics for **Revenue**, **Profitability**, **Retention**, **LTV**, and **Product performance**

The final dashboard enables leadership to understand performance, identify growth opportunities, and make data-driven decisions.

---

## 🎯 2. Business Questions Answered

### Revenue & Profitability
- How are revenue and profit trending month over month?
- Which regions and categories contribute most to revenue and margin?
- How are we performing **YTD vs previous YTD**?

### Customer Intelligence
- What is customer lifetime value (LTV)?
- Which segments perform best (Consumer, Corporate, Home Office)?
- Which customers are **Champions** and which are **At Risk**?

### Retention & Growth
- How does customer retention behave by cohort?
- Which cohorts generate long-term revenue?

### Product Performance
- Which products drive revenue?
- Which categories maximize profit?

---

## 🛠 3. Tech Stack

### Python
- pandas, numpy  
- matplotlib  
- feature engineering (RFM, cohorts)  
- preprocessing → CSV outputs  

### Power BI
- Data modeling  
- Time-intelligence DAX  
- YTD, MTD, QTD, YoY  
- Disconnected table + SWITCH() dynamic selector  
- Professional dashboard design  

### Other
- Git & GitHub  
- SQL (optional)

---

## 🧼 4. Data Pipeline Overview

### Raw Input
`data/raw/ecommerce_sales.csv`

### Data Cleaning (Python)
- Type conversions  
- Date parsing  
- Null handling  
- Standardization of metrics  

### Feature Engineering
- LTV + Customer metrics  
- RFM Segmentation  
- Cohort Retention  

### Output Tables (Used in Power BI)
- `orders_clean.csv`  
- `customers_clean.csv`  
- `products_clean.csv`  
- `rfm_segments.csv`  
- `cohort_retention_long.csv`  

---

## 📊 5. Power BI Dashboard

### 🟦 Overview Page
- Total Revenue, Total Profit  
- Order Count, Customer Count  
- Profit Margin %  
- YTD vs PYTD  
- YoY Revenue  
- Dynamic period selector (MTD/QTD/YTD/YoY)  
- Revenue by Region & Category  

**Screenshot:**  
![Overview](dashboard/screenshots/overview.png)

---

### 🟩 Customers Page
- Customer LTV  
- Order frequency  
- Revenue by Segment  
- RFM Segmentation (Champions, Loyal, At Risk, Lost)  
- Top customers  

**Screenshot:**  
![Customers](dashboard/screenshots/customers.png)

---

### 🟧 Products Page
- Top 15 products  
- Category-level margins  
- Sub-category treemap  

**Screenshot:**  
![Products](dashboard/screenshots/products.png)

---

### 🟪 Cohorts & RFM Page
- Monthly retention matrix  
- RFM distribution  
- Champions % contribution  

**Screenshot:**  
![Cohorts](dashboard/screenshots/cohorts.png)

---

## 🔢 6. Key DAX Measures

### Core Metrics
```DAX
Total Revenue = SUM(orders_clean[sales])
Total Profit = SUM(orders_clean[profit])
Order Count = DISTINCTCOUNT(orders_clean[order_id])
Customer Count = DISTINCTCOUNT(orders_clean[customer_id])
Profit Margin % = DIVIDE([Total Profit], [Total Revenue])


DAX:
YTD Revenue = TOTALYTD([Total Revenue], orders_clean[order_date])
MTD Revenue = TOTALMTD([Total Revenue], orders_clean[order_date])
PYTD Revenue = CALCULATE([YTD Revenue], DATEADD(orders_clean[order_date], -1, YEAR))
YoY Growth % = DIVIDE([Total Revenue] - [PY Revenue], [PY Revenue])

Dynamic Revenue =
SWITCH(
    SELECTEDVALUE('Period Selector'[Period]),
    "MTD", [MTD Revenue],
    "QTD", CALCULATE([Total Revenue], DATESQTD(orders_clean[order_date])),
    "YTD", [YTD Revenue],
    "YoY", [YoY Growth %],
    BLANK()
)

ecommerce-sales-customer-analytics/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_exploratory_analysis.ipynb
│   ├── 03_customer_metrics_rfm.ipynb
│   └── 04_cohort_analysis.ipynb
│
├── dashboard/
│   ├── ecommerce_analytics.pbix
│   └── screenshots/
│
├── src/
│   └── load_to_sqlite.py
│
├── requirements.txt
└── README.md


7. How to Run the Project
Python
pip install -r requirements.txt


Run notebooks in order:

01_data_cleaning

02_exploratory_analysis

03_customer_metrics_rfm

04_cohort_analysis

Power BI

Open dashboard/ecommerce_analytics.pbix

Refresh all

Ensure file paths point to data/processed/