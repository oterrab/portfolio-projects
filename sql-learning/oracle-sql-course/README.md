# 📊 Oracle SQL Course: SQL Made Practical

## Introduction

**All queries here were written by me and this repository does not cover queries that were made by the teacher on video.**

<details> 
<summary>
Click here for Introduction! 👋🏻
	
</summary>

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

<img width="761" alt="Screen Shot 2022-07-18 at 22 54 05" src="https://user-images.githubusercontent.com/59098085/179647475-4f90450a-c2eb-47f6-ac28-5fe7553ed307.png">
	
<img width="443" alt="Screen Shot 2022-07-18 at 22 54 14" src="https://user-images.githubusercontent.com/59098085/179647724-ba10605d-1ea1-43e4-ab37-99d4ef97f48a.png">

</details>

***

## Subqueries

**Content**

- Subqueries
- Inline Views
- Subquery Factoring (WITH clause) 
- Top-N Queries
- Row Limiting Clause.


### 📌 Q1: Query to display all of the detail of the department where the youngest employee n the company works.


```sql
select *
from department
where department.id = (select department_id
                       from employee
                       where birthdate = (select max(birthdate) 
                                          from employee)
);
```

**Result:**  
<img width="382" alt="Screen Shot 2022-07-18 at 22 53 46" src="https://user-images.githubusercontent.com/59098085/179647406-289d91d3-fa5d-46dc-b69d-82085e686128.png">

### 📌 Q2: Query to list the names of the departments along with the average salary and the birthdate of the oldest employee that works in each department.

```sql
select d.name, avg(e.salary) as average_salary, max(e.birthdate) as oldest_employee
from department d, employee e
where d.id = e.department_id
group by d.name;
```

<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

### 📌 Q3: Query to list the names of the departments **that exist in the company**, along with the average salary and the birthdate of the oldest employee that works in each department **ordered by department id in descending order**.

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

**Result:**  
<img width="405" alt="Screen Shot 2022-07-18 at 22 52 05" src="https://user-images.githubusercontent.com/59098085/179647017-263edb75-367d-403a-91ef-dccba4171dd5.png">

### 📌 Q4: Query to list the max, min, and average of salaries for every department id in the employee table, but include only departments whose max salary is greater than the double of their minimum salary.

**RESTRICTION: Not allowed to use a HAVING clause.**

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

**This time using subquery factoring (WITH clause) instead of an inline view. RESTRICTION: Not allowed to use a HAVING clause.**

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
**Result:**  
<img width="399" alt="Screen Shot 2022-07-18 at 22 50 04" src="https://user-images.githubusercontent.com/59098085/179646826-cdaba31f-e617-405b-8ca7-806fe99284fe.png">


### 📌 Q5: Query that uses the rownum pseudocolumn to get the top 5 earners in the employee table

```sql

```
**Result:**  
<img width="421" alt="Q5" src="https://user-images.githubusercontent.com/59098085/179644679-becbe6a8-6d5e-4c52-8af9-7347b45f5c88.png">

### 📌 Q6: Query to list the names of the departments that exist in the company, along with the average salary and the birthdate of the oldest employee that works in each department ordered by department id in descending order.

```sql

```
**Result:**  
<img width="421" alt="Q6" src="https://user-images.githubusercontent.com/59098085/179646234-aec04ac5-25e9-4384-b0cc-60e6edec832e.png">

***

