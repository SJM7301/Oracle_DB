--p146
--숫자함수(round, trunc, ceil, floor, mod)

select -10, abs(-10)
from dual; -- 절대값

select 34.5678, round(34.5678)
from dual; --반올림 값 반환

select 34.5678, round(34.5678, 2)
from dual; --소수점 이하 둘 째 자리 반올림 값 반환

select 34.5678, trunc(34.5678)
from dual; --소수점 이하 버림

select 34.5678, trunc(34.5678, 2)
from dual; -- 소수점 이하 둘 째 자리에서 소수점 버림

select 34.5678, ceil(34.5678), floor(34.5678)
from dual; --ceil은 큰 정수값, floor은 작은 정수값

select mod(27, 2), mod(27, 5), mod(27, 7)
from dual;