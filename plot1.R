# Module 4 Week 1 Project Assignment
#

# Read the data in to memory
DT <- read.table("./data/household_power_consumption.txt"
                 , sep = ";"
                 , header = TRUE
                 , na.strings = "?"
                 , stringsAsFactors = FALSE
                 , blank.lines.skip = TRUE
                 , colClasses = 
                     c("character"
                       , "character"
                       , "numeric"
                       , "numeric"
                       , "numeric"
                       , "numeric"
                       , "numeric"
                       , "numeric"
                       , "numeric")
)

# Convert the Date and Time
# Date in format dd/mm/yyyy and time in format hh:mm:ss
DT$DateTime <- as.POSIXct(paste(DT$Date, DT$Time), format="%d/%m/%Y %H:%M:%S")

# Subset to the prescribed dates 2007-02-01 and 2007-02-02
DT2 <- DT[DT$DateTime >= "2007-02-01 00:00:00" & DT$DateTime <= "2007-02-02 23:59:59", ]

# Remove NAs
DT2 <- DT2[complete.cases(DT2),]

# Plot 1 - Histogram

# Save the plot as a PNG
png(filename = "./plot1.png", type = "quartz", width = 480, height = 480)

# Set the plot window up for 1 plot
par(mfrow=c(1,1))

# Plot the histogram
hist(DT2$Global_active_power
     ,main = "Global Active Power"
     ,xlab = "Global Active Power (kilowatts)" 
     ,col = "red"
)

# Close the device
dev.off()
