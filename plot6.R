setwd("/home/bala/Downloads/exp_data_ana/project2/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Extracting Data of vehicle sources
SCCSubsetOnRoad=SCC[grep("On-Road",SCC$EI.Sector),]

#Extracting Baltimore &LA Data
NEIBaltiLA<-subset(NEI,subset=(fips==c("24510","06037")))

#subsetting the data for the vehicle related one
NEIBaltiLAOnRoad<-subset(NEIBaltiLA, NEIBaltiLA$SCC %in% SCCSubsetOnRoad$SCC)

#Aggregating the data based on year and SCC
NEIBaltiLAOnRoadSum <- aggregate(NEIBaltiLAOnRoad[c("Emissions")], list(fips = NEIBaltiLAOnRoad$fips, year = NEIBaltiLAOnRoad$year), sum)

# Opening the graphic device
png('plot6.png', width=480, height=480)
qplot(year,Emissions,data=NEIBaltiLAOnRoadSum,facets= . ~ fips)
dev.off() # closing the graphic device