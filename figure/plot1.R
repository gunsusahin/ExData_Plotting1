#First read the text 
powerdata <- read.table("household_power_consumption.txt", sep = ";", colClasses = c(Date = "character", Time = "character"), header = TRUE, na.strings = "?") 

#Extract and load only the data between the dates 2007-02-01 and 2007-02-02
mydata <- subset(powerdata, Date=="1/2/2007"| Date =="2/2/2007")

#Change the data column from factor variable to date format
##as.Date(totaldata$Date, format = "%d/%m/%Y")
library(lubridate)
mydata$Date <- dmy(mydata$Date)
mydata$Time <- hms(mydata$Time)

#Launch a png file and plot the first graphic, which is a histogram

png( filename = "plot1.png", width = 480, height = 480)
with(mydata, hist(Global_active_power, col="red", main="Global Active Power"))
par("bg"= "grey")
dev.off()
