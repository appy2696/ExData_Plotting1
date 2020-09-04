library(lubridate)

# Downloading data sets and Reading Table

if(!dir.exists("Exploratory_Data_Proj1")) { dir.create("Exploratory_Data_Proj1") }

file.url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file.path  <- "./Exploratory_Data_Proj1/household_power_consumption.zip"
file.unzip <- "./Exploratory_Data_Proj1/household_power_consumption.txt"
if(!file.exists(file.path) & !file.exists(file.unzip)) {
  download.file(file.url, file.path)
  unzip(file.path, exdir = "Exploratory_Data_Proj1")
  
data<-read.table("household_power_consumption.txt",header=TRUE,sep = ";",na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# Formatting Date to Date type


data$Date<-as.Date(data$Date,"%d/%m/%Y")

# Subsetting useful data

rdata<-subset(data,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Plot 1

hist(rdata$Global_active_power,main="Global Active Power",col="Red",xlab ="Global Active Power(Kilowatts)" )


dev.copy(png,"plot1.png", width=480, height=480)
dev.off()





