# E-Commerce Sales Analysis and Business Intelligence Dashboard

An end-to-end data analytics project using Python, SQL, and Power BI to clean e-commerce transaction data, analyze sales and profitability, and develop an interactive dashboard for business insights.

## Project Overview

This project focuses on analyzing e-commerce sales data to understand customer purchasing patterns, product performance, and business profitability.

The workflow starts with an unclean Excel dataset, which is processed using Python and Pandas. After cleaning and feature engineering, the data is stored in a MySQL database for SQL-based analysis and connected to Power BI for interactive visualization.

The objective is to transform raw transactional data into meaningful insights that can support business decision-making.

## Business Objectives

- Analyze overall sales, profit, and order performance.
- Identify top-performing products and product categories.
- Understand sales distribution across cities and regions.
- Analyze monthly sales trends and seasonality.
- Examine customer payment preferences and order status.
- Develop an interactive dashboard to monitor key business metrics.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Source data and initial inspection |
| Python | Data cleaning and feature engineering |
| Pandas and NumPy | Data manipulation and processing |
| Jupyter Notebook | Data analysis and development |
| MySQL | Data storage and SQL analysis |
| SQLAlchemy and PyMySQL | Connecting Python with MySQL |
| Power BI | Interactive dashboard development |
| DAX | KPI calculations and business measures |

## Data and Assumptions

The project uses an Excel-based e-commerce transaction dataset.
The calculated profit is based on an assumed 20% margin and should be interpreted as an illustrative estimate rather than actual business profit.
Missing delivery dates are handled using the corresponding order date. This is a data-cleaning assumption and should be considered when analyzing delivery performance.



## Project Workflow

### 1. Data Inspection

Imported the raw Excel dataset into Python and examined its structure, data types, missing values, duplicate records, and summary statistics.

### 2. Data Cleaning

Performed data quality checks and transformations using Pandas:

- Removed duplicate records.
- Standardized missing-value representations such as `N/A` and `NULL`.
- Removed extra spaces from text columns.
- Standardized customer names and geographic fields.
- Checked email formats and filtered invalid records.
- Converted order and delivery dates into datetime format.
- Converted quantity, unit price, and discount columns into numeric data types.
- Removed records with non-positive quantities.
- Handled missing values in selected columns.

### 3. Feature Engineering

Created additional columns to support sales and business analysis:

| Feature | Calculation |
|---|---|
| Sales | Quantity × Unit Price |
| Net Amount | Sales − Discount Amount |
| Profit | Net Amount × Assumed Profit Margin |
| Month | Month extracted from Order Date |
| Year | Year extracted from Order Date |
| Weekday | Day of the week extracted from Order Date |

The profit calculation uses an assumed 20% margin for demonstration purposes and does not represent actual product-level costs or verified business profit.

### 4. SQL Analysis

Exported the cleaned dataset from Python and loaded it into MySQL for further analysis.

SQL queries were used to examine:

- Total orders and net sales.
- Sales by product and city.
- Monthly sales performance.
- Profit by product.
- Payment mode distribution.
- Cancelled orders and order status.

### 5. Power BI Dashboard

Connected Power BI to the MySQL database and developed an interactive dashboard to monitor sales performance.

The dashboard includes:

**Key Performance Indicators**
- Total Sales
- Total Orders
- Total Profit
- Average Order Value

**Visualizations**
- Monthly Sales Trend
- Sales by Category
- Sales by Product
- Sales by City
- Payment Mode Distribution
- Order Status Distribution
- Top 10 Products by Sales
- Profit by Category

**Interactive Filters**
- Year
- Month
- Category
- City
- Payment Mode

## Key Business Metrics

| Metric | Definition |
|---|---|
| Total Sales | Sum of Net Amount |
| Total Orders | Count of distinct orders |
| Total Profit | Sum of calculated Profit |
| Average Order Value | Total Sales divided by distinct orders |

## Project Structure

```text
ecommerce-sales-analysis/
│
├── data/
│   └── README.md
│
├── notebooks/
│   └── ecommerce_data_cleaning.ipynb
│
├── sql/
│   └── sales_analysis.sql
│
├── powerbi/
│   └── ecommerce_dashboard.pbix
│
└── README.md
```

## Business Applications

The analysis can help businesses:

- Monitor sales and order performance.
- Identify products and categories contributing the most revenue.
- Understand geographic sales patterns.
- Evaluate payment preferences.
- Track business performance over time.
- Support decisions related to product performance and sales strategy.



