start:
	docker-compose up -d

stop:
	docker-compose stop

restart:
	docker-compose restart

build:
	docker-compose stop
	docker-compose build
	docker-compose up -d
