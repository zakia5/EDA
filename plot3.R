library(data.table)
## reading data
inputFile <- "household_power_consumption.txt"
data <- read.table(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings='?')
work_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# assign to variables

datetime <- strptime(paste(work_data$Date, work_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(work_data$Sub_metering_1)
subMetering2 <- as.numeric(work_data$Sub_metering_2)
subMetering3 <- as.numeric(work_data$Sub_metering_3)

# open device
png(filename='plot3.png',width=480,height=480,units='px')
##plot data
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty='solid', col=c("black", "red", "blue"),bty = "n")

# close device
x<-dev.off()
