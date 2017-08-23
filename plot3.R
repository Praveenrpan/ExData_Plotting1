####Read data and prepare a data set
datafile <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
#### Format date variable
datafile$Date <- as.Date(datafile$Date, format="%d/%m/%Y")

#### Prepare a subset with the date cutoff points
datasubset <- subset(datafile, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


#### Convert Date and Time Variables to Date/Time Classes using as.Date ()
datetime <- paste(as.Date(datasubset$Date), datasubset$Time)
datasubset$Datetime <- as.POSIXct(datetime)

####Prepare plot 3

with (datasubset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab = "Energy sub metering", xlab="")
      lines (Sub_metering_2~Datetime, col='Red')
      lines (Sub_metering_3~Datetime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy (png, file="plot3.png", height=480, width=480)
dev.off()