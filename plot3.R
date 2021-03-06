plot3 <- function() {    
        data <- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";", colClasses = 
                                   c("character","character","numeric","numeric","numeric","numeric",
                                     "numeric","numeric","numeric"), na.strings="?")
        
        data$Date <- as.Date(data$Date, format="%d/%m/%Y")
        
        ## Subsetting the data
        data_filter <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
        rm(data)
        
        ## Converting dates
        datetime <- paste(as.Date(data_filter$Date), data_filter$Time)
        data_filter$Datetime <- as.POSIXct(datetime)
        
        ## Plot 3
        png("plot3.png", width = 480, height = 480)
        plot(data_filter$Datetime, data_filter$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
        lines(data_filter$Datetime, data_filter$Sub_metering_2, type="l", col="red")
        lines(data_filter$Datetime, data_filter$Sub_metering_3, type="l", col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
        dev.off()
        
}