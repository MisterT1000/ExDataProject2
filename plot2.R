# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make
# a plot answering this question.

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")

BCM <- NEI[NEI$fips=="24510",]

BCMagg <- aggregate(BCM$Emissions, by=list(Year=BCM$year), FUN=sum)

png(
  filename = "plot2.png",
  width = 480,
  height = 480,
  units = "px"
)

plot(BCMagg$Year, BCMagg$x, 
     type = "l", 
     col = "blue", 
     lwd = 3,
     xlab = "Year",
     ylab = "Total Emissions",
     main = "Baltimore City, MD Total Emissions")

dev.off()