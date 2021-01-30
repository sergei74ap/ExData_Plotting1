df <- read.table("./data/household_power_consumption.txt",
                 header = TRUE, sep = ";", na.strings = "?",
                 comment.char = "", 
                 colClasses = c(rep("character", times = 2), 
                                rep("numeric", times = 7)))
df <- filter(df, Date == "1/2/2007" | Date == "2/2/2007")

hist(df$Global_active_power, 
     breaks = 12, 
     col = "red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")

dev.copy(png, file = "plot1.png")
dev.off()
