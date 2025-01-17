--테이블의 제약 조건 확인
select owner, table_name, constraint_name, constraint_type
from user_constraints;

select * from tabs;

create table table_notnull(
    login_id varchar2(20) not null,
    login_pwd varchar2(20) not null,
    tel varchar2(20)
);

insert into table_notnull values('test_id_01', '1111', '010-1234-5678');
insert into table_notnull values('test_id_02', '1111', '010-1234-5678');

select * from table_notnull;

delete
from table_notnull
where login_id = 'test_id_02';

alter
table table_notnull
modify(tel null);

alter
table table_notnull
modify (tel CONSTRAINT tb_not_null_nn not null);