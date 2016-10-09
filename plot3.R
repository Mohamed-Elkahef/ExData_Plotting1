### set the Files location 
## here we set the loaction of the data files 




plot3<-function(){
flocation<-"D:\\"
pcDs<-read.csv2(sep =";", file = paste(flocation,sep = "","household_power_consumption.txt"),header = TRUE,na.strings = "?")
exds=subset(pcDs,as.Date(Date, "%d/%m/%Y") ==as.Date("1-2-2007", "%d-%m-%Y") | as.Date(Date, "%d/%m/%Y") ==as.Date("2-2-2007", "%d-%m-%Y")  )

exds$DateTime <- strptime(paste(exds$Date,exds$Time),"%d/%m/%Y %H:%M:%S") 

dev.cur()
plot(exds$DateTime,as.numeric(as.character(exds$Sub_metering_1)),ylab = "Energy Sub meetering",xlab = "", type = "l")
lines(as.numeric(as.character(exds$Sub_metering_2)),type = "l",col="red")
lines(as.numeric(as.character(exds$Sub_metering_3)),type = "l",col="Blue")
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
           lty=c(1,1,1)
               ,lwd=c(2,2,2),col=c("black","blue","red"))
dev.copy(png,paste(flocation,sep = "","plot3.png"))
dev.off()
}

