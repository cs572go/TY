show databases;
create database project_employee;
use project_employee;
create table project(project_id int primary key,proj_name varchar(20),cheif_arch varchar(20));
create table employee(employee_id int primary key,employee_name varchar(20));
create table assigned_too(project_id int, employee_id int,foreign key(employee_id ) references employee(employee_id),primary key(project_id,employee_id) );

insert into employee values(101,"John");
insert into employee values(102,"Smith");
insert into employee values(103,"Sam");
insert into employee values(104,"Tom");
insert into employee values(105,"Ritesh");

insert into project values(353,"Database","Smith");
insert into project values(354,"DBMS","Tom");
insert into project values(453,"Shopping","Ritesh");

insert into assigned_too values(353,101);
insert into assigned_too values(353,103);
insert into assigned_too values(354,103);
insert into assigned_too values(453,105);


select e.* from employee as e join assigned_too as a on e.employee_id=a.employee_id where a.project_id=353; 
select employee_id from assigned_too where project_id=353;  
select e.* from employee as e join assigned_too as a on e.employee_id=a.employee_id where a.project_id=(select project_id from project where proj_name="Database"); 
select e.* from employee as e join assigned_too as a on e.employee_id=a.employee_id where a.employee_id in (select distinct a.employee_id from employee e join assigned_too a on e.employee_id=a.employee_id where a.project_id=353) and a.project_id=354;
select distinct e.* from employee as e join assigned_too as a on e.employee_id=a.employee_id where a.project_id!=453; 
select * from employee where employee_name like "s%"; 
select * from project where cheif_arch="smith";  
delete from project where proj_name="DBMS";
select project_id from assigned_too where employee_id=101; 
create view empl_proj as (select distinct e.* from employee as e join assigned_too as a on e.employee_id=a.employee_id where a.project_id!=453);
select * from empl_proj;
