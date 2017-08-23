####Read data from the folder where the text file has been unzipped and saved
datafile <- "./household_power_consumption.txt"
#### Read data and prepare a data table
plot1data <- read.table(datafile,header= TRUE, sep=";", stringsAsFactors = FALSE,
  na.strings="?",dec=".")
#### Prepare a subset with the date cutoff points
subsetplot1 <- plot1data[plot1data$Date %in% c("1/2/2007", "2/2/2007"),]

GlobalActivePower <- as.numeric(subsetplot1$Global_active_power)
png ("plot1.png", width = 480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab= "Global Active Power (kilowatts)")
dev.off()