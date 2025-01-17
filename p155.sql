--한줄주석
/*
문장 주석
*/
--p156 round 함수를 사용해서 날짜 데이터 출력

select sysdate
from dual; -- 더미 테이블

select sysdate, round(sysdate, 'CC')
from dual;

select sysdate, round(sysdate, 'CC'), round(sysdate, 'YYYY')
from dual;

select sysdate, round(sysdate, 'CC'), round(sysdate, 'YYYY'), round(sysdate, 'Q')
from dual;

select sysdate, round(sysdate, 'CC'), round(sysdate, 'YYYY'), round(sysdate, 'Q'), round(sysdate, 'DDD')
from dual;

select sysdate, round(sysdate, 'CC'), round(sysdate, 'YYYY'), round(sysdate, 'Q'), round(sysdate, 'DDD'), round(sysdate, 'HH')
from dual;