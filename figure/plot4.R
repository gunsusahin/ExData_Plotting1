#First read the text
powerdata <- read.table("household_power_consumption.txt", sep = ";", colClasses = c(Date = "character", Time = "character"), header = TRUE, na.strings = "?") 

#Extract and load only the data between the dates 2007-02-01 and 2007-02-02
mydata <- subset(powerdata, Date=="1/2/2007"| Date =="2/2/2007")

#Concatenate date and time column
mydata$datetime <- paste(mydata$Date, mydata$Time, sep=" ")

mydata$datetime<- strptime(mydata$datetime, "%d/%m/%Y %H:%M:%S")

#If you have your system language in something other than English, this code works temporarily
Sys.setlocale("LC_TIME","en_US")

submet1 <- mydata$Sub_metering_1
submet2 <- mydata$Sub_metering_2
submet3 <- mydata$Sub_metering_3

#Launch a png file and plot the graphs
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
with(mydata, {
        plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", col="peachpuff4")
        
        plot(datetime, Voltage, type = "l", xlab="datetime", ylab="Voltage", col= "violetred4")
        
        plot(datetime, submet1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
        lines(datetime, submet2, xlab = "", ylab = "Energy sub metering", type = "l", col = "lawngreen")
        lines(datetime, submet3, xlab = "", ylab = "Energy sub metering", type = "l", col = "orangered2")
        
        legend("topright", lty = 1:1:1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "lawngreen", "orangered2"))
        
        plot(datetime, Global_active_power, type = "l", xlab="datetime", ylab="Global_active_power", col= "darkseagreen4")
        
})
dev.off()