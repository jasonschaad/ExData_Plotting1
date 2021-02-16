# read data into full_data
data_full <- read.table("../household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

# We are only interested in the dates 2007-02-01 and 2007-02-02
# subset data_full
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

# format date and time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

# export as png file with height 480 and width 480
with(data, {
  plot(Sub_metering_1 ~ DateTime, type="l",
       xlab="", ylab="Energy Sub Metering")
  lines(Sub_metering_2 ~ DateTime, col='Red')
  lines(Sub_metering_3 ~ DateTime, col='Blue')
})
legend("topright", lty=1, lwd=3, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()