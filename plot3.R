##Entry point for the whole process
plot3<-function()
{
  Sys.setlocale("LC_TIME", "English")
  ##Read complete set of data
  rawdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  ##Filter dataset
  reduced<-rawdata[rawdata$Date=="1/2/2007" | rawdata$Date=="2/2/2007",]
  ##Merge Date/Time and obtain a timestamp
  tmstpcolumn<-strptime(paste(reduced$Date,reduced$Time),format("%d/%m/%Y %H:%M:%S"))
  ##Plot 
  ##Create png  
  png("plot3.png",width=480,height=480,units="px", bg="transparent")
  plot(tmstpcolumn,reduced$Sub_metering_1,type="l",col="black",ylab="Energy sub metering",xlab="")
  lines(tmstpcolumn,reduced$Sub_metering_2,type="l",col="red")
  lines(tmstpcolumn,reduced$Sub_metering_3,type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
  dev.off()  
}