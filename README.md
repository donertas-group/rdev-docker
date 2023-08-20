# README

## Contact
Mark Olenik <mark.olenik@gmail.com>

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