.EXPORT_ALL_VARIABLES:
PROJECT_NAME=symfony-template
COMPOSE_PROJECT_NAME=symfony-template
COMPOSE_DEV_FILE="${PWD}/docker/compose.yaml"

DB_PORT=
DB_NAME=${PROJECT_NAME}
DB_USER=${PROJECT_NAME}
DB_PASSWORD=!123ChangeMePlease321!

build:
	docker compose -f ${COMPOSE_DEV_FILE} build --no-cache

run:
	docker compose -f ${COMPOSE_DEV_FILE} up -d

down: kill
	docker compose -f ${COMPOSE_DEV_FILE} down --remove-orphans

restart: down run

kill:
	docker compose -f ${COMPOSE_DEV_FILE} kill --remove-orphans

logs:
	docker compose -f ${COMPOSE_DEV_FILE} logs -f

ssh:
	docker compose -f ${COMPOSE_DEV_FILE} exec fpm bash
