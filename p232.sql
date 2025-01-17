--ISO/ANSI 조인
--NATURAL JOIN: 내부조인(등가)

select empno, ename, deptno
from emp, dept; --공동 컬럼의 경우 어떤 테이블을 참조하는지 명시해야한다.

select empno, ename, deptno
from emp natural join dept; --natural join은 dept테이블의 deptno컬럼을 참조한다.

select e.empno, e.ename, deptno
from emp e natural join dept d; --natural join을 할때 공동컬럼에는 테이블명을 지정하지 않는다.(에러가 발생하기 때문)

--JOIN ~ USING
--using(컬럼이름): 테이블간의 공통컬럼 사용을 명시함.

--기존방법
select *
from emp e, dept d
where e.deptno = d.deptno;

--using 사용
select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, deptno, d.dname, d.loc
from emp e join dept d using(deptno);

select e.empno, e.ename, e.job, e.mgr, e.hiredate, e.sal, e.comm, deptno, d.dname, d.loc
from emp e join dept d using(deptno)
where sal >= 3000
order by deptno, e.empno;

--on 사용
select *
from emp e join dept d on(e.deptno = d.deptno);

--OUTER JOIN(Left Outer join, Right Outer join, Full Outer join)
--Full Outer join
select *
from emp e1 full outer join emp e2 on(e1.mgr = e2.empno);