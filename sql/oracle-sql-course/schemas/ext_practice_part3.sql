
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (102,to_date('13-JAN-01','DD-MON-RR'),to_date('24-JUL-06','DD-MON-RR'),'IT_PROG',60);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (101,to_date('21-SEP-97','DD-MON-RR'),to_date('27-OCT-01','DD-MON-RR'),'AC_ACCOUNT',110);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (101,to_date('28-OCT-01','DD-MON-RR'),to_date('15-MAR-05','DD-MON-RR'),'AC_MGR',110);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (201,to_date('17-FEB-04','DD-MON-RR'),to_date('19-DEC-07','DD-MON-RR'),'MK_REP',20);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (114,to_date('24-MAR-06','DD-MON-RR'),to_date('31-DEC-07','DD-MON-RR'),'ST_CLERK',50);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (122,to_date('01-JAN-07','DD-MON-RR'),to_date('31-DEC-07','DD-MON-RR'),'ST_CLERK',50);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (200,to_date('17-SEP-95','DD-MON-RR'),to_date('17-JUN-01','DD-MON-RR'),'AD_ASST',90);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (176,to_date('24-MAR-06','DD-MON-RR'),to_date('31-DEC-06','DD-MON-RR'),'SA_REP',80);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (176,to_date('01-JAN-07','DD-MON-RR'),to_date('31-DEC-07','DD-MON-RR'),'SA_MAN',80);
Insert into JOB_HISTORY (EMPLOYEE_ID,START_DATE,END_DATE,JOB_ID,DEPARTMENT_ID) values (200,to_date('01-JUL-02','DD-MON-RR'),to_date('31-DEC-06','DD-MON-RR'),'AC_ACCOUNT',90);
REM INSERTING into JOBS

Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_PRES','President',20080,40000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_VP','Administration Vice President',15000,30000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AD_ASST','Administration Assistant',3000,6000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_MGR','Finance Manager',8200,16000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('FI_ACCOUNT','Accountant',4200,9000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_MGR','Accounting Manager',8200,16000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('AC_ACCOUNT','Public Accountant',4200,9000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_MAN','Sales Manager',10000,20080);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SA_REP','Sales Representative',6000,12008);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_MAN','Purchasing Manager',8000,15000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PU_CLERK','Purchasing Clerk',2500,5500);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_MAN','Stock Manager',5500,8500);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('ST_CLERK','Stock Clerk',2008,5000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('SH_CLERK','Shipping Clerk',2500,5500);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('IT_PROG','Programmer',4000,10000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_MAN','Marketing Manager',9000,15000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('MK_REP','Marketing Representative',4000,9000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('HR_REP','Human Resources Representative',4000,9000);
Insert into JOBS (JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY) values ('PR_REP','Public Relations Representative',4500,10500);
REM INSERTING into LOCATIONS

Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1000,'1297 Via Cola di Rie','00989','Roma',null,'IT');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1100,'93091 Calle della Testa','10934','Venice',null,'IT');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1300,'9450 Kamiya-cho','6823','Hiroshima',null,'JP');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2000,'40-5-12 Laogianggen','190518','Beijing',null,'CN');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2300,'198 Clementi North','540198','Singapore',null,'SG');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2400,'8204 Arthur St',null,'London',null,'UK');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2600,'9702 Chester Road','09629850293','Stretford','Manchester','UK');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2800,'Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3000,'Murtenstrasse 921','3095','Bern','BE','CH');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL');
Insert into LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) values (3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
REM INSERTING into REGIONS

Insert into REGIONS (REGION_ID,REGION_NAME) values (1,'Europe');
Insert into REGIONS (REGION_ID,REGION_NAME) values (2,'Americas');
Insert into REGIONS (REGION_ID,REGION_NAME) values (3,'Asia');
Insert into REGIONS (REGION_ID,REGION_NAME) values (4,'Middle East and Africa');


--------------------------------------------------------
--  DDL for Index DEPT_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DEPT_ID_PK" ON "DEPARTMENTS" ("DEPARTMENT_ID");
--------------------------------------------------------
--  DDL for Index DEPT_LOCATION_IX
--------------------------------------------------------

  CREATE INDEX "DEPT_LOCATION_IX" ON "DEPARTMENTS" ("LOCATION_ID");
--------------------------------------------------------
--  DDL for Index EMP_EMAIL_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EMP_EMAIL_UK" ON "EMPLOYEES" ("EMAIL");
--------------------------------------------------------
--  DDL for Index EMP_EMP_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EMP_EMP_ID_PK" ON "EMPLOYEES" ("EMPLOYEE_ID");
--------------------------------------------------------
--  DDL for Index EMP_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "EMP_DEPARTMENT_IX" ON "EMPLOYEES" ("DEPARTMENT_ID");
--------------------------------------------------------
--  DDL for Index EMP_JOB_IX
--------------------------------------------------------

  CREATE INDEX "EMP_JOB_IX" ON "EMPLOYEES" ("JOB_ID");
--------------------------------------------------------
--  DDL for Index EMP_MANAGER_IX
--------------------------------------------------------

  CREATE INDEX "EMP_MANAGER_IX" ON "EMPLOYEES" ("MANAGER_ID");
--------------------------------------------------------
--  DDL for Index EMP_NAME_IX
--------------------------------------------------------

  CREATE INDEX "EMP_NAME_IX" ON "EMPLOYEES" ("LAST_NAME", "FIRST_NAME");
--------------------------------------------------------
--  DDL for Index JHIST_EMP_ID_ST_DATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JHIST_EMP_ID_ST_DATE_PK" ON "JOB_HISTORY" ("EMPLOYEE_ID", "START_DATE");
--------------------------------------------------------
--  DDL for Index JHIST_JOB_IX
--------------------------------------------------------

  CREATE INDEX "JHIST_JOB_IX" ON "JOB_HISTORY" ("JOB_ID");
--------------------------------------------------------
--  DDL for Index JHIST_EMPLOYEE_IX
--------------------------------------------------------

  CREATE INDEX "JHIST_EMPLOYEE_IX" ON "JOB_HISTORY" ("EMPLOYEE_ID");
--------------------------------------------------------
--  DDL for Index JHIST_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "JHIST_DEPARTMENT_IX" ON "JOB_HISTORY" ("DEPARTMENT_ID");
--------------------------------------------------------
--  DDL for Index JOB_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JOB_ID_PK" ON "JOBS" ("JOB_ID");
--------------------------------------------------------
--  DDL for Index LOC_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LOC_ID_PK" ON "LOCATIONS" ("LOCATION_ID");
--------------------------------------------------------
--  DDL for Index LOC_CITY_IX
--------------------------------------------------------

  CREATE INDEX "LOC_CITY_IX" ON "LOCATIONS" ("CITY");
--------------------------------------------------------
--  DDL for Index LOC_STATE_PROVINCE_IX
--------------------------------------------------------

  CREATE INDEX "LOC_STATE_PROVINCE_IX" ON "LOCATIONS" ("STATE_PROVINCE");
--------------------------------------------------------
--  DDL for Index LOC_COUNTRY_IX
--------------------------------------------------------

  CREATE INDEX "LOC_COUNTRY_IX" ON "LOCATIONS" ("COUNTRY_ID");
--------------------------------------------------------
--  DDL for Index REG_ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REG_ID_PK" ON "REGIONS" ("REGION_ID");
--------------------------------------------------------
--  Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "COUNTRIES" MODIFY ("COUNTRY_ID" CONSTRAINT "COUNTRY_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID") ENABLE;
  ALTER TABLE "DEPARTMENTS" MODIFY ("DEPARTMENT_NAME" CONSTRAINT "DEPT_NAME_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID") ENABLE;
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL") ENABLE;
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ENABLE;
  ALTER TABLE "EMPLOYEES" MODIFY ("JOB_ID" CONSTRAINT "EMP_JOB_NN" NOT NULL ENABLE);
  ALTER TABLE "EMPLOYEES" MODIFY ("HIRE_DATE" CONSTRAINT "EMP_HIRE_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "EMPLOYEES" MODIFY ("EMAIL" CONSTRAINT "EMP_EMAIL_NN" NOT NULL ENABLE);
  ALTER TABLE "EMPLOYEES" MODIFY ("LAST_NAME" CONSTRAINT "EMP_LAST_NAME_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_ID_ST_DATE_PK" PRIMARY KEY ("EMPLOYEE_ID", "START_DATE") ENABLE;
  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_DATE_INTERVAL" CHECK (end_date > start_date) ENABLE;
  ALTER TABLE "JOB_HISTORY" MODIFY ("JOB_ID" CONSTRAINT "JHIST_JOB_NN" NOT NULL ENABLE);
  ALTER TABLE "JOB_HISTORY" MODIFY ("END_DATE" CONSTRAINT "JHIST_END_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "JOB_HISTORY" MODIFY ("START_DATE" CONSTRAINT "JHIST_START_DATE_NN" NOT NULL ENABLE);
  ALTER TABLE "JOB_HISTORY" MODIFY ("EMPLOYEE_ID" CONSTRAINT "JHIST_EMPLOYEE_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JOBS
--------------------------------------------------------

  ALTER TABLE "JOBS" ADD CONSTRAINT "JOB_ID_PK" PRIMARY KEY ("JOB_ID") ENABLE;
  ALTER TABLE "JOBS" MODIFY ("JOB_TITLE" CONSTRAINT "JOB_TITLE_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "LOCATIONS" ADD CONSTRAINT "LOC_ID_PK" PRIMARY KEY ("LOCATION_ID") ENABLE;
  ALTER TABLE "LOCATIONS" MODIFY ("CITY" CONSTRAINT "LOC_CITY_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REGIONS
--------------------------------------------------------

  ALTER TABLE "REGIONS" ADD CONSTRAINT "REG_ID_PK" PRIMARY KEY ("REGION_ID") ENABLE;
  ALTER TABLE "REGIONS" MODIFY ("REGION_ID" CONSTRAINT "REGION_ID_NN" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "COUNTRIES" ADD CONSTRAINT "COUNTR_REG_FK" FOREIGN KEY ("REGION_ID") REFERENCES "REGIONS" ("REGION_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "DEPT_LOC_FK" FOREIGN KEY ("LOCATION_ID") REFERENCES "LOCATIONS" ("LOCATION_ID") ENABLE;
  ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "DEPT_MGR_FK" FOREIGN KEY ("MANAGER_ID") REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID") REFERENCES "DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID") REFERENCES "JOBS" ("JOB_ID") ENABLE;
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_MANAGER_FK" FOREIGN KEY ("MANAGER_ID") REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID") REFERENCES "DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_FK" FOREIGN KEY ("EMPLOYEE_ID") REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_JOB_FK" FOREIGN KEY ("JOB_ID") REFERENCES "JOBS" ("JOB_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "LOCATIONS" ADD CONSTRAINT "LOC_C_ID_FK" FOREIGN KEY ("COUNTRY_ID") REFERENCES "COUNTRIES" ("COUNTRY_ID") ENABLE;


--***

REM Extending the schema with additional tables

--======
  --DDL
--======

CREATE TABLE users
  (
    user_id VARCHAR2(10) CONSTRAINT pk_users PRIMARY KEY,
    employee_id NUMBER(6) NOT NULL CONSTRAINT fk_users_employees REFERENCES employees,
    active VARCHAR2(1) NOT NULL,
    creation_date DATE NOT NULL
  );

CREATE TABLE roles
  (
    role_id NUMBER(3) CONSTRAINT pk_roles PRIMARY KEY,
    role_name VARCHAR2(50)
  );

CREATE TABLE user_roles
  (
    user_id VARCHAR2(10) CONSTRAINT fk_userroles_users REFERENCES users,
    role_id NUMBER(3) CONSTRAINT fk_userroles_roles REFERENCES ROLES,
    CONSTRAINT pk_user_roles PRIMARY KEY (user_id,role_id)
  );  

CREATE TABLE systems
  (
    system_id NUMBER(3) CONSTRAINT pk_systems PRIMARY KEY,
    system_name VARCHAR2(50)
  );

CREATE TABLE applications
  (
    application_id NUMBER(5) CONSTRAINT pk_applications PRIMARY KEY,
    application_name VARCHAR2(50),
    system_id NUMBER(3) CONSTRAINT fk_applications_systems REFERENCES systems
  );

CREATE TABLE application_permissions
  (
    application_id NUMBER(5) CONSTRAINT fk_apppermissions_apps REFERENCES applications,
    role_id NUMBER(3) CONSTRAINT fk_apppermissions_roles REFERENCES roles,
    CONSTRAINT pk_application_permissions PRIMARY KEY (application_id,role_id)
  ); 

--======
  --Data
--======

REM Inserting data into the new tables

--Users
INSERT INTO users
SELECT SUBSTR(REPLACE(upper(last_name),' '),1,3) || employee_id,employee_id,
  CASE
    WHEN mod(employee_id,2) = 0
    THEN 'Y'
    ELSE 'N'
  END,hire_date + 10
FROM employees;

--ROLES
INSERT INTO ROLES VALUES (1,'BASIC USER');
INSERT INTO ROLES VALUES (2,'MARKETING FULL');
INSERT INTO ROLES VALUES (3,'PURCHASING QUERY-ONLY');
INSERT INTO ROLES VALUES (4,'PURCHASING FULL');
INSERT INTO ROLES VALUES (5,'HUMAN RESOURCES FULL');
INSERT INTO ROLES VALUES (6,'SHIPPING LEVEL 1');
INSERT INTO ROLES VALUES (7,'SHIPPING LEVEL 2');
INSERT INTO ROLES VALUES (8,'SHIPPING STOCK');
INSERT INTO ROLES VALUES (9,'SHIPPING FULL');
INSERT INTO ROLES VALUES (10,'IT PROGRAMMER QUERY-ONLY');
INSERT INTO ROLES VALUES (11,'IT PROGRAMMER FULL');
INSERT INTO ROLES VALUES (12,'SALES LOCAL');
INSERT INTO ROLES VALUES (13,'SALES REGIONAL');
INSERT INTO ROLES VALUES (14,'FINANCE LEVEL 1');
INSERT INTO ROLES VALUES (15,'FINANCE FULL');
INSERT INTO ROLES VALUES (16,'ACCOUNTING');

--USER_ROLES
INSERT
INTO user_roles
	SELECT user_id, 1
	FROM users;
	
INSERT
INTO user_roles
   SELECT user_id, 2
   FROM users u
      JOIN employees e
      ON u.employee_id = e.employee_id
   WHERE department_id = 20;
   
INSERT
INTO user_roles
   SELECT user_id, decode(e.job_id,'PU_CLERK',3,4)
   FROM users u
      JOIN employees e
      ON u.employee_id = e.employee_id
   WHERE department_id = 30;   

INSERT
INTO user_roles
   SELECT user_id, 5
   FROM users u
      JOIN employees e
      ON u.employee_id = e.employee_id
   WHERE department_id = 40; 

INSERT
INTO user_roles
   SELECT user_id,
      CASE 
         WHEN job_id = 'SH_CLERK' and MOD(e.employee_id,2) = 0
            THEN 6
         WHEN job_id = 'SH_CLERK'
            THEN 7
         WHEN job_id = 'ST_CLERK'
            THEN 8
         ELSE 9
      END
   FROM users u
      JOIN employees e
      ON u.employee_id = e.employee_id
   WHERE department_id = 50;  

INSERT
INTO user_roles
   SELECT user_id, decode(mod(e.employee_id,2),0,10,11)
   FROM users u
      JOIN employees e
      ON u.employee_id = e.employee_id
   WHERE department_id = 60;

INSERT
INTO user_roles
   SELECT user_id, decode(mod(e.employee_id,2),0,12,13)
   FROM users u
      JOIN employees e
      ON u.employee_id = e.employee_id
   WHERE department_id = 80;

INSERT
INTO user_roles
   SELECT user_id, decode(e.job_id,'FI_ACCOUNT',14,15)
   FROM users u
      JOIN employees e
      ON u.employee_id = e.employee_id
   WHERE department_id = 100;

INSERT
INTO user_roles
   SELECT user_id, 16
   FROM users u
      JOIN employees e
      ON u.employee_id = e.employee_id
   WHERE department_id = 110
      AND job_id = 'AC_MGR';

--SYSTEMS
INSERT INTO systems VALUES (1,'SALES AND MARKETING');
INSERT INTO systems VALUES (2,'CUSTOMER RELATIONSHIP MANAGEMENT');
INSERT INTO systems VALUES (3,'PURCHASING');
INSERT INTO systems VALUES (4,'HUMAN RESOURCES MANAGEMENT');
INSERT INTO systems VALUES (5,'DISTRIBUTION');
INSERT INTO systems VALUES (6,'IT SERVICE MANAGEMENT');
INSERT INTO systems VALUES (7,'FINANCE AND ACCOUNTING');

--APPLICATIONS
INSERT INTO applications VALUES (1,'SALES PLANNING',1);
INSERT INTO applications VALUES (2,'SALES BI',1);
INSERT INTO applications VALUES (3,'CAMPAIGN PLANNING',1);
INSERT INTO applications VALUES (4,'SALES LIVE REPORT',1);
INSERT INTO applications VALUES (5,'ACCOUNT ASSIGNMENT',1);
INSERT INTO applications VALUES (6,'AGENT PERFORMANCE ANALYSIS',1);
INSERT INTO applications VALUES (7,'CUSTOMER BASIC QUERY',2);
INSERT INTO applications VALUES (8,'CUSTOMER RECORD MAINTENANCE',2);
INSERT INTO applications VALUES (9,'SUPPORT CASE MANAGEMENT',2);
INSERT INTO applications VALUES (10,'CUSTOMER BEHAVIOR ANALYSIS',2);
INSERT INTO applications VALUES (11,'INCENTIVE PROGRAM MANAGEMENT',2);
INSERT INTO applications VALUES (12,'QUOTE MANAGEMENT',3);
INSERT INTO applications VALUES (13,'AGREEMENT MANAGEMENT',3);
INSERT INTO applications VALUES (14,'PURCHASING BI',3);
INSERT INTO applications VALUES (15,'PROVIDER ANALYSIS',3);
INSERT INTO applications VALUES (16,'PURCHASE PRE-FILTER',3);
INSERT INTO applications VALUES (17,'PURCHASE PROCESSING',3);
INSERT INTO applications VALUES (18,'RECRUITMENT AND SELECTION',4);
INSERT INTO applications VALUES (19,'EMPLOYEE RECORD MANAGEMENT',4);
INSERT INTO applications VALUES (20,'CAREER ANALYSIS',4);
INSERT INTO applications VALUES (21,'PAYROLL PARAMETERS MANAGEMENT',4);
INSERT INTO applications VALUES (22,'INTERNAL COMMUNICATIONS MANAGEMENT',4);
INSERT INTO applications VALUES (23,'HUMAN RESOURCES BI',4);
INSERT INTO applications VALUES (24,'DISTRIBUTION PLANNING',5);
INSERT INTO applications VALUES (25,'DISTRIBUTION PERFORMANCE ANALYSIS',5);
INSERT INTO applications VALUES (26,'DELIVERY REGISTRATION',5);
INSERT INTO applications VALUES (27,'DELIVERY CASE MANAGEMENT',5);
INSERT INTO applications VALUES (28,'CHANNEL AND PARTNER MANAGEMENT',5);
INSERT INTO applications VALUES (29,'CMDB MAINTENANCE',6);
INSERT INTO applications VALUES (30,'SUPPORT CASE MANAGEMENT',6);
INSERT INTO applications VALUES (31,'CENTRAL MONITORING CONSOLE',6);
INSERT INTO applications VALUES (32,'GENERAL STATUS REPORT',6);
INSERT INTO applications VALUES (33,'FINANCE PLANNING',7);
INSERT INTO applications VALUES (34,'BUDGET MANAGEMENT',7);
INSERT INTO applications VALUES (35,'INVENTORY MANAGEMENT',7);
INSERT INTO applications VALUES (36,'CREDITOR MANAGEMENT',7);
INSERT INTO applications VALUES (37,'ACCOUNTS PAYABLE',7);
INSERT INTO applications VALUES (38,'ACCOUNTS RECEIVABLE',7);
INSERT INTO applications VALUES (39,'ASSET MANAGEMENT',7);
INSERT INTO applications VALUES (40,'AUDIT REGISTRATION',7);

--APPLICATION_PERMISSIONS
INSERT INTO application_permissions
   SELECT application_id,1
   FROM applications
   WHERE application_id in (4,7,22,32);
   
INSERT INTO application_permissions
   SELECT application_id,2
   FROM applications
   WHERE application_id in (1,3,5);   

INSERT INTO application_permissions
   SELECT application_id,3
   FROM applications
   WHERE application_id in (14,15); 

INSERT INTO application_permissions
   SELECT application_id,4
   FROM applications
   WHERE system_id = 3;   
   
INSERT INTO application_permissions
   SELECT application_id,5
   FROM applications
   WHERE system_id = 4;  

INSERT INTO application_permissions
   SELECT application_id,6
   FROM applications
   WHERE application_id in (26); 

INSERT INTO application_permissions
   SELECT application_id,7
   FROM applications
   WHERE application_id in (26,27);    
   
INSERT INTO application_permissions
   SELECT application_id,8
   FROM applications
   WHERE application_id in (24); 

INSERT INTO application_permissions
   SELECT application_id,9
   FROM applications
   WHERE system_id = 5;

INSERT INTO application_permissions
   SELECT application_id,10
   FROM applications
   WHERE application_id in (31,32); 

INSERT INTO application_permissions
   SELECT application_id,11
   FROM applications
   WHERE system_id = 6; 

INSERT INTO application_permissions
   SELECT application_id,12
   FROM applications
   WHERE application_id in (4,5,6); 

INSERT INTO application_permissions
   SELECT application_id,13
   FROM applications
   WHERE system_id = 1;

INSERT INTO application_permissions
   SELECT application_id,14
   FROM applications
   WHERE application_id in (35,36,37,38); 

INSERT INTO application_permissions
   SELECT application_id,15
   FROM applications
   WHERE system_id = 7;

INSERT INTO application_permissions
   SELECT application_id,16
   FROM applications
   WHERE application_id in (37,38,39); 

COMMIT;

CREATE OR REPLACE VIEW v_active_user_count AS
SELECT *
FROM
  (
    SELECT u.active,d.department_name
    FROM users u
    JOIN employees e
    ON u.employee_id = e.employee_id
    JOIN departments d
    ON e.department_id = d.department_id
  )
pivot
(count(*) FOR department_name IN 
('Executive' AS executive,
  'IT' AS it,
  'Finance' AS finance,
  'Purchasing' AS purchasing,
  'Shipping' AS shipping,
  'Sales' AS sales,
  'Administration' AS administration,
  'Marketing' AS marketing,
  'Human Resources' AS human_resources,
  'Public Relations' AS public_relations,
  'Accounting' AS accounting)
);