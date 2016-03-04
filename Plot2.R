HouseholdConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")
head(HouseholdConsumption)

HouseholdConsumption$Date_Time <- with(HouseholdConsumption, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

HouseholdConsumption$Date <- as.Date(HouseholdConsumption$Date, format="%d/%m/%Y")

HouseholdConsumption <- subset(HouseholdConsumption, Date_Time >= "2007-02-01 00:00:00")
HouseholdConsumption <- subset(HouseholdConsumption, Date_Time <= "2007-02-02 23:59:59")

plot(Global_active_power ~ Date_Time, data=HouseholdConsumption, col="black", type="l", pch=".", lwd=1, xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "Plot2.png", width=480,height=480)
dev.off()