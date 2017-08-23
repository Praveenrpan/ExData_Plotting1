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

#### Prepare Plot 2
plot(datasubset$Global_active_power~datasubset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()