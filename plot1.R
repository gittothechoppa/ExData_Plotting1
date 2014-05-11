{
        ## First, import the data
        ## 'f' is the file name, 'd' is the raw datafram
        f <- "household_power_consumption.txt"
        d <- read.csv(f, header = TRUE, sep = ";", colClasses = "character")
        
        # Trim to make the dataset more manageable
        d_sm <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")
        
        ## Plot it
        hist(as.numeric(d_sm$Global_active_power), main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)", col = "red")
        
        # Save to PNG file
        dev.copy(png, file = "plot1.png")
        dev.off()
}