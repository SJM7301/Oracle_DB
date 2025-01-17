--LISTAGG 함수
select ename
from emp
where deptno = 10;

select deptno, ename
from emp
group by deptno, ename
order by deptno;

select deptno, listagg(ename, ', ')within group(order by sal desc) as enames
from emp
group by deptno;

--pivot, unpivot 함수
select deptno, job, max(sal)
from emp
group by deptno, job
order by deptno, job;

select *
from (select deptno, job, sal from emp)
pivot(max(sal) for deptno in (10, 20, 30))
order by job;

select *
from (select deptno, job, sal from emp)
pivot(max(sal) for deptno in (10, 20, 30))
order by job;

select
    job,
    nvl("10", 0) as "10",
    nvl("20", 0) as "20",
    nvl("30", 0) as "30"
from (select deptno, job, sal from emp)
pivot (
    max(sal) for deptno in (10, 20, 30)
)
order by job;

--decode문을 활용하여 pivot 함수와 같은 출력 구현
select deptno,
max(decode(job, 'CLERK', sal)) as "CLERK",
max(decode(job, 'SALESMAN', sal)) as "SALESMAN",
max(decode(job, 'PRESIDENT', sal)) as "PRESIDENT",
max(decode(job, 'MANAGER', sal)) as "MANAGER",
max(decode(job, 'ANALYSY', sal)) as "ANALYSY"
from emp
group by deptno
order by deptno;

--unppivot 함수를 사용하여 열로 구분된 그룹을 행으로 출력
select *
from (
select deptno,
max(decode(job, 'CLERK', sal)) as "CLERK",
max(decode(job, 'SALESMAN', sal)) as "SALESMAN",
max(decode(job, 'PRESIDENT', sal)) as "PRESIDENT",
max(decode(job, 'MANAGER', sal)) as "MANAGER",
max(decode(job, 'ANALYST', sal)) as "ANALYST"
from emp
group by deptno
order by deptno
)
unpivot(sal for job in(CLERK, SALESMAN, PRESIDENT, MANAGER, ANALYST))
order by deptno, job;