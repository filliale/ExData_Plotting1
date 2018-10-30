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

# Plot 1
png("plot1.png", width = 480, height = 480)
power <- as.numeric(as.character(sample$Global_active_power))
hist(power,col="red", main = "Global Active Power", xlab = "Global Active Power (kilowats)")
dev.off()
