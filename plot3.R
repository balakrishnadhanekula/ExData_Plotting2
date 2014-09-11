# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

setwd("/home/bala/Downloads/exp_data_ana/project2/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subsetting the data for the fips=24510
NEISubSet<-subset(NEI,subset=(fips=="24510"))

#Summing the emissions by year
NEIEmiSum <- aggregate(NEISubSet[c("Emissions")], list(type = NEISubSet$type, year = NEISubSet$year), sum)

#NEIEmiSum <- aggregate(NEISubSet[c("Emissions")], list(year = NEISubSet$year), sum)


#qplot(displ,hwy,data=mpg,facets=	.~	drv)
# Opening the graphic device
png('plot3.png', width=480, height=480)
qplot(year,Emissions,data=NEIEmiSum,facets= . ~ type)
dev.off() # closing the graphic device