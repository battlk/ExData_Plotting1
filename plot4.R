data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

date <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date, as.numeric(subset$Global_active_power), xlab="", ylab="Global Active Power", type="l", cex=0.2)
plot(date, as.numeric(subset$Voltage), xlab="datetime", ylab="Voltage",type="l")
plot(date, as.numeric(subset$Sub_metering_1), ylab="Energy Submetering", xlab="",type="l")
lines(date, as.numeric(subset$Sub_metering_2), col="red",type="l")
lines(date, as.numeric(subset$Sub_metering_3), col="blue",type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=, lwd=2.5, bty="o")
plot(date, as.numeric(subset$Global_reactive_power), xlab="datetime", ylab="Global_reactive_power",type="l")
dev.off()

