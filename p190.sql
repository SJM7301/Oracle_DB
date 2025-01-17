select deptno as "부서번호", job as "직책", round(avg(sal)) as "평균연봉"
from emp
group by deptno, job
having avg(sal) >= 2000
order by deptno, job;

/*
1. 소속 부서별로 급여총액과 평균급여를 출력
2. 부서별 사원수와 커미션을 받는 사원의 수를 출력
3. 부서의 평균 급여가 2000이상인 부서의 부서번호, 부서별 평균급여를 출력
4.부서의 최소 급여와 최대 급여를 구하고, 최대 급여가 2900이상인 부서를 출력
*/

select *
from emp;

select deptno as "부서", sum(sal) as "급여총액", round(avg(sal)) as "평균급여"
from emp
group by deptno
order by deptno asc;

select deptno, count(*) as "사원 수", count(comm) as "커미션을 받는 사원 수"
from emp
group by deptno
order by deptno asc;

select deptno, round(avg(sal)) as "평균 급여"
from emp
group by deptno
having round(avg(sal)) >= 2000;

select deptno, max(sal) as "최대 급여", min(sal) as "최소 급여"
from emp
group by deptno
having max(sal) >= 2900;