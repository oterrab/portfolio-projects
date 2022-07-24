# ♾ Interview Questions

I'll be solving SQL questions and sharing my answers.

## 📌 Context on this Job Interview

This interview was for a job as Developer Pl/SQL Júnior. They gave me as dataset the built-in oracle sql scott schema. This can be acessed using SQL Developer or at [Oracle Live](https://livesql.oracle.com/).


**Question 0:** <p align="justify"> Create a query for employees hired in <del>the last month.</del> </p>

Observation: The first time I did it wrong and instead of giving the last 30 days as asked in Question 1, I've wrote the code for last month. Rookie mistake. But since its a valid code, I`ve decided to leave it here.

```sql
/*
Because of the way the data is structured in the built-in oracle sql datasets,
we have replace sysdate with a specific date, for example, TO_DATE('04-12-1981', 'dd-mm-yyy') 
*/

SELECT ename, hiredate
FROM scott.emp
WHERE trunc(hiredate, 'MM') = add_months(trunc(sysdate, 'MM'), -1);
```

Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

**Question 1:** <p align="justify"> Create a query for employees hired in the last 30 days. </p>

```sql
/*
Because of the way the data is structured in the built-in oracle sql datasets,
we have replace sysdate with a specific date, for example, TO_DATE('04-12-1981', 'dd-mm-yyy') 
*/

SELECT ename, hiredate
FROM scott.emp
WHERE (hiredate BETWEEN sysdate - 30
                         AND sysdate
      OR hiredate BETWEEN ADD_MONTHS(sysdate, -12 ) - 30
                         AND ADD_MONTHS( sysdate, -12 )
);
```

Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

**Question 2:** <p align="justify"> Create a query that returns the name and commission of each employee, returning 0 (zero) in the case of unfilled commission.</p>

```sql
SELECT ename, NVL(comm, 0) AS comm
FROM scott.emp;
```

Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

**Question 3:** <p align="justify"> Create a query that returns the number of employees per department, including departments without employees.</p>

```sql
SELECT dept.dname, COUNT(emp.empno) AS count
FROM scott.dept
LEFT OUTER JOIN scott.emp ON emp.deptno = dept.deptno
GROUP BY dept.dname;
```

Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

**Question 4:** <p align="justify"> Create a query that for each position returns the job of the employee with the lowest salary.</p>

```sql
/* 
There is more than one employee with the same position and lower salary, 
this query returns more than one employee. 
*/

SELECT empno, job, sal
FROM (
    SELECT E.*, RANK() OVER(PARTITION BY job ORDER BY sal) rn
    FROM scott.emp E
) E
WHERE rn = 1;
```

Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">


```sql
/* 
This query returns the first employee and the salary. 
*/

SELECT
    job,
    MIN(sal) AS SAL,
    MIN(empno) KEEP(DENSE_RANK FIRST ORDER BY sal) empno
FROM scott.emp
GROUP BY job;
```

Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

**Question 5:** <p align="justify"> Create a query that returns departments with more than 3 employees.</p>

```sql
SELECT dname
FROM scott.dept
WHERE deptno IN
  (
    SELECT deptno
    FROM scott.emp
    GROUP BY deptno
    HAVING COUNT(*) >=3
);
```

Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

**Question 6:** <p align="justify"> Create a query that for each employee shows the city of allocation.</p>

```sql
SELECT ename, loc
FROM scott.emp
JOIN scott.dept
ON emp.deptno = dept.deptno;
```

Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

**Question 7:** <p align="justify">Create a query that for each employee shows his manager.</p>

```sql
SELECT empno, ename, job, prior ename as manager
FROM scott.emp
START WITH MGR IS NULL
CONNECT BY mgr = prior empno;
```

Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

**Question 8:** <p align="justify"> Create a function that receives an employee id and returns his salary or -1 if the employee is not registered.</p>

```sql
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
```

Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

**Question 9:** <p align="justify"> Create a function that takes a position as a parameter and returns the id of the highest paid employee. If you have more than one, return the one with the most recent hire date.</p>

```sql
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
```

Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

**Question 10:** <p align="justify"> Create a procedure that receives a city as a parameter and calls DBMS_OUTPUT.PUT_LINE(item in varchar2), passing as a parameter the information of: employee id, position and salary of each employee who works in that city or "no employee found" if find none.</p>

```sql
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
    DBMS_OUTPUT.PUT_LINE('nenhum funcionário encontrado');
  END IF;
END get_employee_info_by_employee_city;
/
```

Result:  
<img width="408" alt="Screen Shot 2022-07-18 at 22 53 26" src="https://user-images.githubusercontent.com/59098085/179647750-625381af-6aef-4a5d-875e-6a49bc7fca18.png">

**Question 10:** <p align="justify"> Add a column in the EMP table, timely define the column type and find a solution so that every time an employee receives a raise, the amount of the last raise received is recorded in this new column.</p>

```sql
/* 
This was made on SQL Developer since we don't have privilegies to add triggers on Oracle Live
*/ 
CREATE OR REPLACE TRIGGER trg_sal
    BEFORE UPDATE OF sal ON scott.emp
    FOR EACH ROW
    WHEN (new.sal > old.sal)
  BEGIN
    :new.comm := (:new.sal - :old.sal);
  END;
/
```