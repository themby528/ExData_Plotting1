# Setting working directory to location of data
setwd("~/Data Scientist Spec/Exploratory Data Analysis/Course Project 1")

#load sqldf package
library(sqldf)

#read in data for relevant dates
DT <- read.csv.sql("CP1 Data/household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",sep = ";", header=TRUE)

#format Date and Time Columns
DT$Date <- as.Date(DT$Date,format="%d/%m/%Y")
DT$DateTime <- paste(DT$Date,DT$Time, sep= ' ')
DT$DateTime <- as.POSIXlt(DT$DateTime)

#Create new data frame that contains columns of interest and format datetime column
newDT1 <- data.frame(DT$DateTime,DT$Sub_metering_1)
newDT2 <- data.frame(DT$DateTime,DT$Sub_metering_2)
newDT3 <- data.frame(DT$DateTime,DT$Sub_metering_3)

#Turn on png device to send graph of size 480x480 with transparent background
png(filename = "plot3.png",width=480,height=480,bg="transparent")

#setup graph with xlabel/ylabel, and main title
plot(newDT1,type="l",main="",ylab="Energy sub meeting",xlab="")
#add other lines into plot
lines(newDT2,col="red")
lines(newDT3,col="blue")
#create legend
legend("topright", lty=1,col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#turn off png device
dev.off()