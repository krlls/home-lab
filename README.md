# Home Server
My main server repository for home use.<br>
It currently hosts several services that make my life more fun and easier:

- **[Traefik proxy](https://registry.hub.docker.com/_/traefik "Traefik proxy")** - I use it as a reverse proxy for service routing, HTTPS connection and certificate issuance.
- **[Duplicati ](https://hub.docker.com/r/linuxserver/duplicati")** - I use it for file-cloud backups.
- **[Plex](https://registry.hub.docker.com/r/linuxserver/plex")** - Media server for watching movies and music.
- **[QBittorrent  ](https://hub.docker.com/r/linuxserver/qbittorrent")** - Torrent to download movies and music directly through the [web UI](https://github.com/ntoporcov/iQbit "web UI")
- **[NextCloud ](https://registry.hub.docker.com/_/nextcloud")** - A personal cloud for storing files.
- **[Ksmi-site ](http://ksmi.me")** - My personal site.
- **[YouTrack](https://registry.hub.docker.com/r/jetbrains/youtrack")** - I use it as a task tracker for personal projects.

## Infrastructure management

- Start all: `make start`
- Stop all: `make stop`
- Restart all: `make restart`
- Upgrade all: `make upgrade`

<br>

- Update secondary sources: `make sources.update`
- Download secondary sources: `make sources.get`

<br>

- Print all component names: `make help.names`
- Print current config: `make help.config`
- Print template config: `make help.config.template`

<br>

- Stop component by name: `make component.stop component=<name>`
- Start component by name: `make component.start component=<name>`
- Upgrade component by name: `make component.upgrade component=<name>`