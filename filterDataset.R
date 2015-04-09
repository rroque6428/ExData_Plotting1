require(dplyr)
require(lubridate)

# UC Irvine MLR - Electric Power Consumption (after unzip)
sdset <- "household_power_consumption.txt"

if( file.exists(sdset) ) {
    # Read the dataset for this Course Project
    df <- read.csv2(sdset, na.strings="?", nrows=-1)
    
    message(paste("Original Size:",format(object.size(df), units="auto")))
    
    # - - - Convert to tbl_df
    df <- tbl_df(df)
    
    # Transform columns 'Date' and 'Time' in one column called 'DateTime'.
    # Filters the dataset to contain only two days of interest.
    df <- df %>%
        # Create a new column for DateTime
        mutate(DateTime = dmy_hms(paste(Date, Time))) %>% 
        # Turn 'DateTime' the first colummn and remove 'Date' and 'Time'
        select(DateTime, 3:9) %>%
        # Select only the days we will process
        filter(DateTime >= ymd("2007-02-01") & DateTime < ymd("2007-02-03"))
    
    message(paste("Size After Optimization:",format(object.size(df), units="auto")))

    # Show Total of NA's
    message("Total of NA's")
    print(colSums(is.na(df)))
    
    # ... and save to disk
    write.table(df, file="mysubset.csv", row.name = FALSE, quote= FALSE, sep=",")
    
} else {
    message("[ERROR] Not in the correct directory.")
}
