best <- function(state,outcome) {
    
    setwd("C:\\Users\\Gemma\\Documents\\R\\Projects\\chapter4\\rprog_data_ProgAssignment3-data")
    
    hospitalData <<- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE, colClasses = "character")

    states <<- unique( hospitalData$State)
    
    # testOutcome = "No such results"
    
    if ((state %in% states) == 0) {
        stop("There is no such state")
    }
    
    stateRows <- data.frame()

    if (outcome == "heart attack") {
    
        pickedStateRows <<- hospitalData[hospitalData$State == state, c(2, 7, 11)]
#        message("heart attack data")
    }
    

#    
#    else {
#        testOutcome <<- NULL
#        stop("no such outcomes")
#    }
    
    colnames(pickedStateRows) <- c("Name",         "State", "type")
    

}