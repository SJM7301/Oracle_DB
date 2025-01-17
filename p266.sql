desc dept;
desc emp;

create table t_emp
as select * from emp; --전체 컬럼, 데이터 까지 복제

create table dept1
as select * from dept
where 1 <> 1;

select * from tabs;
select * from dept1;

desc t_emp;

select *
from t_emp;

create table t_dept
as select * from dept;

select * from tabs;

--t_dept 테이블에 데이터 추가 
desc t_dept;

insert into t_dept(deptno, dname, loc) values(1111111111, 'test', 'test2');
insert into t_dept(deptno, dname, loc) values(test, 'test2', 22222);
insert into t_dept values (33333, 'test', 'test2');
insert into t_dept values (33333 ,'', null);
insert into t_dept values (null ,'', null);
select * from t_dept

select * from t_dept
where dname is null;

--t_emp 테입르에 데이터 추가
insert into t_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values(9999, '홍길동', 'PRESIDENT', NULL, '2001/01/01', 5000, 1000, 10);
insert into t_emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values(1111, '성춘향', 'MANAGER', 9999, '2001/01/05', 4000, NULL, 20);
select * from t_emp;

--서브쿼리로 데이터 추가 
create table emp1
as select * from emp
where 1 = 0;

insert into emp1(empno, ename, job, mgr, hiredate, sal, comm, deptno)
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno
from emp e, salgrade s
where e.sal between s.losal and s.hisal and s.grade = 1;

insert into emp1(empno, ename, job, mgr, hiredate, sal, comm, deptno)
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, e.deptno
from emp e, salgrade s
where e.sal between s.losal and s.hisal and s.grade = 2;



select * from emp1;




