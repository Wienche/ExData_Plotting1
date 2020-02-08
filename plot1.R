# This script reads the data and generates the first plot. 

setwd("~/Desktop/R/Course 4/Exploratory Data Analysis: Course Project 1")
   
library("lubridate")
library("dplyr")

#Reads the data from the file
df_HPC <- read.table("household_power_consumption.txt", 
                     header = TRUE, sep = ";", dec = ".", na.strings = "?")

# To subset the data for 2007-02-01 and 2007-02-02
# we first need to specify what are dates. 

# First find out the column names: 
head(df_HPC)
class(df_HPC$Date)

# Change Date Column to Date Type
df_HPC$Date <- as.Date(df_HPC$Date, "%d/%m/%Y")
class(df_HPC$Date)

# Subset the two dates
df_HPC <- filter(df_HPC, Date >= "2007-02-01" & Date <= "2007-02-02")

# Combine date plus time
df_HPC$DateTime <- as.POSIXct(paste(df_HPC$Date, df_HPC$Time), format="%Y-%m-%d %H:%M:%S")

# Check if that worked: 
class(df_HPC$DateTime)

# Reorder the data in a logical order 
df_HPC <- df_HPC[, c(1, 2, 10, 3:9)]

# Plot 1 
png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
hist(df_HPC$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
