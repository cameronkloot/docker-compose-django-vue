FROM python:3.5
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -yf gunicorn postgresql-client

ENV APP_ROOT /src

WORKDIR ${APP_ROOT}

COPY . ${APP_ROOT}

RUN pip install -r src/requirements.txt

COPY ./config/scripts/api-entrypoint.sh /var/lib/api/api-entrypoint.sh
RUN chmod +x /var/lib/api/api-entrypoint.sh
