#-------------------------------------------------------------------------------
#==== Course Project 1  ::  Plot 2
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
#==== Make Plot 2 ====
png(filename = "plot2.png", width = 480, height = 480, units = "px", )
with(dat, plot(DateTime, Global_active_power, col="black", type="l",
  xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
