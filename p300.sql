select * from tabs;

select * from dept1;

update dept1
set deptno = 50, dname = 'NETWORK', loc = 'SEOUL'
where deptno = 40;

update dept1
set loc = 'BUSAN'
where deptno = 20;

create table dept_tcl
as
select * from dept1;

select * from dept_tcl;

commit;

--세션 1
select * from dept_tcl;

delete
from dept_tcl
where deptno = 50;

commit;

update dept_tcl
set loc = 'SEOUL'
where deptno = 30;

rollback;