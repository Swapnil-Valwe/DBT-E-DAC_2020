create database Assignment6;
use Assignment6;

-- 1.

delimiter $$
create function QUE_01( val int) returns int
begin
declare  iterator int(10) default 1;
loop1 : Loop
if(val <= 0) then
leave loop1;
end if;
set iterator = iterator*val;
set val =val-1;
iterate loop1;
end loop;
return iterator;
end ; $$

 -- drop function  Que_01;
set @value=5;
select Que_01(@value);


-- 2.

delimiter $$
CREATE FUNCTION Q2(X INT) RETURNS VARCHAR(10)
BEGIN
DECLARE M ,I INT;
SET I=2;
SET M=X/2;
IF X=0 || X=1 THEN 
RETURN 'NOT PRIME';
ELSE
L1: LOOP
WHILE I<=M DO
IF X%2=0 THEN 
RETURN 'NOT PRIME';
LEAVE L1;
ELSE
SET I=I+1;
ITERATE L1;
END IF;
END WHILE;
RETURN 'PRIME';
END LOOP L1;
END IF;
END$$

select Q2(5);

--3

delimiter $$
create function Que03( val int(20)) returns varchar(200)
begin
return concat(val ,' inches ', round(val/36),' yards ',round(val/12),' foot ');
end;$$

select Q3(12);


-- 4.

-- select * from emp;
delimiter $$
create function Q4(dept int) returns varchar(20)
begin
update emp set sal=sal+(sal*0.10) where deptno=dept;
return 'UPDATED';
end;$$

SELECT Q4(30);


--5

-- select * from emp;
delimiter $$
 create function Q5(empn int ,comp int ) returns int
 begin
 declare val int;
 set val=(select sal from emp where empno=empn);
 return (val+comp)*12;
 end;$$
 
 
 select Q(1004,20) as 'updated salary';
 
--6
 
delimiter $$
CREATE PROCEDURE USER_QUERY_EMP  (IN P_ENO INT, OUT P_JOB VARCHAR(10), OUT P_SAL INT3 ) 
BEGIN
DECLARE NO INT;
SET NO = (SELECT COUNT(*) FROM EMP WHERE EMPNO=P_ENO);
IF NO=0 THEN 
SELECT 'employee not exists';
SET P_JOB='';
SET P_SAL=0;
ELSE 
SELECT SAL,JOB INTO P_SAL,P_JOB FROM EMP WHERE EMPNO=P_ENO;
END IF;
END$$

CALL USER_QUERY_EMP(1004,@JOB,@SAL);
SELECT @JOB,@SAL

--7
 
 delimiter $$
 create procedure Q7(inout str varchar(200))
 begin
if (str='' || isnull(str))  then
set str= 'no string fount';
else
set str= (select reverse(str));
end if;
end $$
-- drop procedure que007;
set @str1=null;
call Q7(@str1);
select @str1;

 --8

delimiter $$
create procedure Que008()
begin
show databases;
end;$$

call Que008();
 


