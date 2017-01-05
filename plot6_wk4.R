# Exploratory Data Analysis - course project 2 - Q. #6

# set work directory and reading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load ggplot2 library
require(ggplot2)

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == 06037). Which city has seen greater changes over time 
# in motor vehicle emissions?

normalize <- function(x) {(x-min(x)) / (max(x)-min(x))}

# Get Baltimore and Los Angeles County emissions from motor vehicle sources
Bltmr <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
Bltmr2 <- aggregate(Emissions ~ year, data=Bltmr, FUN=sum)

LA <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
LA2 <- aggregate(Emissions ~ year, data=LA, FUN=sum)

Bltmr2$County <- "Baltimore City, MD"
LA2$County <- "Los Angeles County, CA"
Bltmr_LA <- rbind(Bltmr2, LA2)

# plot
png("plot6_wk4.png")
ggplot(Bltmr_LA, aes(x=factor(year), y=Emissions, fill=County)) +
  geom_bar(stat="identity") + 
  facet_grid(County  ~ ., scales="free") +
  ylab("total emissions (tons)") + 
  xlab("year") +
  ggtitle(expression("Motor vehicle emission variation\nin Baltimore and Los Angeles"))

dev.off()
