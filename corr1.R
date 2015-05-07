complete <- function(directory, id = 1:332)         
{
        FilNames <- list.files(directory,full.names =TRUE) # read file names
        m<- matrix(ncol=2)
        CompleteData <- data.frame(m)#initialise
        colnames(CompleteData) <- c("id", "nobs")
        for(i in 1:length(id))
        {
                x <- read.csv(FilNames[id[i]]) # read files for the specified id
                Completex <- x[complete.cases(x),]# extract complete cases
                CompleteData[i,1] <- id[i] # populate the dataframe
                CompleteData[i,2] <- nrow(Completex)
        }
        
        CompleteData # output the dataframe
}
corr <- function(directory, threshold = 0) 
{
        CntCompleteObs <- complete(directory)
        MoreThanThreshold <- CntCompleteObs[CntCompleteObs$nobs > threshold,c("id","nobs")]
        FilName <- list.files(directory,full.names =TRUE) # read file names
        cr<- numeric(0)
        if(nrow(MoreThanThreshold) == 0){}
        else
        {       
                ids <- MoreThanThreshold["id"]
                for(i in 1:nrow(ids))
                {
                        x <- read.csv(FilName[MoreThanThreshold[i,1]]) # read files for the specified id
                        Completex <- x[complete.cases(x),]# extract complete cases
                        resCOrr <- round(cor(Completex["sulfate"],Completex["nitrate"]),5)
                        cr <- c(cr,resCOrr)
                        
                }       
        } 
        
cr
}