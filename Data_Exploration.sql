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


