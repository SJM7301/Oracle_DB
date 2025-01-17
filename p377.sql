--primary key(unique + not null), 테이블 당 하나만 설정 가능, 자동으로 인덱스가 추가 설정된다.

create table table_pk(
    login_id varchar2(20) primary key,
    login_pw varchar2(20) not null,
    tel varchar2(20)
);

select owner, constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'TABLE_PK';

--인덱스 생성 확인
desc user_indexes;

select index_name, index_type, table_name
from user_indexes
where table_name = 'TABLE_PK';

insert into table_pk(login_id, login_pw, tel) values ('ID01', 'PW01', '010-1234-5678');
insert into table_pk(login_id, login_pw, tel) values ('ID02', 'PW02', '010-1234-5678');

--p381
create table table_cons_name1(
    login_id varchar2(20) constraint tbl_cons_name_pk primary key,
    login_pw varchar2(20) not null,
    tel varchar2(20)
);

select owner, constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'TABLE_CONS_NAME1';


create table table_pk_name2(
    login_id varchar2(20),
    login_pw varchar2(20) not null,
    tel varchar2(20),
    primary key(login_id),
    constraint tbl_cons_name_unique unique(login_pw)
);

select owner, constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'TABLE_CONS_NAME2';

--p382 foreign key(외래키, 외부키)
select * from tabs;

desc dept;

desc user_constraints;

--dept 테이블에 제약조건 이름 pk_dept지정
select owner, constraint_name, constraint_type, table_name, r_owner, r_constraint_name
from user_constraints
where table_name in ('EMP', 'DEPT');

alter
table dept
rename constraint SYS_C007433 to pk_dept;

select *
from emp, dept
where emp.deptno = dept.deptno;

insert into emp values(7784, 'CLARK', 'MANAGER', 7839, '1981/06/09', 2450, null, 50);

select * from tabs;
select * from salgrade2;

drop table dept;

--p385 foreign key 지정하기
select owner, constraint_name, constraint_type, table_name, r_owner, r_constraint_name
from user_constraints
where table_name in ('EMP', 'DEPT');

create table emp_fk
as
select * from emp;

select owner, constraint_name, constraint_type, table_name, r_owner, r_constraint_name
from user_constraints
where table_name in ('EMP_FK');

desc emp_fk;

--p385 emp_fk테이블의 empno, deptno의 제약조건 변경
alter
table emp_fk
modify (empno constraint tbl_emp_fk primary key);

alter
table emp_fk
modify (deptno constraint empfk_deptno_fk references dept (deptno));

select owner, constraint_name, constraint_type, table_name, r_owner, r_constraint_name
from user_constraints
where table_name in ('EMP_FK');



select * from dept;

drop table emp_fk;

drop table dept;

delete from dept
where deptno = 10;

--p388 참조받는 자식까지 날리기
alter
table dept
modify(deptno CONSTRAINT fk_deptno REFERENCES emp(deptno) on delete cascade);

drop table emp;
drop table dept;

create table dept(
deptno number(2) primary key,
dname varchar2(20) not null,
loc varchar2(20));

create table emp(
empno number(4) primary key,
ename varchar2(10) not null,
job varchar2(20) not null,
mgr number(4),
hiredate date,
sal number(8),
comm number(8),
deptno number(2),
CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno) ON DELETE CASCADE);

insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATING', 'BOSTON');

insert into emp values(7369, 'SMITH', 'CLERK', 7902, '1980/12/17', 800, null, 20);
insert into emp values(7499, 'ALLEN', 'SALESMAN', 7698, '1981/02/20', 1600, 300, 30);
insert into emp values(7521, 'WARD', 'SALESMAN', 7698, '1981/02/22', 1250, 500, 30);
insert into emp values(7566, 'JONES', 'MANAGER', 7839, '1981/04/02', 2975, null, 20);
insert into emp values(7654, 'MARTIN', 'SALESMAN', 7698, '1981/09/28', 1250, 1400, 30);
insert into emp values(7698, 'BLAKE', 'MANAGER', 7839, '1981/05/01', 2850, null, 30);
insert into emp values(7788, 'SCOTT', 'ANALYST', 7566, '1987/04/19', 3000, null, 20);
insert into emp values(7839, 'KING', 'PRESIDENT', null, '1981/11/17', 5000, null, 10);
insert into emp values(7844, 'TURNER', 'SALESMAN', 7698, '1981/09/08', 1500, 0, 30);
insert into emp values(7876, 'ADAMS', 'CLERK', 7788, '1987/05/23', 1100, null, 20);
insert into emp values(7900, 'JAMES', 'CLERK', 7698, '1981/12/03', 950, null, 30);
insert into emp values(7902, 'FORD', 'ANALYST', 7566, '1981/12/03', 3000, null, 20);
insert into emp values(7934, 'MILLER', 'CLERK', 7782, '1982/01/23', 1300, null, 10);
insert into emp values(7782, 'CLARK', 'MANAGER', 7839, '1981/06/09', 2450, null, 10);

commit;

select * from dept;
select * from emp;

delete
from dept
where deptno = 10;

rollback;