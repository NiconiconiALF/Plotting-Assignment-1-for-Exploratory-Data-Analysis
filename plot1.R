dir("./data")
filename <- "./data/household_power_consumption.txt"
data1 <- read.table(filename,stringsAsFactors = FALSE,dec = ".",sep = ";",header = TRUE)
head(data1)
names(data1)
#subsetting data
subdata <- subset(data1,Date=="1/2/2007"|Date =="2/2/2007")
head(subdata)
sapply(subdata, class)
#plot 1
with(subdata,hist(as.numeric(Global_active_power),col="red",main = "Global Active Power",xlab = "Global Active Power(kilowatts)"))
dev.copy(png,file = "plot1.png",width=480, height=480)
dev.off()
#plot2
time <- strptime(paste(subdata$Date,subdata$Time),"%d/%m/%Y %H:%M:%S")
head(time)
Sys.setlocale("LC_TIME", "C")
with(data1, plot(time,as.numeric(subdata$Global_active_power),type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))
dev.copy(png,file = "plot2.png",width=480, height=480)
dev.off()
#plot3
par(mfrow = c(1,1))
plot(time,as.numeric(subdata$Sub_metering_1),type = "l",ylab = "Energy Sub metering",xlab = "")
#Add lines to graph directly
lines(time,as.numeric(subdata$Sub_metering_2),type = "l",col = "red")
lines(time,as.numeric(subdata$Sub_metering_3),type = "l",col = "blue")
#Add legends
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col = c("black","red","blue"),bg = "transparent",border = "transparent",fill = "transparent")
dev.copy(png,file = "plot3.png",width=480, height=480)
dev.off()
#plot4
dev.png("plot4.png",width=480, height=480)
par(mfrow = c(2,2))
plot(time,as.numeric(subdata$Global_active_power),type = "l", ylab = "Global Active Power",xlab = "")
plot(time,as.numeric(subdata$Voltage),type = "l",ylab = "Voltage",xlab = "datetime")
plot(time,as.numeric(subdata$Sub_metering_1),type = "l",ylab = "Energy Sub metering",xlab = "")
#Add lines to graph directly
lines(time,as.numeric(subdata$Sub_metering_2),type = "l",col = "red")
lines(time,as.numeric(subdata$Sub_metering_3),type = "l",col = "blue")
#Add legends
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col = c("black","red","blue"))
plot(time,as.numeric(subdata$Global_reactive_power),type = "l",ylab = "Global Reactive Power",xlab = "datetime")
dev.off()
