create database lca4ex2;
use lca4ex2;

create table room(
	rnumber int primary key,
    capacity int,
    building varchar(10)
);
create table course(
	cnumber int primary key,
    cname varchar(20),
    department varchar(20)
);
create table section(
	cnumber int,
    snumber int,
    foreign key(cnumber) references course(cnumber),
    primary key(cnumber, snumber),
    enrollment int
);
create table exam(
	cnumber int,
    snumber int,
    rnumber int,
    foreign key(cnumber, snumber) references section(cnumber, snumber),
    foreign key(rnumber) references room(rnumber),
    primary key(cnumber, snumber, rnumber),
    examtime datetime
);

insert into room values(101,50,"A");
insert into room values(102,100,"B");
insert into room values(103,100,"C");
insert into room values(104,100,"C");
insert into room values(105,50,"B");
insert into room values(106,50,"A");
insert into room values(107,100,"A");
insert into room values(108,50,"C");
insert into room values(109,50,"B");

insert into course values(101,"DBMS","CET");
insert into course values(102,"MBA","MGMT");
insert into course values(103,"TTVC","MATH");
insert into course values(104,"ICS","CET");
insert into course values(105,"BBA","MGMT");
insert into course values(106,"LADC","MATH");
insert into course values(107,"DS","CET");
insert into course values(108,"MA","CET");
insert into course values(109,"PSS","MATH");
insert into course values(110,"FSD","CET");

insert into section values(101,501,64);
insert into section values(101,502,77);
insert into section values(101,503,95);
insert into section values(101,504,85);
insert into section values(101,505,73);
insert into section values(102,506,100);
insert into section values(102,507,77);
insert into section values(103,508,85);
insert into section values(104,509,68);
insert into section values(104,510,99);
insert into section values(104,511,73);
insert into section values(104,512,54);
insert into section values(105,513,52);
insert into section values(105,514,100);
insert into section values(105,515,69);
insert into section values(106,516,53);
insert into section values(107,517,54);
insert into section values(108,518,50);
insert into section values(109,519,98);
insert into section values(110,520,74);
insert into section values(110,521,65);
insert into section values(110,522,81);

insert into exam values(101,501,102,"2021-05-13 11:54:20");
insert into exam values(101,502,107,"2021-01-25 10:40:36");
insert into exam values(101,503,109,"2021-05-27 12:08:56");
insert into exam values(101,504,104,"2021-01-25 12:46:10");
insert into exam values(101,505,107,"2022-05-09 12:33:00");
insert into exam values(102,506,106,"2020-08-12 12:33:39");
insert into exam values(102,507,105,"2021-04-29 12:00:37");
insert into exam values(103,508,106,"2022-04-25 11:06:40");
insert into exam values(104,509,104,"2022-04-14 10:34:35");
insert into exam values(104,510,107,"2020-04-28 13:19:44");
insert into exam values(104,511,109,"2020-08-03 10:48:16");
insert into exam values(104,512,101,"2020-06-08 10:46:35");
insert into exam values(105,513,106,"2021-06-30 13:06:33");
insert into exam values(105,514,105,"2020-12-10 13:39:57");
insert into exam values(105,515,106,"2020-03-04 11:45:53");
insert into exam values(106,516,107,"2022-08-09 10:27:20");
insert into exam values(107,517,109,"2022-01-31 11:01:03");
insert into exam values(108,518,103,"2020-05-13 10:12:27");
insert into exam values(109,519,107,"2021-02-09 12:17:24");
insert into exam values(110,520,106,"2021-12-30 12:14:38");
insert into exam values(110,521,109,"2021-06-23 12:17:48");
insert into exam values(110,522,107,"2021-01-25 11:53:39");


select c.* , count(s.snumber) from course c join section s where c.cnumber = s.cnumber group by cnumber; 
update course set department="CET" where cnumber=2;
select c.* , count(s.snumber) from course c join section s where c.cnumber = s.cnumber and department="CET" group by cnumber; 
select c.* , count(s.snumber) from course c join section s where c.cnumber = s.cnumber and department="CET" and s.snumber>1 group by cnumber; 
select * from course c natural join room r join exam e where c.cnumber = e.rnumber and r.rnumber = e.rnumber and building = "A"; 
select e.* from exam e join course c where c.cnumber = e.cnumber and cname = "DBMS"; 
select e.rnumber,r.capacity,r.building from exam e join room r where e.rnumber= r.rnumber; 
select c.*, sum(enrollment) from course c join section s where c.cnumber = s.cnumber group by c.cnumber having sum(enrollment)  > (select sum(enrollment) from course c join section s where c.cnumber = s.cnumber and c.cname = "DBMS" group by c.cnumber);
select c.*, sum(enrollment) from course c join section s where c.cnumber = s.cnumber group by c.cnumber having sum(enrollment) > (select sum(enrollment) from course c join section s where c.cnumber = s.cnumber and c.department = "CET" group by c.department);
select c.cnumber, c.cname, c.department, s.snumber, s.enrollment from course c join section s where c.cnumber = s.cnumber;
create view v1 as (select c.cnumber, c.cname, c.department, s.snumber, s.enrollment from course c join section s where c.cnumber = s.cnumber);