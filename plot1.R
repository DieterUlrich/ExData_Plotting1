# read in the data from file
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
# filter the data
data2 <- filter(data, Date=="1/2/2007"| Date=="2/2/2007")

# create the plot
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# write the plot into png-file
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()