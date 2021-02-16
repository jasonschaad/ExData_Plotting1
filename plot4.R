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
par(mfrow=c(2,2))
with(data, {
  plot(Global_active_power~DateTime, type="l", 
       xlab="", ylab="Global Active Power")
  plot(Voltage~DateTime, type="l", 
       xlab="datetime", ylab="Voltage")
  plot(Sub_metering_1 ~ DateTime, type="l", 
       xlab="datetime", ylab="Energy sub meeting")
  lines(Sub_metering_2 ~ DateTime,col='Red')
  lines(Sub_metering_3 ~ DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       xlab="datetime", ylab="Global_reactive_power")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()