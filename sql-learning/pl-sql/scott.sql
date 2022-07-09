--  Returns the employees hired in the last 30 days;

SELECT ename, hiredate
FROM scott.emp
WHERE trunc(hiredate, 'MM') = add_months(trunc(sysdate, 'MM'), -1);

-- Returns the name and commission of each employee, returning 0 (zero) in the case of unfilled commission;

SELECT ename, NVL(comm, 0) AS comm
FROM scott.emp;

-- Returns the number of employees per department, including departments without employees;

SELECT dept.dname, COUNT(emp.empno) AS count
FROM scott.dept
LEFT OUTER JOIN scott.emp ON emp.deptno = dept.deptno
GROUP BY dept.dname;

--  Each position returns the job of the employee with the lowest salary;

SELECT empno, job, sal
FROM (
    SELECT E.*, RANK() OVER(PARTITION BY job ORDER BY sal) rn
    FROM scott.emp E
) E
WHERE rn = 1;

-- Only the first employee

SELECT
    job,
    MIN(sal) AS SAL,
    MIN(empno) KEEP(DENSE_RANK FIRST ORDER BY sal) empno
FROM scott.emp
GROUP BY job;


-- returns departments with more than 3 employees.

SELECT dname
FROM scott.dept
WHERE deptno IN
  (
    SELECT deptno
    FROM scott.emp
    GROUP BY deptno
    HAVING COUNT(*) >=3
  );

-- For each employee shows the city of allocation;

SELECT ename, loc
FROM scott.emp
JOIN scott.dept
    ON emp.deptno = dept.deptno;


--  Function that receives an employee id and returns his salary or -1 if the employee is not registered;

CREATE OR REPLACE FUNCTION getEmpSalary (par_empno IN scott.emp.empno%TYPE)
RETURN scott.emp.empno%TYPE IS
    return_salary scott.emp.sal%TYPE;
BEGIN
     SELECT sal into return_salary
     from scott.emp
     where emp.empno = par_empno;
     return(return_salary);
exception
when others then 
   return -1;
END;
/


--  Function that takes a position as a parameter and returns the id of the highest paid employee. Returns the one with the most recent hire date;

CREATE OR REPLACE FUNCTION getJobSalary (par_job IN scott.emp.job%TYPE)
RETURN scott.emp.empno%TYPE IS
     return_value  scott.emp.empno%TYPE;
BEGIN
    SELECT empno INTO return_value
       FROM (SELECT empno,
                    ename,
                    job,
                    sal,
                    hiredate,
                    ROW_NUMBER ()
                       OVER (PARTITION BY job ORDER BY sal DESC, hiredate DESC)
                       rn
               FROM scott.emp
              WHERE job = par_job)
      WHERE rn = 1;
    RETURN return_value;
EXCEPTION
WHEN NO_DATA_FOUND THEN RETURN NULL;
END;
/


-- Procedure that receives a city as a parameter and calls the information of employee id, position and salary of each employee who works in that city or "no employee found" if not found none.

CREATE OR REPLACE PROCEDURE get_employee_info_by_employee_city
(   
p_employee_city   scott.dept.loc%TYPE DEFAULT NULL
)
AS
   v_empno scott.emp.empno%TYPE;
   v_job scott.emp.job%TYPE;
   v_sal scott.emp.sal%TYPE;
   no_rows BOOLEAN := TRUE;
BEGIN
 FOR r IN (SELECT empno, job, sal
              INTO v_empno, v_job, v_sal
              FROM scott.emp
                INNER JOIN scott.dept
                 ON emp.deptno = dept.deptno
              WHERE loc = p_employee_city)
  LOOP
   DBMS_OUTPUT.PUT_LINE('Employee City: ' || p_employee_city);
   DBMS_OUTPUT.PUT_LINE('Employee Number: ' || r.empno);
   DBMS_OUTPUT.PUT_LINE('Job: ' || r.job);
   DBMS_OUTPUT.PUT_LINE('Salary: ' || r.sal);
   DBMS_OUTPUT.PUT_LINE ('---------------------------------------------------');
   no_rows := FALSE;
  END LOOP;
  IF no_rows THEN
    DBMS_OUTPUT.PUT_LINE('no employee found');
  END IF;
END get_employee_info_by_employee_city;
/

-- Trigger to add a column in the EMP table  every time an employee receives a raise. The amount of the last raise received is recorded in this new column;

CREATE OR REPLACE TRIGGER trg_sal
    BEFORE UPDATE OF sal ON scott.emp
    FOR EACH ROW
    WHEN (new.sal > old.sal)
  BEGIN
    :new.comm := (:new.sal - :old.sal);
  END;
/
