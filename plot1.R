##Entry point for the whole process
plot1<-function()
{
  ##Read complete set of data
  rawdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  rawdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  ##Filter dataset
  reduced<-rawdata[rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007",]
  ##Plot: Frequency vs GlobalActivePower  
  ##Create png  
  png("plot1.png",width=480,height=480,units="px", bg="transparent")
  ##Draw
  hist(reduced$Global_active_power,col="red",xlab="Global Active Power (kilowats)",bg="transparent",main="Global Active Power")
  dev.off()  
}