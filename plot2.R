### plot2.R plots plot2.png

# Load file
fileURL <- "household_power_consumption.txt"
line1 <- readLines("household_power_consumption.txt", n = 1)
col_names <- strsplit(line, split = ";")
data <- read.table(file = fileURL, sep = ";", skip = 1, col.names = col_names[[1]])

# Convert to proper type to help computation
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# Grab subset using data from the dates 2007-02-01 and 2007-02-02
data_subset <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

# Paste Date and Time together 
data_subset$Date_Time <- strptime(paste(data_subset$Date, data_subset$Time), format = "%Y-%m-%d %H:%M:%S")

# Check Plot
# plot(data_subset$Date_Time, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Write to "plot2.png"
png(filename = "plot2.png")
plot(data_subset$Date_Time, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()