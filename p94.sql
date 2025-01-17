--p94
--where 절(범위에 대한 제약)

select *
from emp
where deptno = 30;

select *
from emp
where deptno = 30 and job = 'SALESMAN'; -- and 연산자를 통해 범위를 더욱 좁혀서 검색

--emp 테이블의 사원번호가 20 이거나 직업(job)이 CLERK인 사원을 검색
select *
from emp
where deptno = 20 or job = 'CLERK';