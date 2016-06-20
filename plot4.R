library(ggplot2)

## setwd("C:/Users/lindec25/Johan/Study/Coursera/R/Exploratory Data Analysis/Project")

## This first line will likely take a few seconds. Be patient!

setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd((".."))

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

SCCCoal = SCC[grepl("coal",SCC$Short.Name,ignore.case=TRUE),]

MergedEmissions = merge(x=NEI,y=SCCCoal,by="SCC")
AggregatedEmissions=aggregate(MergedEmissions$Emissions, list(MergedEmissions$year), sum)
colnames(AggregatedEmissions)=c("Year","Emissions")

#Open .png file
png(filename="plot4.png", height=480,width = 680)

plotPrint = 
ggplot(AggregatedEmissions,aes(x=factor(Year),y=Emissions/1000))+
geom_bar(stat="identity")+
xlab("Year") +
ylab(expression("Total PM"[2.5]*" Emission (in kilotons)")) +
ggtitle(expression("PM"[2.5]*" Total Emissions in United States from Coal combustion-related Sources"))

print(plotPrint)
#Close .png file
dev.off()