create database lca3sets;

use lca3sets;

create table dept(

	deptno int,

    dname varchar(200) unique not null,

    loc varchar(200) not null,

    primary key(deptno)

);


create table emp(

	empno int,

    ename varchar(200) not null,

    job varchar(200) not null,

    mgr int,

    hiredate date not null,

    sal int check(sal > 20000) not null,

    comm int default 0 not null,

    deptno int not null,

    primary key(empno),

    foreign key(mgr) references emp(empno),

    foreign key(deptno) references dept(deptno)

);


insert into dept values(

	10,

    "Accounting",

    "New York"

);


insert into dept values(

	20,

    "Research",

    "Pune"

);


insert into dept values(

	30,

    "Sales",

    "Mumbai"

);


insert into dept values(

	40,

    "Operations",

    "Boston"

);


insert into emp values(

	0001,

    "Yo",

    "CEO",

    null,

    "2010-08-20",

    500000000,

    30000000,

    10

);



insert into emp values(

	0002,

    "Smith",

    "Finance Manager",

    0001,

    "2012-08-20",

    5000000,

    30000,

    10

);


insert into emp values(

	0003,

    "Man",

    "Accountant",

    0002,

    "2015-08-20",

    500000,

    3000,

    30

);


insert into emp values(

	0004,

    "Bro",

    "Accountant",

    0002,

    "2015-08-20",

    500000,

    3000,

    20

);


insert into emp values(

	0005,

    "Yeet",

    "Accountant",

    0003,

    "2015-08-20",

    50000,

    300,

    20

);


insert into emp values(

	0006,

    "Chris",

    "Salesman",

    0003,

    "2015-08-20",

    50000,

    300,

    40

);




-- set 1

select count(empno) as numberOfEmployee, avg(sal) as averageSal from emp where deptno = 20; -- quest 1

select ename as name, sal as salary, 0.1*sal as pf from emp; -- q2

select * from emp order by sal asc; -- q3

select ename, hiredate from emp order by hiredate desc; -- q4

select ename, sal, 0.1*sal as pf, 0.5*sal as hra, 0.3*sal as da, 1.9*sal as gross from emp order by gross asc; -- q5

select deptno, count(empno) from emp group by deptno; -- q6

update emp set sal = 1.1 * sal where job = "Salesman"; -- q7

select sum(sal), max(sal), min(sal), avg(sal) from emp where deptno = 20; -- q8

select * from emp where ename like "__l%"; -- q9

select max(sal) from emp where job = "Salesman"; -- q10


-- set 2

-- q1 removed

select * from emp order by sal asc limit 3; -- q2

select * from emp where deptno not in (select deptno from dept); -- q3

select * from emp where sal%2=1; -- q4

select * from emp where sal like "___"; -- q5

select * from emp where month(hiredate) = 12; -- q6

select * from emp where ename like "%a%"; -- q7

select max(sal), avg(sal), min(sal) from emp; -- q8

select ename, weekday(hiredate) as day from emp; -- q9


use companyE39;

desc dept;

-- e39 assign 3

-- set 2

select ename, char_length(ename) as length from emp; -- q10

select ename, sal from emp where sal < 1000 order by sal; -- q11


select * from emp;

select * from dept;

-- set 3

select distinct job from emp; -- q1

delete from emp where year(hiredate) = "1980"; -- q2

update emp set sal = sal + 0.2*sal where JOB like "%manager%"; -- q3

select * from emp where deptno not in ("10","30","40"); -- q4

select distinct job from emp; -- q5

select * from emp where comm = 0; -- q6

select * from emp where ename like "%s" or ename like "s%"; -- q7

select * from emp where ename like "_a%"; -- q8

select count(ename) from emp; -- q9

select empno, ename, job, mgr,  date_format(hiredate, "%b %d, %Y") as hiredate, sal, comm, deptno from emp; -- q10

select * from emp where comm between 200 and 500; -- q11


-- set 4

select * from emp where hiredate not between date_sub(curdate(), interval 2 year) and curdate(); -- q1

select * from emp order by sal asc; -- q2

select * from emp where sal > (select sal from emp where ename = "smith"); -- q3

update emp set sal = 1.1*sal where empno = 7499; -- q4

select * from emp where sal between 10000 and 25000; -- q5

update emp set sal = 1.1*sal where empno = 7499; -- q7

select c.*, sum(enrollment) from course c join section s where c.c_number = s.c_number group by c.c_number having sum(enrollment) >

	 (select sum(enrollment) from course c join section s where c.c_number = s.c_number and c.department = "Data Analytics" group by c.department); -- q8

select c.c_number, c.c_name, c.department, s.s_number, s.enrollment from course c join section s where c.c_number = s.c_number;  -- q9

create view v1 as (select c.c_number, c.c_name, c.department, s.s_number, s.enrollment from course c join section s where c.c_number = s.c_number); -- q10