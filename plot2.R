### set the Files location 
## here we set the loaction of the data files 




plot2<-function(){
flocation<-"D:\\"
pcDs<-read.csv2(sep =";", file = paste(flocation,sep = "","household_power_consumption.txt"),header = TRUE,na.strings = "?")
exds=subset(pcDs,as.Date(Date, "%d/%m/%Y") ==as.Date("1-2-2007", "%d-%m-%Y") | as.Date(Date, "%d/%m/%Y") ==as.Date("2-2-2007", "%d-%m-%Y")  )

exds$DateTime <- strptime(paste(exds$Date,exds$Time),"%d/%m/%Y %H:%M:%S")

dev.cur()
plot(exds$DateTime,as.numeric(as.character(exds$Global_active_power)),ylab = "Global Active Power (kilowatts)",ylim = c(0,8),xlab = "", type = "l")


dev.copy(png,paste(flocation,sep = "","plot2.png"))
dev.off()
}

