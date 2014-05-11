# Ingest file data
firstrow <- read.table("household_power_consumption.txt", nrow = 1,
	               header = TRUE, sep=";")
columns <- colnames(firstrow)
data <- read.table("household_power_consumption.txt", skip=66636,
     	           nrows=2880, header=TRUE, col.names=columns, sep=";")

# Massage date/time data
data$datetime <- strptime(paste(data$Date, data$Time),
                          format='%d/%m/%Y %H:%M:%S')

# open png file
png("plot3.png")

# Time vs Sub_metering_1/2/3
plot(data$datetime, data$Sub_metering_1, type="n",
     xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_1, col="black")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1),
       col = c("black", "blue", "red"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close png file
dev.off()
