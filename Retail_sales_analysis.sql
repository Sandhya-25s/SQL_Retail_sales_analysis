create database sql_prject;
use sql_prject;

Drop table if exists Retail_sales;
CREATE TABLE Retail_sales
(
		  transactions_id int primary key,
		  sale_date date, 
		  sale_time time,
		  customer_id int,
		  gender varchar(15),
		  age int,
		  category varchar(20),
		  quantiy int,
		  price_per_unit float,
		  cogs float,
		  total_sale float
)
select * from Retail_sales limit 50;

SELECT DISTINCT category FROM retail_sales;

Select count(*) FROM Retail_sales;

#DATA CLEANING

select * from Retail_sales
where 
    transactions_id is null
    OR
    sale_date is null
    OR
    sale_time is null
    OR
    customer_id is null
    OR
    gender is null
    OR
    age is null
    OR
    category is null
    OR
    quantiy is null
    OR
    price_per_unit is null
    OR
    cogs is null
    OR
    total_sale is null;

SET SQL_SAFE_UPDATES = 0;    
Delete from Retail_sales
where 
    transactions_id is null
    OR
    sale_date is null
    OR
    sale_time is null
    OR
    customer_id is null
    OR
    gender is null
    OR
    age is null
    OR
    category is null
    OR
    quantiy is null
    OR
    price_per_unit is null
    OR
    cogs is null
    OR
    total_sale is null;
SET SQL_SAFE_UPDATES = 1; 

#DATA EXPLORATION

#TOTAL SALES COUNT
SELECT count(*) AS Total_sales from Retail_sales

# how many unique customers we have?
SELECT count(distinct customer_id) AS total_customer from Retail_sales


Select distinct category from Retail_sales


#Data analysis and bussiness key problem also answers

#Q1.write sal query to retriew the all colum from sales made on "2022-11-05"
select * from Retail_sales where sale_date ="2022-11-05"

# Q2.write a sql query to find the average of age who paurchased item from "beauty" 

select round(avg(Age),2) as average_age from Retail_sales where category="Beauty"

#Q3.write a sql query to retriew all transaction where the catoegory is "clothing" and the quality sold is more than 4 in the month of november 2022 
select * from Retail_sales where category="Clothing" and quantiy>="4" and sale_date between "2022-11-1" and "2022-11-30"

#Q4. calculate total sales for all the category
select category,sum(total_sale) from Retail_sales group by category

#Q5.write a sql query to find all transaction where the total_sale is greater than 1000.
select * from Retail_sales where total_sale>1000

#Q6. find total number of transaction made by each gender by each category
select category,gender,count(transactions_id)as total_transac from Retail_sales Group by category,gender order by 1


#Q7.find the top 5 customer based on the highest total sale
select customer_id,sum(total_sale) as total_sale from Retail_sales group by customer_id order by total_sale DESC LIMIT 5

#Q8. find the number of unique customer who purchased item from each category
select count(distinct(customer_id))as distinct_customer,category from Retail_sales group by category 
 

#Q9.Write query to create each shift and number of orders(morning <12,afternoon between 12 to 5 ,evening after 5 clock)

select count(transactions_id) as number_of_orders,
CASE
    WHEN sale_time < "12:00:00" then "Morning"
    WHEN sale_time between "12:00:00" and "17:00:00" then "afternoon"
    Else "evening"
    End as Shift
 from Retail_sales
 Group by Shift





