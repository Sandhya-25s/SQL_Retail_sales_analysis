Project Title: Retail Sales Analysis
DATABASE: sql_project
This project is designed to demonstrate SQL skills and techniques typically used by data analyst to explore, clean and analyse retail sales data.the project involves setting up a retail sales database, performing exploratory analysis(EDA) and answering specific bussness question through SQL queries.

Objective:
1. Set up a retail sales database: Create and populate a retail sales database with provided sale data
2. Data Cleaning: Identify and remove and records with missisng and null values
3. Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.
4. Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data

Project Structure:
1. Database Setup
Database Creation: The project starts by creating a database named sql_project.
Table Creation: A table named Retail_sales is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.

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


2. Data Exploration & Cleaning
Record Count: Determine the total number of records in the dataset.
Category Count: Identify all unique product categories in the dataset.
Null value check: check for any null values in the dataset and detelet records with missing data


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



3. Data Analysis & Findings
    1. Write a SQL query to retrieve all columns for sales made on '2022-11-05':
     SELECT * from Retail_sales where sale_date ="2022-11-05"

    2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
      Select  * from Retail_sales where category="Clothing" and quantiy>="4" and sale_date between "2022-11-1" and "2022-11-30"

    3. Write a sql query to find the average of age who paurchased item from "beauty"
       select round(avg(Age),2) as average_age from Retail_sales where category="Beauty"

    4. Write a sql query to calculate total sales for all the category  
       select category,sum(total_sale) from Retail_sales group by category

    5. write a sql query to find all transaction where the total_sale is greater than 1000.
       select * from Retail_sales where total_sale>1000

    6.Write the sql query to find total number of transaction made by each gender by each category
       select category,gender,count(transactions_id)as total_transac from Retail_sales Group by category,gender order by 1

    7.write the sql query to find the top 5 customer based on the highest total sale     
       select customer_id,sum(total_sale) as total_sale from Retail_sales group by customer_id order by total_sale DESC LIMIT 5

    8. write the sql query to find the number of unique customer who purchased item from each category
       select count(distinct(customer_id))as distinct_customer,category from Retail_sales group by category 

    9.Write query to create each shift and number of orders(morning <12,afternoon between 12 to 5 ,evening after 5 clock)
       select count(transactions_id) as number_of_orders,
       CASE
            WHEN sale_time < "12:00:00" then "Morning"
            WHEN sale_time between "12:00:00" and "17:00:00" then "afternoon"
            Else "evening"
            End as Shift
        from Retail_sales
        Group by Shift



Report :
Sales Summary: A detailed report summarizing total sales, customer demographics, and category performance.
Trend Analysis: Insights into sales trends across different months and shifts.
Customer Insights: Reports on top customers and unique customer counts per category.