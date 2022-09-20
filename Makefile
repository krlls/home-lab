install:
	make help.config
	make check_install
	docker network create traefik-network
	@echo 'Image loading and assembling is performed, at first start it can take a long time...'
	make start.verbose

start:
	node ./utils/startProjects.js

start.verbose:
	node ./utils/startVerboseProjects.js

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

help.config:
	cat ./config/.env

help.config.template:
	cat ./config/temp.env

help:
	@echo 'Start all: `make start`'
	@echo 'Stop all: `make stop`'
	@echo 'Restart all: `make restart`'
	@echo 'Upgrade all: `make upgrade`'
	@echo ' '
	@echo 'Update secondary sources: make sources.update'
	@echo 'Download secondary sources: make sources.get'
	@echo ' '
	@echo 'Print all component names: make help.names'
	@echo 'Print current config: make help.config'
	@echo 'Print template config: make help.config.template'
	@echo ' '
	@echo 'Stop component nt name: make component.stop component=<name>'
	@echo 'Start component by name: make component.start component=<name>'
	@echo 'Upgrade component by name: make component.upgrade component=<name>'

check_install:
	@echo -n "Check config file... Are you sure? [Y/N] " && read ans && [ $${ans:-N} = Y ]
.PHONY: clean check_clean