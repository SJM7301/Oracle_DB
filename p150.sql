--p150
--날짜 함수

select sysdate - 1 as yesterday, sysdate as now, sysdate + 1 as tomorrow
from dual; --어제: sysdate -1, 오늘: sysdate, 내일: sysdate +1

select sysdate, add_months(sysdate, 3)
from dual; -- add_month는 현재 날짜 기준에서 제시한 숫자의 달만큼 데이터 출력

select EMPNO, ENAME, HIREDATE, add_months(HIREDATE, 120) as "입사 10주년"
from emp;

select EMPNO, ENAME, HIREDATE,sysdate, months_between(HIREDATE, sysdate) as "입사 몇달차인가?"
from emp; --두 날짜간(HIREDATE, sysdate)의 개월수를 출력

select sysdate, next_day(sysdate, '월요일'), last_day(sysdate)
from dual; --next_day 함수는 특정 날짜를 기준으로 돌아오는 요일의 날짜를 출력, last_day 함수는 특정 날짜가 속한 달의 마지막 날짜를 출력

