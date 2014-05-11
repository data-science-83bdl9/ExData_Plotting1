# Ingest file data
firstrow <- read.table("household_power_consumption.txt", nrow = 1,
	               header = TRUE, sep=";")
columns <- colnames(firstrow)
data <- read.table("household_power_consumption.txt", skip=66636,
     	           nrows=2880, header=TRUE, col.names=columns, sep=";")

# Open png file
png("plot1.png")

# Make histogram plot
hist(data$Global_active_power, col="red",
     xlab="Global Active Power (kilowatts)", main="Global Active Power")

# Close png file
dev.off()
