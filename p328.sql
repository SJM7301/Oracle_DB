--dict 사용

select * from dict
where table_name like 'ALL%';

desc user_tables;

select table_name
from user_tables;

desc all_tables;

select owner, table_name
from all_tables;