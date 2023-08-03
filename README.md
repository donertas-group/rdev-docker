# README

This readme file was generated on 2023-07-18.

## GENERAL INFORMATION

Title of Project: Population dynamics in micriobiome

NOTE: Documents under `/docs` are confidential and should not be shared with anyone outside the project team.
For final publication we will create a fresh repo with only the code.

### Project Description & Goal:

## DATA
TODO

### RAW DATA
TODO 

### PROCESSED DATA
TODO

## OTHER DOCUMENTATION

<All analyses and code should be documented. Specify here what is the means of documentation (e.g. A project notebook published through github, documenting the code, README files in folders etc.)>

## SOFTWARE
### Requirements
Until we have a podman solutions, below the requirements:
* R version `4.3.1`, ideally installed through [rig](https://github.com/r-lib/rig).
* [direnv](https://direnv.net/) for environment management.

The remaining dependencies should be installed via [renv](https://github.com/rstudio/renv).

### Initializing Project

To initialize project execute the following commands:
- `direnv allow` to allow the `.envrc` file to be loaded.
- `snakemake --cores 1 renv_install` to install `renv` locally under `./renv`.
- `snakemake --cores 1 renv_init` to initialize `renv` for the project.

Use `snakemake --cores 1 help` to see all available commands.

### Coding Style
We use the [tidyverse style guide](https://style.tidyverse.org/) for R code.\
Until we have a CI pipeline, we use [styler](https://styler.r-lib.org/) to format code.

### DevOps Practices
We try to adhere to CI/CD practices.\
Commits should be atomic, pushed frequently to `main`, and have a meaningful commit message.\
We avoid branching, unless there's a good reason to do so.


## CONTACTS


- Name: 
    - Contribution:
  	- ORCID:
  	- Institution (as should be listed in a publication): 
  	- Email (professional email address): 

## FUNDING

1) Funding Agency: 
    - Grant Number: CRC1310
    - Grant Awarded to: (DRV, HMD)

## OTHER CONTRIBUTIONS & ACKNOWLEDGEMENT

<acknowledge any individuals or organizations who provided support or contributed to the project in some way.>

## LICENCE

A statement outlining the license under which the project is released.

