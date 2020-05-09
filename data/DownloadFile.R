# Download and unzip the source files
#

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "./data/household_power_consumption.zip", method = "curl")

unzip("./data/household_power_consumption.zip", exdir = "./data/")
