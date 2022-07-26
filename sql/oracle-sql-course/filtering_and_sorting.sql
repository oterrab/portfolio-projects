-- Display a list of departments whose monthly budget is greater than or equal to 20,000. Please include only the department name and its budget.
select name,monthly_budget
from department
where monthly_budget >= 20000;

-- Display a list of employees who were born before 1990, which includes the name, phone, and birthdate.

select Name, phone, birthdate
from employee
where birthdate < date '1990-01-01';

/*
The company is planning to give some employees a special gift, but they will consider only employees that work in the accounting and marketing departments.  For employees of those departments, the condition is that they must earn less than 3000 a month, or have been born before the year 1985.  Your task consists of displaying the list of employees that can participate.

Hint: List the contents of the department table to see the IDs you have to use in your condition to return only the marketing and accounting departments.
*/

