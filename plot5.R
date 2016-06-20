library(ggplot2)

## setwd("C:/Users/lindec25/Johan/Study/Coursera/R/Exploratory Data Analysis/Project")

## This first line will likely take a few seconds. Be patient!

setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd((".."))

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?


BaltimoreNEI = NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]

AggregatedEmissions = aggregate(Emissions ~ year, BaltimoreNEI, sum)

colnames(AggregatedEmissions)=c("Year","Emissions")

#Open .png file
png(filename="plot5.png", height=480,width = 680)

plotPrint = 
ggplot(AggregatedEmissions,aes(x=factor(Year),y=Emissions))+
geom_bar(stat="identity")+
xlab("Year") +
ylab(expression("Total PM"[2.5]*" Emission")) +
ggtitle(expression("PM"[2.5]*" Total Emissions in Baltimore City from Motor Vehicle Sources"))

print(plotPrint)
#Close .png file
dev.off()