# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from
# all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")

agg <-
  aggregate(NEI$Emissions, by = list(Year = NEI$year), FUN = sum)

png(
  filename = "plot1.png",
  width = 480,
  height = 480,
  units = "px"
)

barplot(
  agg$x,
  names.arg = agg$Year,
  ylab = "Total Emissions",
  xlab = "Year",
  main = "Total PM2.5 Emissions"
)

dev.off()