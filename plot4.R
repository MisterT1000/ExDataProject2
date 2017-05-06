# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

CoalCombSources <- SCC[grepl("Fuel Comb.*Coal", SCC$EI.Sector),]$SCC
CoalCombData <- NEI[NEI$SCC %in% CoalCombSources,]
CCDAgg <- aggregate(CoalCombData$Emissions, by=list(Year=CoalCombData$year), FUN=sum)

png(
  filename = "plot4.png",
  width = 480,
  height = 480,
  units = "px"
)

barplot(
  CCDAgg$x,
  names.arg = CCDAgg$Year,
  ylab = "PM2.5 Emissions",
  xlab = "Year",
  main = "Total PM2.5 Emissions (Coal Combustion-Related)"
)

dev.off()