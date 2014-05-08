# Setting working directory to location of data
setwd("~/Data Scientist Spec/Exploratory Data Analysis/Course Project 1")

#load sqldf package
library(sqldf)

#read in data for relevant dates
DT <- read.csv.sql("CP1 Data/household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",sep = ";", header=TRUE)

#format Date and Time Columns
DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")
DT$Time <- ts(DT$Time)

#Turn on png device to send graph of size 480x480 with transparent background
png(filename = "plot1.png",width=480,height=480,bg="transparent")

#setup graph with colors for columns, xlabel, and main title
hist(DT$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main = "Global Active Power")

#turn off png device
dev.off()