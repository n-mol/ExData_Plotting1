library(data.table)
dat <- fread("household_power_consumption.txt", skip="1/2/2007", nrows=2880,
             na.strings="?",header=FALSE)
header <- as.character(fread("household_power_consumption.txt", header=FALSE,
               nrows=1))
dat <- setnames(dat, header)
DT <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S", tz="GMT")
png(file="plot3.png")
plot(DT, dat$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(DT, dat$Sub_metering_2, type="l", col="red") 
lines(DT, dat$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,
       lwd=2.5, col=c("black", "red", "blue")) 
dev.off()