library(dplyr)
##load data
subdata <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?") %>% 
            subset(Date %in% c("1/2/2007","2/2/2007"))
##read data
head(subdata)
##convert the Date and Time variables to Date/Time classes
subdata %>% 
  mutate(Date=as.Date(Date,"%m/%d/%y"),
         Time=strptime(Time, "%H:%M:%S"))

##plot 1
hist(subdata$Global_active_power,  main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")
##save file
png("plot1.png", width=480, height=480)
dev.off()
