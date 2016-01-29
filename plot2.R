library(data.table)
## reading data
inputFile <- "household_power_consumption.txt"
data <- read.table(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings='?')
work_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# assign to variables
datetime <- strptime(paste(work_data$Date, work_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# open device
png(filename='plot2.png',width=480,height=480,units='px')
##plot data
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close device
x<-dev.off()
