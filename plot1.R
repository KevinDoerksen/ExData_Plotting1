## Read the Household Power Consumption data and subset it to the 
##      appropriate date range. 
## Note: I am assuming that the household_power_consumption.txt file is in 
##      your current working directory.

mydata <- read.csv("household_power_consumption.txt", sep = ";", 
                     header = TRUE, as.is = TRUE)
newdata <- subset.data.frame(mydata, Date == "1/2/2007" | Date == "2/2/2007")

## Open a png file and plot the histogram.

png(file = "plot1.png")
with(newdata, hist(as.numeric(as.character(Global_active_power)), 
                   col="red", 
                   main = "Global Active Power",
                   xlab = "Global Active Power (kilowatts)"))
dev.off()