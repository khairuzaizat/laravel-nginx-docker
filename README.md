## About Laravel Nginx Docker

## Pre-Installation

* Require composer
* Require docker

## Installation

1. Install laravel project.
    ```
    composer create-project laravel/laravel [project-folder-name]
    ```
2. Navigate to `[project-folder-name]`.
    ```
    cd [project-folder-name]
    ```
3. Clone [Laravel Nginx Docker](https://github.com/khairuzaizat/laravel-nginx-docker) repository.
    ```
    git clone git@github.com:khairuzaizat/laravel-nginx-docker.git docker
    ```
4. Remove `.git` configuration.
    ```
    rm -rf docker/.git
    ```
5. Replace environment file.
    ```
    mv docker/.env.docker .env
    ```
6. Move docker compose to root folder.
    ```
    mv docker/docker-compose.yml docker-compose.yml
    ```
7. Build docker services.
    ```
    docker compose build app
    ```
8. Start docker services.
    ```
    docker compose up -d
    ```
