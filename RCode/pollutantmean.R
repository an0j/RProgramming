

# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
# across a specified list of monitors. The function 'pollutantmean' takes three 
# arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' 
# reads that monitors' particulate matter data from the directory specified in the 'directory' argument 
# and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded 
# as NA. A prototype of the function is as follows

# You can see some example output from this function below. The function that you write should be able 
# to match this output. Please save your code to a file named pollutantmean.R.

pollutantmean <- function(directory, pollutant, id = c(1:332)) {
  
  setwd(directory)
  files <- list.files()
  tablePollute <- read.csv(text="Date, sulfate, nitrate, ID", colClasses = c("Date", "numeric", "numeric","integer"), sep = ",")
  
  for (i in id) {
    
    tableTemp <- read.csv(file = files[i], sep = ",")
    tablePollute <- rbind.data.frame(tablePollute, tableTemp)
  }
  
  setwd("..")
  meanPollutant <- mean(tablePollute[,pollutant], na.rm = TRUE)
  print(meanPollutant)
  
  
}

