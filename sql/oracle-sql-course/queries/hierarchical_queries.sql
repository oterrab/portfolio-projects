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



/*
Write a query to list the employees that are part of the hierarchy tree for which employee ‘Neena Kochhar’ is the root. The list must include the employee id, first name, last name, and the hierarchy path, which should be built using the employee id, separating levels with a slash.
*/


/*
Write a query to list every manager from the employees table, along with the number of employees who report to him/her directly or indirectly.

The list must include 3 columns:

1) The employee id

2) The whole name of the employee, which would be built concatenating the first and last names separated by a blank space

3) The number of employees that report to him/her directly or indirectly.

HINT: You might need to use a subquery.
*/


/*
 Write a query to display the rows that are part of the hierarchy of the employee with last name ‘Urman’, which includes the employee id, last name, department name, hierarchy path (built with the last name), and level.

The hierarchy should be built starting with employee ‘Urman’ upwards to ‘King’, so Urman must be level 1 and King level 4.
*/


/*
Write a query to build the hierarchy from the employees table, including the employee id, last name, salary, the hierarchy path, and the level.

The children of each node must be ordered by salary in ascending order, and those with the same salary should be ordered alphabetically by last_name, in descending order.
*/

