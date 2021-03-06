# App Name

### Setup

Alias localhost to custom IP address

```
sudo ifconfig lo0 alias 10.200.10.1/24
```

_The ifconfig command must be run again after computer restart_

Open Postgres install folder via toolbar icon preferences.  Open `pg_hba.conf` and add

```
host all all 10.200.10.1/24 trust
```

Open `postgresql.conf` and change this line

```
listen_addresses = 'localhost'
```

to this

```
listen_addresses = 'localhost,10.200.10.1'
```

Restart Postgres

### Environment

```
cp .env-sample .env
```

Host should be `10.200.10.1` as configured above.  Update db details

### Client

```
yarn global add vue-cli
vue init webpack client
```

### Run

Install <a href="https://docs.docker.com/engine/installation/" target="_blank">Docker</a>, <a href="https://docs.docker.com/compose/install/" target="_blank">Docker Compose</a>

```
docker-compose build
docker-compose up
```

Stop containers

```
docker-compose stop
```

Remove containers/volumns

```
docker-compose down
```

Check Makefile for additional commands


### Install Packages

Install packages on the api

```
docker exec -ti app_name_api bash
pip install package_name
pip freeze > requirements.txt
```

Install packages with npm or yarn in the normal fashion within the client folder (on host machine or in container bash).

### Disclaimer

This setup hasn't been configured for production yet.
