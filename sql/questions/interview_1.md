# 🏃 Interview Questions #1

Solved SQL questions for a job interview.

## 📌 Context on this Job Interview

This interview was for a job as Developer Pl/SQL Júnior. They gave me as dataset the built-in oracle sql scott schema. This can be acessed using SQL Developer or at [Oracle Live](https://livesql.oracle.com/).


### Question: Create a query for employees hired in <del>the last 30 days</del> the last month.

Observation: The first time I did it wrong and instead of giving the last 30 days as asked in Question 1, I've wrote the code for last month. Rookie mistake. But since its a valid code, I`ve decided to leave it here.

```sql
/*
Because of the way the data is structured in the built-in oracle sql datasets,
we have replace sysdate with a specific date, for example, TO_DATE('04-12-1981', 'dd-mm-yyyy') 
*/

SELECT ename, hiredate
FROM scott.emp
WHERE trunc(hiredate, 'MM') = add_months(trunc(sysdate, 'MM'), -1);
```

Result:  
<img width="145" alt="Screen Shot 2022-07-23 at 23 33 13" src="https://user-images.githubusercontent.com/59098085/180629704-efe40b61-b170-4e15-ba00-7b27df634783.png">

### Question 1: Create a query for employees hired in the last 30 days.

```sql
/*
Because of the way the data is structured in the built-in oracle sql datasets,
we have replace sysdate with a specific date, for example, TO_DATE('04-12-1981', 'dd-mm-yyyy') 
*/

SELECT ename, hiredate
FROM scott.emp
WHERE (hiredate BETWEEN sysdate - 30
                         AND sysdate
);
```

Result:  
<img width="142" alt="Screen Shot 2022-07-23 at 23 35 12" src="https://user-images.githubusercontent.com/59098085/180629735-bcdeaa34-3e14-4da6-bfdb-388d4c241148.png">


### Question 2: Create a query that returns the name and commission of each employee, returning 0 (zero) in the case of unfilled commission.

```sql
SELECT ename, NVL(comm, 0) AS comm
FROM scott.emp;
```

Result:  
<img width="120" alt="Screen Shot 2022-07-23 at 23 35 40" src="https://user-images.githubusercontent.com/59098085/180629746-ab6b10fd-4797-439c-826a-e50ac2c9d38d.png">


### Question 3: Create a query that returns the number of employees per department, including departments without employees.

```sql
SELECT dept.dname, COUNT(emp.empno) AS count
FROM scott.dept
LEFT OUTER JOIN scott.emp ON emp.deptno = dept.deptno
GROUP BY dept.dname;
```

Result:  
<img width="152" alt="Screen Shot 2022-07-23 at 23 36 19" src="https://user-images.githubusercontent.com/59098085/180629757-e1363ede-f04b-40ce-9b04-82298fd3a1ef.png">


### Question 4: Create a query that for each job position returns empno of the employee with the lowest salary.

- The question did not specify more conditions in which they want the result. This is a problem because there is more than one employee with the same position and lower salary. I don't know if it was a way of testing the candidate's attention or if they wanted to see possible solutions based on the candidate's level. 

<br/>

This is the simplest solution. It returns the first employee and the salary.

```sql
SELECT
    job,
    MIN(sal) AS SAL,
    MIN(empno) KEEP(DENSE_RANK FIRST ORDER BY sal) empno
FROM scott.emp
GROUP BY job;
```

Result:  
<img width="183" alt="Screen Shot 2022-07-23 at 23 37 15" src="https://user-images.githubusercontent.com/59098085/180629777-f2436069-428b-4fd7-8a35-6832e7e4262b.png">

<br/>

This is the query I sent as main query. It returns more than one employee and in my opinion is the right answer.

```sql
SELECT empno, job, sal
FROM (
    SELECT E.*, RANK() OVER(PARTITION BY job ORDER BY sal) rn
    FROM scott.emp E
) E
WHERE rn = 1;
```

Result:  
<img width="185" alt="Screen Shot 2022-07-23 at 23 36 46" src="https://user-images.githubusercontent.com/59098085/180629767-5d4d7f8e-e0bc-436a-822f-c62b16606324.png">

<br/>

After a while I've decided to elaborate a little more on this and came up with this query that I feel its more complete.

```sql
WITH emp_rank AS (
    SELECT E.*, 
    RANK() OVER(PARTITION BY job ORDER BY sal) rn
    FROM scott.emp E
    )
SELECT
    job,
    MIN(sal) AS SAL,
    LISTAGG(empno, ',') WITHIN GROUP (ORDER BY rn) AS emplist
FROM emp_rank
WHERE rn = 1
GROUP BY job;
```

Result:  
<img width="208" alt="Screen Shot 2022-07-25 at 12 33 50" src="https://user-images.githubusercontent.com/59098085/180817603-8e3f7997-dafa-4237-8593-70b20a7d7de7.png">


### Question 5: Create a query that returns departments with more than 3 employees.

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
<img width="122" alt="Screen Shot 2022-07-23 at 23 40 10" src="https://user-images.githubusercontent.com/59098085/180629859-d486a853-7814-4de3-85d3-35a6a4cfd4e8.png">


### Question 6: Create a query that for each employee shows the city of allocation.

```sql
SELECT ename, loc
FROM scott.emp
JOIN scott.dept
ON emp.deptno = dept.deptno;
```

Result:  
<img width="140" alt="Screen Shot 2022-07-23 at 23 39 26" src="https://user-images.githubusercontent.com/59098085/180629837-51593e74-9bcb-4e6c-b08b-d6b544e78247.png">

### Question 7: Create a query that for each employee shows his manager.

```sql
SELECT empno, ename, job, prior ename as manager
FROM scott.emp
START WITH MGR IS NULL
CONNECT BY mgr = prior empno;
```

Result:  
<img width="258" alt="Screen Shot 2022-07-23 at 23 40 40" src="https://user-images.githubusercontent.com/59098085/180629868-06665ceb-d55c-4403-87ad-60527b36c805.png">

### Question 8: Create a function that receives an employee id and returns his salary or -1 if the employee is not registered.

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
select ename, getEmpSalary(empno) as salary
from scott.emp;
```
Result:  
<img width="211" alt="Screen Shot 2022-07-23 at 23 42 33" src="https://user-images.githubusercontent.com/59098085/180629914-aa191684-4fc5-4606-9ac7-37667ee9b58d.png"> 


### Question 9: Create a function that takes a position as a parameter and returns the id of the highest paid employee. If you have more than one, return the one with the most recent hire date.

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

select ename, getJobSalary(job) as id_emp
from scott.emp;
```

Result:  
<img width="130" alt="Screen Shot 2022-07-25 at 12 49 50" src="https://user-images.githubusercontent.com/59098085/180820808-62c6b650-3b0f-4d1d-8f15-bba9699285b6.png">

### Question 10: Create a procedure that receives a city as a parameter and calls DBMS_OUTPUT.PUT_LINE(item in varchar2), passing as a parameter the information of: employee id, position and salary of each employee who works in that city or "no employee found" if find none.

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

begin
get_employee_info_by_employee_city('DALLAS');
end;
```

Result:  
<img width="357" alt="Screen Shot 2022-07-23 at 23 52 40" src="https://user-images.githubusercontent.com/59098085/180630147-07d6758b-2763-47bb-b0af-f6105a8bdb2b.png">


### Question 10: Add a column in the EMP table, timely define the column type and find a solution so that every time an employee receives a raise, the amount of the last raise received is recorded in this new column.

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
