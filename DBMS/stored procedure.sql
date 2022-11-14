drop database airline;
create database airline;

use airline;

create table flight_details(

 flight_id int auto_increment,

    dep_Date date not null,

    price int not null,

    available_seats int not null default 0 check(available_seats >= 0),

    primary key(flight_id)

);

 

 

create table passenger(

 passenger_id int auto_increment,

    first_name varchar(30) not null,

    last_name varchar(30) not null,

    phone varchar(10) not null,

    email varchar(30) not null,

    age int not null,

    primary key(passenger_id)

);

create table ticket(

 ticket_id int auto_increment,

    passenger_id int not null,

    flight_id int not null,

    depart_date date not null,

    status varchar(20) not null,

    primary key(ticket_id),

    foreign key(passenger_id) references passenger(passenger_id),

    foreign key(flight_id) references flight_details(flight_id)

); 

 

 

alter table flight_details auto_increment = 1000;

alter table passenger auto_increment = 100;

alter table ticket auto_increment = 10000;

desc flight_Details;

desc passenger;

insert into flight_details values(

 null,

    '2020-08-20',

    2000,

    50

);

insert into flight_details values(

 null,

    '2020-08-24',

    3000,

    40

);

insert into flight_details values(

 null,

    '2020-08-25',

    4200,

    20

);

 

insert into passenger values(

 null,

    'Tushar',

    'Dodo',

    '6969696969',

    'dodo@gmail.com',

    20    

);

 

insert into passenger values(

 null,

    'Dean',

    'Winchister',

    '7458612563',

    'deanwinchi@gmail.com',

    28    

);

 

insert into passenger values(

 null,

    'Sam',

    'Winchister',

    '8574237469',

    'samwin@gmail.com',

    25   

);

 

 

delimiter /

 

create procedure book(IN p_id int, IN f_id int, IN deptDate date, OUT result varchar(30))

begin

 declare v int;

    declare id int;

    select available_seats into v from flight_details where flight_id = f_id;

    insert into ticket values(null, p_id, f_id, deptDate, 'waiting');

    select last_insert_id() into id;

    IF v > 0

    then

  begin

   update ticket set status='confirmed' where ticket_id = id;

            update flight_details set available_seats = available_seats - 1 where flight_id = f_id;

            select "success" into result;

        end;

 ELSE

  select "waiting" into result;

    END IF;

end/

 

call book(100, 1000, '2020-08-20', @M);

select @M;

select * from ticket;

select * from flight_details;

 

call book(100, 1002, '2020-08-24', @M);

select @M;

select * from ticket;

select * from flight_details;

 

call book(100, 1001, '2020-08-24', @M);

select @M;

select * from ticket;

select * from flight_details;

 

 

delimiter /



CREATE DEFINER=`root`@`localhost` FUNCTION `ticket_confirmation`(firstname varchar(20), lastname varchar(20)) 

RETURNS varchar(20) CHARSET utf8mb4

    DETERMINISTIC

BEGIN

declare isconfirmed varchar(20);


select status into isconfirmed from ticket  where passenger_id = (select passenger_id from passenger where first_name = firstname and last_name = lastname);

return isconfirmed;



END