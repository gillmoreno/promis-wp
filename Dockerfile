FROM php:8.3-fpm-alpine

# Install dependencies
RUN apk add --no-cache \
    freetype \
    libjpeg-turbo \
    libpng \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libzip-dev

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) \
    gd \
    mysqli \
    pdo \
    pdo_mysql \
    zip

# Download and install WordPress
ENV WORDPRESS_VERSION 6.7.1
ENV WORDPRESS_SHA1 c7892b3b1d5c9c8ee8f68f8d6a6e2e5451d7a59d

RUN set -ex; \
    curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz"; \
    echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c -; \
    tar -xzf wordpress.tar.gz -C /var/www/html --strip-components=1; \
    rm wordpress.tar.gz; \
    chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html 