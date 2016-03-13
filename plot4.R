## Reading data and converting data formats as appropriate
power <- read.table("household_power_consumption.txt", header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
ds <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
ds$datetime <- as.POSIXct(paste(ds$Date,ds$Time))
ds$Voltage <- as.numeric(as.character(ds$Voltage))
ds$Global_reactive_power <- as.numeric(as.character(ds$Global_reactive_power))

## Setting plot area
par(mfrow=c(2,2),mar=c(4,4,4,2))

## Plot 1
plot(ds$datetime, ds$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

## Plot 2
plot(ds$datetime, ds$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

## Plot 3
plot(ds$datetime, ds$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(ds$datetime, ds$Sub_metering_2, col="red")
lines(ds$datetime, ds$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5)

## Plot 4
plot(ds$datetime, ds$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

## Saving as .png file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
