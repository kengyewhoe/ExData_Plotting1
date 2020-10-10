dataFile <- './household_power_consumption.txt'
data <- read.table(dataFile, header = TRUE, sep = ";",
                   stringsAsFactors = FALSE, dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

hist(as.numeric(subSetData$Global_active_power), col = 'red',
      main = "Global Active Power", xlab = "Global Active Power(kilowatts)",
     ylab = "Frequency")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
