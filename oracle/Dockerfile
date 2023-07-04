FROM gvenzl/oracle-xe:18-slim

ENV ORACLE_SID=XE
ENV ORACLE_PASSWORD=oracle

COPY user.sql /container-entrypoint-initdb.d/1.sql
COPY schema.sql /container-entrypoint-initdb.d/2.sql
COPY data.sql /container-entrypoint-initdb.d/3.sql

EXPOSE 1521
