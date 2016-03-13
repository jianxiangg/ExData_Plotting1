## Reading data and converting data formats as appropriate
power <- read.table("household_power_consumption.txt", header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
ds <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
ds$Global_active_power <- as.numeric(as.character(ds$Global_active_power))

## Plotting histogram
hist(ds$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main="Global Active Power", col="red")

## Saving as .png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()





