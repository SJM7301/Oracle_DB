show user;
ALTER SESSION SET"_ORACLE_SCRIPT"=true;

--사용자 생성
create user orclstudy
identified by 1111;

--세션 연결 권한 설정
grant create session to orclstudy;

--사용자와 객체 모두 삭제하기
drop user orclstudy cascade;


select * from dba_objects
where owner in ('SCOTT');

drop user scott cascade;

create user scott identified by 1111;
grant dba to scott;

--권한 실습에 사용할 테이블 생성
create table temp(
    col1 varchar(20),
    col2 varchar(20)
);

insert into temp values('col1', 'col2');

desc temp;
select * from temp;

grant select
on temp to orclstudy;

grant select, insert --객체 권한 생성
on temp to orclstudy;

revoke select, insert --객체 권한 취소
on temp from orclstudy;

--role 생성과 권한 부여
create role rolestudy; --롤 생성
drop role rolestudy; --롤 삭제

grant connect, resource
to rolestudy; --2가지 (connect, resource) 권한을 롤에 부여

grant rolestudy to orclstudy;

desc user_sys_privs;
select * from user_sys_privs;

commit;



select * from dba_role_privs
where GRANTEE = 'SCOTT';  -- 사용자 권한 확인


select * from dba_role_privs
where GRANTEE = 'ORCLSTUDY';

select * from role_sys_privs
where role='CONNECT'; --롤 정보 확인

select * from role_sys_privs
where role='RESOURCE';--롤 정보 확인

select * from role_sys_privs
where role='DBA';--롤 정보 확인

