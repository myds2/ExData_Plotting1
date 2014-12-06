  # this file generates plot1 and send it to a png file

  # read in two day's data from the data file in working directory 
  # and store it in a data frame
  
  dat <- read.csv.sql("household_power_consumption.txt", 
          sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", 
          header = TRUE, sep = ";")

  # Open png device; create 'plot1.png' in my working directory

  png(filename = "plot1.png",width = 480, height = 480, 
    units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))


  ## Create plot and send to a file (no plot appears on screen)

  #with(dat, hist(Global_active_power))
  hist(dat$Global_active_power, main = "Global Active Power",
       xlab = "Global Active Power (kilowattes)",
       col = "red", border = "black")

  ## Annotate plot; still nothing on screen

  #title(main = "Global Active Power", xlab = "Global Active Power (kilowattes)",ylab = "Frequency") 
  
    dev.off() ## Close the png file