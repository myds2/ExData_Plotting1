# this file generates plot2 and send it to a png file

# read in two day's data from the data file in working directory 
# and store it in a data frame

dat <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", 
                    header = TRUE, sep = ";")

# Open png device; create 'plot2.png' in my working directory

  png(filename = "plot2.png",width = 480, height = 480, 
      units = "px", pointsize = 12,
      bg = "white", res = NA, family = "", restoreConsole = TRUE,
      type = c("windows", "cairo", "cairo-png"))


    ## Create plot and send to a file (no plot appears on screen)
      time <- paste(dat$Date, dat$Time)
      dat$Time <- strptime(time, "%d/%m/%Y %H:%M:%S")    
      plot(dat$Time, dat$Global_active_power, type = "l",
           xlab = " ", ylab = "Global Active Power (kilowattes)")
      
     dev.off() ## Close the png file