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

with(dset, 
     plot(Global_active_power ~ DateTime, 
     axes = FALSE, 
     ylab = "Global Active Power (kilowatts)", 
     xlab = ""))

with(dset, lines(DateTime, Global_active_power))

axis(2)
axis(1, labels = c("Thu", "Fri", "Sat"), at = c(0,1440,2880))
box()

dev.copy(png, file = "plot2.png") ; dev.off()
