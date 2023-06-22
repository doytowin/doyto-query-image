FROM mysql:8-oracle

COPY privileges.sql /docker-entrypoint-initdb.d/1.sql
COPY schema.sql /docker-entrypoint-initdb.d/2.sql
COPY data.sql /docker-entrypoint-initdb.d/3.sql

ADD my.cnf /etc/mysql/conf.d

EXPOSE 3306
