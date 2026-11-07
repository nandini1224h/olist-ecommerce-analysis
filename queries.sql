USE olist;

-- Q1: Monthly revenue and orders
SELECT order_month, COUNT(*) AS orders, ROUND(SUM(revenue)) AS revenue
FROM order_summary
GROUP BY order_month
ORDER BY order_month;

-- Q2: Top 10 categories by revenue
SELECT category, ROUND(SUM(price)) AS revenue
FROM item_details
GROUP BY category
ORDER BY revenue DESC
LIMIT 10;

-- Q3: Review score, on-time vs late (KEY INSIGHT)
SELECT CASE WHEN delay_days > 0 THEN 'Late' ELSE 'On time' END AS delivery,
       COUNT(*) AS orders,
       ROUND(AVG(review_score), 2) AS avg_review
FROM order_summary
GROUP BY delivery;

-- Q4: Late delivery % by state
SELECT customer_state, COUNT(*) AS orders,
       ROUND(100.0 * SUM(delay_days > 0) / COUNT(*), 1) AS late_pct
FROM order_summary
GROUP BY customer_state
ORDER BY late_pct DESC;

-- Q5: Repeat purchase rate
SELECT COUNT(*) AS customers,
       SUM(n > 1) AS repeat_customers,
       ROUND(100.0 * SUM(n > 1) / COUNT(*), 1) AS repeat_pct
FROM (SELECT customer_unique_id, COUNT(*) AS n
      FROM order_summary
      GROUP BY customer_unique_id) x;
      