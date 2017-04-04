### plot4.R plots plot4.png
# Load file
fileURL <- "household_power_consumption.txt"
line1 <- readLines("household_power_consumption.txt", n = 1)
col_names <- strsplit(line, split = ";")
data <- read.table(file = fileURL, sep = ";", skip = 1, col.names = col_names[[1]])

# Convert to proper type to help computation
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

# Grab subset using data from the dates 2007-02-01 and 2007-02-02
data_subset <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

# Paste Date and Time together 
data_subset$Date_Time <- strptime(paste(data_subset$Date, data_subset$Time), format = "%Y-%m-%d %H:%M:%S")

# Check plots
#par(mfrow = c(2,2))
#plot(data_subset$Date_Time, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#plot(data_subset$Date_Time, data_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#plot(data_subset$Date_Time, data_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
#points(data_subset$Date_Time, data_subset$Sub_metering_2, type = "l")
#points(data_subset$Date_Time, data_subset$Sub_metering_2, type = "l", col = "red")
#points(data_subset$Date_Time, data_subset$Sub_metering_3, type = "l", col = "blue")
#legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"), bty = "n", cex = 0.8)
#plot(data_subset$Date_Time, data_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Write to "plot4.png"
png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(data_subset$Date_Time, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data_subset$Date_Time, data_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data_subset$Date_Time, data_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data_subset$Date_Time, data_subset$Sub_metering_2, type = "l")
points(data_subset$Date_Time, data_subset$Sub_metering_2, type = "l", col = "red")
points(data_subset$Date_Time, data_subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"), bty = "n", cex = 0.8)
plot(data_subset$Date_Time, data_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()