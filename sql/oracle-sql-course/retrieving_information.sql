-- Get the list of names, phones, and salaries of all employees.
select
    name,
    phone,
    salary
from employee;

-- Retrieve all of the information available in the department table.
select *
from department;

-- The company is going to give all employees a 20% increase in their salaries, and your task is to display a list of all of the employees which includes the employee id, the name, the current salary, and the salary they will have after the 20% increase.
select
    id,
    name,
    salary,
    salary*1.2 as raise
from employee;