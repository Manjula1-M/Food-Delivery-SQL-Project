--Business Analysis Insight
use FoodDeliveyProject
GO

--10.find the number of order in each city
select 
	City ,
	count(distinct Order_ID) as Total_orders
from dbo.food_delivery
group by City
order by Total_orders desc;

--11.find the number of ordes placed at each restaurant
select
Restaurant_Name,
count(distinct Order_ID) as Tot_orders
from dbo.food_delivery
group by Restaurant_Name
order by Tot_orders desc;

-- 12.find the number of orders in each food category
select
Food_Category,
count(distinct Order_ID) as Tot_orders
from dbo.food_delivery
group by Food_Category
order by Tot_orders desc;


--13.find the most popular food items based on order count
select
	Food_Item,
	count(distinct Order_ID) as Total_order
from dbo.food_delivery
group by Food_Item
order by Total_order  desc;


--14. Find the Minimun and Maximum average food price
select
	min(Price) as Min_Price,
	max(Price) as Max_Price,
	avg(cast(Price as decimal(10,2))) as Avg_price
from food_delivery;

--15.Find the Minimum and Maximum average quantity
select 
	min(Quantity) as Min_Qnty,
	max(Quantity) as Max_Qnty,
	avg(cast(Quantity as decimal(10,2))) as Avg_Quantity
from dbo.food_delivery;


-- 16.Find the total revenue
select
	sum(Price*Quantity) as Total_Revenue
from dbo.food_delivery


--17.Find the total revenue by city
select
	City,
	sum(Price*Quantity) as Total_revenue
from dbo.food_delivery
group by City 
order by Total_revenue desc;


--18.Find the revenue by restaurant
select
	Restaurant_Name,
	sum(Price*Quantity) as Total_revnue
from dbo.food_delivery
group by Restaurant_Name
order by Total_revnue;


--19.Find the total revenue by food category
select
	Food_Category,
	sum(Price*Quantity) as Total_revenue
from dbo.food_delivery
group by Food_Category
order by Total_revenue;


    
--29. Find the total number of orders in each city.
select
    City,
    count(distinct Order_ID) as total_orders
from food_delivery
group by City
order by total_orders desc;


--30. Find the top 5 restaurants based on order count.
select top 5
    Restaurant_Name,
    count(distinct Order_ID) as total_orders
from food_delivery
group by Restaurant_Name
order by total_orders desc;


--31. Find the total revenue generated.
select
    sum(Price * Quantity) as total_revenue
from food_delivery;


--32. find average order value (aov)
select top 5
    Restaurant_Name,
    sum(Price * Quantity) as total_revenue
from food_delivery
group by Restaurant_Name
order by total_revenue desc;


--33. find top 10 customers based on total spending
select top 10
    Customer_ID,
    sum(Price * Quantity) as total_spending
from food_delivery
group by Customer_ID
order by total_spending desc;


--34. find customers who placed more than one order
select
    Customer_ID,
    count(distinct Order_ID) as total_orders
from food_delivery
group by Customer_ID
having count(distinct Order_ID) > 1
order by total_orders desc;


--35. find the most popular food item in each city
with foodranking as
(
    select
        City,
        Food_item,
        count(distinct Order_ID) as total_orders,
        rank() over
        (
            partition by city
            order by count(distinct order_id) desc
        ) as ranking
    from food_delivery
    group by city, food_item
)
select
    city,
    food_item,
    total_orders
from foodranking
where ranking = 1;


--36. find revenue contribution percentage of each restaurant
select
    Restaurant_Name,
    sum(Price * Quantity) as restaurant_revenue,
    cast(
        sum(Price * Quantity) * 100.0 /
        nullif(sum(sum(Price * Quantity)) over (), 0)
        as decimal(10,2)
    ) as Revenue_percentage
from food_delivery
group by restaurant_name
order by restaurant_revenue desc;
