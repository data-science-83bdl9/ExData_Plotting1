# Ingest file data
firstrow <- read.table("household_power_consumption.txt", nrow = 1,
	               header = TRUE, sep=";")
columns <- colnames(firstrow)
data <- read.table("household_power_consumption.txt", skip=66636,
     	           nrows=2880, header=TRUE, col.names=columns, sep=";")

# Massage date/time data
data$datetime <- strptime(paste(data$Date, data$Time),
                          format='%d/%m/%Y %H:%M:%S')

# Open png file
png("plot2.png")

# Make line plot
plot(data$datetime, data$Global_active_power, type="n",
     xlab="", ylab="Global Active Power (kilowatts)")
lines(data$datetime, data$Global_active_power)

# Close png file
dev.off()
