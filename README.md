# E-commerce Sales & Delivery Performance Analysis

## Business problem
Which products drive revenue, and how does late delivery affect customer satisfaction and retention at a Brazilian e-commerce marketplace?

## Dataset
Olist Brazilian E-Commerce Public Dataset (Kaggle): about 99K orders from 2016 to 2018 across 6 related tables.

## Tools
- **MySQL**: joins, views, aggregation (CTEs, CASE WHEN, subqueries)
- **Excel**: data quality checks, PivotTables, SUMIFS cross-check
- **Tableau**: 2-page dashboard

## Method
1. Loaded 6 tables into MySQL and checked data quality.
2. Built two views at the right level of detail: `order_summary` (one row per order) and `item_details` (one row per item sold).
3. Validated that the final dataset has no duplicate rows (96,470 rows = 96,470 distinct orders).
4. Wrote 5 analysis queries (see `queries.sql`).
5. Checked results in Excel and built the dashboards in Tableau.

## Data cleaning
- Kept delivered orders only. 8 delivered orders with no delivery date were excluded.
- 547 orders had more than one review, so scores were averaged to one per order.
- 646 orders (0.7%) have no review score. They are left out of average-score calculations.
- Excel check: 0 duplicate order IDs. SP revenue matched in SQL and Excel (5,066,562.98).

## Key findings
1. **Late deliveries hurt reviews.** Late orders (6.8% of 96,470) averaged **2.27** stars vs **4.29** for on-time orders.
2. **Retention is low.** Only **3.0%** of customers (2,801 of 93,350) placed a repeat order.
3. **Delivery performance varies by region.** Late rates range from 4.0% in PR to 21.4% in AL, with northeast states worst. RJ is high-volume at 12.1%.
4. **Revenue is spread across categories.** health_beauty, watches_gifts and bed_bath_table lead. Orders peaked in Nov 2017 at 7,288.

Note: these are associations. Late orders score lower, but this analysis does not prove lateness alone caused it.

## Recommendation
Prioritise logistics improvements, such as regional carriers or closer fulfilment, for northeast states and RJ, where late rates are highest.

## Dashboards
![Sales Overview](dashboard_sales_overview.png)
![Delivery and Satisfaction](dashboard_delivery_satisfaction.png)

## Files
- `queries.sql`: all SQL (checks, views, analysis)
- `dashboard_sales_overview.png`, `dashboard_delivery_satisfaction.png`: dashboard screenshots
