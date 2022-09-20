start:
	node ./utils/startProjects.js

stop:
	node ./utils/stopProjects.js

component.start:
	node ./utils/startProject.js $(component)

component.stop:
	node ./utils/stopProject.js $(component)

component.upgrade:
	make component.stop component=$(component)
	node ./utils/pullProject.js $(component)
	make component.start component=$(component)

restart:
	make stop
	make start

upgrade:
	make stop
	make sources.update
	node ./utils/pullProjects.js
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
