--alter 명령어로 구조변경

select * from tabs;

select * from emp1;


alter
table emp1
modify empno number(5);

alter 
table emp1
drop column data;

alter table emp1
drop column tel;

--테이블 이름 바꾸기
select * from tabs;

rename CHAP10HW_DEPT to dept2;
rename CHAP10HW_EMP to emp2;
rename CHAP10HW_SALGRADE to salgrade2;

--truncate
select * from EMP1;

truncate table emp1;