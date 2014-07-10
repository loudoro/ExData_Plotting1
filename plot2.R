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

plot2 = with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()