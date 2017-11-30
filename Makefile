ipconfig:
	sudo ifconfig lo0 alias 10.200.10.1/24

build:
	docker-compose build

build-up:
	docker-compose build && docker-compose up

build-upd:
	docker-compose build && docker-compose up -d

up:
	docker-compose up

upd:
	docker-compose up -d

start:
	docker-compose start

stop:
	docker-compose stop

reload:
	docker-compose stop && docker-compose build && docker-compose up -d

bash-nginx:
	docker exec -it app_name_nginx bash

bash-api:
	docker exec -it app_name_api bash

bash-client:
	docker exec -it app_name_client bash

bash-db:
	docker exec -it app_name_db bash

log-nginx:
	docker-compose logs -f nginx

log-api:
	docker-compose logs -f api

log-client:
	docker-compose logs -f client

collectstatic:
	docker exec app_name_api /bin/sh -c "python manage.py collectstatic --noinput"

migrations:
	docker exec app_name_api /bin/sh -c "python manage.py makemigrations"

migrations-no:
	docker exec app_name_api /bin/sh -c "python manage.py makemigrations --noinput"

migrate:
	docker exec app_name_api /bin/sh -c "python manage.py migrate"

migrate-no:
	docker exec app_name_api /bin/sh -c "python manage.py migrate --noinput"


drma:
	docker-compose down --volumes --rmi all
