FROM php:8.4.10-fpm

RUN apt-get update && apt-get install -y \
    libpq-dev \
    git \
    curl \
    mc \
    vim;

# Install Postgre PDO
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN docker-php-ext-install pdo \
    pdo_pgsql \
    pgsql;

# Install redis
RUN pecl install redis-6.2.0
RUN docker-php-ext-enable redis;

# Install xdebug
RUN pecl install xdebug-3.4.1 && docker-php-ext-enable xdebug;

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash \
    && \
        echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc \
        && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc \
        && /bin/bash -c "source ~/.bashrc && nvm install --lts"

WORKDIR /code
VOLUME /code

COPY . ./

# Install composer
COPY --from=composer:2.8.10 /usr/bin/composer /usr/local/bin/composer
