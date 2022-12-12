FROM php:latest

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libonig-dev \
	libmagickwand-dev \
    iputils-ping \
    libicu-dev \
    libmemcached-dev \
    libz-dev \
    libpq-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libssl-dev \
    libmcrypt-dev \
    libxml2-dev \
    libbz2-dev \
    libjpeg62-turbo-dev \
    librabbitmq-dev \
    libzip-dev \
    curl \
    git \
    subversion \
    unzip \
	nodejs \
	npm \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure bcmath --enable-bcmath \
  && docker-php-ext-configure pcntl --enable-pcntl \
  && docker-php-ext-configure pdo_mysql --with-pdo-mysql \
  && docker-php-ext-configure mbstring --enable-mbstring \
  && docker-php-ext-configure soap --enable-soap \
  && docker-php-ext-install \
    bcmath \
    intl \
    mbstring \
    mysqli \
    pcntl \
    pdo_mysql \
    soap \
    sockets \
    zip \
	sysvsem \
  && docker-php-ext-configure gd \
    --with-jpeg=/usr/lib \
    --with-freetype=/usr/include/freetype2 \
  && docker-php-ext-install gd \
  && docker-php-ext-install opcache \
  && docker-php-ext-enable opcache \
  && npm install --global yarn

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app/src
