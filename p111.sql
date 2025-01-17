--like 연산자, 이스케이프 문자 %

select ename
from emp
where ename = 'F'; --'F'라는 이름은 없다

select ename
from emp
where ename like '%F'; --F로 끝나는 이름은 없다

select ename
from emp
where ename like 'F%'; --F로 시작하는 이름

select ename
from emp
where ename like '%F%'; --문자 중간에 F가 포함되는 이름

select ename
from emp
where ename like '_F%'; --두 번째 글자가 F인 이름