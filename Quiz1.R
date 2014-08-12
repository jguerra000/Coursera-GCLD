## Quiz 1.

##Q1:
data <- read.csv("getdata-data-ss06hid.csv")
my_val_data <- data [data [,"VAL"] ==24 , "VAL"]
my_val_data <- my_val_data [complete.cases (my_val_data)]
summary (my_val_data) 
length (my_val_data)
## Solution:53

##Q2:
#Tidy data has one variable per column.
data <- read.csv("getdata-data-ss06hid.csv")

##Q3
library("xlsx")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx "
download.file (fileUrl, destfile = "./data//naturalGas.xlsx", method = "curl", mode="wb")
#gasData <- read.xlsx("./data//naturalGas.xlsx", sheetIndex=1, header = TRUE)

rows <- 18:23
cols <- 7:15
dat <- read.xlsx("./data//naturalGas.xlsx", sheetIndex=1, colIndex = cols, rowIndex = rows, header=TRUE)
sum(dat2$Zip*dat2$Ext,na.rm=T) 
#Answer: 36534720


##Q4
library(XML)
fileURLXML <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml" 
doc <- xmlTreeParse (fileURLXML, useInternal =TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
length(zipcodes[zipcodes == 21231])
##Answer: 127


##Q5
library(data.table)
fileURL5 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" 
download.file (fileURL5, destfile = "./data//communities.csv", method = "curl", mode="wb")
DT <- fread("./data/communities.csv")

start.time <- Sys.time()
for (i in 1:1000) 
DT[,mean(pwgtp15),by=SEX]
tictoc <-  Sys.time() - start.time 
tictoc
#2.088. da una matriz

start.time <- Sys.time()
for (i in 1:1000) 
tapply(DT$pwgtp15,DT$SEX,mean)
tictoc <-  Sys.time() - start.time 
tictoc
#2.05. Un vector

start.time <- Sys.time()
for (i in 1:1000) 
sapply(split(DT$pwgtp15,DT$SEX),mean)
tictoc <-  Sys.time() - start.time 
tictoc
#1.15

start.time <- Sys.time()
for (i in 1:1000) 
mean(DT$pwgtp15,by=DT$SEX)
tictoc <-  Sys.time() - start.time 
tictoc
#0.05, pero no calcula lo que es.

start.time <- Sys.time()
for (i in 1:1000) 
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
tictoc <-  Sys.time() - start.time 
tictoc
##Error

start.time <- Sys.time()
for (i in 1:1000) 
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
tictoc <-  Sys.time() - start.time 
tictoc
#40secs

##Answer:
#sapply(split(DT$pwgtp15,DT$SEX),mean)
#DataTable is very very fast for group and subsetting

##Otra manera mas mejor de calcular el tiempo sin bucles.
start.time <- Sys.time()
tictoc <-  system.time( replicate( 1000, { sapply(split(DT$pwgtp15,DT$SEX),mean) } ) )- start.time 
tictoc
