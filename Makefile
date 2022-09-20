start:
	node ./utils/startProjects.js

stop:
	node ./utils/stopProjects.js

component.start:
	node ./utils/startProject.js $(component)

component.stop:
	node ./utils/stopProject.js $(component)

restart:
	make stop
	make start

component.restart:
	make component.stop component=$(component)
	make component.start component=$(component)

upgrade:
	make stop
	make sources.update
	node ./utils/pullProjects.js
	make start

component.upgrade:
	make component.stop component=$(component)
	node ./utils/pullProject.js $(component)
	make component.start component=$(component)

sources.get:
#	git clone --depth 1 --branch with_category https://github.com/krlls/iQbit_test.git ./qbittorrent/webgui/iqbit
	git clone --depth 1 https://github.com/ntoporcov/iQbit.git ./data/qbittorrent/webgui/iqbit

sources.update:
	rm -rf ./data/qbittorrent/webgui/iqbit && make sources.get

help.names:
	node ./utils/printProjectNames.js

help:
	@echo 'Запуск: make start'
	@echo 'Остановка: make stop'
	@echo 'Перезагрузка: make restart'
	@echo 'Обновление инфраструктуры: make upgrade'
	@echo ' '
	@echo 'Обновить ресурсы: make sources.update'
	@echo 'Загрузить ресурсы: make sources.get'
	@echo ' '
	@echo 'Имена всех компонентов: make help.names'
	@echo 'Остановка компонента: make component.stop component=<name>'
	@echo 'Запуск компонента: make component.start component=<name>'
	@echo 'Обновление компонента: make component.upgrade component=<name>'
