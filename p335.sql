--인덱스 생성
create index idx_emp_sal
on emp2(sal);

select * from user_ind_columns;
drop index idx_emp_sal;

--table확인
select * from tabs;

select * from emp2;

create view vw_emp20
as(
    select empno, ename, job, deptno
    from emp2
    where deptno = 20
);

select * from user_views;

select * from tabs;

select * from vw_emp20;

select * from emp2;

delete
from vw_emp20
where empno = 7788;

select * from emp;

drop view vw_emp20;

select rownum, empno
from emp;

select rownum, empno, sal
from emp
order by sal desc;


--인라인 뷰(TOP-N) 서브쿼리
select rownum, e.*
from (
    select *
    from emp e
    order by sal desc
) e;

with e as (select * from emp order by sal desc)
select rownum, e.*
from e;








