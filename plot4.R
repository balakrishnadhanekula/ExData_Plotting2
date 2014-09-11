setwd("/home/bala/Downloads/exp_data_ana/project2/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extracting only the coal realted combustion data
SCCSubset=SCC[grep("Coal",SCC$EI.Sector),]


#subsetting the data for the coal combustion related one.
#NEICoalSet<-subset(NEI,subset=(SCC==SCCSubset$SCC))
NEICoalSet<-subset(NEI,NEI$SCC %in% SCCSubset$SCC)

NEICoalSetSum <- aggregate(NEICoalSet[c("Emissions")], list(year = NEICoalSet$year), sum)


# Opening the graphic device
png('plot4.png', width=480, height=480)
#qplot(year,Emissions,data=NEICoalSet)
p <- ggplot(NEICoalSetSum, aes(x=year, y=Emissions)) +
  geom_point(alpha=.3) +
  geom_smooth(alpha=.2, size=1) +
  ggtitle("Total PM2.5 Coal Combustion Emissions in the US")
print(p)
dev.off() # closing the graphic device