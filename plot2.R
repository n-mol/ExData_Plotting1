library(data.table)
dat <- fread("household_power_consumption.txt", skip="1/2/2007", nrows=2880,
             na.strings="?",header=FALSE)
header <- as.character(fread("household_power_consumption.txt", header=FALSE,
                             nrows=1))
dat <- setnames(dat, header)
DT <- strptime(paste(dat$Date, dat$Time, sep=" "), "%d/%m/%Y %H:%M:%S", tz="GMT")
png("plot2.png")
plot(DT, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()