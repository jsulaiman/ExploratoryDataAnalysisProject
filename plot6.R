library(ggplot2)

## setwd("C:/Users/lindec25/Johan/Study/Coursera/R/Exploratory Data Analysis/Project")

## This first line will likely take a few seconds. Be patient!

setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd((".."))

# Compare emissions from motor vehicle sources in Baltimore City with 
#emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

BaltimoreNEI = NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]

BaltimoreAggregatedEmissions = aggregate(Emissions ~ year, BaltimoreNEI, sum)


LosAngelesNEI = NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]

LosAngelesAggregatedEmissions = aggregate(Emissions ~ year, LosAngelesNEI, sum)

BaltimoreAggregatedEmissions$County="Baltimore City, MD"
LosAngelesAggregatedEmissions$County="Los Angeles, CA"
AggregatedEmissions=rbind(BaltimoreAggregatedEmissions,LosAngelesAggregatedEmissions)
colnames(AggregatedEmissions)=c("Year","Emissions","County")

#Open .png file
png(filename="plot6.png", height=480,width = 680)

plotPrint = 
ggplot(AggregatedEmissions,aes(x=factor(Year),y=Emissions, fill=County))+
geom_bar(stat="identity")+
facet_grid(County~.,scales="free")+
xlab("Year") +
ylab(expression("Total PM"[2.5]*" Emission")) +
ggtitle(expression("PM"[2.5]*" Total Emissions in Baltimore City versus Los Angeles from Motor Vehicle Sources"))

print(plotPrint)
#Close .png file
dev.off()