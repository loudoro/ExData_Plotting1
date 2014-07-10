data <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
data$Date = as.Date(data$Date, "%d/%m/%Y")
data = data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

data$datetime = paste(data$Date, data$Time, sep = " ")
data$datetime = strptime(data$datetime, format = "%Y-%m-%d %H:%M:%S")

data$Global_active_power = as.numeric(data$Global_active_power)

data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)

data$Voltage = as.numeric(data$Voltage)

## plot3

plot3 = with(data, {
  plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), cex = 0.8,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()