/*
1. 사원의 입사년도와 월을 사원번호, 사원이름, 입사년, 월로 출력
2. 9월에 입사한 사원만 사원번호, 사원이름, 입사년, 월로 출력
*/

select *
from emp;

select EMPNO, ENAME, substr(HIREDATE, 1, 2) as 입사년, substr(HIREDATE, 4, 2) as 입사월
from emp;

select EMPNO, ENAME, substr(HIREDATE, 1, 2) as 입사년, substr(HIREDATE, 4, 2) as 입사월
from emp
where substr(HIREDATE, 4, 2) = '09';