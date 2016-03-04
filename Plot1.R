HouseholdConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")
head(HouseholdConsumption)

HouseholdConsumption$Date <- as.Date(HouseholdConsumption$Date, format="%d/%m/%Y")

HouseholdConsumptionIn_mid <- subset(HouseholdConsumption, Date >= "2007-02-01")
HouseholdConsumptionIn2Day <- subset(HouseholdConsumptionIn_mid, Date <= "2007-02-02")

hist(HouseholdConsumptionIn2Day$Global_active_power, main = "Global active power", col = "red", xlab = "Global active power (kilowatts)")

dev.copy(png, file = "Plot1.png", width=480,height=480)
dev.off()


