--산술연산 +, -, *, /
--비교 >, >=, <, <=, (<>, !=, ^=), =
--논리 부정: NOT

/*
1.급여가 1500 이하인 사원의 사원번호, 사원명, 급여를 출력
2. SCOTT 사원의 사원번호, 사원명, 급여를 출력
3. 10번 부서 소속의 사원들 중 직급이 MANAGER인 사람을 검색하여 사원명, 부서번호, 직급을 출력
4. 10번 부서 소속의 사원이거나 직급이 MANAGER인 사람을 검색하여 사원명, 부서번호, 직급을 출력
5. 부서번호가 10번이 아닌 사원의 사원명, 부서번호 직급을 출력
6. 급여가 2000에서 3000사이의 사원명, 부서번호, 연봉을 출력
7. 커미션이 300이거나 500이거나 1400인 사원의 사원명, 사원번호, 커미션, 연봉을 출력
*/

select *
from emp;

select EMPNO, ENAME, SAL
from emp
where SAL <= 1500;

select EMPNO, ENAME, SAL
from emp
where ENAME = 'SCOTT';

select ENAME, DEPTNO, JOB
from emp
where DEPTNO = 10 and JOB = 'MANAGER';


select ENAME, DEPTNO, JOB
from emp
where DEPTNO = 10 or JOB = 'MANAGER';

select ENAME, DEPTNO, JOB
from emp
where DEPTNO != 10; --같지않다

select ENAME, DEPTNO, JOB
from emp
where DEPTNO <> 10; --같지않다

select ENAME, DEPTNO, JOB
from emp
where DEPTNO ^= 10; --같지않다

select ENAME, DEPTNO, SAL
from emp
where SAL >= 2000 and SAL <= 3000; --비교연산

select ENAME, DEPTNO, SAL
from emp
where SAL betweeb 2000 and 3000; --between and

select ENAME, EMPNO, COMM, SAL
from emp
where COMM = 300 or COMM = 500 or COMM = 1400; --or 연산

select ENAME, EMPNO, COMM, SAL
from emp
where COMM in(300, 500, 1400); --in 연산