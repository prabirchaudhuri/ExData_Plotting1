#household_power_consumption<-scan("household_power_consumption.txt",
#                                  na.strings = "?",
#                                  sep = ";",
#                                  what= list(Date1=character(0), Time1=character(0),Global_active_power=numeric(0),
#                                             Global_reactive_power=numeric(0),Voltage=numeric(0),
#                                             Global_intensity=numeric(0),Sub_metering_1=numeric(0),
#                                             Sub_metering_2=numeric(0), Sub_metering_3=numeric(0)
#                                             )
#                                 )

household_power_consumption 
<- read.csv("C:/Users/Prabir/CourseEra/Exploratory Data Science/Week 1 Project/household_power_consumption.txt", 
                                        sep=";", na.strings="?"
                                        )
#
household_power_consumption$nDate <- as.Date(household_power_consumption$Date,"%d/%m/%Y")
head(household_power_consumption)

feb1 <- subset(household_power_consumption,household_power_consumption$nDate == as.Date("01/02/2007","%d/%m/%Y"))
feb2 <- subset(household_power_consumption,household_power_consumption$nDate == as.Date("02/02/2007","%d/%m/%Y") )
feb <- rbind(feb1,feb2)                                            
head(feb)
dim(feb1)
dim(feb2)
dim(feb)
#summary(as.double(feb$Global_active_power)/1000)
summary(feb$Global_active_power)
par(mfrow=c(1,1))
#hist(as.numeric(feb$Global_active_power)/1000,col = "red",main = "Global Active Power")
win.graph(width = 480,height = 480)
hist(feb$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
savePlot(filename = "Plot1.png",type = "png")
#ylim(0,1200)
feb$nTime <-strptime(paste(feb$Date,feb$Time),"%d/%m/%Y %H:%M:%S")
win.graph(width = 480,height = 480)
plot(feb$nTime,feb$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
savePlot(filename = "Plot2.png",type = "png")
win.graph(width = 480,height = 480)
plot(feb$nTime,feb$Sub_metering_1,type = "s", col="black",xlab = "",ylab = "Energy sub metering")
lines(feb$nTime,feb$Sub_metering_2,type = "s", col="red")
lines(feb$nTime,feb$Sub_metering_3,type = "s", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_1"), lty = "solid",col = c("black","blue","red"))
savePlot(filename = "Plot3.png",type = "png")
win.graph(width = 480,height = 480)
par(mfrow=c(2,2))
plot(feb$nTime,feb$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
plot(feb$nTime,feb$Global_active_power,type = "l",ylab = "Voltage",xlab = "Datetime")
plot(feb$nTime,feb$Sub_metering_1,type = "s", col="black",xlab = "",ylab = "Energy sub metering")
lines(feb$nTime,feb$Sub_metering_2,type = "s", col="red")
lines(feb$nTime,feb$Sub_metering_3,type = "s", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_1"), lty = "solid",col = c("black","blue","red"))
plot(feb$nTime,feb$Global_reactive_power,type = "l",ylab = "Global reactive power",xlab = "Datetime")
savePlot(filename = "Plot4.png",type = "png")