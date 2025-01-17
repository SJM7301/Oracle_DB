--테이블에 있는 데이터 수정하기
/*
update: 수정할 테이블을 지정
set:    변경할 컬럼의 이름과 데이터를 입력
where:  변경할 데이터를 지정
*/

select * from dept1;

insert into dept1 values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept1 values(20, 'RESEARCH', 'DALLAS');
insert into dept1 values(30, 'SALES', 'CHICAGO');
insert into dept1 values(40, 'OPERATIONS', 'BOSTON');

update dept1
set deptno = 50;

update dept1
set deptno = 50
where dname = 'RESEARCH';

commit;

rollback;

--emp1 테이블 검색
select * from dept1;
select * from tabs;

drop table emp1;--DDL은 auto commit이 된다.

create table emp1
as select * from emp;

select * from emp1;

select * from emp1
order by sal;

/*
update emp1
set comm = 50
where sal < 2500;
*/