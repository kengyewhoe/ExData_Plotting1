dataFile <- './household_power_consumption.txt'
setwd('D:/Desk/ExData_Plotting1/exdata_data_household_power_consumption')
data <- read.table(dataFile, header = TRUE, sep = ";",
                   stringsAsFactors = FALSE, dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

sub_metering_1 = as.numeric(subSetData$Sub_metering_1)
sub_metering_2 = as.numeric(subSetData$Sub_metering_2)
sub_metering_3 = as.numeric(subSetData$Sub_metering_3)

plot(datetime, sub_metering_1, type ='l', xlab=" ", ylab = "Energy sub metering")
lines(datetime, sub_metering_2, type ='l',col = "red")
lines(datetime, sub_metering_3, type ='l',col = "blue")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),lty = 1, 
       col = c("black", "red", "blue"), )
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
