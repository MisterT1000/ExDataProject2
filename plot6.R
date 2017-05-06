# Compare emissions from motor vehicle sources in Baltimore City
# with emissions from motor vehicle sources in Los Angeles County,
# California (fips == "06037"). Which city has seen greater changes 
# over time in motor vehicle emissions?


NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")

BCLA <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
BCLAAgg <- aggregate(BCLA$Emissions, by=list(Year=BCLA$year, City=BCLA$fips), FUN=sum)
names(BCLAAgg)[3] = "Emissions"
BCLAAgg[BCLAAgg$City=="06037",]$City <- "Los Angeles"
BCLAAgg[BCLAAgg$City=="24510",]$City <- "Baltimore"

png(
  filename = "plot6.png",
  width = 480,
  height = 480,
  units = "px"
)

p <- ggplot(BCLAAgg, aes(x = Year, y = Emissions, color = City)) + geom_line()
p + labs(title = "Baltimore & LA Emissions")

dev.off()