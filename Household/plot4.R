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