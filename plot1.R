### plot1.R plots plot1.png

# Load file
fileURL <- "household_power_consumption.txt"
line1 <- readLines("household_power_consumption.txt", n = 1)
col_names <- strsplit(line, split = ";")
data <- read.table(file = fileURL, sep = ";", skip = 1, col.names = col_names[[1]])

# Convert to proper type to help computation
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# Grab subset using data from the dates 2007-02-01 and 2007-02-02
data_subset <- subset(data,  data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

# Plot Histogram to double check
# hist(data_subset$Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Write to "plot1.png"
png(filename = "plot1.png")
hist(data_subset$Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

