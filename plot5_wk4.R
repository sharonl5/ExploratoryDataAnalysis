
# Exploratory Data Analysis - course project 2 - Q. #5

# set work directory and reading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load ggplot2 library
require(ggplot2)

#5.How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City fips code=24510
Bltmr <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
Bltmr2 <- aggregate(Bltmr[, 'Emissions'], by=list(Bltmr$year), sum)
colnames(Bltmr2) <- c('year', 'Emissions')

# Generate the graph in the same directory as the source code
png('plot5_wk4.png')


ggplot(Bltmr2,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))


dev.off()