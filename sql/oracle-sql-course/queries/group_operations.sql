/*
Write a query to get the number of employees in the Accounting department, the total sum of their salaries, and the average salary. The average must appear 2 times in the results, one of them must be calculated using the AVG function, and one without using the AVG function. Please add column aliases to make it easy to understand the columns in the result.
*/
select
    count(*) as emps,
    sum(salary) as sum_salary,
    sum(salary)/count(*) as average_salary1,
    avg(salary) as average_salary2
from employee
where department_id = 1;

/*
Write a query to list the different bonuses from the employee table, along with the number of employees that earn that bonus, and the greatest salary for employees in that group. Please include only employees who were born before 1995.
*/
select 
    nvl(bonus,0) as bonus,
    count(*) as employees,
    max(salary) as max_sal
from employee
where birthdate < to_date('01-01-1995', 'dd-mm-yyyy')
group by nvl(bonus,0)
order by bonus;

/*
Write a query to list the minimum and maximum salaries and also the bonus average per department from the employee table, but please don’t include employees who don’t have a value defined for their bonus.

Also, please show in the results only departments whose smallest salary is less than 2000 or their highest salary is greater than 4000. The results must be displayed in descending order by the minimum salary.
*/
select 
    department_id,
    min(salary) as min_sal,
    max(salary) as max_sal,
    avg(bonus) as avg_bonus
from employee
where bonus is not null
group by department_id
having min(salary) < 2000
    or max(salary) > 4000
order by min(salary) desc;
