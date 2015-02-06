plot1 <- function() {    
   data <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";", colClasses = 
                               c("Date","character","numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric"), na.strings="?")
   

   hist(subset(data, Date >= as.Date("2007-02-01") | Date <= as.Date("2007-02-02"))$Global_active_power,
        col = "red", xlab = "Global Active Power (kilowatts)",main="", axes = FALSE, yaxt = "n")
   title(main = "Global Active Power") ## Add a title

   xs <- seq(0, 6, 2)          # sequence for ticks and labels
   axis(1, at = xs, labels = xs)                     # x-Axis
   ys <- c(0, 200, 400, 600, 800, 1000, 1200)       # sequence for ticks and labels
   axis(2, at = ys,labels = ys)

   dev.copy(png,file="plot1.png",width = 480, height = 480)
   dev.off()
}