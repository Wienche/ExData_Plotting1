# This script reads the data and generates the third plot. 

library("lubridate")
library("dplyr")

setwd("~/Desktop/R/Course 4/Exploratory Data Analysis: Course Project 1")
      
df_HPC <- read.table("household_power_consumption.txt", 
                           header = TRUE, sep = ";", dec = ".", na.strings = "?")
df_HPC$Date <- as.Date(df_HPC$Date, "%d/%m/%Y")
df_HPC <- filter(df_HPC, Date >= "2007-02-01" & Date <= "2007-02-02")
df_HPC$DateTime <- as.POSIXct(paste(df_HPC$Date, df_HPC$Time), format="%Y-%m-%d %H:%M:%S")
df_HPC <- df_HPC[, c(1, 2, 10, 3:9)]
      
# Plot 3
png(filename = "plot3.png", 
          width = 480, height = 480, 
          units = "px", bg = "transparent")
plot(df_HPC$DateTime,df_HPC$Sub_metering_1, 
           type="l", xlab="", ylab="Energy Sub Metering")
lines(df_HPC$DateTime, df_HPC$Sub_metering_2, type="l", col="red")
lines(df_HPC$DateTime, df_HPC$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()