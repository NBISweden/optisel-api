library(renv)

lock <- lockfile("renv.lock")

# set the repositories for a lockfile
lock$repos(CRAN = "https://cran.r-project.org")

# depend on digest 0.6.22
lock$add(optisel = "optiSel@2.0.2")
lock$add(pl = "plumber@0.4.4")
lock$add(json= "jsonlitei@1.6.1")
lock$add(readxl= "readxl")
lock$add(data = "data.table")
lock$add(anytime = "anytime")

# write to file
lock$write("renv.lock")

