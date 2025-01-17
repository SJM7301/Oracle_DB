--p157 ~ 166

select *
from emp;

select empno, ename, empno + '500'
from emp
where ename = 'SCOTT';

select empno, ename, empno + 'ABCD'
from emp
where ename = 'SCOTT';

desc emp;

select to_char(sysdate, 'YYYY/MM/DD HH24:MI:SS') as "현재 날짜 및 시간"
from dual;

select sysdate, to_char(sysdate, 'MM'), to_char(sysdate, 'DD'), to_char(sysdate, 'DY', 'NLS_DATE_LANGUAGE=KOREAN'),
to_char(sysdate, 'DY', 'NLS_DATE_LANGUAGE=JAPANESE'), to_char(sysdate, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH')
from dual;

select sal, to_char(sal, '$999,999'), to_char(sal, 'L999,999'), to_char(sal, '999,999.00'), to_char(sal, '000,999.00'), 
to_char(sal, '000,999.00')
from emp;

select *
from emp
where hiredate > to_date('1981/06/01', 'YYYY/MM/DD');

--p165실습 6-44참조
--1950년을 기점으로 YY와 RR을 사용한 날짜가 각각 년대의 앞자리를 계산하는 방식이 다르다.
/*
1. YY는 어떤 두 자리가 입력되어도 현 시점의 연도와 동일한 연도로 계산된다.
2. RR은 현 시점의 연도의 끝 두 자리가 00~49, 50~99 그리고 입력된 수치가 00~49, 50~99인 경우를 계산하여 비교적 가까운 날짜데이터를 계산해준다
*/