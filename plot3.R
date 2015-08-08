## Read the Household Power Consumption data and subset it to the 
##      appropriate date range. 
## Note: I am assuming that the household_power_consumption.txt file is in 
##      your current working directory.

mydata <- read.csv("household_power_consumption.txt", sep = ";", 
                   header = TRUE, as.is = TRUE)
newdata <- subset.data.frame(mydata, Date == "1/2/2007" | Date == "2/2/2007")

## The following lines of code creates an extra column in the data frame
## This column interprets the date and time columns in a format useful to R

samplesize <- length(newdata[[1]])
times <- vector("character", length = samplesize)
for (i in 1:samplesize){
    times[[i]] <- paste(newdata[[1]][[i]], newdata[[2]][[i]], sep = " ")
}
newdata$mytimes <- strptime(times, format = "%d/%m/%Y  %H:%M:%S")

## Open a png file and plot the graph.

png(file = "plot3.png")
with(newdata, plot(mytimes, Sub_metering_1, 
                   type = "n", 
                   xlab = "",
                   ylab = "Energy sub metering"))
with(newdata, lines(mytimes, Sub_metering_1, col = "Black"))
with(newdata, lines(mytimes, Sub_metering_2, col = "Red"))
with(newdata, lines(mytimes, Sub_metering_3, col = "Blue"))
legend("topright", lty = 1, col = c("Black", "Red", "Blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()