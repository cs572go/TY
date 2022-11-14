create database lca5ex1;
use lca5ex1;

create table flight(
flightid int primary key,
airlineid int,
froml varchar(20),
tol varchar(20),
depart time,
arrival time,
capacity int);

create table flight_details(
flightid int primary key,
foreign key (flightid) references flight(flightid),
depdate date not null,
price int not null,
seats int not null default 0 check (seats>=0));

create table passenger(
passengerid int primary key,
fname varchar(20),
lname varchar(20),
phone int not null,
email varchar(50) not null,
age int not null);

create table ticket(
ticketid int auto_increment,
passengerid int not null,
flightid int not null,
depdate date not null,
foreign key (flightid) references flight(flightid),
foreign key (passengerid) references passenger(passengerid),
primary key (ticketid),
tstatus varchar(20));

alter table flight_details auto_increment=100;
alter table passenger auto_increment =100; 
alter table ticket auto_increment =100;

-- stored procedure to accept passenfer id flight id depdate 
-- insert booking into ticket table
-- 	if seats>0 - confirmed
-- 	else waiting

-- fn to display status of ticket 