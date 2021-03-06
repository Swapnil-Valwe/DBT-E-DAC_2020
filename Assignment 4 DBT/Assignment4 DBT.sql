create database Assignment4;
use Assignment4;

create table Employee(
empid integer not null primary key,
emp_name varchar(20),
salary	integer(7),
dept_name varchar(20),
dept_id integer(4));


insert into Employee values(1,"Arun",25000,"PRODUCTION",1);
insert into Employee values(2,"Kiran",15000,"HUMAN RESOURCE",1);
insert into Employee values(3,"Scott",35000,"QUALITY",2);


create table Employee1(
empid integer not null primary key,
emp_name varchar(20),
salary	integer(7),
dept_name varchar(20),
dept_id integer(4));

insert into Employee1 values(1,"Max",16000,"QUALITY",2);
insert into Employee1 values(2,"Jack",30000,"PRODUCTION",3);
insert into Employee1 values(3,"King",10000,"HUMAN RESOURCE",3);



select employee.dept_name,employee.emp_name from employee inner join employee1 on  employee.dept_id = employee1.dept_id;
select *from employee inner join employee1 on  employee.dept_id = employee1.dept_id;

select dept_id , sum(salary)from employee group  by dept_id;
select employee.dept_name,employee.emp_name from employee right join employee1 on  employee.dept_id = employee1.dept_id;
select employee.dept_name,employee.emp_name from employee left join employee1 on  employee.dept_id = employee1.dept_id;
select emp_name ,dept_name from employee;
select employee1.emp_name ,employee1.dept_name from employee1;
select * from employee union select * from employee1;

select *from employee where salary=(select salary from employee where emp_name="Arun");
select *from employee1 where dept_name=(select dept_name from employee1 where emp_name="jack");
SELECT emp_name FROM employee  WHERE salary IN  ( SELECT MIN(salary)  FROM employee  GROUP BY dept_id  );
UPDATE EMPLOYEE SET SALARY=15000 WHERE  EMP_NAME="MAX";
set sql_safe_updates=0;