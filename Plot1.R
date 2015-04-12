# Have downloaded and unzipped file form url
# Setting the working directory.

library(data.table)

setwd('D:/Projects/Coursera/DataScience/DataExploration/Week1/exdata-data-household_power_consumption')

# Read the file and define data type conversion.ABle to get better performance 
# by keeping some of the data as strings and convert to numeric only on need basis


full_data <- read.table('household_power_consumption.txt',
           header=TRUE,
           sep=";",
           colClasses=c("character", "character", "numeric","character","character","character","character","character","character"),
           na.strings='?')

# Inspect the elements of the data using str
# We can see that all excpet library(data.table) is chr.
str(full_data)

# Reformat the date field data type.
full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")

#Confirm that the data type has changed
str(full_data)

# Filter in only the date range we need
filtered_data <- full_data[full_data$Date=='2007-02-01'| full_data$Date=='2007-02-02',]

# Now we have only 2880 rows/objects
str(filtered_data)

#Open the device/graphics context

png(filename = "plot1.png")

hist(filtered_data$Global_active_power, col = 'Red',
     main = 'Global Active Power',
     xlab = 'Global Active Power(kilowatts)')

#Close the file
dev.off()
