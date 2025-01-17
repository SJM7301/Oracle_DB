--p88
--order by 절
select *
from emp
order by sal; --기본 값 오름차순

select *
from emp
order by sal asc; --오름차순

select *
from emp
order by sal desc; --내림차순

-- 두 컬럼을 정렬하게 되면 첫 번째 컬럼을 먼저 정렬하고 두 번째 컬럼을 정렬한다.
select *
from emp
order by deptno asc, sal desc;