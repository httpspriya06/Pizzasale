-- Determine the top 3 most ordered pizza types based on revenue.

Select pizzatypecategory.name , sum(orders_details.quantity*pizzas.price) as revenue from
pizzatypecategory join pizzas
on pizzatypecategory.pizza_type_id=pizzas.pizza_type_id
join
orders_details on 
orders_details.pizza_id=pizzas.pizza_id
group by pizzatypecategory.name order by revenue desc limit 3; 