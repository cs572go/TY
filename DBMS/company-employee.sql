create database companydata;
use companydata;
create table dept(
deptNo int,
deptName varchar(20) not null unique,
loc varchar(20),
primary key(deptNo)
);

create table employee(
empNo int,
eName varchar(20) not null,
job varchar(20) not null,
mgr int,
hiredate date not null,
salary int check(salary>10000) not null,
comm int,
deptNo int,
primary key(empNo),
foreign key(mgr) references employee(empNo),
foreign key(deptNo) references dept(deptNo)
);

insert into dept values(
10,
"Accounting",
"New York"
);

insert into dept values(
20,
"Research",
"Dallas");

insert into dept values(
30,
"Sales",
"Chicago");

insert into dept values(
40,
"Opeations",
"Boston"
);

insert into employee values(
001,
"Smith",
"CEO",
null,
17/12/80,
80000,
300,
10
);

insert into employee values(
002,
"John",
"Clerk",
001,
07/01/85,
30000,
300,
10
);

insert into employee values(
003,
"Sam",
"Salesman",
002,
27/05/75,
40000,
350,
30
);

insert into employee values(
004,
"Sam",
"Accountant",
003,
21/11/95,
70000,
330,
20
);

insert into employee values(
005,
"Chris",
"Manager",
004,
11/10/95,
32000,
300,
20
);

select count(empNo) as Total_Employee,avg(salary) as AverageSalary from employee where deptNo=20;   
select eName as name,salary as salary,0.1*salary as pf from employee; 
select * from employee  order by salary asc;
select eName,hiredate from employee order by hiredate desc;  
select eName,salary,0.1*salary as pf,0.5*salary as hra,0.3*salary as da,1.9*salary as gross from employee order by gross asc;  
select deptNo,count(empNo) from employee group by deptno;  
update employee set salary=1.1*salary where job="Salesman"; 
select sum(salary) as totalSalary,max(salary) as Maximum, min(salary) as Minimum,avg(salary) as Average from employee where deptNo=20;
select * from employee where eName like "__l%" ; 
select max(salary) from employee where job="Salesman"; 