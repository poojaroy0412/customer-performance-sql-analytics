CREATE OR REPLACE VIEW report_customers AS
WITH base_query AS (
SELECT
f.order_number,
f.product_key,
f.order_date,
f.sales_amount,
f.quantity,
c.customer_key,
c.customer_number,
CONCAT(c.first_name, ' ' , c.last_name) AS customer_name,
TIMESTAMPDIFF(YEAR, c.birthdate, CURDATE()) AS age
FROM fact_sales f
LEFT JOIN dim_customers c
ON c.customer_key = f.customer_key
WHERE order_date is not null)
-- 3. Aggregates customer-level metrics:
, customer_aggregation AS (
SELECT
customer_key,
customer_number,
customer_name,
age,
COUNT(DISTINCT order_number) AS total_orders,
SUM(sales_amount) AS total_sales,
SUM(quantity) as total_quantity,
COUNT(DISTINCT product_key) as total_products,
MAX(order_date) AS last_order_date,
timestampdiff(MONTH, MIN(order_date), MAX(order_date)) as lifespan
FROM base_query
GROUP BY
	customer_key,
	customer_number,
	customer_name,
	age
)
SELECT
customer_key,
customer_number,
customer_name,
age,
CASE
	WHEN age < 20 THEN 'Under 20'
    when age between 20 and 29 then '20-29'
    when age between 30 and 39 then '30-39'
    when age between 40 and 49 then '40-49'
    else '50 and above'
end as age_group,
    
CASE
	WHEN lifespan >= 12 AND total_sales > 5000 THEN 'VIP'
    WHEN lifespan >= 12 AND total_sales <= 5000 THEN 'Regular'
    ELSE 'New'
END AS customer_segment,
last_order_date,
TIMESTAMPDIFF(month, last_order_date, CURDATE()) AS recency,
total_orders,
total_sales,
total_quantity,
total_products,report_customersreport_customers
lifespan,
-- compute average order value
total_sales / total_orders as avg_order_value,
-- compute average monthly spend
case when lifespan = 0 then total_sales
	else total_sales / lifespan 
end as average_monthly_spend
FROM customer_aggregation