library(data.table)
dat <- fread("household_power_consumption.txt", skip="1/2/2007", nrows=2880,
             na.strings="?",header=FALSE)
header <- as.character(fread("household_power_consumption.txt", header=FALSE,
                             nrows=1))
dat <- setnames(dat, header)
png(file="plot1.png")
hist(dat$Global_active_power, col="orangered", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()