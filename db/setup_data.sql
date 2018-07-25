psql -q -h localhost -U developer -d bb_dev -c "
set search_path=usermanagement;
insert into local_authority_area (id) values (-1);
insert into local_authority (id,local_authority_area_id,name) values (2,-1,'Gotham City Council');
insert into roles (id,description) values (2, 'ADMIN');"
