


# Write a function that reads a directory full of files and reports the number of completely 
# observed cases in each data file. The function should return a data frame where the first 
# column is the name of the file and the second column is the number of complete cases. A 
# prototype of this function follows

# You can see some example output from this function below. The function that you write 
# should be able to match this output. Please save your code to a file named complete.R. To 
# run the submit script for this part, make sure your working directory has the file complete.R 
# in it.



complete <- function(directory, id = c(1:332)) {
  
  setwd(directory)
  files <- list.files()
  displayTable <- read.csv(text="ID, nobs", colClasses = c("integer","integer"), sep = ",")
  dataFrameTemp <- read.csv(text="ID, nobs", colClasses = c("integer","integer"), sep = ",")
  
  
  for (i in id) {
    
    completeTemp <- read.csv(file = files[i], sep = ",", header = TRUE)
    completeRows <- completeTemp[complete.cases(completeTemp),]
    dataFrameTemp <- c(i, nrow(completeRows))
    displayTable <- rbind.data.frame(displayTable, dataFrameTemp)
    colnames(displayTable) <- c("id", "nobs" )
    
  }
  setwd("..")
  displayTable
  
}