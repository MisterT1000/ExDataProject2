# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")

BCMV <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
BCMVAgg <- aggregate(BCMV$Emissions, by=list(Year=BCMV$year), FUN=sum)

png(
  filename = "plot5.png",
  width = 480,
  height = 480,
  units = "px"
)

barplot(
  BCMVAgg$x,
  names.arg = BCMVAgg$Year,
  ylab = "PM2.5 Emissions",
  xlab = "Year",
  main = "Total PM2.5 Emissions (Baltimore Vehicles)"
)

dev.off()