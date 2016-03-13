## Reading data and converting data formats as appropriate
power <- read.table("household_power_consumption.txt", header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
ds <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
ds$datetime <- as.POSIXct(paste(ds$Date,ds$Time))
ds$Sub_metering_1 <- as.numeric(as.character(ds$Sub_metering_1))
ds$Sub_metering_2 <- as.numeric(as.character(ds$Sub_metering_2))
ds$Sub_metering_3 <- as.numeric(as.character(ds$Sub_metering_3))

## Plotting three different line charts
plot(ds$datetime, ds$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(ds$datetime, ds$Sub_metering_2, col="red")
lines(ds$datetime, ds$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), col=c("Black","Red","Blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6)

## Saving as .png file'
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
