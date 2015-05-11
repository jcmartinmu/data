data=read.table("household_power_consumption.txt",header=TRUE,sep=";") #reads the file "household_power_consumption.txt"
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
dias<-data[(data$Date=="2007-02-01")|(data$Date=="2007-02-02"),]
dias$Global_active_power<-as.numeric(as.character(dias$Global_active_power))
dias$Global_reactive_power<-as.numeric(as.character(dias$Global_reactive_power))
dias$Voltage<-as.numeric(as.character(dias$Voltage))
dias<-transform(dias,timestamp=as.POSIXct(paste(Date,Time)), "%d/%m/%Y %H:%M:%s")
dias$Sub_metering_1<-as.numeric(as.character(dias$Sub_metering_1))
dias$Sub_metering_2<-as.numeric(as.character(dias$Sub_metering_2))
dias$Sub_metering_3<-as.numeric(as.character(dias$Sub_metering_3))
