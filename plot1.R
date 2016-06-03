## setwd("C:/Users/lindec25/Johan/Study/Coursera/R/Exploratory Data Analysis/Project")

## This first line will likely take a few seconds. Be patient!

setwd("./exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

setwd((".."))

with(NEI, plot(Emissions,year))