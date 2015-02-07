plot2 <- function() {    
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
        
        ## Plot 2
        plot(data_filter$Global_active_power~data_filter$Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        dev.copy(png, file="plot2.png", height=480, width=480)
        dev.off()
        
}