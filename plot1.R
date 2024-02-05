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
