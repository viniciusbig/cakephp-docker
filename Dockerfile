FROM php:7.3-apache

# This image works with php:7.2-apache and php:7.3-apache

# Install System Dependencies

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	software-properties-common \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	libfreetype6-dev \
	libicu-dev \
  	libssl-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libedit-dev \
	libedit2 \
	libxslt1-dev \
	apt-utils \
	mariadb-client \
	git \
	vim \
	nano \
	wget \
	curl \
	lynx \
	psmisc \
	unzip \
	tar \
	cron \
	bash-completion \
	gnupg \
	wkhtmltopdf \
	&& apt-get clean


# Install Cake Dependencies

RUN docker-php-ext-configure \
  	gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
  	docker-php-ext-install \
  	mbstring \
	intl \
	simplexml \
  	pdo_mysql \
	opcache \
  	gd \
  	bcmath \
  	soap \
  	xsl \
	mysqli


# Install zip and zip php extension
# https://stackoverflow.com/questions/53772780/how-to-reinstall-the-libzip-distribution-when-build-lumen-in-docker?rq=1
RUN apt-get install -y zip libzip-dev \
  && docker-php-ext-configure zip --with-libzip \
  && docker-php-ext-install zip


# Install oAuth

RUN apt-get update \
  	&& apt-get install -y \
  	libpcre3 \
  	libpcre3-dev \
  	# php-pear \
  	&& pecl install oauth \
  	&& echo "extension=oauth.so" > /usr/local/etc/php/conf.d/docker-php-ext-oauth.ini


# Install Node, NVM, NPM and Grunt
# ---------------------------------------------------------------
# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
# Node Version Manager
# 	https://github.com/creationix/nvm#installation

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  	&& apt-get install -y nodejs npm build-essential \
    # && curl https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | sh \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash \
    && npm i -g grunt-cli yarn gulp-cli


# Install WP-Cli

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& php wp-cli.phar --info \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	&& wp --info


# Install Composer
# ---------------------------------------------------------------
# composer parallel install plugin
# 	https://github.com/hirak/prestissimo

RUN	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
RUN composer global require hirak/prestissimo


# Install Code Sniffer
# ---------------------------------------------------------------

# RUN composer global require "squizlabs/php_codesniffer=*"
# RUN composer global require magento-ecg/coding-standard
# RUN ~/.composer/vendor/bin/phpcs --config-set installed_paths ~/.composer/vendor/magento-ecg/coding-standard
# RUN ln -s ~/.composer/vendor/bin/phpcs /usr/local/bin;
# ENV PATH="/var/www/.composer/vendor/bin/:${PATH}"


# Install Deployer
# ---------------------------------------------------------------
# Ref.: https://deployer.org/docs/installation

RUN curl -LO https://deployer.org/deployer.phar
RUN mv deployer.phar /usr/local/bin/dep
RUN chmod +x /usr/local/bin/dep


# Install XDebug
# ---------------------------------------------------------------

RUN yes | pecl install xdebug && \
	 echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.iniOLD


# Install Mhsendmail
# ---------------------------------------------------------------

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install golang-go \
   && mkdir /opt/go \
   && export GOPATH=/opt/go \
   && go get github.com/mailhog/mhsendmail


# Configuring system
# ---------------------------------------------------------------
# Config php
ADD .docker/config/php.ini /usr/local/etc/php/php.ini
ADD .docker/config/cake.conf /etc/apache2/sites-available/cake.conf
ADD .docker/config/custom-xdebug.ini /usr/local/etc/php/conf.d/custom-xdebug.ini
COPY .docker/bin/* /usr/local/bin/
COPY .docker/users/* /var/www/
RUN chmod +x /usr/local/bin/*
# Enable site Apache
# RUN ln -s /etc/apache2/sites-available/cake.conf /etc/apache2/sites-enabled/cake.conf
RUN a2ensite cake.conf


# Fix permissions and enable apache modules
RUN chmod 777 -Rf /var/www /var/www/.* \
	&& chown -Rf www-data:www-data /var/www /var/www/.* \
	&& chown -Rf www-data:www-data ~/.composer/ ~/.composer/.* \
	&& usermod -u 1000 www-data \
	&& a2enmod rewrite \
	&& a2enmod headers

VOLUME /var/www/html
WORKDIR /var/www/html
