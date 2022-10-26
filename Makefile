# See:
# http://www.gnu.org/software/make/manual/make.html
# http://linuxlib.ru/prog/make_379_manual.html

# Set shell interpreter
SHELL := /bin/bash

psql:
	docker exec -it mf-db psql -U mf

db-back:
	docker exec -i mf-db psql -U mf mf -c "create database \"back\";"
	docker exec -i mf-db psql -U mf mf -c "create user \"back\" with encrypted password 'back';"
	docker exec -i mf-db psql -U mf mf -c "grant all privileges on database \"back\" to \"back\";"

db: 
	db-back

start:
	docker-compose up -d

stop:
	docker-compose down

restart: stop start
