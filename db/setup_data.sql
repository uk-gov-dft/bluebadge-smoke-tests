psql -q -h localhost -U developer -d bb_dev -c "
set search_path=usermanagement;
insert into roles (id,description) values (2, 'ADMIN');"
