-- Identify the highest-priced pizza.

SELECT 
    pizzatypecategory.name, pizzas.price
FROM
    pizzatypecategory
        JOIN
    pizzas ON pizzatypecategory.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;
