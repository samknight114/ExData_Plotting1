# 1. Check/Download appropriate dataset and then unzips
if (!file.exists("powerdata.zip")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                      destfile = "powerdata.zip")
        unzip("powerdata.zip")
}

# 2. Creates a table from data and subsets the days in question.
raw_dat <- read.table("household_power_consumption.txt", sep = ";", header = T)
data1 <- subset(raw_dat, Date == "1/2/2007")
data2 <- subset(raw_dat, Date == "2/2/2007")
data <- rbind(data1,data2)

# 3. Combining Date/Time columns and coercing them into Date class in new column
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

# 4. Plot Time
plot(data$DateTime, data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

# 5. Save to Graphics Device
dev.copy(png, file = "plot2.png")
dev.off