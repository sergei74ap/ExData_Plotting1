library(dplyr)

df <- read.table("./data/household_power_consumption.txt",
                 header = TRUE, sep = ";", na.strings = "?",
                 comment.char = "", 
                 colClasses = c(rep("character", times = 2), 
                                rep("numeric", times = 7))) %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(Date = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"),
           Time = NULL)

plot(df$Date, df$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")
dev.off()
