data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

date <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(date, as.numeric(subset$Global_active_power), xlab="", ylab="Global Active Power (kilowatts)",type="l")
dev.off()
