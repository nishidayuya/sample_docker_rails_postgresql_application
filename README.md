# SampleDockerRailsPostgresqlApplication

A sample Rails application with PostgreSQL on Docker Compose.

## Requirements

- Docker Compose

## Usage

```console
$ docker compose up -d
```

Open http://localhost:3000/ or http://localhost:3000/articles by your web browser.

### (Optional) Import sample data

```console
$ docker compose run --rm app bin/rails db:seed
```

### (Optional) Change development configuration

If you need change development configuration, you can use `.env` file after copy from `.env.sample`.

```console
$ cp -avi .env.sample .env
$ vi .env   # Edit .env file
$ docker compose up -d --force-recreate
```

## Uninstall

```console
$ docker compose down -v
```
