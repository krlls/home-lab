start:
	docker-compose -f ./projects/docker-compose.yaml up -d

restart:
	make stop
	make start

stop:
	docker-compose -f ./projects/docker-compose.yaml down

upgrade:
	make stop
	make sources.update
	docker-compose -f ./projects/docker-compose.yaml pull
	make start

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
