library("tibble")
library("lubridate")
library("dplyr")

setwd("~/Desktop/R/Course 4/")

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

# Check if that worked: 
head(df_HPC)
class(df_HPC$Date)

#The actual subsetting 
df_HPC <- filter(df_HPC, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plotting the graph
png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
hist(df_HPC$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()

