# Laravel with Docker, CircleCI, App Engine Flex
This example demonstrates a laravel installation which is dockerized for local, ci, and production deployments, using the App Engine docker images.

## Installation
- git clone `git@github.com:Vugario/Laravel-Docker-CircleCI-App-Engine.git laravel && cd laravel` 
- `make provision` (creates a temporary ip 172.26.1.0)
- Visit [http://172.26.1.0](http://172.26.1.0)

## Deploy to App Engine Flexible
- Create a Google Cloud account and [create a new project](https://console.cloud.google.com/projectcreate).
- Run `brew cask install google-cloud-sdk` to install the `gcloud` command
- Run `gcloud config set core/project YOUR_PROJECT_ID`
- Run `gcloud app deploy`

## Usage
```
make provision
```
Provision your local setup by copying a config file (.env), creating a temporary ip (172.26.1.0) and docket network, and build the docker images.

```
make up && make down
```
Bring your application up or down.

```
make reload
```
Restart your application

```
make migrate
```
Run database migrations
