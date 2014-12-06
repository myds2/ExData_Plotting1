# this file generates plot4 and send it to a png file

# read in two day's data from the data file in working directory 
# and store it in a data frame

dat <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", 
                    header = TRUE, sep = ";")

# Open png device; create 'plot4.png' in my working directory

png(filename = "plot4.png",width = 480, height = 480, 
    units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))


## Create plot and send to a file (no plot appears on screen)
#  format the x variable 
time <- paste(dat$Date, dat$Time)
dat$Time <- strptime(time, "%d/%m/%Y %H:%M:%S")  

#set the parameter for displaying 4 plots in 2 rows and 2 columns
par(mfrow = c(2,2))

#create plot

with(dat, {
  plot(dat$Time, dat$Global_active_power, type = "l",
       xlab = " ", ylab = "Global Active Power (kilowattes)")
  plot(dat$Time, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(dat$Time, dat$Sub_metering_1, type = "l",
       xlab = " ", ylab = "Energy sub metering", col = "purple")
  lines(dat$Time, dat$Sub_metering_2, type = "l", col = "red")
  lines(dat$Time, dat$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("purple", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(dat$Time, dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
})

dev.off() ## Close the png file