plot2<-function(){
  plot(dias$timestamp,dias$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  dev.copy(png,file="plot2.png",width=480,height=480)
  dev.off
  cat("plot2.png is saved in you directory",getwd())
}
plot2()