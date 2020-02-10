


Write a function that takes a directory of data files and a threshold for complete cases 
and calculates the correlation between sulfate and nitrate for monitor locations where 
the number of completely observed cases (on all variables) is greater than the threshold. 
The function should return a vector of correlations for the monitors that meet the threshold 
requirement. If no monitors meet the threshold requirement, then the function should 
return a numeric vector of length 0. A prototype of this function follows

For this function you will need to use the 'cor' function in R which calculates the 
correlation between two vectors. Please read the help page for this function via '?cor' and 
make sure that you know how to use it.

You can see some example output from this function below. The function that you write should 
be able to approximately match this output. Note that because of how R rounds and presents 
floating point numbers, the output you generate may differ slightly from the example output. 
Please save your code to a file named corr.R. To run the submit script for this part, make 
sure your working directory has the file corr.R in it.



corr <- function(directory, treshold = 0) {
  
  setwd(directory)
  files <- list.files()
  displayTemp <- vector("numeric")
  id <- c(1:332)
  
  
  for (i in id) {
    
    completeTemp <- read.csv(file = files[i], sep = ",")
    completeRows <- completeTemp[complete.cases(completeTemp),]
    colnames(completeRows) <- c("Date","sulfate", "nitrate","ID" )
    
    if (nrow(completeRows) > treshold) {
      
      corTemp <- cor(completeRows$sulfate, completeRows$nitrate)
      displayTemp <- c(displayTemp, corTemp)
    }
    
  }
  setwd("..")
  displayTemp
  
}