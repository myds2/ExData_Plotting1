# this file generates plot3 and send it to a png file

# read in two day's data from the data file in working directory 
# and store it in a data frame

dat <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", 
                    header = TRUE, sep = ";")

# Open png device; create 'plot3.png' in my working directory

png(filename = "plot3.png",width = 480, height = 480, 
    units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))

#create plot
#specify the format of x variable of the plot
time <- paste(dat$Date, dat$Time)
dat$Time <- strptime(time, "%d/%m/%Y %H:%M:%S")  

#creat the plot with the first line
plot(dat$Time, dat$Sub_metering_1, type = "l",
     xlab = " ", ylab = "Energy sub metering", col = "purple")

#add the second and the third line to the same plot
lines(dat$Time, dat$Sub_metering_2, type = "l", col = "red")
lines(dat$Time, dat$Sub_metering_3, type = "l", col = "blue")

#add legend to the plot
legend("topright", lty = 1, col = c("purple", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off() ## Close the png file