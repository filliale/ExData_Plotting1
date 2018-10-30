Sys.setlocale("LC_TIME", "en_US.UTF-8") 

# Load Data
data <- read.csv("household_power_consumption.txt", sep=";")

# Filter Data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
sample <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

# create new date / time column
sample$Datetme <- as.POSIXct(paste(sample$Date, sample$Time), format="%Y-%m-%d %H:%M:%S")
#sample$Time <- as.Date(sample$Time, format="%h:%m:s")

# Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot.ts(sample$Datetme,power,type="l",xlab="",ylab = "Global Active Power", axes=FALSE)
axis(side=2, at=c(0,2,4,6))
axis.POSIXct(1, sample$Datetme, format="%a")
box()

plot.ts(sample$Datetme,as.numeric(as.character(sample$Voltage)),type="l",xlab="datetime",ylab = "Voltage",axes=FALSE)
axis(side=2, at=seq(from = 234, to = 246, by = 2))
axis.POSIXct(1, sample$Datetme, format="%a")
box()

plot.ts(sample$Datetme,as.numeric(as.character(sample$Sub_metering_1)) ,type="l",xlab="",ylab = "Energy sub metering", axes=FALSE)
lines(sample$Datetme,as.numeric(as.character(sample$Sub_metering_2)), col="red")
lines(sample$Datetme,as.numeric(as.character(sample$Sub_metering_3)), col="blue")
axis(side=2, at=c(0,10,20,30))
axis.POSIXct(1, sample$Datetme, format="%a")
box()
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"), lty=1, cex=0.8)


plot.ts(sample$Datetme,as.numeric(as.character(sample$Global_reactive_power)),type="l",xlab="datetime",ylab = "Global_reactive_power",axes=FALSE)
axis(side=2, at=c(0.1,0.2,0.3,0.4,0.5))
axis.POSIXct(1, sample$Datetme, format="%a")
box()
dev.off()