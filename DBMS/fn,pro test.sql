DELIMITER //
use lca3sets //
select * from emp //

create procedure GetEmpNo(In id int, out en varchar(20))
BEGIN
	SELECT ename into en FROM emp where empno=id;
END//

call GetEmpNo(4,@n) //
select @n//

create function getsomething (id int) returns varchar(20) deterministic
begin
	declare en varchar(20);
    select ename into en from emp where empno=id;
    return en;
end//

DELIMITER ;
select getsomething(2);
