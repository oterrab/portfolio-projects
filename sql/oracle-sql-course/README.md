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
- [Single Row Functions](#single-row-functions)
- [Transposing](#transposing)

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
Click here for study notes on key concepts. 🔑</p>
	
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

- [Subqueries](#subqueries)
- [Inline Views](#inline-views)
- [Subquery Factoring (WITH clause)](#cte) 
- [Top-N Queries](#top-n-queries)
- [Row Limiting Clause](#row-limiting-clause)


<br/>

### Subqueries 

<br/>

#### 📌 C1: \*Query to display all of the detail of the department where the youngest employee n the company works.\*


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

#### 📌 C2: Query to list the names of the departments along with the average salary and the birthdate of the oldest employee that works in each department.

```sql
select d.name, avg(e.salary) as average_salary, max(e.birthdate) as oldest_employee
from department d, employee e
where d.id = e.department_id
group by d.name;
```
Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

#### 📌 C3: Query to list the names of the departments **that exist in the company**, along with the average salary and the birthdate of the oldest employee that works in each department **ordered by department id in descending order**.

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


<br/>

### Inline Views

<br/>

#### 📌 C4: Query to list the max, min, and average of salaries for every department id in the employee table, but include only departments whose max salary is greater than the double of their minimum salary.

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

<br/>

### CTE
**a.k.a. WITH Clause**

<br/>

#### 📌 C5: Query to list the max, min, and average of salaries for every department id in the employee table, but include only departments whose max salary is greater than the double of their minimum salary.

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


<br/>

### Top-N Queries

<br/>


#### 📌 C6: Query that uses the rownum pseudocolumn to get the top 5 earners in the employee table.

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

#### 📌 C7: Query that uses the dense_rank analytic function to list the bottom 3 earners in the employee table.

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

#### 📌 C8: Use the row limiting clause to write a query to get the top 5 youngest employees among those who earn more than 2000 a month.

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

<br/>

### Row Limiting Clause

<br/>

#### 📌 C9: Query that segments the employee table in pages, based on the salary in ascending order, and returns the third page. The size of each page must be 4 rows.

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


## Single Row Functions

<br/>
<details> 
<summary>
Click here for study notes on key concepts. 🔑</p>
	
</summary>
	
<br/>
	
**Implicit Conversions:**
	Implicit conversions occur when SQL Server has to do a conversion from one data type to another data type to be able to make a comparison and that conversion wasn't specified in the query. These hidden conversions can be a performance killer, especially if SQL Server has to apply them to every row to perform that comparison. One easy way to see this implicit conversion is with the sql_variant data type. Any comparison to a value that is of that type requires a conversion.   

```sql	
/* This requires an implicit conversion, 
because the column 'period' in this example is deined as varchar2 and we are comparing with a number. 
So, oracle applies TO_NUMBER() to the column: */

SELECT *
FROM monthly.account.balance
WHERE period =  201811 and client_id = 100;
```
 
```sql	
/* This does not require an implict conversion. 
Because we are explicitly converting to varchar and it runs 20x faster. */

SELECT *
FROM monthly.account.balance
WHERE period =  '201811' and client_id = 100;
```

</details>

**Content**

- [Text Functions](#text-functions)
- [Numeric Functions](#numeric-functions)
- [Date Functions](#date-functions)
- [Conversion Functions](#conversion-functions)
- [Decode Function and CASE expression](#decode-function-and-case-expression)
- [Date Arithmetic](#date-arithmetic)

<br/>

### Text Functions

<br/>

#### 📌 C1: We need to make some changes to the data about our employees, but before applying the changes we need to see the data as it will be after the changes. Please write a query to list employees data with the following changes:

 - The names of all of the employees must be stored with the first letter of each name in uppercase, and the rest of the name in lowercase.
 - The e-mail addresses are incorrect.  All of them must be modified to add “@gmail.com” to the string they currently have, but the current value must be changed to lowercase.
 - Phone numbers have dots, but we want them replaced by hyphens.
 - We need a new column called “CODE” which will be generated by extracting the part of the name that appears before the first blank space, and then removing all vowels from it, so, for an employee called ‘CARLOS’ the code would be ‘CRLS’.
 
```sql
select id,
  initcap(name) as name,
  birthdate,
  replace(phone,'.','-') as phone,
  salary,
  department_id,
  hire_date,
  job_id,
  lower(email) || '@gmail.com' as email,
  translate(substr(name,1,instr(name,' ')-1),'*AEIOU','*') as code
from employee;
```

Result:  
<img width="878" alt="Screen Shot 2022-07-19 at 20 13 38" src="https://user-images.githubusercontent.com/59098085/179863620-ba0a916c-83c4-4493-b5a6-27b18eebacff.png">

#### 📌 C2: Write a query to generate a list of employees following these requirements:

 - We don’t need the complete phone number. In this report, we only want the numbers that are between the first and second dots, for example, for a number like this 515.123.4567 the report must display ‘123’ only.
 - Please don’t include employees hired before 2010.
 - The report must be ordered by salary, in descending order.
 
```sql
select  id,
  name,
  birthdate,
  phone,
  substr(phone, instr(phone, '.')+1, to_number(instr(phone,'.',1,2) - instr(phone,'.')-1)) as phone,
  salary,
  department_Id,
  hire_date,
  job_id,
  email
from Employee
where hire_date >= to_date('01-01-2010', 'dd-mm-yyyy')
order by salary desc;
```

Result:  
<img width="818" alt="Screen Shot 2022-07-19 at 21 35 24" src="https://user-images.githubusercontent.com/59098085/179870961-cae2543c-f0bb-4ae7-82dd-3b4216ccf621.png">


<br/>

### Numeric Functions

<br/>

#### 📌 C3: Write the query needed to generate a report with the following characteristics. For this task assume that a month has 30 days:

- The report must include the names, job_id, salary, daily salary, and the result of applying the round, trunc, ceil and floor functions to the daily salary calculation.

- The report must include only employees whose daily salary is an integer and either were hired after 2010 or work for the ‘IT’ department.


```sql
select name, 
       job_id, 
       salary, 
       (salary/30) as daily_salary,
       round(salary/30),
       trunc(salary/30),
       ceil(salary/30),
       floor(salary/30) 
from employee e
where hire_date >= to_date('01-01-2010', 'dd-mm-yyyy')
and MOD((salary/30),1) = 0
or department_id = 3;
```

Result:  
<img width="870" alt="Screen Shot 2022-07-19 at 22 02 01" src="https://user-images.githubusercontent.com/59098085/179873303-3ddef305-5800-40ec-bd0c-0d09ba9bfd13.png">

***

### Date Functions

**Change Date Format on Oracle Live**
<br/>
```sql
alter session set NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
```
<br/>

#### 📌 C4: Write the query necessary to generate the report with the following characteristics:

- The report must include the employee id, name, and hire date.

- It must include a column that tells us for how many months the employee has worked for the company.

- Every employee receives a raise after 6 months of working for the company. Include a column that tells us the date in which they earned the right for the mentioned raise.

- Every employee is sent to a short induction the next Monday after they are hired. Include a column that tells us the date in which they attended their induction.

- Every employee is subscribed to the company’s monthly newsletter on the first day of the next month after they are hired. Add a column that tells us the date in which they were subscribed to the newsletter.

- Do not include employees from the IT department.

 
```sql
select
    id,
    name,
    hire_date,
    trunc(months_between(sysdate, hire_date)) as months_worked,
    add_months(hire_date, 6) as raise_earned_date,
    next_day(hire_date, 'monday') as induction_date,
    last_day(hire_date)+1 as newsletter_day
from employee
where department_id != 3;
```

Result:  
<img width="816" alt="Screen Shot 2022-07-20 at 16 30 36" src="https://user-images.githubusercontent.com/59098085/180066272-1c24888a-a07c-4d81-a072-9d37fd56650b.png">


### Conversion Functions
<br/>
<details> 
<summary>
Click here for study notes on key concepts. 🔑</p>
	
</summary>
	
<br/>
	
**Formating:**
	The format element for minutes is 'MI' and not 'MM'. Careful, using MM will not give any error, it will just mix months in the time portion of your results. This can go unotice for a long time!
</details>

#### 📌 C5: Generate a report of all of the employees who were born after 1970 and for whom we have a phone number registered. In the report, the department_id must be displayed using 4 digits, left-padded with zeros. The salary must be displayed with your local currency symbol and 2 decimals and with commas as the thousands separator.

Please add an additional column called “ALT_BIRTHDATE” that will result from swapping the month and day parts of the birthdate, so, for example, if the birthdate is 10-Mar-2015, the alternate birthdate would be 03-Oct-2015 (the day becomes the month and the month becomes the day). If the resulting date is invalid, this column should return NULL.
 
```sql
select name,birthdate,phone,
  to_char(department_id,'fm0000') as department_id,
  to_char(salary,'fmL99,990.00') as salary,
  to_date(to_char(birthdate,'ddmmyyyy') default null on conversion error,'mmddyyyy') as alt_birthdate
from employee e
where trunc(birthdate, 'yy') >= to_date(1970, 'yyyy')
--where birthdate > to_date('31-12-1969', 'dd-mm-yyyy')
and phone is not null;
```

Result:  
<img width="625" alt="Screen Shot 2022-07-21 at 13 27 46" src="https://user-images.githubusercontent.com/59098085/180265631-96a19f69-204d-4708-9adf-cc0d344bd5ba.png">

#### 📌 C6: Generate a second report that includes all of the employees that were hired before 2015 and earn more than 2500 or were hired in 2015 but earn less than 3000. The report must include the employees’ names, the day and month of the birthdate, and only the month (name of the month) and year of the hire date.

The company is planning to give every employee a surprise bonus for the amount of the last 4 digits of their phone number, so please include an additional column that displays the amount of this bonus for every employee. This amount must be displayed with your local currency symbol and 2 decimals.

They will receive this surprise bonus in the month that corresponds to the last digit of their phone number, so, for example, if the employee’s phone number ends with a 4, it means that he must receive his bonus in April. Please include an additional column that tells us the name of the month in which they must receive their bonus. If any employee has a phone number that ends in a number that is not a valid month, they must receive their bonus in December.
 
```sql
select 
    name,
    to_char(birthdate,'dd/mm') as birthdate,
    to_char(hire_date,'fmMonth yyyy') as hire_date,
    to_char(to_number(substr(phone,-4)),'L9990.00') as bonus,
    to_char(to_date(substr(phone,-1) default '12' on conversion error,'mm'),'Month') as bonus_month
from employee
where trunc(hire_date, 'yyyy') < to_date('01-01-2015', 'dd-mm-yyyy') and salary > 2500
or trunc(hire_date, 'yyyy') = to_date('01-01-2015', 'dd-mm-yyyy') and salary < 3000;
```

Result:  
<img width="561" alt="Screen Shot 2022-07-21 at 14 37 10" src="https://user-images.githubusercontent.com/59098085/180277929-02281bd4-4ccd-48b0-9351-063dec5db2d3.png">


### Decode Function and CASE expression

<br/>

#### 📌 C7: 
 
```sql

```

Result:  


#### 📌 C8: 
 
```sql

```

Result:  

### Date Arithmetic

<br/>

#### 📌 C9: 
 
```sql

```

Result:  

***

## Transposing

<br/>

**Content**

- [Pivot](#pivot)
- [Unpivot](#unpivot)

<br/>

### Pivot

<br/>

#### 📌 C1: 
 
```sql

```

Result: 


### Unpivot

<br/>

#### 📌 C2: 
 
```sql

```

Result:  
