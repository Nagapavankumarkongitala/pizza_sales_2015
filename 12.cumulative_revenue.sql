-- Analyze the cumulative revenue generated over time.

SELECT order_date, revenue, 
ROUND(SUM(revenue) OVER (ORDER BY order_date),2) AS cum_revenue
FROM
(SELECT orders.`date` AS order_date, ROUND(SUM(orders_details.quantity * pizzas.price),2) AS revenue
FROM orders_details JOIN pizzas
	ON orders_details.pizza_id = pizzas.pizza_id
JOIN orders
	ON orders.order_id = orders_details.order_id
GROUP BY order_date) AS sales;