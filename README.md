# Servant's Code

Welcome to Servant's Code!

May God continue to bless our work and your willingness to help us build the future infrastructure of the Church!

## Setup
This repo contains scripts and resources to get a development environment setup on your local machine.

Prerequisites:
- Docker
- Kubernetes
- JDK 11
- NPM
- Angular CLI
- PostgreSQL

### Windows
First, ensure that you're running Windows Pro with Docker for Windows installed. If you don't have docker yet, you can find installation instructions here:
https://docs.docker.com/docker-for-windows/install/

You'll also need Kubernetes running. In the Docker settings go to the Kubernetes tab, check the box next to "Enable Kubernetes" and click "Apply".

Finally, this development environment expects to run in the Linux for Windows. Configuration instructions can be found here:
https://docs.microsoft.com/en-us/windows/wsl/install-win10

Other prerequisites:
Java 10 JDK
```
apt install openjdk-11-jdk
```

Gradle
```
apt install gradle
```

NPM
```
apt install npm
```


### MacOS

Using [sdkman](https://sdkman.io/):
- Java `sdk install 11.0.2-open`
- Gradle `sdk install gradle`

PostgreSQL via [Homebrew](https://formulae.brew.sh/formula/postgresql) or [app](https://postgresapp.com/)
```
brew install postgresql
```

Install [Docker for Mac](https://docs.docker.com/docker-for-mac/install/)

Install [Kubernetes CLI](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-with-homebrew-on-macos)
```
brew install kubectl
```

## General Setup

Front-end dependencies
- Install Node Version Manager [NVM](https://github.com/nvm-sh/nvm#installing-and-updating)
- Angular CLI `npm install -g @angular/cli`

With Kubernetes running you can configure the Servant's Code development environment from the command line by running:
```
./setup-dev-env.sh
```

## Database setup:
Populating the database. There are two database scripts that you'll need to get the database populated.
- fake-data:/src/main/db/db-setup-sql (Database creation and initial system admin creation)

Connect to postgres pod:
NOTE: This requires TTY, try windows cmd, if your local Linux prompt is not TTY enabled.
- `kubectl exec -it <Your postgres pod> -- /bin/bash`

Login to postgres
- `psql -h localhost -U postgres`
- Paste database and db user creation from fake-data
- `\c servantscode servant1`
- Paste system role and user creation from fake-data
