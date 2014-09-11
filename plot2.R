setwd("/home/bala/Downloads/exp_data_ana/project2/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subsetting the data for the fips=24510
NEISubSet<-subset(NEI,subset=(fips=="24510"))

#Summing the emissions by year
NEIEmiSum <- aggregate(NEISubSet[c("Emissions")], list(year = NEISubSet$year), sum)

# Opening the graphic device
png('plot2.png', width=480, height=480)
plot(NEIEmiSum$year,NEIEmiSum$Emissions, type="l",main="Total Emissions from PM2.5 in the Baltimore City",ylab="Emissions", xlab="Year")
dev.off() # closing the graphic device