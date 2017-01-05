
# Exploratory Data Analysis - course project 2 - Q. #2

# set work directory and reading in data
setwd("C:/Users/sharon.liu/Documents/R/course 4")
getwd()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.
# Subset data for Baltimore city, MD fips code 24510
MD <- subset(NEI, fips=='24510')

# Generate a plot2_wk4 
png(filename='plot2_wk4.png')

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()