#########################################################################
## Generates plot2.png
#########################################################################

#########################################################################
## Cleaning the data set
#########################################################################

## First, read the text file 
datain <- read.table("household_power_consumption.txt",
                     sep = ";", header=TRUE, na.strings="?")

## Convert date column to readable dates
datain$Date <- as.Date(datain$Date,"%d/%m/%Y")

## Extract the dates that I am analyzing
datause <- datain[datain$Date == "2007-02-01" | datain$Date == "2007-02-02",]

## Convert date and time into one "date time" unit to track time across days
datause$dtt <- as.POSIXct(strptime(paste(datause$Date,datause$Time,sep=" "), "%Y-%m-%d %H:%M:%S"))

#########################################################################

#########################################################################
## Actually generating the plot
#########################################################################
## Create the png file to be built
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## Generate plot of global power consumption these 2 days,
## per the instructions
plot2 <- plot(datause$dtt,datause$Global_active_power, 
              type = "l",
              ylab = "Global Active Power (kilowatts)",
              xlab = "")

## Close the png build session
dev.off()

#########################################################################


