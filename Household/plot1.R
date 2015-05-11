plot1<-function(){
  hist(dias$Global_active_power,main="Global Active Power",col="lightblue",xlab="Global Active Power (kilowatts)")
  dev.copy(png,file="plot1.png",width=480,height=480)
  dev.off()
  cat("Plot 1 is saved in your directory",getwd())
}
plot1()