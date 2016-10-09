### set the Files location 
## here we set the loaction of the data files 




plot4<-function(){
flocation<-"D:\\"
pcDs<-read.csv2(sep =";", file = paste(flocation,sep = "","household_power_consumption.txt"),header = TRUE,na.strings = "?")
exds=subset(pcDs,as.Date(Date, "%d/%m/%Y") ==as.Date("1-2-2007", "%d-%m-%Y") | as.Date(Date, "%d/%m/%Y") ==as.Date("2-2-2007", "%d-%m-%Y")  )

exds$DateTime <- strptime(paste(exds$Date,exds$Time),"%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
dev.curplo
plot(exds$DateTime,as.numeric(as.character(exds$Global_active_power)),ylab = "Global Active Power (kilowatts)",ylim = c(0,8),xlab = "", type = "l")


plot(exds$DateTime,as.numeric(as.character(exds$Voltage)),ylab = "Voltage",xlab = "datetime", type = "l")


plot(exds$DateTime,as.numeric(as.character(exds$Sub_metering_1)),ylab = "Energy Sub meetering",xlab = "", type = "l")

lines(as.numeric(as.character(exds$Sub_metering_2)),type = "l",col="red")
lines(as.numeric(as.character(exds$Sub_metering_3)),type = "l",col="Blue")
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
           lty=c(1,1,1)
               ,lwd=c(2,2,2),col=c("black","blue","red"))

plot(exds$DateTime,as.numeric(as.character(exds$Global_reactive_power)),ylab = "Global Re-Active Power",xlab = "datetime", type = "l")


dev.copy(png,paste(flocation,sep = "","plot4.png"))
dev.off()
}

