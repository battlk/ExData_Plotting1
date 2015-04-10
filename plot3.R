data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

date <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png")
plot(date, as.numeric(subset$Sub_metering_1), ylab="Energy Submetering", xlab="",type="l")
lines(date, as.numeric(subset$Sub_metering_2), col="red", type="l")
lines(date, as.numeric(subset$Sub_metering_3), col="blue",type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2.5)
dev.off()

