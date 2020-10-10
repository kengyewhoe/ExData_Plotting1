dataFile <- './household_power_consumption.txt'
data <- read.table(dataFile, header = TRUE, sep = ";",
                   stringsAsFactors = FALSE, dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 
sub_metering_1 = as.numeric(subSetData$Sub_metering_1)
sub_metering_2 = as.numeric(subSetData$Sub_metering_2)
sub_metering_3 = as.numeric(subSetData$Sub_metering_3)

png("plot4.png", 480, 480)
par(mfrow= c(2,2))
plot(datetime, as.numeric(subSetData$Global_active_power), xlab = " ",
     ylab = "Global Active Power(kilowatts)", type = "l")
plot(datetime, as.numeric(subSetData$Voltage),xlab = "datetime",
     ylab = "Voltage", type = "l")
plot(datetime, sub_metering_1, type ='l', xlab=" ", ylab = "Energy sub metering")
lines(datetime, sub_metering_2, type ='l',col = "red")
lines(datetime, sub_metering_3, type ='l',col = "blue")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),lty = 1, 
       col = c("black", "red", "blue"), bty = "n")
plot(datetime, as.numeric(subSetData$Global_reactive_power), xlab = "datetime", ylab = "Global_reactive_power",
     type = "l")

dev.off()
