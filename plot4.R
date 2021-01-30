library(dplyr)

df <- read.table("./data/household_power_consumption.txt",
                 header = TRUE, sep = ";", na.strings = "?",
                 comment.char = "", 
                 colClasses = c(rep("character", times = 2), 
                                rep("numeric", times = 7))) %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(Date = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"),
           Time = NULL)

par(mfrow = c(2, 2))

plot(df$Date, df$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

plot(df$Date, df$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

plot(df$Date, df$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(df$Date, df$Sub_metering_2, col = "red")
lines(df$Date, df$Sub_metering_3, col = "blue")
legend("topright", bty = "n",
       legend = c("Sub_metering_1", 
                  "Sub_metering_2",
                  "Sub_metering_3"),
       lwd = 2, col = c("black", "red", "blue"))

plot(df$Date, df$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global Reactive Power")

dev.copy(png, file = "plot4.png")
dev.off()
