-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pizzatypecategory.name,
    SUM(orders_details.quantity) AS quantity
FROM
    pizzatypecategory
        JOIN
    pizzas ON pizzatypecategory.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizzatypecategory.name
ORDER BY quantity DESC
LIMIT 5;
