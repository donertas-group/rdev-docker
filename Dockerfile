# This docker image has LaTeX to build the vignettes
FROM bioconductor/bioconductor_docker:devel

# Update
RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils \
    && apt-get install -y --no-install-recommends \
    build-essential libcurl4-openssl-dev libssl-dev libxml2-dev r-base \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install snakemake
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv')"
RUN R -e "remotes::install_github('nx10/httpgd')"
RUN R -e "remotes::install_github('REditorSupport/languageserver')"

WORKDIR /project

COPY renv.lock renv.lock
RUN Rscript -e 'renv::restore()'

# Make a nice prompt
RUN echo 'export PS1="🐳 \[\033[1;36m\][\u@docker] \[\033[1;34m\]\W\[\033[0;35m\] # \[\033[0m\]"' >> ~/.bashrc