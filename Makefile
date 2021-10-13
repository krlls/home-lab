start:
	docker-compose up -d

restart:
	docker-compose down
	docker-compose up -d

stop:
	docker-compose down

upgrade:
	docker-compose down
	docker-compose pull
	docker-compose up -d

help:
	@echo 'Запуск: make start'
	@echo 'Остановка: make stop'
	@echo 'Перезагрузка: make restart'
	@echo 'Обновление инфраструктуры: make update'

bind.start:
	docker-compose -f docker-compose-bind.yaml up -d

bind.restart:
	docker-compose -f docker-compose-bind.yaml down
	docker-compose -f docker-compose-bind.yaml up -d
