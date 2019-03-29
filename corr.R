corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the number of
  ## completely observed observations (on all variables) required to compute the correlation between 
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  df <-  complete(directory) #fills in the missing data, and returns the completed data
  ids <-  df[df["nobs"] > threshold, ]$id
  corrr <- numeric() #numeric vector of length()
  for (i in ids) {
    
    ReadFile <-  read.csv(paste(directory, "/", formatC(i, width = 3, flag = "0"), 
                                ".csv", sep = ""))
    dff <-  ReadFile[complete.cases(ReadFile), ] #Only keep completely observed cases
    corrr <-  c(corrr, cor(dff$sulfate, dff$nitrate))
  }
  return(corrr)
}
cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)
