/*
Using your employees table, write a query to generate a report of all of the employees, which includes the following columns:

Employee id, first name, last name, and job id of the employee plus first name, last name, and job id of their direct manager.

Order the results by employee id.
*/

select 
    employee_id,
    first_name,
    last_name,
    salary,
    job_id,
    prior first_name as mgr_fn,
    prior last_name as mgr_ln,
    prior job_id as mgr_job_id
from employees
start with manager_id is null
connect by manager_id = prior employee_id
--offset 0 rows fetch next 15 rows only;

/*
Write a hierarchical query from your employees table, in which you include employees whose level in the hierarchy is greater than 2 or don’t have any child.

Order the results by their level in descending order.
*/

select 
    employee_id,
    first_name,
    last_name,
    manager_id,
    level,
    connect_by_isleaf
from employees
where level > 2 or connect_by_isleaf = 1
start with manager_id is null
connect by manager_id = prior employee_id
order by level desc
--offset 0 rows fetch next 15 rows only;

/*
Write a query to list the employees that are part of the hierarchy tree for which employee ‘Neena Kochhar’ is the root. The list must include the employee id, first name, last name, and the hierarchy path, which should be built using the employee id, separating levels with a slash.
*/

select 
    employee_id,
    first_name,
    last_name,
    sys_connect_by_path(employee_id, '->') as path
from employees
start with employee_id = 101
connect by manager_id = prior employee_id
order by level;

/*
Write a query to list every manager from the employees table, along with the number of employees who report to him/her directly or indirectly.

The list must include 3 columns:

1) The employee id

2) The whole name of the employee, which would be built concatenating the first and last names separated by a blank space

3) The number of employees that report to him/her directly or indirectly.

HINT: You might need to use a subquery.
*/

with hierarchy as (
            select
                employee_id,
                connect_by_root employee_id as root_id,
                connect_by_root first_name || ' ' || connect_by_root last_name as root_name
                -- connect_by_root (first_name || ' ' || last_name) as root_name
            from employees
            connect by prior employee_id = manager_id
)
select 
        root_id,
        root_name,
        count(*) as employees
from hierarchy
where employee_id != root_id
group by root_id, 
         root_name
order by employees desc;

-- Elaborating a little more

with hierarchy as (
             select  employee_id,
                   first_name,
                   last_name,
                   sys_connect_by_path(employee_id,',') || ',' path,
                   level as lvl
                   --rownum rn
             from  employees
             start with manager_id  is null
             connect by manager_id = prior employee_id
          )
select  lpad(' ',min(t2.lvl)) || t1.first_name || ' ' || t1.last_name as emp_idented,
        t1.lvl,
        count(*) - 1 as hierarchy_cnt
from  hierarchy t1,
      hierarchy t2
where t2.path like '%,' || t1.employee_id || ',%'
having count(*) - 1 != 0
group by t1.employee_id,
         t1.first_name,
         t1.last_name,
         t1.lvl
         --t1.rn
order by count(*) - 1 desc;

/*
 Write a query to display the rows that are part of the hierarchy of the employee with last name ‘Urman’, which includes the employee id, last name, department name, hierarchy path (built with the last name), and level.

The hierarchy should be built starting with employee ‘Urman’ upwards to ‘King’, so Urman must be level 1 and King level 4.
*/


/*
Write a query to build the hierarchy from the employees table, including the employee id, last name, salary, the hierarchy path, and the level.

The children of each node must be ordered by salary in ascending order, and those with the same salary should be ordered alphabetically by last_name, in descending order.
*/


