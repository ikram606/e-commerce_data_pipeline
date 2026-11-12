
FROM apache/spark:3.5.6-python3

USER root

RUN pip install --no-cache-dir delta-spark==3.3.2 pandas
RUN curl -fSL \
    https://jdbc.postgresql.org/download/postgresql-42.7.8.jar \
    -o /opt/spark/jars/postgresql.jar
WORKDIR /app
