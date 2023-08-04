FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apt-utils \
    software-properties-common \
    dirmngr \
    gpg-agent \
    ed \
    less \
    locales \
    vim-tiny \
    wget \
    ca-certificates \
    git \
    htop \
    # PPAs for R packages
    && wget -q -O - https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc \
    | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc  \
    && add-apt-repository --yes "ppa:marutter/rrutter4.0" \
    && add-apt-repository --yes "ppa:c2d4u.team/c2d4u4.0+" \
    && add-apt-repository --yes "ppa:edd/misc"

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.utf8 \
    && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

## This was not needed before but we need it now
ENV DEBIAN_FRONTEND noninteractive

## Otherwise timedatectl will get called which leads to 'no systemd' inside Docker
ENV TZ UTC

# Now install R and littler, and create a link for littler in /usr/local/bin
# Default CRAN repo is now set by R itself, and littler knows about it too
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    littler \
    r-base \
    r-base-dev \
    r-recommended \
    r-cran-docopt \
    && chown root:staff "/usr/local/lib/R/site-library" \
    && chmod g+ws "/usr/local/lib/R/site-library" \
    && ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
    && ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
    && ln -s /usr/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r \
    && ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
    && ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
    && ln -s /usr/lib/R/site-library/littler/examples/update.r /usr/local/bin/update.r 

# Install Python
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-dev \
    python3-dbus \
    python3-gi \
    python3-apt \
    python3-pip \
    # Add this when ready for publishing to make image smaller
    # && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
    # && rm -rf /var/lib/apt/lists/*
    && apt-get clean 

RUN pip install radian snakemake

# Install bspm
RUN rm -f /etc/apt/sources.list.d/c2d4u*list \
        && apt update -qq \
        && install.r bspm remotes \
        && echo "suppressMessages(bspm::enable())" >> /etc/R/Rprofile.site \
        && echo "options(bspm.version.check=FALSE)" >> /etc/R/Rprofile.site \
        && echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/90local-no-recommends \
        && chgrp -R 1000 /usr/local/lib/R/site-library

# Devtools
RUN install.r languageserver
RUN install.r httpgd

# R packages
RUN install.r tidyverse
RUN install.r bookdown

WORKDIR /root/project

# Make a nice prompt
RUN echo 'export PS1="🐳 \[\033[1;36m\][\u@docker] \[\033[1;34m\]\W\[\033[0;35m\] # \[\033[0m\]"' >> ~/.bashrc
RUN echo 'alias r="radian"' >> ~/.bashrc