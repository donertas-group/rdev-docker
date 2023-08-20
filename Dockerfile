# Image is based on rocker/rstudio:devel (ubuntu22.04)
FROM docker.io/bioconductor/bioconductor_docker:3.17-R-4.3.0

# This is to avoid the error
# 'debconf: unable to initialize frontend: Dialog'
ENV DEBIAN_FRONTEND noninteractive

# Install goodies
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    vim-tiny \
    htop

# Install pak for parallel builds
RUN r -e 'install.packages("pak")'

# Install required Bioconductor packages mia and miaviz
RUN r -e 'pak::pkg_install("tidyverse")'
RUN r -e 'pak::pkg_install(c("mia","miaViz"))'


## Clean up
RUN apt-get clean \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

RUN r -e 'pak::cache_clean()'

RUN echo 'export PS1="🐳 \[\033[1;36m\][\u@docker] \[\033[1;34m\]\W\[\033[0;35m\] # \[\033[0m\]"' >> ~/.bashrc
