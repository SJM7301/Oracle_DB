--다중행 함수와 데이터 그룹화

select sal
from emp
order by sal;

select sum(sal)
from emp;

select sum(sal), count(sal), max(sal), min(sal), avg(sal)
from emp;

select sum(sal), sum(distinct sal)
from emp;

/*
1. 최근에 입사한 사원의 입사일과 가장 오래된 사원의 입사일을 출력
2. 부서의 평균 급여가 얼마인지 출력
*/

select max(hiredate) as "신입", min(hiredate) as "경력"
from emp;

select distinct deptno
from emp;

select deptno as "부서번호", round(avg(sal)) as "평균연봉"
from emp
group by deptno;

--부서번호 및 직책 별 평균 급여로 정렬
select deptno as "부서번호", job as "직책", round(avg(sal)) as "평균연봉"
from emp
group by deptno, job
order by deptno, job;