# 📊 Oracle SQL Course: SQL Made Practical

## Introduction
<br/>

**All queries here were written by me and this repository does not cover queries that were made by the teacher on video.**

<br/>

<details> 
<summary>
Click here for Introduction! 👋🏻
	
</summary>
	
<br/>
	
**📈 BIREFING**

- This course aims to teach SQL in a pratical way. Every topic is teached on video and after that, the couse gives a challenge that I had to do it by myself. Thats why some of the queries are a little off topic. It was me exploring learning possibilities within the lesson.

**✏️ OBJECTIVE**

- Be able to use Oracle SQL to retrieve, filter, analyze, format and present information from Oracle databases.
- Understand Oracle SQL code written by other people and feel confident to modify it.
- Be able to use SQL to insert, modify and delete information from Oracle databases.
- Be able to write the SQL code needed to solve the most common problems found in real work situations and academic tests.


**📈 ENVIROMENT SETUP**

- [Oracle LIVE SQL](https://livesql.oracle.com/)

</details> 
<br/>

***

## Table of Contents

- [Schema](#schema)
- [Subqueries](#subqueries)

## Schema

<details>
<summary>
Click here to see the script for the tables!
</summary>

```sql
CREATE TABLE department
(
  id	   		number(5) constraint pk_department primary key,
  name	   		varchar2(50),
  monthly_budget 	number(8,2),
  last_employee_id 	number(5)
);

CREATE TABLE employee
(
  id        number(5) constraint pk_employee primary key,
  name      varchar2(50),
  birthdate date,
  phone     varchar2(20),
  salary    number(7,2) not null,
  department_id number(3) constraint fk_employee_department references department,
  hire_date date,
  job_id    varchar2(20),
  email     varchar2(50)
 );


 insert into department values (1,'ACCOUNTING',20000,8);
 insert into department values (2,'MARKETING',15000,9);
 insert into department values (3,'INFORMATION TECHNOLOGY',30000,10);
 insert into department values (4,'HUMAN RESOURCES',25000,13);
 insert into department values (5,'REGULATORY AFFAIRS',5000,null);
 insert into department values (6,'CUSTOMER SERVICE',2000,null);

 insert into employee values (1,'JOHN SMITH',date '1995-01-01','1.123.456.7890',4000.00,1,date '2015-03-28','AC_ACCOUNT','JSMITH');
 insert into employee values (2,'JAMES BOSH',date '1992-02-15','1.234.567.8901',3500.00,2,date '2014-07-01','MK_REP','JBOSH');
 insert into employee values (3,'LUISA JACKSON',date '1970-03-08','1.345.678.9012',4500.00,3,date '2013-08-29','IT_PROG','LJACKSON');
 insert into employee values (4,'STUART GARCIA',date '1965-04-12','1.456.789.0123',2000.00,4,date '2010-02-15','HR_REP','SGARCIA');
 insert into employee values (5,'JUSTIN BLACK',date '1990-05-16','1.567.890.1234',2550.00,1,date '2015-05-02','AC_ACCOUNT','JBLACK');
 insert into employee values (6,'ANGIE CROOD',date '1998-06-22','1.678.901.2345',1500.00,1,date '2015-07-01','AC_ACCOUNT','ACROOD');
 insert into employee values (7,'CHARLES DEAN',date '1973-06-08','1.789.012.3456',2250.00,3,date '2002-03-01','IT_PROG','CDEAN');
 insert into employee values (8,'EDDIE FARREL',date '1980-07-28','1.890.123.4567',3000.00,1,date '2009-04-20','AC_ACCOUNT','EFARREL');
 insert into employee values (9,'GEORGE HAYES',date '1982-08-03',NULL,2500.00,2,date '2012-09-22','MK_REP','GHAYES');
 insert into employee values (10,'IGOR KEYS OSBOURNE',date '1987-09-11','144.898.7564',6000.00,3,date '2014-11-14','IT_PROG','IKEYS');
 insert into employee values (11,'LUKE MINT',date '1985-10-19','1.123.456.7890',5000.00,4,date '2011-01-08','HR_REP','LMINT');
 insert into employee values (12,'NIGEL OAKS',date '1997-11-05','52.987.654.3210',4750.00,4,date '2014-10-01','HR_REP','NOAKS');
 insert into employee values (13,'LUKE GREEN JR',date '1995-02-05',NULL,4750.00,4,date '2015-09-01','HR_REP','LGREEN');
 
CREATE TABLE products
  (
	Product_Id   NUMBER(5),
	Product_Name VARCHAR2(100),
	Price           NUMBER(8,2),
	Expiration_Date DATE
  ) ;
 
ALTER TABLE products ADD CONSTRAINT products_PK PRIMARY KEY ( Product_Id ) ;
 
insert into products values (1,'Aspirin',5,date '2025-12-31');
insert into products values (2,'Penicillin',10,date '2026-04-30');
insert into products values (3,'Insulin',25,date '2026-05-31');
insert into products values (4,'Acetaminophen',5,date '2027-01-31');
insert into products values (5,'Amoxicillin',8,date '2026-07-31');

commit;
```
</details>

<img width="761" alt="Screen Shot 2022-07-18 at 22 54 05" src="https://user-images.githubusercontent.com/59098085/179647475-4f90450a-c2eb-47f6-ac28-5fe7553ed307.png">
	
<img width="443" alt="Screen Shot 2022-07-18 at 22 54 14" src="https://user-images.githubusercontent.com/59098085/179647724-ba10605d-1ea1-43e4-ab37-99d4ef97f48a.png">

***

## Subqueries

<br/>

<details> 
<summary>
Click here for study notes on key concepts. 🔑
	
</summary>
	
<br/>
	
**Correlated Subqueries:**
	Correlated subqueries are used for row-by-row processing. Each subquery is executed once for every row of the outer query. A correlated subquery is one way of reading every row in a table and comparing values in each row against related data. Because the subquery may be evaluated once for each row processed by the outer query, **it can be slow.** _It is used whenever a subquery must return a different result or set of results for each candidate row considered by the outer query (main query)._ For example, return a value necessary to compare with each employee (aka, a row) as in **C3**. In this sense, a correlated subquery requires values from its outer query (main query) in order to execute, and if you try to run it separately, you have to substitute at least one of the values.
	
**Non-Correlated Subqueries:**	
	Non-correlated subqueries are those that are totally independent of the main statement. The subquery executes first, and then passes its results to the outer query.
	
**Scalar Subqueries:**	
	A scalar subquery is a subquery expression that can return a maximum of one value and can be either correlated or non-correlated. It is correlated when it returns a single value for each row of its correlated outer table set, as in **C3**. And it is non-correlated when it returns a single value to its containing query, as in **C1**.
</details> 
<br/>

**Content**

- Subqueries
- Inline Views
- Subquery Factoring (WITH clause) 
- Top-N Queries
- Row Limiting Clause.


## 📌 C1: Query to display all of the detail of the department where the youngest employee n the company works.


```sql
select *
from department
where department.id = (select department_id
                       from employee
                       where birthdate = (select max(birthdate) 
                                          from employee)
);
```

Result:  
<img width="382" alt="Screen Shot 2022-07-18 at 22 53 46" src="https://user-images.githubusercontent.com/59098085/179647406-289d91d3-fa5d-46dc-b69d-82085e686128.png">

### 📌 C2: Query to list the names of the departments along with the average salary and the birthdate of the oldest employee that works in each department.

```sql
select d.name, avg(e.salary) as average_salary, max(e.birthdate) as oldest_employee
from department d, employee e
where d.id = e.department_id
group by d.name;
```
Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

### 📌 C3: Query to list the names of the departments **that exist in the company**, along with the average salary and the birthdate of the oldest employee that works in each department **ordered by department id in descending order**.

```sql
select name, (
    select avg(salary) 
    from employee e 
    where e.department_id = d.id
    ) as average_salary, 
    (
    select min(birthdate) 
    from employee e 
    where e.department_id = d.id
    ) as oldest_employee
from department d
order by d.id desc;
```

Result:  
<img width="405" alt="Screen Shot 2022-07-18 at 22 52 05" src="https://user-images.githubusercontent.com/59098085/179647017-263edb75-367d-403a-91ef-dccba4171dd5.png">

### 📌 C4: Query to list the max, min, and average of salaries for every department id in the employee table, but include only departments whose max salary is greater than the double of their minimum salary.

RESTRICTION: Not allowed to use a HAVING clause.

```sql
select *
from ( 
select department_id, max(salary) as max_salary, min(salary) as min_salary, avg(salary) as average_salary
from employee
group by department_id
     ) e
where e.max_salary >= 2*e.min_salary;
```

**This time using the HAVING clause.**

```sql
select department_id, max(salary) as max_salary, min(salary) as min_salary, avg(salary) as average_salary
from employee
group by department_id
having max(salary) >= 2*min(salary);
```

This time **using subquery factoring (WITH clause)** instead of an inline view.  
RESTRICTION: Not allowed to use a HAVING clause.

```sql
with subquery_salary (department_id, max_salary, min_salary, average_salary)
as (
select department_id, max(salary) , min(salary), avg(salary)
from employee
group by department_id
)
select *
from subquery_salary
where max_salary >= 2*min_salary;
```
Result:  
<img width="399" alt="Screen Shot 2022-07-18 at 22 50 04" src="https://user-images.githubusercontent.com/59098085/179646826-cdaba31f-e617-405b-8ca7-806fe99284fe.png">


### 📌 C5: Query that uses the rownum pseudocolumn to get the top 5 earners in the employee table.

```sql
with rownumbered as (
    select e.*, row_number() over (order by salary desc) as rn
    from employee e
    order by salary desc
)
select *
from rownumbered
where rn <= 5;
```

Result:  
<img width="780" alt="Screen Shot 2022-07-18 at 23 14 24" src="https://user-images.githubusercontent.com/59098085/179649638-5ae85699-e895-4607-b6d8-94f992d37153.png">

### 📌 C6: Query that uses the dense_rank analytic function to list the bottom 3 earners in the employee table.

```sql
with rownumbered as (
    select e.*, dense_rank() over (order by salary) as rn
    from employee e
    order by salary
)
select *
from rownumbered
where rn <= 3;
```

Result:  
<img width="747" alt="Screen Shot 2022-07-18 at 23 20 46" src="https://user-images.githubusercontent.com/59098085/179650239-eac18d3f-8d24-4bb4-a9ee-8dfd9ba2d5fc.png">

### 📌 C7: Use the row limiting clause to write a query to get the top 5 youngest employees among those who earn more than 2000 a month.

WARNING: The row limiting clause was introduced in version 12c.

```sql
with sal as (
select *
from employee
where salary > 2000
)
select *
from sal
order by birthdate desc
fetch first 5 rows only;
```

Result:  
<img width="719" alt="Screen Shot 2022-07-18 at 23 48 48" src="https://user-images.githubusercontent.com/59098085/179653764-90e5ff9a-7031-40db-849f-7b1bc1226673.png">

### 📌 C8: Query that segments the employee table in pages, based on the salary in ascending order, and returns the third page. The size of each page must be 4 rows.

WARNING: The row limiting clause was introduced in version 12c.

```sql
select *
from employee
order by salary, id
offset (3 - 1) * 4 rows fetch next 4 rows only;

-- If using sql developer, I can replace 3 - 1 for &page -1 to get prompted which page I want
```

Result:  
<img width="712" alt="Screen Shot 2022-07-19 at 14 16 29" src="https://user-images.githubusercontent.com/59098085/179810583-43671351-68f6-4ede-b7d8-601e8a0cb5b5.png">


***

