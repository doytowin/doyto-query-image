FROM postgres:alpine3.17

ENV POSTGRES_USER=root
ENV POSTGRES_PASSWORD=Pa55word

COPY privileges.sql /docker-entrypoint-initdb.d/1.sql
COPY schema.sql /docker-entrypoint-initdb.d/2.sql
COPY data.sql /docker-entrypoint-initdb.d/3.sql

EXPOSE 5432
