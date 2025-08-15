-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pizzatypecategory.category,
    SUM(orders_details.quantity) AS quantity
FROM
    pizzatypecategory
        JOIN
    pizzas ON pizzatypecategory.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizzatypecategory.category
ORDER BY quantity DESC;

