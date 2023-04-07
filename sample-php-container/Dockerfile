FROM php:8.1.16-fpm-alpine

# Set working directory
WORKDIR /var/www

RUN apk add --no-cache \
      freetype \
      libjpeg-turbo \
      libpng \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev \
      curl

RUN docker-php-ext-configure gd \
      --with-freetype=/usr/include/

RUN docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-enable gd

RUN apk del --no-cache \
      freetype-dev \
      libjpeg-turbo-dev \
      libpng-dev

RUN rm -rf /tmp/*

RUN apk add libzip-dev

RUN docker-php-ext-install pdo pdo_mysql zip bcmath mysqli

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# update port
RUN sed -i 's/9000/9002/' /usr/local/etc/php-fpm.d/zz-docker.conf

EXPOSE 9002
CMD ["php-fpm"]
