library(plumber)
library(jsonlite)
source("/usr/local/optisel/R/optisel.R")

#* @get /inbreeding
inbreeding <- function(req) {
  pin <- calculate_inbreeding()
  ret <- pin[2][1]
}

#* @get /kinship
kinship <- function(req) {
  pkin <- calculate_kinship()
  ret <- pkin[1]
}
