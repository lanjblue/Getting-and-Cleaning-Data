urlfile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
desfile <- "microdata.csv"
download.file(urlfile,desfile,method="curl")
dataDownloaded <- date()

microdata <- read.csv(desfile)
H_1M <- microdata

# question 3
library(xlsx)
#xlsxfile <- "http://www.gsa.gov/dg/pbs/DATA.gov_NGAP.xlsx"
xlsxfile <- "getdata-data-DATA.gov_NGAP.xlsx"
dat <- read.xlsx(xlsxfile,sheetIndex=1,rowIndex=18:23,colIndex=7:15,header=TRUE)

# question 4
library(XML)
xmlfile <- "http://d396qusza40orc.cloudfront.net/getdata/data/restaurants.xml"
doc <- xmlTreeParse(xmlfile, useInternal=TRUE)

rootNode <- xlmRoot(doc)
xmlName(rootNode)
rootNode[[1]][[1]]

zipcode <- xpathSApply(rootNode,"//zipcode",xmlValue)
length(zipcode[zipcode==21231])

# question 5
urlfile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
desfile <- "microdata.csv"
download.file(urlfile,desfile,method="curl")
dataDownloaded <- date()

library(data.table)
DT <- fread(input=desfile, sep=",")

system.time(mean(DT[DT$SEX==1,]$pwgtp15))
system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(DT[,mean(pwgtp15),by=SEX])

