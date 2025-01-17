--서브쿼리
--SCOTT사원이 소속된 부서이름을 출력
select deptno
from emp
where ename = 'SCOTT';

select dname
from dept
where deptno = 20;

select dname
from dept
where deptno = (
    select deptno
    from emp
    where ename = 'SCOTT'
);

--단일행 서브쿼리 사용 1
select *
from emp
where ename = 'ALLEN';

select comm
from emp
where comm > 300;

select *
from emp;
--SCOTT과 같은 부서에서 근무하는 사원의 이름과 부서의 번호를 출력
select ename, deptno
from emp
where deptno = (
    select deptno
    from emp
    where ename = 'SCOTT') and ename <> 'SCOTT';

--SCOTT과 동일한 직급을 가진 사원의 정보를 출력
select *
from emp
where job = (
    select job
    from emp
    where ename = 'SCOTT') and ename <> 'SCOTT';

--SCOTT의 급여와 동일하거나 많이 받는 사원의 이름과 급여를 출력
select ename, sal
from emp
where sal >= (
    select sal
    from emp
    where ename = 'SCOTT') and ename <> 'SCOTT';

--DALLAS에서 근무하는 사원의 이름, 부서번호를 출력
select ename, deptno
from emp
where deptno = (
    select deptno
    from dept
    where loc = 'DALLAS'
);

--SALES 부서에서 근무하는 모든 사원의 이름과 급여를 출력
select ename, sal
from emp
where deptno = (
    select deptno
    from dept
    where dname = 'SALES'
);

select *
from emp;

select *
from dept;

select *
from salgrade;

--자신의 매니저가 KING인 사원의 이름과 급여를 출력
select ename, sal
from emp
where mgr = (
    select empno
    from emp
    where ename = 'KING'
);

--다중행 서브쿼리
select *
from emp
where deptno = 20; --단일행 결과 출력

select *
from emp
where deptno in(10, 20); --다중행 결과 출력(in 연산자)

select *
from emp
where sal = any( --다중행 결과 출력(any 연산자)
    select max(sal)
    from emp
    group by deptno
);

select *
from emp
where sal = some( --다중행 결과 출력(some 연산자)
    select max(sal)
    from emp
    group by deptno
);

select *
from emp
where sal = all( --다중행 결과 출력(all 연산자)
    select max(sal)
    from emp
    group by deptno
);

select * 
from emp 
where sal < 2850;

select *
from emp
where deptno = 30;

select *
from emp
where sal < (
    select sal
    from emp
    where deptno = 30) order by sal, empno;

select *
from emp
where sal < any(
    select sal
    from emp
    where deptno = 30) order by sal, empno;

select *
from emp
where sal > any(
    select sal
    from emp
    where deptno = 30) order by sal, empno;

select *
from emp
where sal < all(
    select sal
    from emp
    where deptno = 30) order by sal, empno;

select *
from emp
where sal > all(
    select sal
    from emp
    where deptno = 30) order by sal, empno;


select * 
from emp 
where sal < 2850;

select min(sal)
from emp 
where sal < 2850
order by sal;

select max(sal)
from emp 
where sal < 2850
order by sal;

select max(sal)
from emp 
group by deptno;

--exists 연산자
select *
from emp
where exists( --다중행 결과 출력(exists연산자)
    select sal
    from emp
    where deptno = 30) order by sal, empno;

select *
from emp
where deptno = 30;

select *
from emp
where exists( --다중행 결과 출력(exists연산자)
    select sal
    from emp
    where deptno = 40) order by sal, empno;

--in 연산자 사용
--1. 부서별로 가장 급여가 많은 사원의 사원번호, 사원명, 급여, 부서번호를 출력
select empno, ename, sal, deptno
from emp
where sal in(
    select max(sal)
    from emp
    group by deptno
);

--2. 직급이 MANAGER인 사람이 속한 부서의 부서번호, 부서명, 지역을 출력
select deptno, dname, loc
from dept
where deptno in (
    select deptno
    from emp
    where job = 'MANAGER'
);

--3. 30번 부서의 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사원의 이름과 급여를 출력
select ename, sal
from emp
where sal > (
    select max(sal)
    from emp
    where deptno in(30)
);

--any 연산자 사용
--1. 영업사원(SALESMAN)들의 최소 급여보다 많이 받는 사원들의 이름과 급여, 직급을 출력하되 영업사원은 제외
select ename, sal, job
from emp
where sal > any(
    select min(sal)
    from emp
    where job = 'SALESMAN') and job <> 'SALESMAN';
    
--2. 직급이 SALESMAN인 사원이 받는 급여들의 최대급여 보다 많이 받는 사원들의 이름과 급여를 출력하되, 부서번호가 20번인 사원은 제외
select ename, sal, deptno
from emp
where sal > any(
    select max(sal)
    from emp
    where job = 'SALESMAN') and not deptno = 20;

--all 연산자 사용
--1. 영업사원(SALESMAN)들의 최소 급여보다 많이 받는 사원들의 이름과 급여, 직급을 출력하되 영업사원은 제외
select ename, sal, job
from emp
where sal > all(
    select min(sal)
    from emp
    where job = 'SALESMAN') and job <> 'SALESMAN';

--2. 직급이 SALESMAN인 사원이 받는 급여들의 최대급여 보다 많이 받는 사원들의 이름과 급여를 출력하되, 부서번호가 20번인 사원은 제외
select ename, sal, deptno
from emp
where sal > all(
    select max(sal)
    from emp
    where job = 'SALESMAN') and not deptno = 20;





