FROM mysql:8-oracle

# copy file into container
COPY setup.sh /mysql/setup.sh
COPY privileges.sql /mysql/privileges.sql
COPY schema.sql /mysql/schema.sql
COPY data.sql /mysql/data.sql

# exec these command when container start up
CMD ["sh", "/mysql/setup.sh"]
