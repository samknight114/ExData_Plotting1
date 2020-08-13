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

# 3. Plot Time
plot1 <- hist(as.numeric(data$Global_active_power), xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")

# 4. Save to Graphics Device
dev.copy(png, file = "plot1.png")
dev.off()