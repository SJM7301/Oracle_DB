show user;
ALTER SESSION SET"_ORACLE_SCRIPT"=true;

--사용자와 객체 모두 삭제하기
drop user orclstudy cascade;


select * from dba_objects
where owner in ('SCOTT');

drop user scott cascade;

create user scott identified by 1111;
grant dba to scott;

