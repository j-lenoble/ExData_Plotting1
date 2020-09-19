#Download and Unzip File
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip ("data.zip", exdir = "./")

#Read Data
dat <- read.table(file = "household_power_consumption.txt", header = TRUE, na.strings="?", sep=";")
datF <- dat[(dat$Date=="1/2/2007" | dat$Date=="2/2/2007" ), ]

#Draw Plot 1
hist(datF$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)

#Export File
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()