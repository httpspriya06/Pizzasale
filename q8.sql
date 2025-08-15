-- Join relevant tables to find the category-wise distribution of pizzas.

select category, count(name) from pizzatypecategory
group by category ;