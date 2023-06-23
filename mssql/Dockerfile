FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Pa55word
ENV MSSQL_PID=Developer
ENV MSSQL_TCP_PORT=1433

WORKDIR /data
COPY . /data

RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" && \
     /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Pa55word -i login.sql && \
     /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Pa55word -i schema.sql && \
     /opt/mssql-tools/bin/sqlcmd -S localhost -U doytowin -P Pa55word -i data.sql

EXPOSE 1433

#CMD /opt/mssql/bin/sqlservr
