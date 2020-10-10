dataFile <- './household_power_consumption.txt'
data <- read.table(dataFile, header = TRUE, sep = ";",
                   stringsAsFactors = TRUE, dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, as.numeric(subSetData$Global_active_power), xlab = " ",
     ylab = "Global Active Power(kilowatts)", type = "l")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
