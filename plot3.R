# Exploratory Data Analysis
# Course Project 1
# plot3
# by Reese Anschultz

library(lubridate)

url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zip_file<-"household_power_consumption.zip"
data_file<-"household_power_consumption.txt"
min_date<-dmy('01-02-2007')
max_date<-dmy('02-02-2007')
output_filename<-"plot3.png"

# Read the raw data in
download.file(url,zip_file)
unzip(zip_file,junkpaths=TRUE)
hpc<-read.csv(data_file,header=TRUE,sep=";",na.strings="?")

# Reduce the data set
hpc<-hpc[min_date<=dmy(hpc$Date) & dmy(hpc$Date) <=max_date,]

# Plot information
#hist(hpc$Global_active_power,main="Global Active Power",lab="Global Active Power (kilowatts)",col="red")
plot(hpc$Sub_metering_1,type="l",xaxt="n",xlab=NA,ylab="Energy sub metering",col="black")
lines(hpc$Sub_metering_2,col="red")
lines(hpc$Sub_metering_3,col="blue")
axis(1,labels=c("Thu","Fri","Sat"),at=c(1,nrow(hpc)/2,nrow(hpc)))
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=c(2.5,2.5,2.5))
# Make a persistent copy
dev.copy(png,filename=output_filename)
dev.off()

