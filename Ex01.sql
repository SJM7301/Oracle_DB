--sql 연습

/*
1. 입사일이 1981년 1월 1일에서 1981년 12월 31일인 사원의 사원번호, 사원명, 입사일을 출력
2. 이름에 A를 포함하는 사원의 사원번호, 사원이름을 출력
3. 이름에 R자가 3번째 위치에 있는 사원의 사원번호, 사원이름을 출력
4. 커미션이 NULL이 아닌 사원의 사원번호, 사원명, 커미션을 출력
5. 급여를 오름차순으로 정렬하여 사원번호, 사원이름, 급여를 출력
6. 입사일이 가장 오래된 사원부터 사원번호, 사원이름, 입사일을 출력
7. 급여를 많이 받는 순서대로 출력하고 급여가 같은 사람은 이름의 첫 글자가 빠른 순서대로 사원번호, 사원이름, 급여를 출력
*/

select *
from emp;

select EMPNO, ENAME, HIREDATE
from emp
where HIREDATE between '1981/01/01' and '1981/12/31'; --날짜 형식에 맞춰서 작성

select EMPNO, ENAME
from emp
where ENAME like '%A%'; --%를 사용해서 앞뒤로 해당문자를 감싼다

select EMPNO, ENAME
from emp
where ENAME like '__R%'; --_은 개당 한글자를 의미하므로 _를 2개 사용하고 다음에 찾고자 하는 문자를 작성후 %로 마무리

select EMPNO, ENAME, COMM
from emp
where COMM IS NOT NULL;

select EMPNO, ENAME, SAL
from emp
order by SAL;

select EMPNO, ENAME, HIREDATE
from emp
order by HIREDATE DESC;

select EMPNO, ENAME, SAL
from emp
order by SAL DESC, ENAME ASC;