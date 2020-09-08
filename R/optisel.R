library(optiSel)
library(readxl)
library(anytime)
source("/usr/local/optisel/R/db.R")
#source("./db.R")


calculate_inbreeding <- function() {
    con <- connect_to_pg()
    gottis <- get_all_individuals(con)
    names(gottis)<-c("Indiv","Sire","Dam","Sex", "Born", "Dead")
    gottis<-gottis[!is.na(gottis$Indiv),]
    gottis<-gottis[!is.na(gottis$Sire),]
    gottis<-gottis[!is.na(gottis$Dam),]
    gottis<-gottis[is.na(gottis$Dead),]
    gottis=subset(gottis,Sex!="kastrat")
    gottis=subset(gottis,Sex!="eunuch")
    gottis=subset(gottis,Sex!="?")
    Pedi <- prePed(gottis)
    return (pedInbreeding(Pedi))
}

calculate_kinship <- function() {
    con <- connect_to_pg()
    gottis <- get_all_individuals(con)
    names(gottis)<-c("Indiv","Sire","Dam","Sex", "Born", "Dead")
    gottis<-gottis[!is.na(gottis$Indiv),]
    gottis<-gottis[!is.na(gottis$Sire),]
    gottis<-gottis[!is.na(gottis$Dam),]
    gottis<-gottis[is.na(gottis$Dead),]
    gottis=subset(gottis,Sex!="kastrat")
    gottis=subset(gottis,Sex!="eunuch")
    gottis=subset(gottis,Sex!="?")
    Pedi <- prePed(gottis)
    return (pedIBD(Pedi))
}

