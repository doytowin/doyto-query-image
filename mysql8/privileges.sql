create database `doytowin`;
create user 'doytowin'@'%' identified by 'doytowin';
grant all on doytowin.* to 'doytowin'@'%' with grant option;
flush privileges;
