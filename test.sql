--Q1
--1번
desc dept;

--2번
desc emp;

--3번
desc salgrade;

--4번
select * from dept;
select * from emp;
select * from salgrade;

--Q2
--1~3번
select ename, upper(ename), lower(ename), initcap(ename) from emp;

--Q3
--1~3번
select deptno, job, avg(sal)
from emp
group by deptno, job --각 부서의 직책별
    having avg(sal) >= 2000 --평균 급여가 2000 이상인 그룹을
order by deptno, job; --보기 편하게 부서와 직책별로 오름차순 정렬

--Q4
--1~2번
select *
from emp
where sal in (
    select max(sal)
    from emp
    group by deptno
)
order by deptno;

--Q5
--1번
create table DEPTSEQ
    as select * from DEPT
where 1<>1;

select * from deptseq;

--2번
create sequence deptseq_sequence --deptseq_sequence이름을 가진 시퀀스 생성
    increment by 1 -- 부서 번호의 시작 값: 1
    start with 1 -- 부서 번호의 증가: 1
    maxvalue 99 -- 부서 번호의 최대값: 99
    minvalue 1 -- 부서 번호의 최소값: 1
    nocycle -- 부서 번호 최대값에서 생성 중단
    nocache; -- 캐시 없음

select * from user_sequences;

--3번
insert into deptseq (deptno, dname, loc)
values (deptseq_sequence.nextval, 'DATABASE', 'SEOUL');

insert into deptseq (deptno, dname, loc)
values (deptseq_sequence.nextval, 'WEB', 'BUSAN');

insert into deptseq (deptno, dname, loc)
values (deptseq_sequence.nextval, 'MOBILE', 'ILSAN');

select *
from deptseq;