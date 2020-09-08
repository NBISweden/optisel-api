library(DBI)

# Returns a connection instance to a PG server
connect_to_pg <- function() {
  pg_host <- Sys.getenv("POSTGRES_HOST", "localhost")
  con <- dbConnect(RPostgres::Postgres(),dbname = 'herdbook',
                 host = get("pg_host"),
                 port = 5432,
                 user = 'herdbook',
                 password = 'insecure')
  return (con)
}

# Terminates a connection to a PG server
disconnect_from_pg <- function(con) {
  dbDisconnect(con)
}

# Returns a data structure with selected individuals' ancestry information
get_all_individuals <- function(con) {
  res <- dbSendQuery(con, "SELECT individual_id, father_id, mother_id, sex, birth_date, death_date FROM individual")
  gottis <- dbFetch(res)
  dbClearResult(res)
  disconnect_from_pg(con)
  return (gottis)

}

# Returns a data structure with all individuals' ancestry information
get_all <- function(con) {
  res <- dbSendQuery(con, "SELECT * FROM individual")
  gottis <- dbFetch(res)
  dbClearResult(res)
  disconnect_from_pg(con)
  return (gottis)
  
}

#con <- connect_to_pg()
#gottis <- get_all_individuals(con)
