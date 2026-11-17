use FoodDeliveyProject
GO

--Data Exploration

--1.Display all records
select * from  dbo.food_delivery;

-- 2.Find Total number of records
select count(*) from dbo.food_delivery as Tot_No_records;


--3.find the total number of unique orders
select count(distinct order_ID) as Tot_no_unqOrder
from dbo.food_delivery ;


--4.find the total number of unique customers
select count(distinct Customer_ID) as Tot_no_unqCustm
from dbo.food_delivery ;

--5.find the total number of unique restaurants
select count(distinct Restaurant_ID) as Tot_no_unqResto
from dbo.food_delivery;

--unique values exploration

--6.find the all unique cities
select distinct City
from dbo.food_delivery
order by City;

--7.find all unique food categories
select distinct Food_Category
from dbo.food_delivery
order by Food_Category;

--8.find all unique food items
select distinct Food_item
from dbo.food_delivery
order by Food_item desc;

--9. find the unique restaurant names
select distinct Restaurant_Name
from dbo.food_delivery
order by Restaurant_Name desc;


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