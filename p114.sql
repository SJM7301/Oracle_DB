--p114
--null값 확인 (IS NULL, IS NOT NULL)

select empno, ename, comm
from emp
where comm = NULL; --NULL값을 직접 입력해서 검색할 수 없다.

select empno, ename, comm
from emp
where comm IS NULL; -- IS NULL 연산자 사용

select empno, ename, comm
from emp
where comm IS NOT NULL; -- IS NOT NULL 연산자 사용해서 값만 보여주기