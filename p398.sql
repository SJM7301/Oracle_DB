ALTER SESSION SET "_ORACLE_SCRIPT"=true;

--SCOTT 계정으로 사용자 만들기
create user orclstudy
identified by 1111;

show user;

--orclstudy 사용자에 대한 세션 생성
grant create session to orclstudy;

desc all_users;

select * from all_users
where username in('SYSTEM', 'SCOTT', 'ORCLSTUDY');

desc dba_users;

select * from dba_users;

select * from dba_users
where username in('SYSTEM', 'SCOTT', 'ORCLSTUDY');

desc dba_objects;

select * from dba_objects;

select * from dba_objects
where owner in('SCOTT', 'ORCLSTUDY');

show user;

alter user orclstudy
identified by 2222;

drop user orclstudy cascade;

































