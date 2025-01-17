--p365
select * from tabs;

create table table_notnull2(
    login_id varchar2(20) constraint tablenn2_lgnid_nn NOT NULL,
    login_pwd varchar2(20) constraint tablenn2_lgnpw_nn NOT NULL,
    tel varchar2(20)
);

desc user_constraints;

select owner, constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'TABLE_NOTNULL2';

--p368
alter table table_notnull2
modify(tel constraint tablenn2_tel_nn NOT NULL);

alter table table_notnull2
rename constraint tablenn2_tel_nn to tblnn2_tel_nn;

alter table table_notnull2
drop constraint tblnn2_tel_nn;

--p370 unique

create table table_unique(
    login_id varchar2(20) unique,
    login_pwd varchar2(20) NOT NULL,
    tel varchar2(20)
);

desc table_unique;

select owner, constraint_name, constraint_type, table_name
from user_constraints
where table_name = 'TABLE_UNIQUE';

insert into table_unique(login_id, login_pwd, tel) values ('ID01', 'PW01', '010-1234-5678');
insert into table_unique(login_id, login_pwd, tel) values ('ID02', 'PW02', '010-1234-5678');
insert into table_unique(login_id, login_pwd, tel) values (null, 'PW03', '010-1234-5678');
insert into table_unique(login_id, login_pwd, tel) values ('ID03', 'PW03', '010-1234-5678');

select * from table_unique;

delete
from table_unique
where login_id is null;


alter
table table_unique
modify(login_id not null);