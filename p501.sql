--p501 패키지 생성하기
create or replace package pkg_example
is
    spec_no number := 10;
    function func_aftertax(sal number) return number;
    procedure pro_emp(in_empno in emp.empno%type);
    procedure pro_dept(in_deptno in dept.deptno%type);
end;
/

--패키지 명세 확인하기 (user_source데이터 사전으로 조회)
select text
    from user_source
    where type = 'PACKAGE'
    and name = 'PKG_EXAMPLE';

--p502 패키지 명세 확인하기 (edsc 명령어로 조회)
desc pkg_example;

--p503 패키지 본문 생성하기
create or replace package body pkg_example
is
    body_no number := 10;
    
    function func_aftertax(sal number) return number
    is
        tax number := 0.05;
    begin
        return (round(sal - (sal * tax)));
    end func_aftertax;
    
    procedure pro_emp(in_empno in emp.empno%type)
    is
        out_ename emp.ename%type;
        out_sal emp.sal%type;
    begin
        select ename, sal into out_ename, out_sal
        from emp
        where empno = in_empno;
        
        dbms_output.put_line('ENAME : ' || out_ename);
        dbms_output.put_line('SAL : ' || out_sal);
    end pro_emp;
    
    procedure pro_dept(in_deptno in dept.deptno%type)
    is
        out_dname dept.dname%type;
        out_loc dept.loc%type;
    begin
        select dname, loc into out_dname, out_loc
        from dept
        where deptno = in_deptno;
        
        dbms_output.put_line('DNAME : ' || out_dname);
        dbms_output.put_line('LOC : ' || out_loc);
    end pro_dept;
end;
/

--p504 프로시저 오버로드하기
create or replace package pkg_overload
is
    procedure pro_emp(in_empno in emp.empno%type);
    procedure pro_emp(in_ename in emp.ename%type);
end;
/

--p505 패키지 본문에서 오버로드된 프로시저 작성하기
create or replace package body pkg_overload
is
    procedure pro_emp(in_empno in emp.empno%type)
    is
        out_ename emp.ename%type;
        out_sal emp.sal%type;
    begin
        select ename, sal into out_ename, out_sal
        from emp
        where empno = in_empno;
    
        dbms_output.put_line('ENAME : ' || out_ename);
        dbms_output.put_line('SAL : ' || out_sal);
    end pro_emp;
    
    procedure pro_emp(in_ename in emp.ename%type)
    is
        out_ename emp.ename%type;
        out_sal emp.sal%type;
    begin
        select ename, sal into out_ename, out_sal
        from emp
        where ename = in_ename;
        
        dbms_output.put_line('ENAME : ' || out_ename);
        dbms_output.put_line('SAL : ' || out_sal);
    end pro_emp;
end;
/

--p506 패키지에 포함된 서브프로그램 실행하기
set serveroutput on;

begin
    dbms_output.put_line('---pkg_example.func_aftertax(3000)--');
    dbms_output.put_line('atfer-tax : ' || pkg_example.func_aftertax(3000));
    
    dbms_output.put_line('---pkg_example.pro_emp(7788)--');
    pkg_example.pro_emp(7788);
    
    dbms_output.put_line('---pkg_example.pro_dept(10)--');
    pkg_example.pro_dept(10);
    
    dbms_output.put_line('---pkg_overload.pro_emp(7788)--');
    pkg_overload.pro_emp(7788);
    
    dbms_output.put_line('---pkg_overload.pro_emp(7788)--');
    pkg_overload.pro_emp('SCOTT');
end;
/

--p507 패키지 삭제
drop package pkg_overload;
drop package body pkg_overload;

--p510 emp_trg 테이블 생성하기
create table emp_trg
    as select * from emp;

select * from emp_trg;

--p511 dml실행 전에 수행할 트리거 생성
create or replace trigger trg_emp_nodml_weekend
before
insert or update or delete on emp_trg
begin
    if to_char(sysdate, 'DY') in ('토', '일') then
        if inserting then
            raise_application_error(-20000, '주말 사원정보 추가 불가');
        elsif updating then
            raise_application_error(-20001, '주말 사원정보 수정 불가');
        elsif deleting then
            raise_application_error(-20002, '주말 사원정보 삭제 불가');
        else
            raise_application_error(-20003, '주말 사원정보 변경 불가');
        end if;
    end if;
end;
/

--트리거는 excute또는 pl/sql로 실행할 수 없다.
--트리거는 이벤트 실행시 동작한다.(insert, update, delete)

--p512 emp_trg 테이블 update하기
update emp_trg
set sal = 3500
where empno = 7788;

--emp_trg_log 테이블 생성하기
create table emp_trg_log(
    tablename varchar2(10),
    dml_type varchar2(10),
    empno number(4),
    user_name varchar2(30),
    change_date date
);

--p513 DML 실행 후 수행할 트리거 생성하기
create or replace trigger trg_emp_log
after
insert or update or delete on emp_trg
for each row

begin
    if inserting then
        insert into emp_trg_log
        values('EMP_TRG', 'INSERT', : new.empno, sys_context('USERENV', 'SESSION_USER'), sysdate);
    
    elsif updating then
        insert into emp_trg_log
        values('EMP_TRG', 'UPDATE', : old.empno, sys_context('USERENV', 'SESSION_USER'), sysdate);
        
    elsif deleting then
        insert into emp_trg_log
        values('EMP_TRG', 'UPDATE', : old.empno, sys_context('USERENV', 'SESSION_USER'), sysdate);
    end if;
end;
/

select * from emp_trg;

--p514 emp_trg 테이블에 insert실행하기
insert into emp_trg
values(9999, 'TestEmp', 'CLERK', 7788, to_date('2018-03-03', 'YYYY-MM-DD'), 1200, null, 20);

commit;

--p515 emp_tgr 테이블의 insert확인하기
select * from emp_trg;

--emp_tgr_log 테이블의 insert 기록 확인하기
select * from emp_trg_log;

--emp_trg 테이블에 update 실행하기
update emp_trg
set sal = 1300
where mgr = 7788;

commit;

--p517  user_triggers로 트리거 정보 조회하기
select trigger_name, trigger_type, triggering_event, table_name, status
from user_triggers;

--트리거 변경
alter trigger TRG_EMP_LOG enable;
alter trigger TRG_EMP_LOG disable;

--특정 테이블과 관련된 모든 트리거의 상태 활성화 및 비활성화
alter table emp_trg enable all triggers;
alter table emp_trg disable all triggers;

--트리거 삭제
--drop trigger trg_emp_log;