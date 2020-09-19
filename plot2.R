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

#Draw Plot 2
plot(datF$Global_active_power~datF$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Export File
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
