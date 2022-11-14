drop database dbmsal;
create database dbmsal;
use dbmsal;

create table borrower(
RollIn int primary key not null,
sName varchar(20),
DateOfIssue date,
NameOfBook varchar(20),
BStatus varchar(3)
);

create table Fine(
roll_no int primary key not null,
FineDate date,
amt int
);

insert into borrower values(1,"Donald","2022-11-02","Alchemist","I");
insert into borrower values(2,"Trump","2022-10-26","Ikigai","I");
insert into borrower values(3,"Joe","2022-10-25","Gold","I");
insert into borrower values(4,"Biden","2022-11-05","Secret","I");
insert into borrower values(5,"Putin","2022-11-10","Infinity","I");

delimiter //
use dbmsal//

create procedure calcFine(rollno int, bname varchar(20))
begin
declare ldate date;
declare cfine int;
declare days int;
select DateOfIssue into ldate from borrower where RollIn=rollno and NameOfBook=bname;
set days = datediff(curdate(), ldate);
if(days>=15 and days<=30) then
set cfine = days*5;
elseif(days>30) then
set cfine = days*50;
end if;
update borrower set BStatus='R' where RollIn=rollno and NameOfBook=bname;
if(cfine is not null) then
insert into Fine values(rollno, curdate(), cfine);
end if;
end//

delimiter ;
call calcFine(1,"Alchemist");
call calcFine(2,"Ikigai");
call calcFine(3,"Gold");
call calcFine(4,"Secret");
call calcFine(5,"Infinity");
