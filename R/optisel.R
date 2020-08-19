library(optiSel)
library(readxl)
library(anytime)
require(data.table)

calculate_inbreeding <- function() {
    filename<-"G20200419"
    gottis <-read_excel(paste0('./',filename, '.xlsx'), range = cell_cols("A:V"), col_types = c("text", "skip", "skip","text", "text", "numeric", "date", "skip", "text","skip", "text","skip","skip","skip","skip","skip","skip","skip","skip","skip","numeric","numeric"))
    gottis <- gottis[,c("Nummer","Far nr","Mor nr","Kön","År","Namn","Född","2019","2018")]
    names(gottis)<-c("Indiv","Sire","Dam","Sex","Born","Name","Född","Nitton","Arton")
    #Ta bort tomma rader
    gottis<-gottis[!is.na(gottis$Indiv),]
    #rensa bort kastrat
    gottis=subset(gottis,Sex!="kastrat")
    gottis=subset(gottis,Sex!="?")
    Pedi <- prePed(gottis)
    #Gör om till Datum igen
    Pedi$Född<-anydate(Pedi$Född)

    pKin   <- pedIBD(Pedi)
}

