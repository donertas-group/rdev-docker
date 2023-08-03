
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


rule build_tse:
    input:
        phyloseq="data/processed/phyloseq_obj_20210215.rds",
        metadata="data/metadata/metadata.csv"
    output:
        "data/processed/tse_raw.rds"
    script: 
        "scripts/build_tse.R"

