![Cakephp](https://cakephp.org/v2/img/logos/CakePHP_Logo.svg)

#  Cakephp 3 Docker to Development

### Apache 2.4 + PHP 7.2 + OPCache + MariaDB + XDebug

[![Build Status](https://travis-ci.org/clean-docker/Magento2.svg?branch=master)](https://travis-ci.org/clean-docker/Magento2)
[![Docker Build](https://img.shields.io/docker/build/rafaelcgstz/magento2.svg)](https://hub.docker.com/r/rafaelcgstz/magento2/)
[![Docker Pulls](https://img.shields.io/docker/pulls/rafaelcgstz/magento2.svg)](https://hub.docker.com/r/rafaelcgstz/magento2/)
[![Docker Starts](https://img.shields.io/docker/stars/rafaelcgstz/magento2.svg)](https://hub.docker.com/r/rafaelcgstz/magento2/)
[![Build Status](https://images.microbadger.com/badges/image/rafaelcgstz/magento2.svg)](https://microbadger.com/images/rafaelcgstz/magento2)
[![Releases](https://img.shields.io/github/release/clean-docker/Magento2.svg)](https://github.com/clean-docker/Magento2/releases)

### Requirements

**MacOS:**

Install [Docker](https://docs.docker.com/docker-for-mac/install/), [Docker-compose](https://docs.docker.com/compose/install/#install-compose) and [Docker-sync](https://github.com/EugenMayer/docker-sync/wiki/docker-sync-on-OSX).

**Windows:**

Install [Docker](https://docs.docker.com/docker-for-windows/install/), [Docker-compose](https://docs.docker.com/compose/install/#install-compose) and [Docker-sync](https://github.com/EugenMayer/docker-sync/wiki/docker-sync-on-Windows).

**Linux:**

Install [Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) and [Docker-compose](https://docs.docker.com/compose/install/#install-compose).

### How to use

Execute in your terminal, change the *MYCAKE3* to use the name of your project:

```
curl -s https://raw.githubusercontent.com/clean-docker/Magento2/master/init | bash -s MYCAKE3 clone
```

If you want to install a fresh Cakephp 3, use like that:

```
cd MYCAKE3
./shell
rm index.php
install-cake
```

You can specify a subfolder to install Cake, just add a new parameter (e.g. `install-cake my_app`).

### Tips

>You can customize port numbers and database credentials, editing `.env` file.

>Don't forget to change `config\app.php` with these database credentials.

>Database host is defined as `db`. *localhost will not work*.

### Panels

Enjoy your new panels!

**Web server:** http://localhost/

**PHPMyAdmin:** http://localhost:8080

**Local emails:** http://localhost:8025

### Features commands

| Commands  | Description  | Options & Examples |
|---|---|---|
| `./init`  | If you didn't use the CURL setup command above, please use this command changing the name of the project.  | `./init MYCAKE3` |
| `./start`  | Start your container manually. Tha `init` command call this command internally.  | |
| `./stop`  | Stop your project containers  | |
| `./kill`  | Stops containers and removes containers, networks, volumes, and images created to the specific project  | |
| `./shell`  | Access your container  | | |
| `./cake`  | Use the Cakephp Shell | |
| `./composer`  |  Use Composer commands | `./composer update` |
| `./xdebug`  |  Enable / Disable the XDebug | |


### Inspiration

This repo was strongly inspired on [Clean Docker for Magento 2](https://github.com/clean-docker/Magento2) by [Rafael Corrêa Gomes](https://github.com/rafaelstz/).

### License

MIT © 2018 [Vinicius Arantes](https://github.com/viniciusbig/).
