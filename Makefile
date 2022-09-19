start:
	docker-compose up -d

restart:
	docker-compose down
	docker-compose up -d

stop:
	docker-compose down

upgrade:
	docker-compose down
	make sources.update
	docker-compose pull
	docker-compose up -d

sources.get:
#	git clone --depth 1 --branch with_category https://github.com/krlls/iQbit_test.git ./qbittorrent/webgui/iqbit
	git clone --depth 1 https://github.com/ntoporcov/iQbit.git ./data/qbittorrent/webgui/iqbit

sources.update:
	rm -rf ./data/qbittorrent/webgui/iqbit && make sources.get

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
