--p484 프로시저 사용
create or replace procedure pro_noparam
is --declare(저장되지 않는 pl/sql(1회용) 대신 선언하는 선언부, 즉 declare를 쓰지 않는다. is는 저장되는 pl/sql이다.)
    v_empno number(4) := 7788;
    v_ename varchar2(10);
begin
    v_ename := 'SCOTT';
    dbms_output.put_line('v_empno : ' ||v_empno);
    dbms_output.put_line('v_ename : ' ||v_ename);

end;
/

--생성환 프로시저 실행하기
set serverout on;
execute pro_noparam;

--p485 익명 블록에서 프로시저 실행하기
begin
    pro_noparam;
end;
/

--user_source를 통해 프로시저 확인하기
desc user_source;

select *
from user_source
where name = 'PRO_NOPARAM' and type = 'PROCEDURE';

--p486 프로시저 삭제하기
drop procedure pro_noparam;

--p488 프로시저에 파라미터 지정하기
set serveroutput on;

create or replace procedure pro_param_in(
    param1 in number,
    param2 number,
    param3 number := 3,
    param4 number default 4
)
is

begin
    dbms_output.put_line('param1 : ' || param1);
    dbms_output.put_line('param2 : ' || param2);
    dbms_output.put_line('param3 : ' || param3);
    dbms_output.put_line('param4 : ' || param4);

end;
/

--파라미터를 입력하여 프로시저 사용하기
execute pro_param_in(1, 2, 9, 8);

--p489 기본값이 지정된 파라미터 입력을 제외하고 프로시저 사용하기
execute pro_param_in(1, 2);

--실행에 필요한 개수보다 적은 파라미터를 입력하여 프로시저 실행하기
execute pro_param_in(1);

--p490 파라미터 이름을 활용하여 프로시저에 값 입력하기
execute pro_param_in(param1 => 10, param2 => 20);

--OUT 모드 파라미터
create or replace procedure pro_param_out(
    in_empno in emp.empno%type,
    out_ename out emp.ename%type,
    out_sal out emp.sal%type
)
is

begin
    select ename, sal into out_ename, out_sal
    from emp
    where empno = in_empno;

end pro_param_out;
/

--p491 out모드 파라미터 사용하기
select *
from emp;

declare
    v_ename emp.ename%type;
    v_sal emp.sal%type;
begin
    pro_param_out(7788, v_ename, v_sal);
    
    dbms_output.put_line('ENAME : ' || v_ename);
    dbms_output.put_line('SAL : ' || v_sal);

end;
/

--in out 모드 파라미터
create or replace procedure pro_param_inout(
    inout_no in out number
)
is

begin
    inout_no := inout_no * 2;

end pro_param_inout;
/

--p492 in out 모드 파라미터 사용하기
declare
    no number;
begin
    no := 5;
    pro_param_inout(no);
    
    dbms_output.put_line('no : ' ||no);
end;
/

--생성할 때 오류가 발생하는 프로시저 알아보기
create or replace procedure pro_err
is
    err_no number;
begin
    err_no = 100;
    dbms_output.put_line('err_no : ' || err_no);
end pro_err;
/

--show errors 명령어로 오류 확인하기
show errors;
show err procedure pro_err;
show err procedure pro_param_inout;

--p494 user_errors로 오류 확인
select *
from user_errors
where name = 'PRO_ERR';

--p497 함수 생성하기
create or replace function func_aftertax(
    sal in number
)
return number
is
    tax number := 0.05;
begin
    return(round(sal - (sal * tax)));
end func_aftertax;
/

--함수 사용하기
set serveroutput on;

declare
    aftertax number;
begin
    aftertax := func_aftertax(3000);
    dbms_output.put_line('after-tax incom : ' || aftertax);
end;
/

--p498sql에서 함수 사용하기
select func_aftertax(3000)
from dual;

--함수에 테이블 데이터 사용하기
select empno, ename, sal, func_aftertax(sal) as aftertax
from emp;

--함수 삭제하기
drop function func_aftertax;