--O1
--1번
set serveroutput on;

create or replace procedure pro_dept_in(
    inout_deptno in out dept.deptno%type,
    out_dname out dept.dname%type,
    out_loc out dept.loc%type
)
is

begin
    select deptno, dname, loc into inout_deptno, out_dname, out_loc
    from dept
    where deptno = inout_deptno;

end pro_dept_in;
/

--2번
declare
    v_deptno dept.deptno%type;
    v_dname dept.dname%type;
    v_loc dept.loc%type;

begin
    v_deptno := &부서번호; --주의(공백이 있으면 오류발생)
    
    pro_dept_in(v_deptno, v_dname, v_loc);
    
    dbms_output.put_line('부서 번호 : ' || v_deptno);
    dbms_output.put_line('부서 이름 : ' || v_dname);
    dbms_output.put_line('지역 : ' || v_loc);

end;
/

--Q2
--1번
select * from emp;

set serveroutput on;

create or replace function func_date_kor(
    in_date in date
)
return varchar2
is

begin
    return (to_char(in_date, 'YYYY"년"MM"월"DD"일"'));

end func_date_kor;
/

--2번
select ename, func_date_kor(HIREDATE) as HIREDATE
from emp
where empno = 7369;


--Q3
--1번
create table dept_trg
as
select * from dept;

--2번
create table dept_trg_log(
    tablename varchar2(10),
    dml_type varchar2(20),
    deptno number(2),
    user_name varchar2(30),
    change_date date
);

desc dept_trg_log;

--3번
set serveroutput on;

create or replace trigger trg_dept_log
after
insert or update or delete on dept_trg
for each row
begin
    if inserting then
        insert into dept_trg_log values('DEPT_TRG', 'INSERT', :new.deptno, sys_context('userenv', 'session_user'), sysdate);
    elsif updating then
          insert into dept_trg_log values('DEPT_TRG', 'UPDATE', :old.deptno, sys_context('userenv', 'session_user'), sysdate);
    elsif deleting then
          insert into dept_trg_log values('DEPT_TRG', 'DELETE', :old.deptno, sys_context('userenv', 'session_user'), sysdate);
    end if;
end;
/

select * from dept_trg;
insert into dept_trg values(50, 'ANALIST', 'BUSAN');

update dept_trg
set deptno = 60
where deptno = 50;

delete 
from dept_trg
where deptno = 60;

select * from dept_trg_log;