Sys.setlocale("LC_TIME", "en_US.UTF-8") 
par(mfrow=c(1,1))

# Load Data
data <- read.csv("household_power_consumption.txt", sep=";")

# Filter Data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
sample <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

# create new date / time column
sample$Datetme <- as.POSIXct(paste(sample$Date, sample$Time), format="%Y-%m-%d %H:%M:%S")
#sample$Time <- as.Date(sample$Time, format="%h:%m:s")


# Plot 2
png("plot2.png", width = 480, height = 480)
plot.ts(sample$Datetme,power,type="l",xlab="",ylab = "Global Active Power (kilowats)",axes=FALSE)
axis(side=2, at=c(0,2,4,6))
axis.POSIXct(1, sample$Datetme, format="%a")
dev.off()
