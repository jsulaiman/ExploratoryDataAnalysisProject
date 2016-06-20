## setwd("C:/Users/lindec25/Johan/Study/Coursera/R/Exploratory Data Analysis/Project")

## This first line will likely take a few seconds. Be patient!

setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd((".."))

BaltimoreNEI = NEI[NEI$fips=="24510",]
# Aggregate data
AggregatedEmissions = aggregate(Emissions ~ year, BaltimoreNEI, sum)

# Have total emissions from PM2.5 decreased in Baltimore City, Maryland from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 2005, and 2008.

#Open .png file
png(filename="plot2.png", height=480,width = 480)

barplot(main="Total emissions from PM2.5 in Baltimore City",
        names.arg=AggregatedEmissions$year,
        height = AggregatedEmissions$Emissions/1000,
        xlab="Year", 
        ylab="Total PM2.5 Emissions (in tons)"
        )

#Close .png file
dev.off()