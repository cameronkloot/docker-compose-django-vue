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
