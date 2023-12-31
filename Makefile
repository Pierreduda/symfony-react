SHELL := /bin/bash

DOCKER = docker compose exec
BACKEND = php
FRONT = node
DB = database
DB_NAME = db_name

# CONFIG
install:
	$(DOCKER) $(BACKEND) composer install
update:
	$(DOCKER) $(BACKEND) composer update
%:
	$(DOCKER) $(BACKEND) php bin/console make:$@
migrate:
	$(DOCKER) $(BACKEND) php bin/console doctrine:migrations:migrate
generate:
	$(DOCKER) $(BACKEND) php bin/console doctrine:migrations:generate
watch:
	$(DOCKER) $(FRONT) yarn encore dev --watch

build:
	$(DOCKER) $(FRONT) yarn encore dev
up:
	$(DOCKER) compose up -d
cc:
	$(DOCKER) $(BACKEND) php bin/console c:c
ddb:
	$(DOCKER) $(BACKEND) php bin/console doctrine:database:create
init:
	docker compose run --rm --no-deps $(FRONT) bash -ci 'yarn install'
	docker compose up -d
	make update
	make ddb
	make migrate

cs-fixer:
	tools/php-cs-fixer/vendor/bin/php-cs-fixer fix src