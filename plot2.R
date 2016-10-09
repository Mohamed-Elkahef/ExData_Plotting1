### set the Files location 
## here we set the loaction of the data files 




plot2<-function(){
flocation<-"D:\\"
pcDs<-read.csv2(sep =";", file = paste(flocation,sep = "","household_power_consumption.txt"),header = TRUE,na.strings = "?")
exds=subset(pcDs,as.Date(Date, "%d/%m/%Y") ==as.Date("1-2-2007", "%d-%m-%Y") | as.Date(Date, "%d/%m/%Y") ==as.Date("2-2-2007", "%d-%m-%Y")  )

xlab=rbind(c(0,'thu'),c(1440,'fri'),c(2860,'sat'))   

dev.cur()
plot(as.numeric(as.character(exds$Global_active_power)),ylab = "Global Active Power (kilowatts)",ylim = c(0,8),xlab = "", type = "l",xaxt ='n')
axis(labels =xlab[,2] ,at=xlab[,1],side = 1, las=2)

dev.copy(png,paste(flocation,sep = "","plot2.png"))
dev.off()
}

