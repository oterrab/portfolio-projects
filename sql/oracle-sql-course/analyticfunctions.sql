/*
Write a query to generate a list of employees with the following characteristics:
· All employees must be returned.

· The report must include the following columns from the table: Id, name, department_id, email.

· The report must also include the following calculated columns: The length of the email. The number of employees from the same department who have an email of the same length.

· The report must be ordered by department_id and length of the email column.
*/

select 
    id,
    name,
    department_id,
    email,
    length(email) as length_email,
    count(*) over (partition by (length(email)), department_id) as CNT_elength
from employee
order by department_id, length_email;


/*
Write a query to generate a report of the employees, which includes at least the following columns:
· Id

· Name

· Hire_date,

· A count of the number of employees hired in the same year of the current employee or in the previous year.

The results must be ordered by the hire date.
*/

 -- SOLUTION 1
select
    id,
    name,
    department_id,
    salary,
    hire_date,
    count(*) over(
    order by to_number(to_char(hire_date, 'yyyy'))
    range 1 preceding
    ) as counts
from employee;

-- SOLUTION 2
select
    id,
    name,
    department_id,
    salary,
    hire_date,
    count(*) over(
    order by extract(year from hire_date)
    range 1 preceding
    ) as counts
from employee;

/*
Write a query to generate a list of all of the departments including their ID, name, and monthly budget, but also include a column that shows the accumulated budget (the sum of the budget of previous departments plus the current one). To decide the order in which the budgets are accumulated you must sort them by smallest to greatest budget.
*/
select 
    id,
    name,
    monthly_budget,
    sum(monthly_budget) over (order by monthly_budget) as accumulated_mb
from department;

/*
Write a query to list all the employees. The result must include their name, department id, hire date, and a column called “hire_order” which is a number that indicates the order in which they were hired. This order is related to the department where they work only, so, the first employee that was hired in each department will have a hire_order of 1.
*/
with hire_order as (
select 
    name,
    department_id,
    hire_date,
    rank() over (partition by department_id order by hire_date) as rn
from employee
)
select *
from hire_order; 

/*
Write a query that returns the name, birthdate, and department id of an employee who was born in 1995, preferably from the ACCOUNTING department. If no employee from that department was born in 1995, return one from any other department.
*/
with prioritized as (
select 
    name,
    birthdate,
    department_id,
    row_number() over (order by case 
                                    when department_id = 1 then 'A'
                                    else 'B'
                                end) as rn
from employee
where to_char(birthdate, 'YYYY') = 1995
)
select *
from prioritized
where rn = 1;   

/*
Write a query that lists the different salaries that appear in the employee table. For each salary include a comma-separated list of the names of the employees that earn that amount. The list of employees for each salary must be ordered by the name of the employee, and the final result set must be ordered by salary from greatest to smallest.
*/
select
    salary,
    listagg(name, ',') within group (order by name) as emplist
from employee
group by salary
order by salary desc;

/*
Write a query to generate a list of all employees from the ACCOUNTING and HUMAN RESOURCES departments, ordered by department and birthdate. For every employee, the report must include the name, birthdate, and the name of the employee from the same department who follows him/her if you order them by age.
*/


/*
Write a query to generate a list of employees with the following conditions:
· The list must include only the employee with the highest salary in each department.

· It must include ID, name, salary, department_id, and an additional column with the ID of the employee with the second-highest salary in his/her department.

· Hint: You might need to use some kind of subquery.
*/


/*
Write a query to return the name and hire date of the first employee hired in each department.
The results must include the department_id, name of the employee and their hire date, and must be ordered by department id.
*/


/*
Write a query that will produce an employees’ report with the following information for each employee:
· Id, name, and department_id of the employee.

· Name of the employee who was the first hire in the department where the employee works.

· Salary of the employee who was the first hire in the department where the employee works.

· Bonus of the top earner among the employees who were hired in the same year as the employee, regardless of their department. If the bonus is null, the bonus must be shown as 0.

The report must be ordered by department_id and hire_date.
*/



