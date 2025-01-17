
select 10 + 10
from dual; --연산을 시키고, 다양한 값을 확인할 수 있다

select sysdate
from dual; -- 컴퓨터 시스템 날짜

select user
from dual;

select ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
from emp; -- 함수안에 값만 넣으면 된다. 즉 컬럼에 있는 값이 매개 변수 값이 된다.

select ENAME, LENGTH(ENAME)
from emp; --length는 데이터의 길이를 구하는 함수

select LENGTH('korean'), LENGTH('대한민국')
from dual; --길이만 구하면 영문 6, 한글 4이다

select LENGTHB('korean'), LENGTHB('대한민국')
from dual; --바이트 길이는 영문 6, 한글 12이다

--영문을 기준으로 직급이 6글자 이상인 데이터만 출력
select *
from emp
where length(job) >= 6;

--문자열 일부를 추출하는 함수 substr
select substr(ename, 3)
from emp; --세 번째 글자부터 끝까지 출력

select ename, substr(ename, -3)
from emp; --뒤에서 부터 세 번째 글자까지 출력

--instr 함수는 문자열 안의 특정 문자 위치를 찾는다
select 'hello, oracle!', instr('hello, oracle!', 'r') as INSTR_1번
from dual;

--replace는 특정 문자를 다른 문자로 변경
select '010-1234-5678' as replace변환, replace('010-1234-5678', '-'), replace('010-1234-5678', '-', ' '), replace('010-1234-5678', '-', '#')
from dual;

--LPAD, RPAD 함수는 왼쪽, 오른쪽 공간을 채운다
select 'Oracle', lpad('Oracle', 10, '$'), rpad('Oracle', 10, '*')
from dual;

--concat 함수는 두 문자를 합친다
select EMPNO, ENAME, concat(EMPNO, ENAME), concat(EMPNO, concat(':', ENAME))
from emp;

--LTRIM, RTRIM 함수는 공백문자가 삭제된다
select '   Oracle   ', trim('   Oracle   '), ltrim('   Oracle   '), rtrim('   Oracle   ')
from dual;

select 'aaaOracleaaa', trim('a' from 'aaaOracleaaa')
from dual;