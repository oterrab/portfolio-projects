/*
Write a query to generate a list of employees applying the following conditions:    

The results include the employee_id, first_name and last_name columns, but the column titles must use blank spaces to separate words, instead of underscores.

The salary is less than 3000.
The first or last names start with ‘G’ .   
*/

select
        employee_id as "employee id",
        first_name as "first name",
        last_name as "last name"
from employees
where salary < 3000 
and (first_name like 'G%' or last_name like 'G%');


/*
Write a query to generate a list of employees who are managers of more than 6 employees, applying the following conditions:    

The results include only the employee_id and the number of employees for whom he/she is the manager.

The results must be ordered by employee id in descending order.

Even though you will use the manager_id column in your query, the results must display it as employee_id.  
*/

select 
    sup.employee_id,
    count(sub.employee_id) as number_of_employees
from employees sub
join employees sup
on sub.manager_id = sup.employee_id
having count(sub.employee_id) > 6
group by sup.employee_id
order by sup.employee_id desc;

/*
Write a query to generate a list of the 5 employees who have more time working for the company, applying the following conditions:   

The results include only the employee_id, first_name, last_name, hire_date, and commission_pct.

The query takes into account only employees who have a commission_pct  defined  which is smaller than 0.3 
*/

with hire_order as (
                    select 
                        employee_id, 
                        first_name, 
                        last_name, 
                        hire_date,
                        commission_pct,
                        rank() over (order by hire_date) as rn
                    from employees
                    where commission_pct < 0.3
)
select *
from hire_order
where rn <= 5;

/*
The email address of employees is expected to be constructed by concatenating the first letter of the first_name with the last_name.  Write a query to generate a list of employees whose registered email is different from the expected email, applying the following conditions:

The results include only employees of these departments: Marketing, Purchasing, Executive.

Take into account the fact that the email is stored in uppercase, so make sure the expected email is constructed in uppercase too.   
*/
select
        employee_id,
        first_name,
        last_name,
        department_id,
        email,
        substr(first_name, 1,1) || upper(last_name) as expected_email
from employees
where department_id in (20,30,90)
and email != (substr(first_name, 1,1) || upper(last_name));


/*
Write a query to generate a report of employees that includes a column with the last digits of the phone number,  applying the following conditions:    

The “last digits” of the phone number are those that are after the last dot (.)

The results must include employees from the Marketing department.  Employees from other departments can be included only if they have a salary that is greater than or equal to 6000 and smaller than or equal to 6500.

The results must be ordered by department_id.   
*/

select
        employee_id,
        first_name,
        last_name,
        phone_number,
        substr(phone_number, instr(phone_number,'.',-1)+1) as last_digits,
        salary,
        department_id
from employees
where department_id = 20
or (salary >= 6000 and salary <= 6500)
order by department_id;


/*
Write a query to list the names of the departments for which there are more than 5 employees,  applying the following conditions:   

The results must be ordered by the number of employees, in descending order.   
*/

select department_name, count(employee_id) as employees
from departments d
left outer join employees e on d.department_id = e.department_id
having count(employee_id)>5
group by department_name
order by count(employee_id) desc;


/*
Write a query to list the id and names of departments that don’t have any employee,  applying the following conditions:    

The departments must be ordered alphabetically.

Write 2 versions of the query:  the first one using a subquery and the second one using an aggregate function and an outer join.
*/

-- Version 1
-- Solution 1
select 
    department_name, 
    department_id
from departments d
where  (
            select count(employee_id)
            from employees e 
            where e.department_id = d.department_id
            having count(employee_id) = 0
        ) = 0
group by department_id, department_name
order by department_name;

-- Solution 2
select 
    department_name, 
    department_id
from departments d
where not exists (
            select employee_id
            from employees e 
            where e.department_id = d.department_id
        )
group by department_id, department_name
order by department_name;

-- Version 2

select d.department_id, d.department_name
from departments d
left outer join employees e on d.department_id = e.department_id
having count(employee_id)=0
group by d.department_id, d.department_name
order by department_name;

/*
Write a query to list all locations for which there is at least one employee,  applying the following conditions:    

The results must include the location id, the city and the number of employees for the location.

The results must be ordered by the number of employees.

Hint:  See the relational diagram you generated at the beginning of this practice session to understand the relationships between employees, departments and locations. 
*/

select 
    l.location_id,
    l.city,
    count(*)
from locations l
join departments d 
on l.location_id = d.location_id
join employees e 
on d.department_id = e.department_id
group by l.location_id, l.city
order by count(*);

/*
The SELECT statement in the image below generates a list of the locations in Canada along with the number of departments in each location.  The query was written using the old syntax for joins. Your task is to re-write it using the new ANSI syntax for the outer join.  Make sure that your query returns the exact same results than the original one.


SELECT l.location id, l.city, COUNT (d.location _id) AS departments
FROM locations l, departments d
WHERE l.location id = d.location id (+)
AND l.country id = "CA"
GROUP BY l.location_id, l.city;
*/

  select l.location_id, l.city, count (d.location_id) as departments
    from locations l left join departments d on d.location_id = l.location_id
   where l.country_id = 'CA'
group by l.location_id, l.city;



/*
Write a query to generate a list of regions that includes the minimum and maximum salary for each region, taking into account the following conditions:    

The results must include only regions that have employees

The regions must be ordered alphabetically
*/

select region_name, min(e.salary) as min_salary, max(e.salary) as max_salary
from regions r
join countries c
    on r.region_id = c.region_id
join locations l
    on c.country_id = l.country_id
join departments d
    on d.location_id = l.location_id
join employees e
    on d.department_id = e.department_id
group by r.region_name
order by region_name;

/*
Write a query to generate a list of regions that includes the count of employees for each region, taking into account the following conditions:   

The results must include all regions

The regions must be ordered alphabetically
*/

select region_name, count(e.employee_id)
from regions r
right outer join countries c
    on r.region_id = c.region_id
left outer join locations l
    on c.country_id = l.country_id
left outer join departments d
    on d.location_id = l.location_id
left outer join employees e
    on d.department_id = e.department_id
group by r.region_name
order by region_name;


/*
Write a query to generate a list of employees along with the number of applications for which they have permissions, taking into account the following conditions:   

The results must include only employees with employee_id smaller than or equal to 105

Each application must be counted only once for each user.  Some users might have roles that end up giving them permissions for the same application more than once, so you need to do something to only count them once.

In addition to the column that counts the applications, there must be an additional column called “APPS_NOTE” that shows ‘5 OR LESS’ or ‘MORE THAN 5’ according to the number of apps counted.

The results must be ordered by employee_id

Hints: Some aggregate functions have a way to tell it to only take into account different or distinct values (aggregate functions lesson).   You need some kind of IF-THEN-ELSE logic to generate the apps_note column
*/




/*
Write a query to list all of the departments in the company along with 2 columns that show the number of active and inactive users in the company’s system, taking into account the following conditions:   

All departments must appear in the list even if they don’t have any user

The results must be ordered by department_id

Write 2 versions of the query, one using CASE expressions and one using the PIVOT clause

Hint: Sometimes you need to use subqueries to “prepare” your data to be pivoted.
*/


/*
The script you ran for this practice session created a view called "v_active_user_count" in your schema.  Views have not been covered yet, so by now just imagine that it is a table, and use it like that.  This view returns data about the number of active/inactive users per department, pivoted to display one column per department.  Your task is now using the Unpivot feature of Oracle SQL to produce the following output:
*/


/*
Write a query to generate a list of the 2 more recently created users per department, taking into account the following conditions:   

If 2 or more users were created on the same date, they must be assigned the same ranking, which means that the results could actually include more than 2 users per department.

The final results must be ordered by department_id and by the rank assigned according to the user’s creation date.

Write one version of the query using an in-line view, and one using the WITH clause (also called, the subquery factoring clause).

Hint:  This could be called a “partitioned” top-n query.
*/


/*
The company is giving a raise on their salaries to employees who earn more than 10,000. Here is query that returns the list of employees that will get the raise, which includes a column for their new salary, which will be increased differently depending on the department where they work.  The query gives the correct results, but your task is to re-write using a CASE expression instead of the DECODE function.   

Make sure that your query produces the exact same results as the original one.   
*/


/*
Write a query to list the employees of the “Executive” and “Finance” departments, with an additional column that tells us if the date on which the previous user that was created in the same department was created more than 1 year before.  Follow these requirements/guidelines:   

Consider a year as always being equal to 365 days.

If the previous user was created later than a year before, or there is no previous user in the department, return null for that column.

To understand the requirement, look at the row with employee_id=100 in the expected output below.  The user that was created before him was created on 23-JAN-2001, so since his user was created on 27-JUN-2003, the difference between the dates is more than one year.  If you see the row for employee_id=108, you can see that the previous user was created on 26-AUG-2002, so the difference is only one day, and thus, the column shows as null.

The SQL Developer instance used to generate the below output is configured to display nulls as "(null)", but you are not forced to do it the same way.  As long as the query returns null when it has to, how the null is displayed is not important.
*/




/*
Write a query to list the departments for which there are at least 2 employees who earn more than 10,000.  

The results must be ordered by department id.
*/


/*
The following statement produces correct results, but it doesn’t follow the practices recommended in this course to make code readable, and it uses the old syntax for joins.  Re-write it to use the new ANSI syntax and to adhere to the readability recommended practices.  Make sure that your version produces the exact same results as the original one.

Hint:  Besides the joins, there are 2 different areas of readability improvements that have been recommended in this course. 
*/


/*
Write a query to get the number of employees and the sum of their salaries, who were hired per year in the Administration, Marketing and purchasing departments since year 2003.  

The number of employees hired must be displayed with 2 digits.

The sum of the salaries must be displayed with a comma as thousand separator and must include your local currency symbol.  The currency symbol must not be “fixed” or hardcoded in your query. It must use the local currency symbol as defined in your session settings.

The results must be ordered by department_id and year.
*/


/*
Write a query to generate a report of the number of employees per department at each level of the company’s hierarchy, but include only employees who are not managers.

Levels in which all employees are managers are not expected to be included in the result set.

Please order the results by level and department name.
*/
