#########################################################################
## Generates plot4.png
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
png(filename = "plot4.png", width = 480, height = 480, units = "px")

## Generate the 4 plots in one panel,
## per the instructions
par(mfrow = c(2,2))

## First Plot - global power vs time, one label
    plot(datause$dtt,datause$Global_active_power, 
              type = "l",
              ylab = "Global Active Power (kilowatts)",
              xlab = "")
    
## Second plot - voltage vs time, both axes labelled
    plot(datause$dtt, datause$Voltage, 
         type = "l",
         xlab = "datetime",
         ylab = "Voltage")

## Third Plot - same as Plot 3 but legend is smaller font
## and has no border
    plot(datause$dtt,datause$Sub_metering_1, type = "l",
                  ylab = "Energy sub metering",
                  xlab = "",
                  col="black")
    
        lines(datause$dtt,datause$Sub_metering_2, col="red")
        lines(datause$dtt,datause$Sub_metering_3, col="purple")
        legend("topright", lty=1, 
            col = c("black","red", "purple"),
            cex = c(.9,.9,.9), bty = "n",
            legend = c("Sub_metering_1",
                      "Sub_metering_2",
                      "Sub_metering_3" ))

## Fourth plot, both axes labelled reactive power vs time
    plot(datause$dtt, datause$Global_reactive_power,
         type = "l",
         xlab = "datetime",
         ylab = "Global_reactive_power")
    
## Close the png build session
dev.off()

#########################################################################


