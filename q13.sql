-- Determine the top 3 most ordered pizza types 
-- based on revenue for each pizza category.

select name, revenue from
(select category, name, revenue,
rank() over(partition by category order by revenue desc )
as rn from
(Select pizzatypecategory.category , pizzatypecategory.name,
sum((orders_details.quantity)*pizzas.price) as revenue
from pizzatypecategory join pizzas
on pizzatypecategory.pizza_type_id=pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id=pizzas.pizza_id
group by pizzatypecategory.category , pizzatypecategory.name) as a) as b
where rn <=3;