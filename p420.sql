set serveroutput on;

--DECLEAER (생략)

begin
    dbms_output.put_line('Hello, PL/SQL!출력');
end;
/


desc emp;

--p421
set serveroutput on; --화면에 출력하는 함수 사용 설정(put_line())


declare --선언부 (변수, 상수, 커서를 선언하는 영역)
v_empno constant number(4):= 7788; --타입 = number, 길이 = 4, 값 = 7788인 변수 v_empno선언 (변수 선언 및 초기화)
-- constant는 선언부에만 가능하며, 초기화를 하지 않으면 오류가 발생한다.
v_ename /*constant*/ varchar2(10); --타입 = varchar2, 길이 = 10인 변수 v_ename 선언 (변수 선언)
begin -- 실행부
v_ename := 'SCOTT';
dbms_output.put_line('v_empno: ' || v_empno);
dbms_output.put_line('v_ename: ' || v_ename);
end ;
/ --작성한 명령문을 실행한다.

--p425 변수의 default지정
set serveroutput on; --화면에 출력하는 함수 사용 설정(put_line())

declare --선언부 (변수, 상수, 커서를 선언하는 영역)
v_empno number(4) default 7788; --타입 = number, 길이 = 4, 기본값 = 7788인 변수 v_empno선언 (변수 선언 및 초기화)
-- default는 기본값일 뿐 실행부에서 값을 변경할 수 있다.
begin -- 실행부
v_empno := 1111;
dbms_output.put_line('v_empno: ' || v_empno);
end ;
/ --작성한 명령문을 실행한다.


--p426 변수의 not null 설정하고 값 대입 출력
set serveroutput on; --화면에 출력하는 함수 사용 설정(put_line())

declare --선언부 (변수, 상수, 커서를 선언하는 영역)
v_empno number(4) not null := 7788; --타입 = number, 길이 = 4, 초기값 = 7788인 변수 v_empno선언 (변수 선언 및 초기화)
-- not null은 항상 초기값이 있어야한다.
-- default 사용 가능

begin -- 실행부
v_empno := 1111;
dbms_output.put_line('v_empno: ' || v_empno);
end ;
/ --작성한 명령문을 실행한다.

--rownum

select rownum, deptno
from dept;

--p429
declare
    v_dept_row dept%rowtype; -- %rowtype 사용, 주의할 점: 값을 지정할 수 없다
begin
    select deptno, dname, loc into v_dept_row
    from dept
    where deptno = 40;
dbms_output.put_line('DEPTNO: ' || v_dept_row.deptno);
dbms_output.put_line('DNAME: ' || v_dept_row.dname);
dbms_output.put_line('LOC: ' || v_dept_row.loc);
end;
/

--p432 if ~ then ~ else 사용
declare
    v_number number := 13; --변수 선언 및 초기화
begin
    if mod(v_number, 2) = 1 then
        dbms_output.put_line('v_number는 ' || v_number ||'(홀수)입니다.');
    else
        dbms_output.put_line('v_number는 ' || v_number ||'(짝수)입니다.');
    end if;
end;
/

--p436 case문 사용
set serveroutput on;

declare
    v_score number := 87;
begin
    case trunc(v_score / 10)
        when 10 then dbms_output.put_line('A학점');
        when 9 then dbms_output.put_line('A학점');
        when 8 then dbms_output.put_line('B학점');
        when 7 then dbms_output.put_line('C학점');
        when 6 then dbms_output.put_line('D학점');
        else dbms_output.put_line('F학점');
    end case;
end;
/

--p437 case문 사용
set serveroutput on;

declare
    v_score number := 87;
begin
    case
        when v_score >= 90 then dbms_output.put_line('A학점');
        when v_score >= 80 then dbms_output.put_line('B학점');
        when v_score >= 70 then dbms_output.put_line('C학점');
        when v_score >= 60 then dbms_output.put_line('D학점');
        else dbms_output.put_line('F학점');
    end case;
end;
/

set serveroutput on;

declare
    v_num number := 0;
begin
    loop
        dbms_output.put_line('v_num: ' || v_num);
        v_num := v_num + 1;
        exit when v_num >= 4;
    end loop;
end;
/


--p439 기본 LOOP와 exit when 대신 exit 사용
set serveroutput on;

declare
    v_num number := 0;
begin
    loop
        dbms_output.put_line('v_num: ' || v_num);
        v_num := v_num + 1;
        if v_num >= 4 then
            exit;
        end if;
    end loop;
end;
/

--p440 while loop 사용
set serveroutput on;

declare
    v_num number := 0;
begin
    while v_num < 4 loop
        dbms_output.put_line('v_num: ' || v_num);
        v_num := v_num + 1;
    end loop;
end;
/

--p441 for loop 사용
set serveroutput on;

begin
    for i in 0..4 loop
        dbms_output.put_line('i: ' || i);
    end loop;
end;
/

begin
    for i in reverse 0..4 loop
        dbms_output.put_line('i: ' || i);
    end loop;
end;
/

begin
    for i in 0..10 loop
        continue when mod(i, 2) = 1;
        dbms_output.put_line('i: ' || i);
    end loop;
end;
/

--Q1
set serveroutput on;

declare
begin
    for i in 1..10 loop
        continue when mod (i, 2) = 0;
        dbms_output.put_line('현재 i의 값 : ' || i);
    end loop;
end;
/

--Q2
set serveroutput on;

declare
v_deptno dept.deptno%type := 50; --참조타입 선언 및 초기화
begin
    case v_deptno 
            when 10 then dbms_output.put_line('DNAME : ACCOUNTING');
            when 20 then dbms_output.put_line('DNAME : RESEARCH');
            when 30 then dbms_output.put_line('DNAME : SELES');
        else
            dbms_output.put_line('DNAME : N/A');
    end case;    
end;
/

--%lowtype 사용
declare
v_deptno dept%rowtype; --테이블에서 참조 받는 참조타입 선언 및 초기화
begin
    select * into v_deptno
    from dept
    where deptno = 50;
    case
        when v_deptno.deptno = 10 then    
            dbms_output.put_line('DNAME : ' || v_deptno.dname);
        when v_deptno.deptno = 20 then    
            dbms_output.put_line('DNAME : ' || v_deptno.dname);
        when v_deptno.deptno = 30 then    
            dbms_output.put_line('DNAME : ' || v_deptno.dname);
        when v_deptno.deptno = 40 then    
            dbms_output.put_line('DNAME : ' || v_deptno.dname);
        else
            dbms_output.put_line('DNAME : N/A');
    end case;
end;
/

declare
v_deptno dept%rowtype; --참조타입 선언 및 초기화
v_number number(2) := 20;
begin
    if v_number in (10, 20, 30, 40) then
        select * into v_deptno
        from dept
        where deptno = v_number;
        dbms_output.put_line('DNAME : ' || v_deptno.dname);
    else
        dbms_output.put_line('DNAME : N/A');
    end if;
end;
/



declare
    v_deptno dept%rowtype; -- 참조타입 변수 선언
    v_number number(2) := 50; -- 테스트용 값
begin
    if v_number in (10, 20, 30, 40) then
        begin
            select * into v_deptno
            from dept
            where deptno = v_number;
        exception
            when no_data_found then -- 데이터가 없으면 v_deptno의 값들을 초기화하거나 NULL을 설정
                v_deptno.deptno := NULL;
        end;

        -- 데이터가 존재하는지 확인
        if v_deptno.deptno is not null then
            dbms_output.put_line('DNAME : ' || v_deptno.dname);
        else
            dbms_output.put_line('DNAME : N/A'); -- 데이터가 없을 경우 출력
        end if;
    else
        dbms_output.put_line('DNAME : N/A');
    end if;
end;
/










