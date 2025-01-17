--Q1 연봉이 2000 초과인 사원들의 부서 정보, 사원정보를 오른쪽과 같이 출력해 보세요.(두 방식 모두 사용)
select d.deptno, d.dname, e.empno, e.ename, e.sal
from emp e, dept d
where e.deptno = d.deptno and e.sal > 2000;

select deptno, d.dname, e.empno, e.ename, e.sal --주의사항 공통컬럼에는 테이블 명시하지 않음.
from emp e natural join dept d
where e.sal > 2000;

--Q2 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력(두 방식 모두 사용)
select d.deptno, d.dname, trunc(avg(sal)), max(sal), min(sal), count(*)
from emp e, dept d
where e.deptno = d.deptno
group by d.deptno, d.dname
order by d.deptno;

select deptno, d.dname, trunc(avg(sal)), max(sal), min(sal), count(*)
from emp e join dept d using(deptno)
group by deptno, d.dname
order by deptno;

--Q3 부서정보와 사원정보를 부서번호, 사원이름순으로 정렬해서 출력(두 방식 모두 사용)
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e, dept d
where e.deptno = d.deptno
order by d.deptno, e.ename;

select deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e natural join dept d
order by deptno, e.ename;

--outer join
select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e, dept d
where e.deptno = d.deptno(+)
order by d.deptno, e.ename;

select d.deptno, d.dname, e.empno, e.ename, e.job, e.sal
from emp e left outer join dept d
on d.deptno = e.deptno
order by deptno, e.ename;  -- outer join의 경우 공통컬럼에 테이블명을 명시 할 수 있다.

--Q4 부서정보, 사원정보, 급여 등급 정보, 각 사원의 직속 상관의 정보를 부서번호, 사원 번호 순으로 정렬하여 출력(두 방식 모두 사용)
select d.deptno, d.dname, e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno, s.losal, s.hisal, s.grade, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1, dept d, salgrade s, emp e2
where e1.deptno(+) = d.deptno and e1.sal between s.losal(+) and s.hisal(+)
and e1.mgr = e2.empno(+)
order by d.deptno, e1.empno;

select d.deptno, d.dname, e1.empno, e1.ename, e1.mgr, e1.sal, e1.deptno, s.losal, s.hisal, s.grade, e2.empno as mgr_empno, e2.ename as mgr_ename
from emp e1 right outer join dept d on(e1.deptno = d.deptno)  left outer join salgrade s on(e1.sal between s.losal and s.hisal)
left outer join emp e2 on(e1.mgr = e2.empno)
order by d.deptno, e1.empno;