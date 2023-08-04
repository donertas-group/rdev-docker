# README

## WARNING
This is a work in progress.  It might not be ready for use.

## Contact
Mark Olenik <mark.olenik@gmail.com>

## Software Prerequisites
* Podman
* Podman Compose
* VSCode

## Podman Commands
```bash
# Build image
podman-compose build project

# Rebuild without cache
podman-compose build --no-cache project

# Start container and enter bash
podman-compose up project

# Start container in background
podman-compose up -d project

# Stop container
podman-compose down

```

## Containerized Development in VSCode
**Step 1**: Build the image with `podman-compose build project`.\
**Step 2**: Start container in background `podman-compose up -d project`.\
**Step 3**: Install the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) VSCode extension.\
**Step 4**: Attach to container by calling command "Dev Containers: Attach to Running Container".\
**Step 5**: Start coding.
