plot1 <- function() {    
   data <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";", colClasses = 
                               c("character","character","numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric"), na.strings="?")
   
   data$Date <- as.Date(data$Date, format="%d/%m/%Y")
   
   ## Subsetting the data
   data_filter <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
   rm(data)
   
   ## plot 1
   png("plot1.png", width = 480, height = 480)     
   hist(data_filter$Global_active_power,
        col = "red", xlab = "Global Active Power (kilowatts)",main="")
   title(main = "Global Active Power") ## Add a title

   dev.off()
}