# README
[![Build Docker image](https://github.com/donertas-group/rdev-docker/actions/workflows/build-image.yml/badge.svg)](https://github.com/donertas-group/rdev-docker/actions/workflows/build-image.yml)

A Docker image for R development with a focus on reproducibility.
The image is based on the Bioconductor [Docker image](https://hub.docker.com/r/bioconductor/bioconductor_docker), and runs a Ubuntu 22.04 and R 4.3.0.
Includes the following packages:
* `tidyverse`
* `mia + miaViz`

## Usage
TODO

## Build & Push to GHCR
Trigger the workflow using the GitHub CLI:
    
```bash
# Login to GitHub
gh auth login

# Trigger workflow
gh workflow run build-push-image
```

Note: Because `mia` has to be compiled from source, the build process takes a while.

<details>
  <summary>Or build locally</summary>
    
    ```bash
    # Build images
    docker build --platform linux/arm64 -t ghcr.io/donertas-group/rdev-docker:<tag>-arm64 .
    docker build --platform linux/amd64 -t ghcr.io/donertas-group/rdev-docker:<tag>-amd64 .

    # Push images
    docker push ghcr.io/donertas-group/rdev-docker:<tag>-arm64
    docker push ghcr.io/donertas-group/rdev-docker:<tag>-amd64

    # Create manifest
    docker manifest create ghcr.io/donertas-group/rdev-docker:<tag> ghcr.io/donertas-group/rdev-docker:<tag>-arm64 ghcr.io/donertas-group/rdev-docker:<tag>-amd64

    # Push manifest
    docker manifest push ghcr.io/donertas-group/rdev-docker:<tag>
    ```

</details>


## Contact
Mark Olenik <mark.olenik@gmail.com>