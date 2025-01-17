--서브쿼리
--with절

select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
from(select * from emp where deptno = 10) e10, (select * from dept)d
where e10.deptno = d.deptno;

with
e10 as (select * from emp where deptno = 10),
d as (select * from dept)

select e10.empno, e10.ename, e10.deptno, d.dname, d.loc
from e10, d
where e10.deptno = d.deptno;

--select절에 사용하는 서브쿼리
select empno, ename, job, sal, (select grade from salgrade where emp.sal between losal and hisal) as grade
from emp;


select *
from emp;
--p262
--Q1 전체 사원 중 ALLEN과 같은 직책(JOB)인 사원들의 사원정보, 부서정보를 다음과 같이 출력하는 SQL문을 작성
select e.job, e.empno, e.ename, e.sal, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno and job = (
    select job
    from emp
    where ename = 'ALLEN'
)
order by sal desc, ename asc;

--Q2 전체 사원의 평균급여(SAL)보다 높은 급여를 받는 사원들이 사원정보, 부서정보, 급여등급 정보출력
--(단, 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는 사원정보를 기준으로 오름차순 정렬)
select e.empno, e.ename, d.dname, e.hiredate, d.loc, e.sal, s.grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno and e.sal between s.losal and s.hisal
and sal > (
    select trunc(avg(sal))
    from emp
)
order by e.sal desc, e.empno asc;

--Q3 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 사원정보, 부서정보를 출력
select distinct job
from emp
where deptno = 30; --직책: SALESMAN, CLERK, MANAGER

select deptno, job
from emp
where deptno = 10; --PRESIDENT, MANAGER, CLERK

select e.empno, e.ename, e.job, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and e.deptno = 10
and job not in(
    select distinct job
    from emp
    where deptno = 30
);

--Q4 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사우너들의 사원정보ㅡ 급여 등급 정보를 출력
--(단, 서브쿼리를 사용할때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원 번호를 기준으로 오름차순으로 정렬)
select e.empno, e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal
and sal > (
    select max(sal)
    from emp
    where job = 'SALESMAN'
)
order by e.empno;

select e.empno, e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal
and sal > all(
    select distinct sal
    from emp
    where job = 'SALESMAN'
)
order by e.empno;