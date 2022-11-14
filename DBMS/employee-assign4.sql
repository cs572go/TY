create database lca4ex1;
use lca4ex1;
create table project(
	project_id int primary key,
	proj_name varchar(40),
    cheif_arch varchar(40));
create table employee(
	employee_id int primary key,
	employee_name varchar(40));
create table assignedto(
	project_id int, 
    employee_id int,
    foreign key(employee_id ) references employee(employee_id),
    primary key(project_id,employee_id),
    work_hours int);

insert into project values(1,"C351","Pennywhistle Cocktoasten");
insert into project values(2,"C352","Worms Pealike");
insert into project values(3,"C353","Pitchfork Ben Pinkerton");
insert into project values(4,"C354","Bad News Splern");
insert into project values(5,"C355","Snoobs Bloominshine");
insert into project values(6,"C453","Joe Pottin Soil Overturf");

insert into employee values(101,"Huckleberry Stevens");
insert into employee values(102,"Scut Turnipseed");
insert into employee values(103,"Sweet Tea Goodpasture");
insert into employee values(104,"Pennywhistle Cocktoasten");
insert into employee values(105,"Lemongrass Gooberdapple");
insert into employee values(106,"Spitzitout Quakenbush");
insert into employee values(107,"Soupcan Sam Fewhairs");
insert into employee values(108,"Stinky Butterbaugh");
insert into employee values(109,"Baby Oil Breedslovetrout");
insert into employee values(110,"Foncy Goodpasture");
insert into employee values(111,"Chigger Wimplesnatch");
insert into employee values(112,"Mr Peabody Swackhamer");
insert into employee values(113,"Joe Pottin Soil Overturf");
insert into employee values(114,"Squids Bloominshine");
insert into employee values(115,"Snoobs Bloominshine");
insert into employee values(116,"Huckleberry Whipkey");
insert into employee values(117,"Snakes Oxhandler");
insert into employee values(118,"Cinnabuns Jefferson");
insert into employee values(119,"Winston Jazz Hands Porkins");
insert into employee values(120,"Bad News Splern");
insert into employee values(121,"Old Scratch Jenkins");
insert into employee values(122,"Worms Pealike");
insert into employee values(123,"Pitchfork Ben Pinkerton");
insert into employee values(124,"Johnny Olivetti");

insert into assignedto values(4,101,9);
insert into assignedto values(4,102,15);
insert into assignedto values(5,103,16);
insert into assignedto values(1,104,11);
insert into assignedto values(2,105,17);
insert into assignedto values(2,106,7);
insert into assignedto values(5,107,6);
insert into assignedto values(4,108,4);
insert into assignedto values(5,109,20);
insert into assignedto values(5,110,20);
insert into assignedto values(4,111,3);
insert into assignedto values(5,112,19);
insert into assignedto values(6,113,19);
insert into assignedto values(4,114,8);
insert into assignedto values(5,115,18);
insert into assignedto values(2,116,6);
insert into assignedto values(2,117,13);
insert into assignedto values(4,118,17);
insert into assignedto values(1,119,20);
insert into assignedto values(4,120,16);
insert into assignedto values(2,121,12);
insert into assignedto values(2,122,4);
insert into assignedto values(3,123,18);
insert into assignedto values(3,124,1);



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
