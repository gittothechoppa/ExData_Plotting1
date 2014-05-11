{
        ## First, import the data
        ## 'f' is the file name, 'd' is the raw datafram
        f <- "household_power_consumption.txt"
        d <- read.csv(f, header = TRUE, sep = ";", colClasses = "character")
        
        # Trim to make the dataset more manageable
        d_sm <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")
        
        # Make a new column with the POSIXlt time
        d_sm$lt <- strptime(paste(d_sm[, 1], d_sm[, 2]), "%d/%m/%Y %T")
        
        ## Set global display to 2 x 2, make fonts smaller to fit with cex
        par(mfrow = c(2, 2), cex = 0.5)
        
        ## Plot 1
        plot(d_sm$lt, as.numeric(d_sm$Global_active_power), type = "l", 
             xlab = "", ylab = "Global Active Power (kilowatts)")
        
        ## Plot 2
        with(d_sm, plot(lt, Voltage, type = "l", xlab = "datetime"))
        
        ## Plot 3
        with(d_sm, plot(lt, as.numeric(Sub_metering_1), type = "l", 
                        xlab = "", ylab = "Energy sub metering"))
        with(d_sm, lines(lt, as.numeric(Sub_metering_2), type = "l",
                        xlab = "", ylab = "Energy sub metering", col = "red"))
        with(d_sm, lines(lt, as.numeric(Sub_metering_3), type = "l",
                        xlab = "", ylab = "Energy sub metering", col = "blue"))
        legend("topright", lty = 1, col = c("black", "red", "blue"), 
                        legend = c("Sub_metering_1", "Sub_metering_2",
                        "Sub_metering_3"), bty = "n")
        
        ## Plot 4
        with(d_sm, plot(lt, Global_reactive_power, type = "l",
                        xlab = "datetime"))
        
        # Save to PNG file
        dev.copy(png, file = "plot4.png")
        dev.off()
}