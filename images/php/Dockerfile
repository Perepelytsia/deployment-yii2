FROM php:7.1-fpm

# Install modules
RUN apt-get update \
    && apt-get install -y \
        apt-utils \
        curl \
        dnsutils \
        git \
        unzip \
        wget \
        zip \
        libcurl4-gnutls-dev \
        libmcrypt-dev \
        libtidy-dev \
        libbz2-dev \
        libxml2-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libjpeg62 \
        libpng-dev \
        libssl-dev \
        libicu-dev \
        libc-client-dev \
        libkrb5-dev \
        jpegoptim \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install \
        bcmath \
        bz2 \
        calendar \
        curl \
        exif \
        ftp \
        gd \
        gettext \
        imap \
        intl \
        json \
        mbstring \
        mcrypt \
        mysqli \
        opcache \
        pdo \
        pdo_mysql \
        shmop \
        soap \
        sockets \
        sysvmsg \
        sysvsem \
        sysvshm \
        tidy \
        wddx \
        zip

RUN apt-get install vim

# Install APCu and APC backward compatibility
RUN pecl install apcu \
    && pecl install apcu_bc-1.0.3 \
    && docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini

# Install Composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.10.22

WORKDIR /var/www/
