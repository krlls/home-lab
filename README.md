# Home Server

This is my main server repository for home use. It currently hosts several services that make my life more fun and easier.

## Personal Media

- **[PhotoPrism](https://photoprism.app)** - AI-Powered Photos App for the Decentralized Web. It utilizes the latest technologies to automatically tag and find pictures.
- **[NextCloud](https://nextcloud.com/)** - A personal cloud for storing files.
- **[Plex](https://www.plex.tv/)** - A media server for watching movies and music.
- **[Tautulli](https://tautulli.com/)** - A monitoring tool for Plex Media Server.

## Torrents

- **[Overseerr](https://overseerr.dev/)** - A request management and media discovery tool built to work with your existing Plex ecosystem.
- **[QBittorrent](https://www.qbittorrent.org/)** - A torrent client for downloading movies and music directly through the [iQbit Web UI].
- **[Jackett](https://github.com/Jackett/Jackett)** - A proxy for searching multiple torrents at once.
- **[Radarr](https://radarr.video/)** - A torrent management tool for movies.
- **[Sonarr](https://sonarr.tv/)** - A torrent management tool for TV shows.
- **[Lidarr](https://lidarr.audio/)** - A torrent management tool for music.

## VPN

- **[WireGuard Proxy](https://www.wireguard.com/)** - WireGuard VPN client and Socks5 proxy for local use.
- **[WireGuard Server](https://www.wireguard.com/)** - WireGuard VPN server for home IP (Does not allow access to the local network).
- **[Windscribe](https://windscribe.net)** - VPN client + local proxy for any components (Blocked by Roskomnadzor).

## Other Applications

- **[Traefik Proxy](https://traefik.io/traefik/)** - Used as a reverse proxy for service routing, HTTPS connection, and certificate issuance.
- **[Duplicati](https://www.duplicati.com/)** - Used for file-cloud backups.
- **[Ksmi-Site](http://ksmi.me)** - My personal site.
- **[AdGuard Home](https://adguard.com/adguard-home/overview.html)** - Network-wide software for blocking ads and tracking.
- **[Homer](https://github.com/bastienwirtz/homer)** - A simple static homepage for easy access to services, configured through a simple YAML file.
- **[Netdata](https://www.netdata.cloud/)** - Server monitoring.

## Infrastructure Management

- Start all: `make start`
- Stop all: `make stop`
- Restart all: `make restart`
- Upgrade all: `make upgrade`

- Update secondary sources: `make sources.update`
- Download secondary sources: `make sources.get`

- Print all component names: `make help.names`
- Print current config: `make help.config`
- Print template config: `make help.config.template`

- Stop component by name: `make component.stop component=<name>`
- Start component by name: `make component.start component=<name>`
- Upgrade component by name: `make component.upgrade component=<name>`

## Installation

This is a basic installation guide for the infrastructure. The components must be configured according to their respective documentation in the links provided.

1. Clone the repository:
```shell
$ git clone https://github.com/krlls/homeServer/
```

2. Create the environment file:
   Copy `./

config/temp.env` as `./config/.env` and replace the service data with your own:
```shell
$ cp ./config/temp.env ./config/.env
$ nano ./config/.env
```

3. Domain Connection:
   Bind the domain to the server's IP and add A records for the selected subdomains of the components. Alternatively, you can use a local DNS.

4. Run the installation:
   After verifying the data in the `./config/.env` file, launch the installation:
```shell
$ make install
```

5. Configure components:
   Visit the addresses for each service and follow the suggested steps according to their respective documentation.

## Overview

Next, I will provide some general information about the infrastructure and how things work.

### Adding a Component

In the context of this infrastructure, a component refers to one or more services defined in a `./components/<component_name>.yaml` file. For example, the **nextcloud** component contains `nextcloud_app`, `nextcloud_db`, `nexcloud_cron`, and `redis`.

1. Component Creation:
   Create a `./components/<component_name>.yaml` file with the service description for the component. This file should follow the [docker-compose.yaml](https://docs.docker.com/compose/) format of version 3.7 or higher.

2. Component Registration:
   In `./config/components.json`, register the new component by adding the following lines:
```json
{
  "components": [
    ....
    {
      "name": "<component_name>",
      "file": "<component_name>.yaml"
    }
  ]
}
```

3. Add Component Data:
   Create the directory `./data/<component_name>` and mount all necessary volumes to organize container data for future use.

4. Add Traefik Configuration:
   The file `data/traefik/servicesConfig.yaml` contains the configuration for correctly routing traffic to services. To add a new service, you need to create a `router` and a `service` for it. For example:
```yaml  
http:
  routers:
    ...
    <SERVICE_NAME>:  # custom router name
      rule: "Host(`{{env "<SERVICE_URL>"}}`)"  # replace
      service: <SERVICE_NAME>  # replace
      entryPoints:
        - "websecure"
      tls:
        certresolver:
          - "mydnschallenge"
```
Create the service by adding the following to `services`:
```yaml  
http:
  services:
    ...
    <SERVICE_NAME>:  # replace
      loadBalancer:
        servers:
          - url: "http://<ALIAS>:<PORT>"  # replace with container name and port
```
> In the above example, the environment variable `SERVICE_URL` must be defined in the Traefik section of the docker-compose file and used here, e.g., `TORRENT_TRAEFIK_HOST`.

5. Add .env File:
   Place all important data (that should not be in the git index) in the `./config/.env` file.

6. Start the Component:
   Afterward, restart the entire infrastructure or just the specific component:
```shell
$ make restart
# or
$ make component.start component=<component_name>
```

### Additional Notes

With this approach, the infrastructure can be easily scaled by removing or adding new components. Since important data for each component is stored in the `data/<component_name>` directory, setting up backups becomes quick and straightforward.

For more flexible and convenient management of the infrastructure, I have written several utility scripts in JavaScript that cover all the basic interaction cases with components. The commands to run them are described in the **Makefile** and can be found in the management section above.

Within this

framework, the author prefers using images with the **latest** tag to update components quickly. However, it is important to note that this approach may cause potential failures in a production or commercial environment. It is recommended to use more controlled and stable versioning practices.

I hope this clarifies the installation and usage process of your home server infrastructure. If you have any further questions, feel free to ask!