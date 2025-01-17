--ROLLUP 함수, CUBE 함수

select deptno, job, count(*), max(sal), sum(sal), round(avg(sal))
from emp
group by rollup(deptno, job);

select deptno, job, count(*), max(sal), sum(sal), round(avg(sal))
from emp
group by cube(deptno, job)
order by deptno, job;