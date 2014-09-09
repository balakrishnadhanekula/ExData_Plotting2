setwd("/home/bala/Downloads/exp_data_ana/project2/")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Summing the emissions by year
NEIEmiSum <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

# Opening the graphic device
png('plot1.png', width=480, height=480)
plot(NEIEmiSum$year,NEIEmiSum$Emissions, type="l",main="Total Emissions from PM2.5 in the US",ylab="Emissions", xlab="Year")
dev.off() # closing the graphic device