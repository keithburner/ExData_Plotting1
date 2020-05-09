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

# Plot 3 - Categorical

# Save the plot as a PNG
png(filename = "./plot3.png", type = "quartz")

# Set the plot window up for 1 plot
par(mfrow=c(1,1))

# Draw the base plot
plot(Sub_metering_1 ~ DateTime , data = DT2
     ,main = ""
     ,xlab = ""
     ,ylab = "Energy sub metering" 
     ,type = "n"
)

# Add Sub Metering data points
points(DT2$DateTime, DT2$Sub_metering_1, col = "black", type = "l")
points(DT2$DateTime, DT2$Sub_metering_2, col = "red", type = "l")
points(DT2$DateTime, DT2$Sub_metering_3, col = "blue", type = "l")

# Add the legend for the Sub Metering
legend(x = "topright"
       ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,col = c("black", "red", "blue")
       ,lty = 1
       ,border = "black"
)

# Close the device
dev.off()

