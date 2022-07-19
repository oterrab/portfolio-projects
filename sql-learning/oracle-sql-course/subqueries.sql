select * 
from employee;

select *
from department;

-- Query to display all of the detail of the department where the youngest employee n the company works. 

select *
from department
where department.id = (select department_id
                       from employee
                       where birthdate = (select max(birthdate) 
                                          from employee)
);

-- Query to list the names of the departments along with the average salary and the birthdate of the oldest employee that works in each department.

select d.name, avg(e.salary) as average_salary, max(e.birthdate) as oldest_employee
from department d, employee e
where d.id = e.department_id
group by d.name;

-- Query to list the names of the departments /* that exist in the company */, along with the average salary and the birthdate of the oldest employee that works in each department /* ordered by department id in descending order */.

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

-- Query to list the max, min, and average of salaries for every department id in the employee table, but include only departments whose max salary is greater than the double of their minimum salary.

/* RESTRICTION: Not allowed to use a HAVING clause.*/

select *
from ( 
select department_id, max(salary) as max_salary, min(salary) as min_salary, avg(salary) as average_salary
from employee
group by department_id
     ) e
where e.max_salary >= 2*e.min_salary;

/* This time using the HAVING clause. */

select department_id, max(salary) as max_salary, min(salary) as min_salary, avg(salary) as average_salary
from employee
group by department_id
having max(salary) >= 2*min(salary);

/*This time using subquery factoring (WITH clause) instead of an inline view. RESTRICTION: Not allowed to use a HAVING clause.*/

with subquery_salary (department_id, max_salary, min_salary, average_salary)
as (
select department_id, max(salary) , min(salary), avg(salary)
from employee
group by department_id
)
select *
from subquery_salary
where max_salary >= 2*min_salary;

-- Query that uses the rownum pseudocolumn to get the top 5 earners in the employee table.
with rownumbered as (
    select e.*, row_number() over (order by salary desc) as rn
    from employee e
    order by salary desc
)
select *
from rownumbered
where rn <= 5;

-- Query that uses the dense_rank analytic function to list the bottom 3 earners in the employee table.
with rownumbered as (
    select e.*, dense_rank() over (order by salary) as rn
    from employee e
    order by salary
)
select *
from rownumbered
where rn <= 3;


-- Use the row limiting clause to write a query to get the top 5 youngest employees among those who earn more than 2000 a month.
with sal as (
select *
from employee
where salary > 2000
)
select *
from sal
order by birthdate desc
fetch first 5 rows only;
