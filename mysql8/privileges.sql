
create database `doytowin` default character set utf8 collate utf8_general_ci;

create user 'doytowin'@'host' identified by 'doytowin';

grant all privileges on doytowin.* to 'doytowin'@'%' with grant option;

flush privileges;


