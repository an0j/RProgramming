
##load the data
hw1_data <- read.csv("~/R/Coursera/RProgramming/Data/hw1_data.csv")

##11
names(hw1_data)

##12
head(hw1_data)

#13
tail(hw1_data)

#14
tail(hw1_data)

#15
hw1_data$Ozone[47]

#16
NAvector <- is.na(hw1_data$Ozone)
numberOfNA <- sum(NAvector)
numberOfNA

#17
mean(hw1_data$Ozone, na.rm = TRUE)

#18
OzoneAbove31 <- subset(hw1_data, hw1_data$Ozone > 31)
TempAbove90 <- subset(OzoneAbove31, OzoneAbove31$Temp > 90)
mean(TempAbove90$Solar.R)

#19
MonthEqualSix <- subset(hw1_data, hw1_data$Month == 6)
mean(MonthEqualSix$Temp)


#20
MonthEqualFive <- subset(hw1_data, hw1_data$Month == 5)
max(MonthEqualFive$Ozone, na.rm = TRUE)
