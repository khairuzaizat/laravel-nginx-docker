FROM php:8.3.0-fpm

# Arguments defined in docker-compose.yml
ARG user
ARG uid
ARG NODE_VERSION=20

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Install PHP extensions
RUN apt-get install -y libzip-dev \
    && docker-php-ext-install zip xml

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions 2
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $USER:$user /home/$user

# Install node
RUN curl -sLS https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -
RUN apt-get install -y nodejs

# Install npm
RUN npm install npm@8.11 -g
RUN npm install n -g

# Set working directory
WORKDIR /var/www

# Set working directory permission to user
RUN chown -R $USER:$user /var/www/

USER $USER
