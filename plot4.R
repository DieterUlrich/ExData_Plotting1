# read in the data from file
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
# filter the data
data2 <- filter(data, Date=="1/2/2007"| Date=="2/2/2007")

# create datetime from date and time
library(lubridate)
vardate <- dmy(data2$Date)
vartime <- hms(data2$Time)
vardt <- vardate + vartime
data2 <- cbind(data2, vardt)

# preparing for the 4 plots
par(mfcol = c(2, 2), mar = c(4, 4, 2, 1))

# plot 1
with(data2, plot(vardt,Global_active_power, ylab="Global Active Power", xlab="", type="l"))

# plot 2
with(data2, plot(vardt,Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
with(data2, lines(vardt,Sub_metering_1, type="l"))
with(data2, lines(vardt,Sub_metering_2, type="l", col="red"))
with(data2, lines(vardt,Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

# plot 3
with(data2, plot(vardt,Voltage, xlab="datetime", type="l"))

# plot 4
with(data2, plot(vardt,Global_reactive_power, xlab="datetime", type="l"))

# write the plot into png-file
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()
