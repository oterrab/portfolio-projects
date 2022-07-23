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
- [Analytic Functions](#analytic-functions)

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
<details> 
<summary>
Click here for study notes on key concepts. 🔑</p>
	
</summary>
<br/>
	
**Decode vs Case:**
	- Decode is exclusive of oracle and less readable than CASE expressions.

</details>

<br/>

#### 📌 C7: The company wants to give a rise to all employees according to these conditions:

- Employees who work in the ACCOUNTING department get a 10% increase to their salary.

- Employees who work in the MARKETING department get a 15% increase to their salary.

- Employees from the other departments get a 20% increase to their salary.

Please generate a report that includes the employee id, name, current salary, and new salary. Please generate 2 columns for the new salary. To calculate the first one use the DECODE function and for the second one use a simple CASE expression. The result in both new salary columns must be the same.
 
```sql
select
    id,
    name,
    salary as current_salary,
    salary + (salary * decode(department_id,1,0.10,2,0.15,0.20)) as new_salary_1,
    salary + (salary * 
    case 
        when department_id = 1
            then 0.1
        when department_id = 2
            then 2
        else 3
    end) as new_salary_2
from employee;
```

Result:  
<img width="485" alt="Screen Shot 2022-07-21 at 20 17 31" src="https://user-images.githubusercontent.com/59098085/180330559-80b3fc41-256c-4d7b-b7b0-4bde25f248d4.png">


#### 📌 C8: The company is planning to assign a classification to each employee based on the salary they earn. The classification would be as follows:

- Employees who earn less than 2500 will be classified as “A”.

- Employees who earn 2500 or more but less than 4000 will be classified as “B”.

- Employees who earn 4000 or more will be classified as “C” if they were hired before 2014 and will be classified as “D” if they were hired in 2014 or 2015.

Please generate a report that includes the employee id, name, salary, the year they were hired, and the classification of each employee, but don’t include employees from the MARKETING department, and also don’t include employees who don’t have a phone number registered. The report must be ordered by salary and hire_date.
 
```sql
select
    id,
    name,
    salary,
    extract(year from hire_date) as hire_year,
    case
        when salary < 2500
            then 'A'
        when salary >= 2500 and salary < 4000
            then 'B'
        when salary >= 4000 and extract(year from hire_date) < 2014
            then 'C'
        when salary >= 4000 and extract(year from hire_date) >= 2014 and extract(year from hire_date) <= 2015
            then 'D'
        else 'not categorized'
    end as classification
from employee
where department_id != 2
  and phone is not null
order by salary,hire_date;
```

Result:  
<img width="426" alt="Screen Shot 2022-07-21 at 20 35 37" src="https://user-images.githubusercontent.com/59098085/180332025-c8d8138a-d16e-471e-80d9-9677d7272118.png">


### Date Arithmetic

<br/>

#### 📌 C9: Write an employees report with the following columns:

- Id

- Name

- Date of their second birthday (don’t use functions to calculate this date, and assume that all years have 365 days (ignore the possibility of leap years), so the result will actually be an approximation of the second birthday date.)

- How old they were when they were hired. Their age must be expressed in hours (not years).

Please include only employees who were hired in 1980 or later and whose phone number starts with “1”. Order results by department id (ascending) and salary (descending).
 
```sql
select
    id,
    name,
    birthdate+(2*365) as second_birthday,
    (hire_date - birthdate) * 24 as hours_old_when_hired
from employee
where hire_date >= date '1980-01-01'
and phone like '1%'
order by department_id,salary desc;
```

Result:  
<img width="446" alt="Screen Shot 2022-07-21 at 20 58 45" src="https://user-images.githubusercontent.com/59098085/180334125-05be3126-d21a-465e-8272-a87f6a86a979.png">


***

## Transposing

<br/>

**Content**

- [Pivot](#pivot)
- [Unpivot](#unpivot)

<br/>

### Pivot

<br/>

<details> 
<summary>
Click here for an interesting example given by the teacher. 🔑</p>
	
</summary>

#### 📌 Interesting Example: Write a query that tells the number of employees hired in the years of 2014 and 2015 for each department. First example is made in traditional way, second example is made using pivot clause.
 
```sql
select 
    department_id,
    count( 
            case to_char(hire_date, 'YYYY')
            when '2014' then 1
            end ) as "2014",
    count( 
            case to_char(hire_date, 'YYYY')
            when '2015' then 1
            end ) as "2015"
from employee
group by department_id
order by department_id;
```

<br/>

```sql
select *
from 
(
select department_id, to_char(hire_date, 'YYYY') as year
from employee
)
pivot (count(*) for year in (2014, 2015))
order by department_id;
```

Result:  
<img width="203" alt="Screen Shot 2022-07-22 at 23 00 08" src="https://user-images.githubusercontent.com/59098085/180586243-47813f56-4be4-41fa-9018-ac7672428c61.png">

<br/>
	
</details>

#### 📌 C1: Write a query that returns a single row that has one column for each of the monthly budgets of the departments ACCOUNTING, MARKETING, and INFORMATION TECHNOLOGY. The column titles for the budgets must be the names of the departments.
 
```sql
select *
from 
(
select name, monthly_budget
from department
)
pivot(
max(monthly_budget) for name in ('ACCOUNTING', 'MARKETING','INFORMATION TECHNOLOGY')
);
```
  
<details> 
<summary>
Why MAX()?</p>
	
</summary>
<br/>
	
**Why MAX()?**

You need an aggregate function. Depending on what you want to do, it could be MAX, MIN, AVG, etc…

Sometimes you don’t want to aggregate anything, because you are working with a single row for each value. In those cases, you can use some function like MAX or MIN just to comply with the requirement of using an aggregate function, but because there is only one row for each value, the results would be correct.

</details>

Result:  
<img width="378" alt="Screen Shot 2022-07-22 at 23 20 46" src="https://user-images.githubusercontent.com/59098085/180586950-c4e2705e-7055-4686-88a3-81d5d1c075f8.png">

### Unpivot

<br/>

#### 📌 C2: Write a query to generate a list of employees who work in the Accounting and Marketing departments. The report must include the name, birthdate, and hire_date, but each employee must appear in the report 2 times, and the birth date and hire date must appear in the same column but in different rows. This column must be called “date_value” and there must be an additional column that explains the kind of date that is included in the date_value column. This additional column must be called “date_type” and will contain either “Date of Birth” or “Date of Hiring”.
 
```sql
select name,date_type,date_value
from employee
  unpivot
  ( 
    date_value for 
    date_type in (birthdate as 'Date of Birth', hire_date as 'Date of Hiring')
  )
  where department_id in (1, 2);
```

Result:  
<img width="301" alt="Screen Shot 2022-07-22 at 23 40 26" src="https://user-images.githubusercontent.com/59098085/180587562-9e69d93d-df56-4864-b479-8a3797ac2bb5.png">

***

## Analytic Functions

<br/>
<details> 
<summary>
Click here for study notes on key concepts. 🔑</p>
	
</summary>
<br/>
	
**Aggregate Functions vs Analytic Functions:**
	- **Aggregate functions** (count(), avg(), sum(), min(), max()) perform a calculation on a set of values and **return a single value**. **Analytic functions** compute an aggregate value based on a set of values, and, unlike aggregate functions, can **return multiple rows for each set of values.**

</details>

<br/>

**Content**

- [Partition](#partition)
- [Windowing](#windowing)
- [Common Analytic Functions](#common-analytic-functions)
- [Ranking Functions](#ranking-functions)
- [LISTAGG Function](#listagg-functions)
- [LAG and LEAD Functions](#lead-and-lag-functions)
- [FIRST and LAST Functions](#first-and-last-functions)
- [FIRST_VALUE and LAST_VALUE Functions](#first_value-and-last_value-functions)

<br/>

### Partition

<br/>

#### 📌 C1: Write a query to generate a list of employees with the following characteristics:

· All employees must be returned.

· The report must include the following columns from the table: Id, name, department_id, email.

· The report must also include the following calculated columns: The length of the email. The number of employees from the same department who have an email of the same length.

· The report must be ordered by department_id and length of the email column.


```sql

```

Result:  

### Windowing

<br/>

#### 📌 C2: Write a query to generate a report of the employees, which includes at least the following columns:

· Id

· Name

· Hire_date,

· A count of the number of employees hired in the same year than the current employee or in the previous year.

The results must be ordered by the hire date.
 
```sql

```

Result:  

### Common Analytic Functions

<br/>

#### 📌 C3: Write a query to generate a list of all of the departments including their ID, name, and monthly budget, but also include a column that shows the accumulated budget (the sum of the budget of previous departments plus the current one). To decide the order in which the budgets are accumulated you must sort them by smallest to greatest budget.
 
```sql

```

Result:  

### Ranking Functions

<br/>

#### 📌 C4: Write a query to list all the employees. The result must include their name, department id, hire date, and a column called “hire_order” which is a number that indicates the order in which they were hired. This order is related to the department where they work only, so, the first employee that was hired in each department will have a hire_order of 1.
 
```sql

```

Result:  


<br/>

#### 📌 C5: Write a query that returns the name, birthdate, and department id of an employee who was born in 1995, preferably from the ACCOUNTING department. If no employee from that department was born in 1995, return one from any other department.
 
```sql

```

Result:  

### LISTAGG Function

<br/>

#### 📌 C6: Write a query that lists the different salaries that appear in the employee table. For each salary include a comma-separated list of the names of the employees that earn that amount. The list of employees for each salary must be ordered by the name of the employee, and the final result set must be ordered by salary from greatest to smallest.
 
```sql

```

Result:  

### LAG and LEAD Functions

<br/>

#### 📌 C7: Write a query to generate a list of all employees from the ACCOUNTING and HUMAN RESOURCES departments, ordered by department and birthdate. For every employee, the report must include the name, birthdate, and the name of the employee from the same department who follows him/her if you order them by age.
 
```sql

```

Result:  


<br/>

#### 📌 C8: Write a query to generate a list of employees with the following conditions:

· The list must include only the employee with the highest salary in each department.

· It must include ID, name, salary, department_id, and an additional column with the ID of the employee with the second-highest salary in his/her department.

· Hint: You might need to use some kind of subquery.

```sql

```

Result:  


### FIRST and LAST Functions

<br/>

#### 📌 C9: Write a query to return the name and hire date of the first employee hired in each department.

The results must include the department_id, name of the employee and their hire date, and must be ordered by department id.
 
```sql

```

Result:  


### FIRST_VALUE and LAST_VALUE Functions

<br/>

#### 📌 C10: Write a query that will produce an employees’ report with the following information for each employee:

· Id, name, and department_id of the employee.

· Name of the employee who was the first hire in the department where the employee works.

· Salary of the employee who was the first hire in the department where the employee works.

· Bonus of the top earner among the employees who were hired in the same year as the employee, regardless of their department. If the bonus is null, the bonus must be shown as 0.

The report must be ordered by department_id and hire_date.
 
```sql

```

Result:  

