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

## Convert date and time into one "date time" unit to track time across days
datause$dtt <- as.POSIXct(strptime(paste(datause$Date,datause$Time,sep=" "), "%Y-%m-%d %H:%M:%S"))

#########################################################################

#########################################################################
## Actually generating the plot
#########################################################################
## Create the png file to be built
png(filename = "plot3.png", width = 480, height = 480, units = "px")

## Generate plot of the 3 sub metering levels these 2 days,
## per the instructions
plot3 <- plot(datause$dtt,datause$Sub_metering_1, type = "l",
              ylab = "Energy sub metering",
              xlab = "",
              col="black")

## Adds the second and third lines (sub metering 2 and 3)
lines(datause$dtt,datause$Sub_metering_2, col="red")
lines(datause$dtt,datause$Sub_metering_3, col="purple4")

## Adds the legend
legend("topright", lty=1, 
       col = c("black","red", "purple"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3" ))

## Close the png build session
dev.off()

#########################################################################


