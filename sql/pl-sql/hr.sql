-- Query that for each employee shows his manager;

SELECT employee_id, first_name, last_name, job_id, prior first_name as fn_manager, prior last_name as ln_manager, prior job_id as jobid_manager
FROM hr.employees
START WITH manager_id IS NULL
CONNECT BY manager_id = prior employee_id;
