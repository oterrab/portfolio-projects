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

select *
from employee
where department_id = 1 or department_id = 2 and salary < 3000 or birthdate < date '1995-01-01';

/*
The company has a cell phone that is assigned to the employee who is in charge of server support. All employees in the company can do that job, and they switch positions constantly, so the person in charge of support can change at any time, but you can identify it by means of their phone number. The phone number for the server support person is ‘1.234.567.8901’. Your task is to write a query to list ALL employees whose salary is greater than 4000, but you don’t have to include the person currently in charge of server support.
*/

select *
from employee
where salary > 4000
and (phone != '1.234.567.8901'
or phone is null);

/*
Write a query to get a list of companies from the COMPANY table, which includes the following columns. Please define the appropriate aliases so that the columns are shown in the results as mentioned here:

COMPANY_NAME

CONTACT_NAME: The commercial contact if we have it. If we don’t have the commercial contact, then return the technical contact. If we don’t have the technical contact, return the president, and if we don’t have the president either, return ‘*NO CONTACT DATA*’.

BUDGET: The budget, if we have it. If we don’t have it, then return the budget range start. Restriction: You must use NVL to generate this column.
*/

select 
	name as company_name, 
	coalesce(commercial_contact, technical_contact, president, '*NO CONTACT DATA*') as contact_name, 
	NVL(budget, budget_range_start) as budget
from company;

/*
Someone from our commercial department has been calling the companies stored in the COMPANY table, to confirm if the budgets we have stored are correct, and when that has not been the case, they have immediately made the necessary corrections to the data. As a result, we know that whenever we have any date in the LAST_CONTACTED column, it means that the budget stored in the BUDGET column for that company is correct. If the last_contacted column has NULL, it means we have never contacted that company. Write a query to generate a list of companies with the following information, but don’t include companies we contacted before the year 2019. The companies must be ordered by the last contacted date in ascending order, but companies we have never contacted must appear first.

Please make sure that the column names are shown in the results as mentioned here.

COMPANY NAME

EXCLUSIVELY_COMMERCIAL_CONTACT: The commercial contact of the company, but only if it is different from the technical contact. If the commercial contact is the same as the technical contact, then this column must be returned as null.

BUDGET: The budget, but only if we know the value is correct. If we have not confirmed that the budget info we have is correct, then return the budget_range_start.

LAST_CONTACTED_DATE

Restrictions:

1. The use of the logical operators AND/OR is not allowed.

2. You are only allowed to use null-handling functions. No other type of function or expression is allowed in the SELECT list or WHERE clause.

*/

select 
    name as company_name, 
    NULLIF(commercial_contact, technical_contact) as exclusively_commercial_contact, 
    NVL2(last_contacted, budget, budget_range_start) as budget, 
    last_contacted as last_contacted_date
from company
where LNNVL(last_contacted < date '2019-01-01')
order by last_contacted nulls first;