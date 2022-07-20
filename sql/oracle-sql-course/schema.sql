-- Creating Tables on Oracle Live

CREATE TABLE department
(
  id	   		number(5) constraint pk_department primary key,
  name	   		varchar2(50),
  monthly_budget 	number(8,2),
  last_employee_id 	number(5)
);

CREATE TABLE employee
(
  id        number(5) constraint pk_employee primary key,
  name      varchar2(50),
  birthdate date,
  phone     varchar2(20),
  salary    number(7,2) not null,
  department_id number(3) constraint fk_employee_department references department,
  hire_date date,
  job_id    varchar2(20),
  email     varchar2(50)
 );


 insert into department values (1,'ACCOUNTING',20000,8);
 insert into department values (2,'MARKETING',15000,9);
 insert into department values (3,'INFORMATION TECHNOLOGY',30000,10);
 insert into department values (4,'HUMAN RESOURCES',25000,13);
 insert into department values (5,'REGULATORY AFFAIRS',5000,null);
 insert into department values (6,'CUSTOMER SERVICE',2000,null);

 insert into employee values (1,'JOHN SMITH',date '1995-01-01','1.123.456.7890',4000.00,1,date '2015-03-28','AC_ACCOUNT','JSMITH');
 insert into employee values (2,'JAMES BOSH',date '1992-02-15','1.234.567.8901',3500.00,2,date '2014-07-01','MK_REP','JBOSH');
 insert into employee values (3,'LUISA JACKSON',date '1970-03-08','1.345.678.9012',4500.00,3,date '2013-08-29','IT_PROG','LJACKSON');
 insert into employee values (4,'STUART GARCIA',date '1965-04-12','1.456.789.0123',2000.00,4,date '2010-02-15','HR_REP','SGARCIA');
 insert into employee values (5,'JUSTIN BLACK',date '1990-05-16','1.567.890.1234',2550.00,1,date '2015-05-02','AC_ACCOUNT','JBLACK');
 insert into employee values (6,'ANGIE CROOD',date '1998-06-22','1.678.901.2345',1500.00,1,date '2015-07-01','AC_ACCOUNT','ACROOD');
 insert into employee values (7,'CHARLES DEAN',date '1973-06-08','1.789.012.3456',2250.00,3,date '2002-03-01','IT_PROG','CDEAN');
 insert into employee values (8,'EDDIE FARREL',date '1980-07-28','1.890.123.4567',3000.00,1,date '2009-04-20','AC_ACCOUNT','EFARREL');
 insert into employee values (9,'GEORGE HAYES',date '1982-08-03',NULL,2500.00,2,date '2012-09-22','MK_REP','GHAYES');
 insert into employee values (10,'IGOR KEYS OSBOURNE',date '1987-09-11','144.898.7564',6000.00,3,date '2014-11-14','IT_PROG','IKEYS');
 insert into employee values (11,'LUKE MINT',date '1985-10-19','1.123.456.7890',5000.00,4,date '2011-01-08','HR_REP','LMINT');
 insert into employee values (12,'NIGEL OAKS',date '1997-11-05','52.987.654.3210',4750.00,4,date '2014-10-01','HR_REP','NOAKS');
 insert into employee values (13,'LUKE GREEN JR',date '1995-02-05',NULL,4750.00,4,date '2015-09-01','HR_REP','LGREEN');
 
CREATE TABLE products
  (
	Product_Id   NUMBER(5),
	Product_Name VARCHAR2(100),
	Price           NUMBER(8,2),
	Expiration_Date DATE
  ) ;
 
ALTER TABLE products ADD CONSTRAINT products_PK PRIMARY KEY ( Product_Id ) ;
 
insert into products values (1,'Aspirin',5,date '2025-12-31');
insert into products values (2,'Penicillin',10,date '2026-04-30');
insert into products values (3,'Insulin',25,date '2026-05-31');
insert into products values (4,'Acetaminophen',5,date '2027-01-31');
insert into products values (5,'Amoxicillin',8,date '2026-07-31');

commit; 


select * 
from employee;

select *
from department;