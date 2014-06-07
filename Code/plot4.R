#-------------------------------------------------------------------------------
#==== Course Project 1  ::  Plot 4
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
#==== Make Plot 4 ====
png(filename = "plot4.png", width = 480, height = 480, units = "px", )
par(mfrow=c(2,2))
with(dat, plot(DateTime, Global_active_power, col="black", type="l",
  xlab="", ylab="Global Active Power"))
  
with(dat, plot(DateTime, Voltage, col="black", type="l",
  xlab="datetime", ylab="Voltage"))
  
with(dat, plot(DateTime, Sub_metering_1, col="black", type="n",
  xlab="", ylab="Energy sub metering",
  ylim=range(dat[,c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")])))
with(dat, points(DateTime, Sub_metering_1, type="l", col="black"))
with(dat, points(DateTime, Sub_metering_2, type="l", col="red"))
with(dat, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty=1, col=c("black", "red", "blue"), bty="n")
  
with(dat, plot(DateTime, Global_reactive_power, col="black", type="l",
  xlab="datetime"))

dev.off()
