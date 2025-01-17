--p461
desc dept;

set serveroutput on;

declare
    v_dept_row dept%rowtype;
begin
    select * into v_dept_row
    from dept
    where deptno = 40;
    
    dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('DNAME : ' || v_dept_row.dname);
    dbms_output.put_line('LOC : ' || v_dept_row.loc);
end;
/

--p462 커서 사용 (단일행)
set serveroutput on;

declare
--커서 데이터를 입력할 변수 선언
    v_dept_row dept%rowtype;

--명시적 커서 선언
    cursor c1 is
        select *
        from dept
        where deptno = 40;

begin
--커서 열기(open)    
    open c1;

--커서로부터 읽어온 데이터 사용(fetch)
    fetch c1 into v_dept_row;
    
    dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('DNAME : ' || v_dept_row.dname);
    dbms_output.put_line('LOC : ' || v_dept_row.loc);
    
--커서 닫기(close)
    close c1;
    
end;
/

--p463 커서 loop (다중행)
select * from dept;

set serveroutput on;

declare
--커서 데이터를 입력할 변수 선언
    v_dept_row dept%rowtype;

--명시적 커서 선언
    cursor c1 is
        select *
        from dept;

begin
--커서 열기(open)    
    open c1;
    
    loop
--커서로부터 읽어온 데이터 사용(fetch)
    fetch c1 into v_dept_row;
    
--커서의 모든 행을 읽어오기 위해 %notfound 속성 지정
    exit when c1%notfound;
    
    dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno ||
                       ', DNAME : ' || v_dept_row.dname ||
                       ', LOC : ' || v_dept_row.loc);
    end loop;
    
--커서 닫기(close)
    close c1;
    
end;
/

--p465 커서 (FOR LOOP 다중행)
select * from dept;

set serveroutput on;

declare
--명시적 커서 선언
    cursor c1 is
        select *
        from dept;

begin
--커서 for loop 시작(자동 open, fetch, close)
    for c1_rec in c1 loop
    
    dbms_output.put_line('DEPTNO : ' || c1_rec.deptno ||
                       ', DNAME : ' || c1_rec.dname ||
                       ', LOC : ' || c1_rec.loc);
    end loop;
    
end;
/

--p467 커서에 파라미터 사용
set serveroutput on;

declare
    v_dept_row dept%rowtype;
    cursor c1(p_deptno dept.deptno%type) is
    select deptno, dname, loc
    from dept
    where deptno = p_deptno;

begin
    open c1(10);
        loop
            fetch c1 into v_dept_row;
            exit when c1%notfound;
            dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno ||
                       ', DNAME : ' || v_dept_row.dname ||
                       ', LOC : ' || v_dept_row.loc);
        end loop;
    close c1;
    
    open c1(20);
        loop
            fetch c1 into v_dept_row;
            exit when c1%notfound;
            dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno ||
                       ', DNAME : ' || v_dept_row.dname ||
                       ', LOC : ' || v_dept_row.loc);
        end loop;
    close c1;
end;
/

--p468 커서에 파라미터 사용
set serveroutput on;


declare
--사용자가 입력한 부서 번호를 저장하는 변수 선언
    v_deptno dept.deptno%type;
-- 명시적 커서 선언
    cursor c1(p_deptno dept.deptno%type) is
    select deptno, dname, loc
    from dept
    where deptno = p_deptno;

begin
--input_deptno 부서 번호 입력받고 v_deptno에 대입
    v_deptno := &input_deptno; -- 값 입력  대기
--커서 FOR LOOP 시작. c1 커서에 v_deptno를 대입
    for c1_rec in c1(v_deptno) loop
    
    dbms_output.put_line('DEPTNO : ' || c1_rec.deptno ||
        ', DNAME : ' || c1_rec.dname ||
        ', LOC : ' || c1_rec.loc);
    
    end loop;
end;
/

--p469 묵시적 커서
select * from tabs;
select * from dept;
select * from dept_record;
set serveroutput on;

declare

begin
    update dept_record
    set deptno = 70;
    
    dbms_output.put_line('갱신된 행의 수: ' || sql%rowcount);
    
    if(sql%found) then
        dbms_output.put_line('갱신된 행의 존재 여부: true');
    else
        dbms_output.put_line('갱신된 행의 존재 여부: false');
    end if;
    
    if(SQL%isopen) then
        dbms_output.put_line('커서의 OPEN 여부: true');
    else
        dbms_output.put_line('커서의 OPEN 여부: false');
    end if;

end;
/