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

# create the plot
with(data2, plot(vardt,Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l"))

# write the plot into png-file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()