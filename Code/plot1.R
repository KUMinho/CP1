#-------------------------------------------------------------------------------
#==== Course Project 1  ::  Plot 1
#-------------------------------------------------------------------------------

#...............................................................................
#==== Load and prepare data ====
datALL <- read.table("household_power_consumption.txt", head=T, sep=";", dec=".",
  stringsAsFactors = FALSE, na.strings = "?")
datALL$Date <- as.Date(datALL$Date, format="%d/%m/%Y")
dat <- subset(datALL, subset=Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))
rm(datALL)
dat$DateTime <- as.POSIXct(paste(dat$Date, dat$Time), format="%Y-%m-%d %H:%M:%S")

#...............................................................................
#==== Make Plot 1 ====
png(filename = "plot1.png", width = 480, height = 480, units = "px", )
with(dat, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
  main="Global Active Power"))
dev.off()
