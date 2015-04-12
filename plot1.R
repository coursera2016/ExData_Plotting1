dat <- read.csv2("household_power_consumption.txt", na.string="?", dec=".")
dat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")
dat <- cbind(dat, datetime)

png("plot1.png", width=480, height=480)
hist(dat$Global_active_power, col=2, main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()