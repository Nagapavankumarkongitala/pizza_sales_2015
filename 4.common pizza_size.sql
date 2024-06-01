-- Identify the most common pizza size ordered
-- to count most ordered order id
-- select quantity, count(order_details_id)
-- from orders_details group by quantity;

SELECT 
    pizzas.size,
    COUNT(orders_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC
LIMIT 1;