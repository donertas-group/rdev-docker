# README

A Docker image for R development with a focus on reproducibility.
The image is based on the Bioconductor [Docker image](https://hub.docker.com/r/bioconductor/bioconductor_docker), and runs a Ubuntu 22.04 and R 4.3.0.
Includes the following packages:
* `tidyverse`
* `mia + miaViz`

## Usage
TODO

## Build & Push to GHCR
To build & push either use the GitHub workflow or do it manually.
### GitHub Workflow
Trigger the workflow using the GitHub CLI:
    
```bash
# Login to GitHub
gh auth login

# Trigger workflow
gh workflow run build-push-image
```

### Manually 
Option 1: Works with `podman`:

```bash
# Build images
docker build --platform linux/arm64 -t ghcr.io/<namespace>/<package>:<tag>-arm64 .
docker build --platform linux/amd64 -t ghcr.io/<namespace>/<package>:<tag>-amd64 .

# Push images
docker push ghcr.io/<namespace>/<package>:<tag>-arm64
docker push ghcr.io/<namespace>/<package>:<tag>-amd64

# Create manifest
docker manifest create ghcr.io/<namespace>/<package>:<tag> ghcr.io/<namespace>/<package>:<tag>-arm64 ghcr.io/<namespace>/<package>:<tag>-amd64

# Push manifest
docker manifest push ghcr.io/<namespace>/<package>:<tag>

```
Option 2: Or using Docker's `buildx` (doesn't work with `podman` yet):

```bash
# Build multi-arch image and write manifest
podman buildx build --push --manifest ghcr.io/markolenik/rdev-docker:manifest-latest --platform linux/amd64,linux/arm64 -t ghcr.io/markolenik/rdev-docker:latest .

```

## Contact
Mark Olenik <mark.olenik@gmail.com>