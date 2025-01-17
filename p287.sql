create table CHAP10HW_DEPT as select * from DEPT;
create table CHAP10HW_EMP as select * from EMP;
create table CHAP10HW_SALGRADE as select * from SALGRADE;

--Q1 CHAP10_DEPT 테이블에 50, 60, 70, 80번 부서를 등록하는 SQL문 작성
select * from CHAP10HW_DEPT;

insert into CHAP10HW_DEPT (deptno, dname, loc) values (50, 'ORACLE', 'BUSAN');
insert into CHAP10HW_DEPT (deptno, dname, loc) values (60, 'SQL', 'ILSAN');
insert into CHAP10HW_DEPT (deptno, dname, loc) values (70, 'SELECT', 'INCHEON');
insert into CHAP10HW_DEPT (deptno, dname, loc) values (80, 'DML', 'BUNDANG');

rollback;

--Q2 CHAP10_EMP 테이블에 8명의 사원 정보를 등록하는 SQL문 작성
select * from CHAP10HW_EMP;

insert into CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (1201, 'Test_USER1', 'MANAGER', 7788, '2016/01/02', 4500, NULL, 50);
insert into CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (1202, 'Test_USER2', 'CLERK', 7201, '2016/02/21', 1800, NULL, 50);
insert into CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (1203, 'Test_USER3', 'ANALYST', 7201, '2016/04/11', 3400, NULL, 60);
insert into CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (1204, 'Test_USER4', 'SALESMAN', 7201, '2016/05/31', 2700, 300, 60);
insert into CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (1205, 'Test_USER5', 'CLERK', 7201, '2016/07/20', 2600, NULL, 70);
insert into CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (1206, 'Test_USER6', 'CLERK', 7201, '2016/09/08', 2600, NULL, 70);
insert into CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (1207, 'Test_USER7', 'LECTURER', 7201, '2016/10/28', 2300, NULL, 80);
insert into CHAP10HW_EMP (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (1208, 'Test_USER8', 'STUDENT', 7201, '2018/03/09', 1200, NULL, 80);

commit;

--Q3 CHAP10_EMP 테이블에 속한 사원 중 50번 부서에 근무하는 사원들의 평균 급여보다 많은 급여를 받고 있는 
--사원들을 70번 부서로 옮기는 SQL문 작성
select deptno, avg(sal)
from CHAP10HW_EMP
group by deptno
order by deptno;

update CHAP10HW_EMP
set deptno = 70
where sal > (
    select avg(sal)
    from CHAP10HW_EMP
    where deptno = 50
);

--Q4 CHAP10_EMP 테이블에 속한 사원 중 60번 부서의 사원중에 입사일이 가장 빠른 사원보다 늦게 입사한
--사원들의 급여를 10% 인상하고 80번 부서로 옮기는 SQL문 작성
select * from chap10hw_emp;

select empno, ename, hiredate
from CHAP10HW_EMP
where deptno = 60;

update CHAP10HW_EMP
set sal = sal * 1.1, deptno = 80
where hiredate > (
    select min(hiredate)
    from CHAP10HW_EMP
    where deptno = 60
);

--Q5 CHAP10_EMP 테이블에 속한 사원 중 급여 등급이 5인 사원을 삭제하는 SQL문 작성
select * from salgrade
where grade = 5;

delete
from CHAP10HW_EMP
where empno in(
    select e.empno
    from chap10hw_emp e, chap10hw_salgrade s
    where e.sal between s.losal and s.hisal and s.grade = 5
);