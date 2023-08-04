# Rules: renv
#
# All rules related to renv.


## renv_init: Initialize packages
rule renv_init:
    output:
        "renv.lock",
        "renv/activate.R",
        ".Rprofile",
    shell:
        "R -q -e 'renv::init(bioconductor=\"3.17\")'"


## renv_restore: Restore packages from lock file
rule renv_restore:
    shell:
        "R -q -e 'renv::restore(\".\")'"


## renv_snapshot: Create snapshot of packages and write lock file
rule renv_snapshot:
    shell:
        "R -q -e 'renv::snapshot()'"


## renv_update: Update packages
rule renv_update:
    shell:
        "R -e 'renv::update()'"


## renv_remove: Remove everything renv related
rule renv_clean:
    shell:
        "rm -rf renv/ .Rprofile renv.lock"


## help_renv: Help message
rule help_renv:
    input:
        "rules/renv.smk",
    shell:
        "sed -n 's/^##//p' {input}"
