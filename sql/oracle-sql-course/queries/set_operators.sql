/*
The company wants to send a congratulations letter to employees who were born in the months of May or June, and they also want to send a letter to employees who were hired by the company in those months.

Please write a query to generate the list of employees that have to receive the letters mentioned in the previous paragraph.

The list only needs to include the Id, name, birthdate, and hire_date. Nothing more.

If an employee complies with the conditions to receive both letters, he/she has to be included in the report twice.

Please order the report by employee id.

*/
select
    id,
    name,
    birthdate,
    hire_date
from employee
where extract(month from birthdate) in(5,6)
union all
select
    id,
    name,
    birthdate,
    hire_date
from employee
where extract(month from hire_date) in(5,6)
order by id;

/*
Using the same description of the task from the previous lecture, write a compound query to generate the list of employees that should get the 2 letters. Every employee needs to appear only once in this report.

The list only needs to include the Id, name, birthdate, and hire_date. Nothing more.

Reference Description:

The company wants to send a congratulations letter to employees who were born in the months of May or June, and they also want to send a letter to employees who were hired by the company in those months.
*/

select
    id,
    name,
    birthdate,
    hire_date
from employee
where extract(month from birthdate) in(5,6)
intersect
select
    id,
    name,
    birthdate,
    hire_date
from employee
where extract(month from hire_date) in(5,6)
order by id;

/*
Using the same description of the task from the previous lecture, write a compound query to generate the list of employees that should get the first letter but not the second one.

The list only needs to include the Id, name, birthdate, and hire_date. Nothing more.

Reference Description:

The company wants to send a congratulations letter to employees who were born in the months of May or June, and they also want to send a letter to employees who were hired by the company in those months.
*/
select
    id,
    name,
    birthdate,
    hire_date
from employee
where extract(month from birthdate) in(5,6)
minus
select
    id,
    name,
    birthdate,
    hire_date
from employee
where extract(month from hire_date) in(5,6)
order by id;

/*
The company classifies employees who earn more than 3000 as “trusted employees”. This classification, however, does not apply to employees of the IT department. Write a query to list trusted employees that were hired in 2015.

Restrictions:

You must use SET operators

Each component query can have only one single condition in its WHERE clause (the use of ANDs and ORs is not allowed).
*/

select
    id,
    name,
    salary,
    hire_date
from employee
where salary > 3000
minus
select
    id,
    name,
    salary,
    hire_date
from employee
where department_id = 3
intersect
select
    id,
    name,
    salary,
    hire_date
from employee
where to_char(hire_date, 'yyyy') = 2015;