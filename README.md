# data
# Course_Project: The directory has the "household_power_consumption.txt"
data=read.table("household_power_consumption.txt",header=TRUE,sep=";") #reads the file "household_power_consumption.txt"
data$Date<-as.Date(data$Date,format="%d/%m/%Y") #reads the "Date" column as a Date with a defined format 
dias<-data[(data$Date=="2007-02-01")|(data$Date=="2007-02-02"),] #Selects two specific dates from "Dates" and generates a new data frame named "dias"
dias$Global_active_power<-as.numeric(as.character(dias$Global_active_power)) #converts the "Global_active_power" from "factor" to "character" and finally to "numeric" from "dias"
dias$Global_reactive_power<-as.numeric(as.character(dias$Global_reactive_power)) # Does the same to "Global_reactive_power" from "dias"
dias$Voltage<-as.numeric(as.character(dias$Voltage)) # Extracts the "Voltage" information from "dias" and converts it to numeric
dias<-transform(dias,timestamp=as.POSIXct(paste(Date,Time)), "%d/%m/%Y %H:%M:%s") # POSIXct gives the possibility to make calculations with the variables "Date" and "Time" for future calculations 
dias$Sub_metering_1<-as.numeric(as.character(dias$Sub_metering_1))
dias$Sub_metering_2<-as.numeric(as.character(dias$Sub_metering_2))
dias$Sub_metering_3<-as.numeric(as.character(dias$Sub_metering_3))
## To make plot1
plot1<-function(){ 
  hist(dias$Global_active_power,main="Global Active Power",col="lightblue",xlab="Global Active Power (kilowatts)") # Creates a histogram of the distribution of consumption (in kilowatts) of "Global Active Power"
  dev.copy(png,file="plot1.png",width=480,height=480) # Generates the previous histogram in a png format, named "plot1.png" with a fixed width and height
  dev.off() # Saves and closes the window (of the .png file generation)
  cat("Plot 1 is saved in your directory",getwd()) # Sends a message to user about the plot1.png file
} # Closes the function plot1
plot1() # Calls plot1
## To make plot 2
plot2<-function(){
  plot(dias$timestamp,dias$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  dev.copy(png,file="plot2.png",width=480,height=480)
  dev.off
  cat("plot2.png is saved in you directory",getwd())
}
plot2()
## To make plot3
plot3<-function(){
  plot(dias$timestamp,dias$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(dias$timestamp,dias$Sub_metering_2,col="red")
  lines(dias$timestamp,dias$Sub_metering_3,col="blue")
  legend("topright",col=c("black","red","blue"),c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),lty=c(1,1),lwd=c(1,1))
  dev.copy(png,file="plot3.png",width=480,height=480)
  dev.off()
  cat("plot3.png is saved in your directory",getwd())
}
plot3()
## To make plot4
plot4<-function(){
  par(mfrow=c(2,2))
  plot(dias$timestamp,dias$Global_active_power,type="l",xlab="",ylab="Global Active Power")
  plot(dias$timestamp,dias$Voltage,type="l",xlab="Datetime",ylab="Voltage")
  plot(dias$timestamp,dias$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(dias$timestamp,dias$Sub_metering_2,col="red")
  lines(dias$timestamp,dias$Sub_metering_3,col="blue")
  legend("topright",col=c("black","red","blue"),c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),lty=c(1,1),bty="n",cex=0.5)
  plot(dias$timestamp,dias$Global_active_power,type="l",xlab="Datetime",ylab="Global_active_power")
  dev.copy(png,file="plot4.png",width=480,height=480)
  dev.off()
  cat("plot4.png is saved",getwd())
}
plot4()
