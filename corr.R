corr <- function(directory, threshold = 0) {
 
  result <- c()
  MyFiles <- list.files(directory, full.names=TRUE)
  
  for ( i in MyFiles){
    
   MyData <- read.csv(i, header=TRUE)
  complete_cases <- dim(MyData[complete.cases(MyData),])[1]
    if (complete_cases > threshold)
      {
      
      correlation <- cor(MyData$sulfate ,MyData$nitrate, use="complete.obs")
      result <- c(result, correlation)
    }
    
  }
  
  return(result)
  
  
}