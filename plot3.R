library(ggplot2)

## setwd("C:/Users/lindec25/Johan/Study/Coursera/R/Exploratory Data Analysis/Project")

## This first line will likely take a few seconds. Be patient!

setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd((".."))

BaltimoreNEI = NEI[NEI$fips=="24510",]
# Aggregate data
AggregatedEmissions = aggregate(Emissions ~ year + type, BaltimoreNEI, sum)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

#Open .png file
png(filename="plot3.png", height=480,width = 680)

plotPrint = ggplot(AggregatedEmissions,aes(x=factor(year),y=Emissions, fill = type))+
geom_bar(stat="identity")+
facet_grid(.~type)+
xlab("Year") +
ylab(expression("Total PM"[2.5]*" Emission")) +
ggtitle(expression("PM"[2.5]*" Total Emissions in Baltimore City by Source Types"))

print(plotPrint)
#Close .png file
dev.off()