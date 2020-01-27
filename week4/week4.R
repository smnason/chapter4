best <- function(state,outcome) {
    
    setwd("C:\\Users\\Gemma\\Documents\\R\\Projects\\chapter4\\rprog_data_ProgAssignment3-data")
    
    hospitalData <<- read.csv("outcome-of-care-measures.csv", colClasses = "character")

    states <<- unique( hospitalData$State)
    
    # testOutcome = "No such results"
    
    if ((state %in% states) == 0) {
        stop("There is no such state")
    }
    
    stateRows <- data.frame()

    if (outcome == "heart attack") {
    
        pickedStateRows <- hospitalData[hospitalData$State == state, c(2, 7, 11)]
#        message("heart attack data")
    }
    
    else if (outcome == "heart failure") {
        
        pickedStateRows <- hospitalData[hospitalData$State == state, c(2, 7, 17)]
        #        message("heart attack data")
    }

#    
#    else {
#        testOutcome <<- NULL
#        stop("no such outcomes")
#    }
    
    colnames(pickedStateRows) <- c("Name",         "State", "Type")
    pickedStateRows[,"Type"] <- as.numeric(pickedStateRows[,"Type"])
    sort.pickedStateRows <- pickedStateRows[order(pickedStateRows$Type, pickedStateRows$Name,na.last = TRUE), ]
    sort.pickedStateRows[1,1]
    
    

}