#########################################################################
## Generates plot1.png
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

#########################################################################

#########################################################################
## Actually generating the plot
#########################################################################

## Create the png file to be built
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## Generate histogram of global power consumption these 2 days,
## per the instructions
plot1 <- hist(datause$Global_active_power,breaks=20, 
              main = "Global Active Power", 
              xlab = "Global Active Power (kilowatts)",
              col = "red")

## Close the png build session
dev.off()

#########################################################################
