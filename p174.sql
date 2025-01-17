--p174
--Q1 emp 테이블에서 사원이름이 5자이상, 6자 미만인 사원 정보를 출력 masking_empno열은 뒷 2자리를 *기호를 출력
--masking_ename열은 1자리 값만 보여주고 뒷자리를 모두 *기호로 출력

select *
from emp;

select empno, rpad(substr(empno, 1, 2), 4, '*') as MASKING_EMPNO,
ename, rpad(substr(ename, 0,1), 5, '*') as MASKING_ENAME
from emp;

--Q2 emp 테이블의 사원들의 월 평균 근무일수는 21.5일이다. 하루 근무 시간을 8시간으로 보았을 때
--사원들의 하루 급여(DAY_PAY)와 시급(TIME_PAY)를 계산하여 결과를 출력
--단, 하루 급여는 소수점 세 번째 자리에서 버리고, 시급은 두 번째 소수점에서 반올림

select empno, ename, sal, TRUNC((sal / (21.5)), 2) as DAY_PAY, ROUND((sal / (21.5 * 8)), 1) as TIME_PAY
from emp;

--Q3 emp 테이블에서 사원들은 입사일 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다
--사원들의 정직원되는 날짜(R_JOB)를 YYY-MM-DD 형식으로 출력
--단 추가 수당(comm)이 없는 사원의 추가수당은 N/A로 출력

select empno, ename, hiredate, next_day(add_months(hiredate, 3), '월요일') as R_JOB, nvl(to_char(comm), 'N/A') as COMM
from emp;

--Q4 emp 테이블의 모든 사원을 대상으로 직속 상관의 사원번호(MGR)를 조건 기준으로 변환해서 CHG_MGR열에 출력
/*
기준 조건
직속 상관의 사원번호가 존재하지 않는 경우: 0000
직속 상관의 사원번호 앞 2자리가 75일 경우: 5555
직속 상관의 사원번호 앞 2자리가 76일 경우: 6666
직속 상관의 사원번호 앞 2자리가 77일 경우: 7777
직속 상관의 사원번호 앞 2자리가 78일 경우: 8888
그 외의 직속 상관 사원 번호의 경우: 본래 직속 상관의 사원번호 그대로 출력
*/

select empno, ename, mgr,
case
when mgr is null then '0000'
when substr(mgr, 1, 2) = '75' then '5555'
when substr(mgr, 1, 2) = '76' then '6666'
when substr(mgr, 1, 2) = '77' then '7777'
when mgr like '78%' then '8888'
else to_char(mgr)
end as CHG_MGR
from emp;