best <- function(state,outcome) {
    
    setwd("C:\\Users\\Gemma\\Documents\\R\\Projects\\chapter4\\rprog_data_ProgAssignment3-data")
    
    
    #if (is.null(hospitalData)) {
        
        hospitalData <<- read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE, colClasses = "character")
    #}
    
    hospitalData[, 11] <- as.numeric(hospitalData[, 11])
    hospitalData[, 17] <- as.numeric(hospitalData[, 17])
    #hospitalData [hospitalData$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack] <- as.numeric(hospitalData$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    #hospitalData [hospitalData$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure] <- as.numeric(hospitalData$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    #hospitalData [hospitalData$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia] <- as.numeric(hospitalData$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    
    states <<- unique( hospitalData$State)
    
    stateRows <<- hospitalData[hospitalData$State == state, c(2,7,11)]
    
    # testOutcome = "No such results"
    
    if ((state %in% states) == 0) {
        stop("There is no such state")
    }
    
    if (outcome == "heart attack") {
        testOutcome <<- with (stateRows, stateRows$Hospital.Name[ stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == as.character( min(as.numeric(as.character(stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack )), na.rm=TRUE))])
        #testOutcome <<- with (stateRows, stateRows$Hospital.Name[ stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == as.character( min(stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, na.rm=TRUE))])
        
        message("heart attack data")
    }
    
    else if (outcome == "heart failure") {
        testOutcome <<- with (stateRows, stateRows$Hospital.Name[as.numeric( stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure) ==                min(as.numeric(as.character(stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure )), na.rm=TRUE  )])        
        #testOutcome <<- with (stateRows, stateRows$Hospital.Name[             stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack  == as.character( min(as.numeric(as.character(stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack  )), na.rm=TRUE ))])
        #testOutcome <<- with (stateRows, stateRows$Hospital.Name[             stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == as.character( min(as.numeric(as.character(stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure )), na.rm=TRUE ))])        
        #testOutcome <<- with (stateRows, stateRows$Hospital.Name[             stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack  == as.character( min(as.numeric(as.character(stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack  )), na.rm=TRUE ))])
         
         
                
        #message ( as.character( min(as.numeric(as.character(stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure )), na.rm=TRUE)))
        message("heart failure data")
    }
    
    else if (outcome == "pneumonia") {
        #testOutcome <<- with (stateRows, stateRows$Hospital.Name[as.numeric( stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia) == min(as.numeric(as.character(stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia )), na.rm=TRUE)])
         testOutcome <<- with (stateRows, stateRows$Hospital.Name[            stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == as.character( min(as.numeric(as.character(stateRows$Lower.Mortality.Estimate...Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia )), na.rm=TRUE))])
        
        message("pneumonia data")
    }
    
    else {
        testOutcome <<- NULL
        message("no such outcomes")
    }
    
    testOutcome
    
    return(testOutcome)

}