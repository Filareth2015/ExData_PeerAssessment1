HouseholdConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")
head(HouseholdConsumption)

HouseholdConsumption$Date_Time <- with(HouseholdConsumption, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

HouseholdConsumption$Date <- as.Date(HouseholdConsumption$Date, format="%d/%m/%Y")

HouseholdConsumption <- subset(HouseholdConsumption, Date_Time >= "2007-02-01 00:00:00")
HouseholdConsumption <- subset(HouseholdConsumption, Date_Time <= "2007-02-02 23:59:59")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(HouseholdConsumption, {
  plot(Global_active_power ~ Date_Time, data=HouseholdConsumption, col="black", type="l", pch=".", lwd=1, xlab = "", ylab = "Global Active Power")
  plot(Voltage ~ Date_Time, data=HouseholdConsumption, col="black", type="l", pch=".", lwd=1, xlab = "datetime", ylab = "Voltage")
  with(HouseholdConsumption, plot(Date_Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"), pin = 480*480)
  with(subset(HouseholdConsumption, Date_Time <= "2007-02-02 23:59:59"), points(Date_Time, Sub_metering_1, col="black", type="l", pch=".", lwd=1))
  with(subset(HouseholdConsumption, Date_Time <= "2007-02-02 23:59:59"), points(Date_Time, Sub_metering_2, col="red", type="l", pch=".", lwd=1))
  with(subset(HouseholdConsumption, Date_Time <= "2007-02-02 23:59:59"), points(Date_Time, Sub_metering_3, col="blue", type="l", pch=".", lwd=1))
  legend("topright", 30, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, box.lty=0)
  plot(Global_reactive_power ~ Date_Time, data=HouseholdConsumption, col="black", type="l", pch=".", lwd=1, xlab = "datetime", ylab = "Global_reactive_power")

})

dev.copy(png, file = "Plot4.png", width=480,height=480)
dev.off()