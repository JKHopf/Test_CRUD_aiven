# Library in packages used in this application
library(shiny)
library(DT)
library(DBI)
# library(RSQLite)
library(shinyjs)
library(shinycssloaders)
library(lubridate)
library(shinyFeedback)
library(dplyr)
library(dbplyr)
library(RPostgres)

db_config <- config::get()$db

# Create database connection
conn <- dbConnect(
  RPostgres::Postgres(),dbname = 'defaultdb', 
  host = 'test-may26-jubileeaustralia-6f79.c.aivencloud.com', 
  port = 19731,
  user = 'avnadmin',
  password = 'AVNS_LmldOL3GqPV2w4glGJ4'
)

# Stop database connection when application stops
shiny::onStop(function() {
  dbDisconnect(conn)
})

# Turn off scientific notation
options(scipen = 999)

# Set spinner type (for loading)
options(spinner.type = 8)
