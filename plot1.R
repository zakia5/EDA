library(data.table)
## reading data
inputFile <- "household_power_consumption.txt"
data <- read.table(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings='?')
work_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# assign to variables
globalActivePower <- as.numeric(work_data$Global_active_power)

# open device
png(filename='plot1.png',width=480,height=480,units='px')
##plot data
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close device
x<-dev.off()
