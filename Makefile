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
	@echo 'Start all: make start'
	@echo 'Stop all: make stop'
	@echo 'Restart all: make restart'
	@echo 'Upgrade all: make upgrade'
	@echo ' '
	@echo 'Update secondary sources: make sources.update'
	@echo 'Download secondary sources: make sources.get'
	@echo ' '
	@echo 'Print all component names: make help.names'
	@echo 'Stop component nt name: make component.stop component=<name>'
	@echo 'Start component by name: make component.start component=<name>'
	@echo 'Upgrade component by name: make component.upgrade component=<name>'
