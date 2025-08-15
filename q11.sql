-- Calculate the percentage contribution of each pizza type to total revenue.

Select pizzatypecategory.category, 
round(
(sum(orders_details.quantity * pizzas.price) /
(SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price),
            2) AS total_sales
FROM
    orders_details
        JOIN
    pizzas ON pizzas.pizza_id = orders_details.pizza_id) )*100,2) as revenue 
from pizzatypecategory join pizzas
on pizzatypecategory.pizza_type_id= pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id=pizzas.pizza_id
group by pizzatypecategory.category order by revenue desc;