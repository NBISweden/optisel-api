library(plumber)
library(jsonlite)
source("optisel.R")

inbreeding <- function(req) {
  example <- req$postBody
  parsed_example <- jsonlite::fromJSON(example)
  pkin <- calculate_inbreeding() 
}

kinship <- function(req) {
  example <- req$postBody
  parsed_example <- jsonlite::fromJSON(example)
}
