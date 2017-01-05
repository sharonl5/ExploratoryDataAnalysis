
# Exploratory Data Analysis - course project 2 - Q. #3

# set work directory and reading in data
setwd("C:/Users/sharon.liu/Documents/R/course 4")
getwd()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Baltimore City, fipscode 24510

Bltmr <- subset(NEI, fips == 24510)
Bltmr$year <- factor(Bltmr$year, levels=c('1999', '2002', '2005', '2008'))


# Generate the graph in the same directory as the source code
png(filename='plot3_wk4.png', width=800, height=500, units='px')

install.packages("ggplot2")
require(ggplot2)

ggplot(Bltmr,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()