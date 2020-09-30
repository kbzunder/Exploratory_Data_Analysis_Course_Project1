rm(list=ls())
library(data.table)
setwd("~/Documents/R/Exploratory_Data_Analysis_Week1")
data<-fread("household_power_consumption.txt",na.strings="?",sep=";")
#Changing Data format
data$Date<-as.Date(data$Date,"%d/%m/%Y")
#making data subsets
data_sub1<-subset(data,Date==as.Date("2007-02-01"))
data_sub2<-subset(data,Date==as.Date("2007-02-02"))
#merging data frames
data_sub<-rbind(data_sub1,data_sub2)
#making values in a column numeric
data_sub$Global_active_power<-as.numeric(data_sub$Global_active_power)

#changing data format
data_sub$DateTime<-as.POSIXct(paste(data_sub$Date,data_sub$Time),
                              format="%Y-%m-%d %H:%M:%S")

#making a file connection
png("plot2.png", width=480, height=480)

plot(data_sub$DateTime,data_sub$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type="l")
#closing device
dev.off()
