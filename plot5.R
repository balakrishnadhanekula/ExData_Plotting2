setwd("/home/bala/Downloads/exp_data_ana/project2/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extracting only the vehicle related data
SCCSubsetOnRoad=SCC[grep("On-Road",SCC$EI.Sector),]

#Extracting Baltimore Data
NEIBaltimoreData<-subset(NEI,subset=(fips=="24510"))

#subsetting the data for the vehicle related one
#NEIOnRoad<-subset(NEIBaltimoreData,subset=(SCC==SCCSubsetOnRoad$SCC))

NEIOnRoad<-subset(NEIBaltimoreData,NEIBaltimoreData$SCC %in% SCCSubsetOnRoad$SCC)



png('plot5.png', width=480, height=480)
plot(NEIOnRoad$year, NEIOnRoad$Emissions, type = "l", 
     main = "Total Vehicle Emissions in Baltimore City",
     xlab = "Year", ylab = "Emissions")
dev.off()