<p align="center">
  <a href="https://cakephp.org/" target="_blank" >
    <img alt="CakePHP" src="https://cakephp.org/v2/img/logos/CakePHP_Logo.svg" width="400" />
  </a>
</p>

#  Cakephp 3 Docker to Development

### Apache 2.4 + PHP 7.2 + OPCache + MariaDB + XDebug

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
curl -s https://raw.githubusercontent.com/viniciusbig/cakephp-docker/master/init | bash -s MYCAKE3 clone
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

This repo uses a pre-compiled machine hosted in [Docker Hub](https://hub.docker.com/r/viniciusbig/cakephp3/). But you can easly make your changes in `Dockerfile` and `docker-compose.yml` to compile a different version of this image.

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


### WORDPRESS issues

chown -R www-data:www-data /var/www/wordpress
chown -R www-data:www-data /var/www/html