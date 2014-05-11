{
        ## First, import the data
        ## 'f' is the file name, 'd' is the raw datafram
        f <- "household_power_consumption.txt"
        d <- read.csv(f, header = TRUE, sep = ";", colClasses = "character")
        
        # Trim to make the dataset more manageable
        d_sm <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")
        
        # Make a new column with the POSIXlt time
        d_sm$lt <- strptime(paste(d_sm[, 1], d_sm[, 2]), "%d/%m/%Y %T")
        
        ## Plot it
        plot(d_sm$lt, as.numeric(d_sm$Global_active_power), type = "l", 
             xlab = "", ylab = "Global Active Power (kilowatts)")
        
        # Save to PNG file
        dev.copy(png, file = "plot2.png")
        dev.off()
}