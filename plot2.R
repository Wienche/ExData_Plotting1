# This script reads the data and generates the second plot. 

library("lubridate")
library("dplyr")

setwd("~/Desktop/R/Course 4/Exploratory Data Analysis: Course Project 1")
      
df_HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
df_HPC$Date <- as.Date(df_HPC$Date, "%d/%m/%Y")
df_HPC <- filter(df_HPC, Date >= "2007-02-01" & Date <= "2007-02-02")
df_HPC$DateTime <- as.POSIXct(paste(df_HPC$Date, df_HPC$Time), format="%Y-%m-%d %H:%M:%S")
df_HPC <- df_HPC[, c(1, 2, 10, 3:9)]

# Plot 2
png(filename = "plot2.png", 
      width = 480, height = 480, 
      units = "px", bg = "transparent")
plot(df_HPC$DateTime,df_HPC$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()