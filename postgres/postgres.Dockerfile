FROM postgres:16.8

ENV POSTGRES_DB=home
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=passw0rd

COPY dump.sql /docker-entrypoint-initdb.d/