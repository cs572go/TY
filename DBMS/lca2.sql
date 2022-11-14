-- exrecise 1

create database lca2;
use lca2;
create table project(
	project_id int,
	proj_name varchar(200) not null,
    chief_arch varchar(200),
    Primary key(project_id)
);

create table employee(
	emp_id int,
	emp_name varchar(200) not null,
    Primary key(emp_id)
);

create table assignedTo(
	project_id int,
	emp_id int,
    work_hrs int default 0,
    foreign key(project_id) references project(project_id),
    foreign key(emp_id) references employee(emp_id), 
    Primary key(project_id, emp_id)
);

alter table assignedTo modify column work_hrs int default 0 not null;
alter table employee add column dob date not null;
alter table employee rename column dob to dateOfBirth;



-- exrecise 2

create database lca2p2;
use lca2p2;
create table employee(
	emp_num int,
	emp_name varchar(200) not null,
    skill varchar(200) not null,
    pay_rate int not null check(pay_rate > 0), 
    Primary key(emp_num)
);

create table pos(
	pos_num int,
    skill varchar(200) not null,
    Primary key(pos_num)
);

create table duty_all(
	pos_num int,
	emp_num int,
    day_duty varchar(20) not null,
    shift varchar(20) not null,
    foreign key(pos_num) references pos(pos_num),
    foreign key(emp_num) references employee(emp_num), 
    Primary key(pos_num, emp_num)
);