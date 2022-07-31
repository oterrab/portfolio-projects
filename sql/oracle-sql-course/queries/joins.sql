/*
Write a query to list the names of the departments along with the number of employees and the sum of salaries for each one.
*/
select 
    d.name,
    count(e.name) as emplo,
    sum(salary) as sum_salary
from employee e
join department d
on d.id = e.department_id
group by d.name
order by emplo desc;


/*
Write a query to list the IDs names and salary of all employees that work in the Finance department, along with their job titles.
*/

select 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    j.job_title
from employees e
join jobs j 
on e.job_id = j.job_id
where e.department_id = 100;


/*
Write a query that returns a list of employees that includes the employee id, name, and salary along with the name of their manager.

Remember that in the EMPLOYEES table, the column “manager_id” corresponds to the employee_id of another employee who works as a manager. So if you see an employee with manager_id = 100, it means that in the same EMPLOYEES table, there is an employee whose employee_id is 100, who works as a manager.
*/

select 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    j.job_title,
    d.department_name
from employees e
join jobs j 
on e.job_id = j.job_id
join departments d
on d.department_id = e.department_id
where e.department_id != 60
order by employee_id
--offset 0 rows fetch next 15 rows only;

/*
Write a query that returns a list of employees that includes the employee id, name, and salary along with the name of their manager.

Remember that in the EMPLOYEES table, the column “manager_id” corresponds to the employee_id of another employee who works as a manager. So if you see an employee with manager_id = 100, it means that in the same EMPLOYEES table, there is an employee whose employee_id is 100, who works as a manager.
*/

select 
    e1.employee_id,
    e1.first_name,
    e1.last_name,
    e1.salary,
    e1.manager_id,
    e2.first_name as mgr_fn,
    e2.last_name as mgr_ln
from employees e1
join employees e2
on e1.manager_id = e2.employee_id
order by employee_id
--offset 0 rows fetch next 15 rows only;