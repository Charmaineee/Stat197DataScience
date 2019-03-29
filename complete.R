complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  
  ## Return a data frame of the form: id nobs 1 117 2 1041 ...  where 'id' is the monitor ID number 
  ## and 'nobs' is the number of complete cases
  
  nobs <- numeric() #numeric vector of length()
  for (i in id) {
    
    ReadFile <- read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                               ".csv", sep = ""))
    nobs <- c(nobs, sum(complete.cases(ReadFile)))
    #Return a logical vector indicating which cases are complete then compute for it sum
  }
  return(data.frame(id, nobs)) #outputs in table form
}
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
