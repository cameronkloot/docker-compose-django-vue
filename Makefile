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

shell-nginx:
	docker exec -ti app_name_nginx bash

shell-api:
	docker exec -ti app_name_api bash

shell-client:
	docker exec -ti app_name_client bash

shell-db:
	docker exec -ti app_name_db bash

log-nginx:
	docker-compose logs -f nginx

log-api:
	docker-compose logs -f api

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
