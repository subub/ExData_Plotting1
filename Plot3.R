# Have downloaded and unzipped file form url
# Setting the working directory.

library(data.table)

setwd('D:/Projects/Coursera/DataScience/DataExploration/Week1/exdata-data-household_power_consumption')

# Read the file and define data type conversion.Able to get better performance 
# by keeping some of the data as strings and convert to numeric only on need basis


full_data <- read.table('household_power_consumption.txt',
           header=TRUE,
           sep=";",
           colClasses=c("character", "character", "character","character","character","character","numeric","numeric","numeric"),
           na.strings='?')

# Inspect the elements of the data using str
# We can see that all excpet library(data.table) is chr.
str(full_data)

# Reformat the Date and Time  field data type.
full_data$Time <- strptime(paste(full_data$Date, full_data$Time), "%d/%m/%Y %H:%M:%S")
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

#Confirm that the data type has changed for Time
str(full_data)

# Filter in only the date range we need
filtered_data <- full_data[full_data$Date=='2007-02-01'| full_data$Date=='2007-02-02',]

# Now we have only 2880 rows/objects
str(filtered_data)

#Open the device/graphics context

png(filename = "plot3.png")

plot(filtered_data$Time, filtered_data$Sub_metering_1, type="n")

lines(filtered_data$Time, filtered_data$Sub_metering_1, col="black")
lines(filtered_data$Time, filtered_data$Sub_metering_2, col="red")
lines(filtered_data$Time, filtered_data$Sub_metering_3, col="blue")

# Adding legend for Chart 
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       box.lwd=0)

#Close the file
dev.off()
