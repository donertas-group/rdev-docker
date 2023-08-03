
include: "rules/renv.smk"


# --- Help Rules --- #
## help: prints help comments for Snakefile in ROOT directory.
##       Help for rules in other parts of the workflows (i.e. in rules/)
##       can be called by `snakemake help_<workflowname>`
rule help:
    input:
        "Snakefile",
    shell:
        "sed -n 's/^##//p' {input}"


rule knit:
    input:
        "notebooks/main.Rmd",
    output:
        "notebooks/main.html",
    shell:
        "Rscript -e 'rmarkdown::render(\"{input}\")'"
