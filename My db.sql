create table Employee(
Name varchar(30),
Address varchar(30),
Salary int,
Age int);

-- alter command
alter table employee
add gender varchar(2);

desc employee;

insert into employee
values ('Franklin','MP',100000,20,'M');

insert into employee
values
('Suresh','Ghaziabad',30000,21,'M'),
('Rinki','Delhi',40000,21,'F'),
('Micheal','Mumbai',70000,21,'M'),
('Suhani','Indore',20000,21,'F'),
('Suresh','Pune',90000,21,'M');


select * from employee

update employee
set Address = 'mp'
where name = 'Franklin';

SET SQL_SAFE_UPDATES = 0;

show binlog events;

-- count case
select
count(case when Salary >= (select avg(Salary) from employeedata) then Employee end) as good_sal
from employeedata;

-- subquery
-- show all the distinct departments
select distinct Department from employeedata;

# Find out the total employees who work in Finance departmnet
select count(Employee) as EmployeeCount
from employeedata
where Department='Finance';

-- show all employees from Calfornia
select Employee from employeedata
where Location = 'California';

-- get the employees name in descending order salary wise 
select Employee, Salary from employeedata
order by Salary desc;

-- select top 5 earner of Technlogy Department
select Employee, Salary
from employeedata
where Department = 'Technology'
order by Salary desc
limit 5;

select
count(case when salary >= (select avg(Salary) from employeedata) then Employee end) as good_sal
from employeedata;

-- To Retrieve the lowest salary in the company Employeedata
select Employee , Department , Salary
from employeedata
where salary = (select min(Salary) as lowest_salary from employeedata);

select Employee
from employeedata
where salary = (select max(Salary) as lowest_salary from employeedata);

-- count the number of employee who are earning more than 60000 dollers
SELECT COUNT(employee) 
FROM employeedata
WHERE salary > 60000;

-- count the number of epmloyee hired after 2010

SELECT COUNT(*) AS employees_hired_after_2010
FROM employeedata
WHERE 'Datehired' > '2010-12-31';

-- Grouping
-- calculate the average salary of male and female employees
select sex, avg(salary) as average_salary
from employeedata
group by sex;

--  get the location of the highest number of employees
select location, count(*) as Employee_count
from employeedata
group by location
order by employee_count DESC;

-- Show the total salary of the employees for each location
select location, sum(salary) as salary_count
from employeedata
group by location;


-- Calculate the diference between highest and lowest salaries
select max(salary) - min(salary) AS salary_difference
FROM employeedata;


-- Retrieve employees with salaries in top 10%
SELECT *
FROM employeedata
WHERE salary >= (
    SELECT salary
    FROM employeedata
    ORDER BY salary DESC
    LIMIT 1 OFFSET (SELECT FLOOR(COUNT(*) * 0.1) FROM employeedata)
);




-- Find the Department with Highest average salary
select department, avg(salary) as average_salary
from employeedata
group by department
order by average_salary DESC
LIMIT 1;

-- select the departments whose average salary is greater than the marketing departmnet
select department, avg(salary) as avg_salary
from employeedata
group by department
having avg_salary > (
    select avg(salary) FROM employeedata
    WHERE department = 'Marketing'
);


-- count if then case
-- Arithmetic Operators

select employee_id, first_name, salary+500 as 'Increased Salary' from employees;

-- calculate the 5% of increement in the salary
select employee_id, first_name, salary*0.05 as 'New inc' from employees;
-- calculate the new salary after incremment
select employee_id, first_name, salary+salary*0.05 as 'New_salary' from employees;

select first_name,last_name,salary
from employees
order by salary desc
limit 5;



-- Not Equal <>
select first_name, last_name, job_title, office_id
from employees
where office_id <> 1;

-- select those employees earning more than avarage salary
select employee_id, first_name, salary 
from employees
where salary > (select avg(salary) from employees);

use sql_store;

-- please get employee details for state MA, VA, TN, IL
select * from customers 
where state in ('MA', 'VA', 'TN', 'IL');
 	

-- IN Operator
select * from customers where state in ('MA', 'CO');

select * from customers 
where state in ('MA', 'VA', 'TN', 'IL') and points>2000;

-- concat function
select concat('Rituraj', ' ', 'Dixit') as full_name;

select concat(first_name, ' ', last_name) as Full_Name from customers;

-- Upper Case and Lower Case
select upper('hello') as UpperCase;


-- Retrieve all products and their prices
-- Retrieve all products and their prices
select ProductName, Price from products;

-- List Unique categories available
select distinct CategoryName from Categories;


-- find the total sales revenue 
select sum(s.Quantity*p.price) as total_sales
from sales as s
inner join products p
on s.ProductID = p.ProductID;

-- Count the number of customer 
select count(*) as total_customers from customers

-- Find the average price of products

-- get the product name s along with their categories (Inner join)

--
select p.ProductName, c.CategoryName
from products p 
join categories c 
on p.CategoryID=c.CategoryID;

select cu.FirstName, cu.LastName, ci.CityName, co.CountryName
from customers cu 
join cities ci on cu.CityID = ci.CityID
join countries co on ci.CountryID = co.CountryID;

select c.CategoryName,sum(s.Quantity*p.price) as total_sales
from sales as s
inner join products p on s.ProductID = p.ProductID
inner join categories c on p.CategoryID=c.CategoryID
group by c.CategoryName;

----
-- Find all the products that are durable and have a price greater than 50
select ProductName, price
from products 
where Resistant='Durable' and price>50;


-- Get the customers names who live in Chicago or Buffalo
Select cu.FirstName, cu.LastName, ci.CityName
from customers ct
inner join cities ci on ci.CityID = cu.CityID
where CityName='Chicago' or CityName= 'Buffalo';

-- list the products that belong to category Diary and are medium class
-- join be on two tables products and Category
select p.ProductName, p.Class, c.CategoryName
from products p
inner join categories c on p.CategoryID = p.CategoryID
where Class = 'Medium' and CategoryName = 'Dairy';

-- find the maximum price and minimum price from the products
select max(Price), min(Price)  from products;


-- alter


select c.customer_id, c.first_name, p.name, o.order_id, os.name
from customers c
left join orders o
on c.customer_id = o.customer_id
inner join order_statuses os on o.order_id = os.order_status_id
inner join order_items oi on os.order_status_id = oi.order_id
inner join products p on  oi.product_id = p.product_id;




