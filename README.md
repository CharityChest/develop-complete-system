### Develop Complete System

This repository collects and orchestrates sub-system repositories in order to create a working complete development environment.

Some examples of production are embedded too.

### How to start Environments:

You can start both develop or a production sample environment. With the following commands: remember that <environment>
at the moment can be only "develop" or "production" and for cc-backend subpackage develop environment works only with an
active debugger.

#### Windows:

In order to use it in PowerShell by the PS script you should enable script execution first:

> Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process

after that you can execute the PS script:

- To build the image:
> .\scripts\windows\environment-starter.ps1 -Environment <environment> -Action "build" -Option "--no-cache"

- To start the container:
> .\scripts\windows\environment-starter.ps1 -Environment <environment> -Action "up" -Option "-d"

- To stop the container:
> .\scripts\windows\environment-starter.ps1 -Environment <environment> -Action "down"

#### Linux

In order to use it on linux, there is any particular prescription, just run:

- To build the image:
> ./scripts/linux/environment-starter.sh <environment> build --no-cache

- To start the container:
> ./scripts/linux/environment-starter.sh <environment> up -d

- To stop the container:
> ./scripts/linux/environment-starter.sh <environment> down


