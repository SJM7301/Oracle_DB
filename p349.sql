--시퀀스
create table dept_sequence
as
select * from dept
where 1 = 0;

create sequence seq_dept
increment by 10
start with 10
maxvalue 90
minvalue 0
cycle 
cache 2;

select *
from user_sequences;

select * from tabs;

insert into dept_sequence(deptno, dname, loc) values(seq_dept.nextval, 'DATABASE', 'SEOUL');
select * from dept_sequence;

select seq_dept.currval --현재 시퀀스 번호
from dual;

select seq_dept.nextval --다음 시퀀스 번호
from dual;

alter SEQUENCE seq_dept
increment by 1
maxvalue 9
cycle;

drop SEQUENCE seq_dept;

--동의어 사용
create synonym e
for emp;

select * from e;

drop synonym e;

select * from emp;

--Q1
select * from empidx;

create table empidx
as
select * from emp;

create index idx_empidx_empno
on empidx(empno);

select * from user_indexes;

select * from user_indexes
where index_name = 'IDX_EMPIDX_EMPNO';

--Q2
create or replace view empidx_over15k
as
select empno, ename, job, deptno, sal, nvl2(comm, 'O', 'X') as comm
from empidx
where sal > 1500
order by empno asc;

select * from empidx_over15k;

--Q3
create table deptseq
as
select * from dept;

create sequence seq_deptseq
increment by 1
start with 1
maxvalue 99
minvalue 1
nocycle 
nocache;

insert into deptseq(deptno, dname, loc) values(seq_deptseq.nextval, 'DATABASE', 'SEOUL');
insert into deptseq(deptno, dname, loc) values(seq_deptseq.nextval, 'WEB', 'BUSAN');
insert into deptseq(deptno, dname, loc) values(seq_deptseq.nextval, 'MOBILE', 'ILSAN');

select * from deptseq;


















