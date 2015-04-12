dat <- read.csv2("household_power_consumption.txt", na.string="?", dec=".")
dat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat <- cbind(dat, datetime)

png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(dat$datetime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(dat$datetime, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dat$datetime, dat$Sub_metering_2, type="l", col=2)
lines(dat$datetime, dat$Sub_metering_3, type="l", col=4)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c(1,2,4), 
       lty=1, bty="n")

plot(dat$datetime, dat$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dat$datetime, dat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()