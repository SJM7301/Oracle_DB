select *
from dept;

select *
from emp, dept --뷰, 서브쿼리, 열과 행의 집합 등이 올 수 있다.
order by empno;

select *
from emp, dept
where emp.deptno = dept.deptno
order by empno;

--내부조인, 등가조인, 심플조인 모두 같은 말이다
--두 테이블의 부서번호가 똑같은 열이름으로 포함되어 있을 때 오류가 발생한다
--해결방법은 사원 또는 부서 테이블을 명확히 컬럼에 정의해 준다. (예: emp.deptno)
select empno, ename, emp.deptno, dname, loc
from emp, dept
where emp.deptno = dept.deptno;

--급여가 3000이상인 데이터를 검색
select e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and sal >= 3000;

--급여가 2500이하, 사원번호가 9999이하인 사원정보 출력
select e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
from emp e, dept d
where e.deptno = d.deptno and sal <=2500 and e.empno <= 9999
order by e.empno;

/*
1. SCOTT이 근무하는 부서의 이름을 출력
2. 뉴욕에서 근무하는 사원의 이름과 급여를 출력
3. ACCOUNTING 부서 소속의 사원의 이름과 입사일을 출력
4. 직급이 MANAGER인 사원의 이름, 부서명을 출력
5. salgrade 테이블의 정보를 가져와서 각 사원의 급여 등급을 출력(사원이름, 연봉, 등급)
6. 매니저가 KING인 사원들의 이름과 직급을 출력
*/

--1
select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.ename = 'SCOTT';

--2
select d.loc, e.ename, e.sal
from emp e, dept d
where e.deptno = d.deptno and d.loc = 'NEW YORK';

--3
select d.dname, e.ename, e.sal
from emp e, dept d
where e.deptno = d.deptno and d.dname = 'ACCOUNTING';

--4
select e.job, e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.job = 'MANAGER';

--5
select e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal >= s.losal and e.sal <= s.hisal;

--6 (self조인 & 자체 조인)
select e.ename as "사원", m.job as "직급"
from emp e, emp m
where e.mgr = m.empno and m.ename = 'KING';

--외부조인 (outer join)
select e.empno, e.ename, e.mgr, m.empno, m.ename
from emp e, emp m
where e.mgr = m.empno(+) -- 왼쪽 조인
order by e.empno;

select e.empno, e.ename, e.mgr, m.empno, m.ename
from emp e, emp m
where e.mgr(+) = m.empno -- 오른쪽 조인
order by e.empno;