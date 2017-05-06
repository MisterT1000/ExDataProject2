# Of the four types of sources indicated by the type (point, nonpoint,
# onroad, nonroad) variable, which of these four sources have seen
# decreases in emissions from 1999–2008 for Baltimore City? Which
# have seen increases in emissions from 1999–2008? Use the ggplot2
# plotting system to make a plot answer this question.


NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")

BCM <- NEI[NEI$fips == "24510", ]
BCMagg2 <-
  aggregate(BCM$Emissions,
            by = list(Year = BCM$year, Source = BCM$type),
            FUN = sum)
names(BCMagg2)[3] = "Emissions"


png(
  filename = "plot3.png",
  width = 480,
  height = 480,
  units = "px"
)

p <- ggplot(BCMagg2, aes(x = Year, y = Emissions, color = Source)) + geom_line()
p + labs(title = "Baltimore City, MD Emissions by Source")

dev.off()