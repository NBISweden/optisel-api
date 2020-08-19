# disable automatic snapshots
auto.snapshot <- getOption("renv.config.auto.snapshot")
options(renv.config.auto.snapshot = FALSE)

# initialize a new project (with an empty R library)
renv::init(bare = TRUE)

renv::restore(packages = "renv")
renv::install("optiSel@2.0.2")
renv::install("plumber@0.4.4")
renv::install("jsonlitei@1.6.1")
renv::install("readxl")
renv::install("data.table")
renv::install("anytime")

renv::snapshot()

renv::status()

