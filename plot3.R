library(dplyr)

df <- read.table("./data/household_power_consumption.txt",
                 header = TRUE, sep = ";", na.strings = "?",
                 comment.char = "", 
                 colClasses = c(rep("character", times = 2), 
                                rep("numeric", times = 7))) %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(Date = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"),
           Time = NULL)

plot(df$Date, df$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(df$Date, df$Sub_metering_2, col = "red")
lines(df$Date, df$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", 
                  "Sub_metering_2",
                  "Sub_metering_3"),
       lwd = 2, col = c("black", "red", "blue"),
       text.width = strwidth("Sub_metering_1") * 1.5)

dev.copy(png, file = "plot3.png")
dev.off()


