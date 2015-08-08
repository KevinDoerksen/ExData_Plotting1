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

png(file = "plot2.png")
with(newdata, plot(mytimes, Global_active_power,
                   type = "l",
                   xlab = "",
                   ylab = "Global Active Power (kilowatts)"))
dev.off()