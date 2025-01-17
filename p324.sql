select * from emp_hw;
--Q1
create table EMP_HW
as
select * from emp
where 1 = 0;

select * from tabs;

desc emp_hw;

--Q1
alter
table EMP_HW
add BIGO varchar2(20);

--Q3
alter
table EMP_HW
modify BIGO varchar2(30);

--Q4
alter
table EMP_HW
rename column bigo to remark;

--Q5
insert into EMP_HW
select empno, ename, job, mgr, hiredate, sal, comm, deptno, null from emp;

--Q6
drop table emp_hw;

select * from tabs;