USE ecommerce;

-- Most selling products
SELECT product, SUM(net_amount) AS sales
FROM orders
GROUP BY product
ORDER BY sales DESC;


-- How are monthly sales changing over time?
WITH ranked_products AS (
    SELECT Category, Product, SUM(Net_Amount) AS total_sales,
        DENSE_RANK() OVER (PARTITION BY Category ORDER BY SUM(Net_Amount) DESC) AS product_rank
    FROM orders
    GROUP BY Category, Product
)
SELECT *
FROM ranked_products
WHERE product_rank <= 3
ORDER BY Category, product_rank;


-- Who are the top 10 most profitable customers?
SELECT
    Customer_Name, Email, 
    SUM(Profit) AS total_profit, 
    SUM(Net_Amount) AS total_spending,
    COUNT(DISTINCT Order_ID) AS total_orders
FROM orders
GROUP BY Customer_Name, Email
ORDER BY total_profit DESC
LIMIT 10;


-- Which cities generate above-average sales?
SELECT City, SUM(Net_Amount) AS total_sales
FROM orders
GROUP BY City
HAVING SUM(Net_Amount) > (
    SELECT AVG(city_sales)
    FROM (
        SELECT SUM(Net_Amount) AS city_sales
        FROM orders
        GROUP BY City
    ) AS city_totals
)
ORDER BY total_sales DESC;


-- What percentage of total sales does each category contribute?
SELECT Category, SUM(Net_Amount) AS total_sales,
    ROUND(
        100.0 * SUM(Net_Amount) / SUM(SUM(Net_Amount)) OVER (),
        2
    ) AS contribution_pct
FROM orders
GROUP BY Category
ORDER BY contribution_pct DESC;


-- Which payment modes generate the highest sales?
SELECT
    Payment_Mode,
    COUNT(DISTINCT Order_ID) AS total_orders,
    SUM(Net_Amount) AS total_sales,
    ROUND(AVG(Net_Amount), 2) AS avg_order_value
FROM orders
GROUP BY Payment_Mode
ORDER BY total_sales DESC;


-- Which products have high sales but low profitability?
SELECT
    Product,
    SUM(Net_Amount) AS total_sales,
    SUM(Profit) AS total_profit,
    ROUND(100.0 * SUM(Profit) / NULLIF(SUM(Net_Amount), 0), 2) AS profit_margin_pct
FROM orders
GROUP BY Product
HAVING SUM(Net_Amount) > 0
ORDER BY profit_margin_pct ASC;


-- How do order statuses affect sales?
SELECT
    Order_Status,
    COUNT(DISTINCT Order_ID) AS total_orders,
    SUM(Net_Amount) AS total_sales
FROM orders
GROUP BY Order_Status
ORDER BY total_orders DESC;


-- Which customers have not placed another order after their first purchase?
SELECT
    Customer_Name,
    Email,
    COUNT(DISTINCT Order_ID) AS total_orders,
    SUM(Net_Amount) AS total_spending
FROM orders
GROUP BY Customer_Name, Email
HAVING COUNT(DISTINCT Order_ID) = 1
ORDER BY total_spending DESC;


