FROM python:3.5
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -yf gunicorn postgresql-client

ENV APP_ROOT /src

RUN mkdir /config
COPY config/requirements.txt /config/
RUN pip install -r /config/requirements.txt

WORKDIR ${APP_ROOT}

COPY . ${APP_ROOT}

COPY ./config/scripts/api-entrypoint.sh /var/lib/api/api-entrypoint.sh
RUN chmod +x /var/lib/api/api-entrypoint.sh
