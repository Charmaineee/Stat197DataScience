pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  
  ## 'pollutant' is the caharacter vector of length 1 indicating the name of the pollutant for 
  ##which we will calculate the mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  
  data = numeric() #numeric vector of length()
  for (i in id) {
    
    newRead = read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                             ".csv", sep = "")) #the separator is 'white space'
    #format number with fixed width and then append .csv to number
    data <-  c(data, newRead[[pollutant]])
  }
  return(mean(data, na.rm = TRUE)) #calculate the mean by dropping the missing value
}
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
