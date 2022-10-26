# See:
# http://www.gnu.org/software/make/manual/make.html
# http://linuxlib.ru/prog/make_379_manual.html

# Set shell interpreter
SHELL := /bin/bash

mysql:
	docker exec -it mf-db mysql --user=root --password=mf

db-back:
	docker exec -i mf-db mysql --user=root --password=mf -e "create database back;"
	docker exec -i mf-db mysql --user=root --password=mf -e "create user 'back'@'%' identified by 'back';"
	docker exec -i mf-db mysql --user=root --password=mf -e "grant all privileges on back.* to 'back'@'%';"

db-test:
	docker exec -i mf-db mysql --user=root --password=mf -e "create database test;" 
	docker exec -i mf-db mysql --user=root --password=mf -e "create user 'test'@'%' identified by 'test';"
	docker exec -i mf-db mysql --user=root --password=mf -e "grant all privileges on test.* to 'test'@'%';"

db: db-back db-test

start:
	docker-compose up -d

stop:
	docker-compose down

restart: stop start
