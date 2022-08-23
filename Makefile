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

sources.get:
	git clone https://github.com/ntoporcov/iQbit.git ./qbittorrent/webgui/iqbit

sources.update:
	cd ./qbittorrent/webgui/iqbit && git fetch && git reset --hard origin/master

help:
	@echo 'Запуск: make start'
	@echo 'Остановка: make stop'
	@echo 'Перезагрузка: make restart'
	@echo 'Обновление инфраструктуры: make upgrade'
	@echo 'Обновить ресурсы: make sources.update'
	@echo 'Загрузить ресурсы: make sources.get'

bind.start:
	docker-compose -f docker-compose-bind.yaml up -d

bind.restart:
	docker-compose -f docker-compose-bind.yaml down
	docker-compose -f docker-compose-bind.yaml up -d
