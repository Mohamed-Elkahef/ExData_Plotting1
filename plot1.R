### set the Files location 
## here we set the loaction of the data files 




plot1<-function(){
flocation<-"D:\\"
pcDs<-read.csv2(sep =";", file = paste(flocation,sep = "","household_power_consumption.txt"),header = TRUE,na.strings = "?")
exds=subset(pcDs,as.Date(Date, "%d/%m/%Y") ==as.Date("1-2-2007", "%d-%m-%Y") | as.Date(Date, "%d/%m/%Y") ==as.Date("2-2-2007", "%d-%m-%Y")  )
dev.cur()
hist(as.numeric(as.character(exds$Global_active_power)),freq = TRUE,col="red",main = "Global Active Power",xlab = "Global Active Power (Killowatts)")
dev.copy(png,paste(flocation,sep = "","plot1.png"))
dev.off()
}

