##Entry point for the whole process
plot2<-function()
{
  Sys.setlocale("LC_TIME", "English")
  ##Read complete set of data
  rawdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
  rawdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  ##Filter dataset
  reduced<-rawdata[rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007",]
  ##Plot: Frequency vs GlobalActivePower  
  ##Create png  
  png("plot2.png",width=480,height=480,units="px", bg="transparent")
  ##Merge Date/Time and obtain a timestamp
  tmstpcolumn<-strptime(paste(reduced$Date,reduced$Time),format("%d/%m/%Y %H:%M:%S"))
  plot(tmstpcolumn,reduced$Global_active_power,type="l",ylab="Global Active Power (kilowats)",xlab="")
  dev.off()  
}