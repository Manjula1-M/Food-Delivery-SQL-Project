  --Data cleaning
  use FoodDeliveyProject
  GO

--20.Find the null value in all column
select
    sum(case when Order_ID is null then 1 else 0 end) as Null_Order_ID,
    sum(case when Customer_ID is null then 1 else 0 end) as Null_Customer_ID,
    sum(case when Restaurant_ID is null then 1 else 0 end) as Null_Restaurant_ID,
    sum(case when Restaurant_Name is null then 1 else 0 end) as Null_Restaurant_Name,
    sum(case when City is null then 1 else 0 end) as Null_City,
    sum(case when Customer_Age is null then 1 else 0 end) as Null_Customer_Age,
    sum(case when Food_Item is null then 1 else 0 end) as Null_Food_Item,
    sum(case when Food_Category is null then 1 else 0 end) as Null_Food_Category,
    sum(case when Price is null then 1 else 0 end) as Null_Price,
    sum(case when Quantity is null then 1 else 0 end) as Null_Quantity
FROM dbo.food_delivery;


--21.Check duplicate records
SELECT
    Order_ID,
    Customer_ID,
    Restaurant_ID,
    Restaurant_Name,
    City,
    Customer_Age,
    Food_Item,
    Food_Category,
    Price,
    Quantity,
    COUNT(*) AS Duplicate_Count
FROM dbo.food_delivery
GROUP BY
    Order_ID,
    Customer_ID,
    Restaurant_ID,
    Restaurant_Name,
    City,
    Customer_Age,
    Food_Item,
    Food_Category,
    Price,
    Quantity
HAVING COUNT(*) > 1;

--22.Identify repeated Order_ID
select 
    Order_ID,
    count(*) as Total_Records
from dbo.food_delivery
group by Order_ID
having count(*)>1;


--23.Find the zero or Negative price
select * from dbo.food_delivery
where Price <=0;


--24.Find the zero or negative quantities
select * from dbo.food_delivery
where Quantity <= 0;


--25.Find the Invalid age group
select * from dbo.food_delivery
where Customer_Age <=0;


--26.Find the blank city names
select * from dbo.food_delivery
where City is null
or LTRIM(RTRIM(City))='';


--27.Find the blank restaurant names
select * from dbo.food_delivery
where Restaurant_Name is null
or LTRIM(RTRIM(Restaurant_Name))='';


--28.Find the blank food item
select * from dbo.food_delivery
where Food_Item is null
or LTRIM(RTRIM(Food_Item))='';
