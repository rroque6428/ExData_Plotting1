# - - - Load subset

# Attention: This subset was created using 'filterDataset.R', that
#            filters only the data for the two days we are interested in.
sdset <- "mysubset.csv" # See 'filterDataset.R' script

# Abort in case the subset was not found.
if( !file.exists(sdset) ) {
    stop("Subset not found. Please, run 'filterDataset.R' or change dir.")
}

dset <- read.csv(sdset)

# - - - Plot Commands
    
hist(dset$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")

dev.copy(png, file = "plot1.png") ; dev.off()
