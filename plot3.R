#Download and Unzip File
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

#Read Data
dat <- read.table(file = "household_power_consumption.txt", header = TRUE, na.strings="?", sep=";")
datF <- dat[(dat$Date=="1/2/2007" | dat$Date=="2/2/2007" ), ]

#Format Date and Time
datF$Date <- as.Date(datF$Date, format="%d/%m/%Y")
dateTime <- paste(datF$Date, datF$Time)
datF$DateTime <- as.POSIXct(dateTime)

#Draw Plot 3
with(datF, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Energy sub metering", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

#Export File
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
