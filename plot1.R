# read data into full_data
data_full <- read.table("../household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# We are only interested in the dates 2007-02-01 and 2007-02-02
# subset data_full
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

# Plot 1 histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# export as png file with height 480 and width 480
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()