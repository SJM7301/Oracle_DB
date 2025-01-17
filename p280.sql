select * from tabs;

drop table DEPT1;

select * from dept1;

create table dept1
as
select * from dept; --dept 테이블의 컬럼 및 데이터를 복제하여 dept1 테이블 생성

update dept1
set loc = 'BUSAN'
where deptno = 30;


update dept1
set (dname, loc) = (
    select dname, loc
    from dept
    where deptno = 30
)
where deptno = 30;


update dept1
set loc = 'SEOUL'
where deptno = (
    select deptno
    from dept1
    where dname = 'SALES'
);


--삭제
delete
from dept1
where deptno = 40;


select * from dept1;

rollback;

commit;

--emp1 테이블 복제
select * from emp1;

create table emp1
as
select * from emp;


delete
from emp1
where empno in(
    select e.empno
    from emp1 e, salgrade s
    where e.sal between s.losal and s.hisal and s.grade = 3 and deptno = 30
);