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
     plot(DateTime, Sub_metering_1, 
     axes = FALSE,
     xlab = "",
     ylab = "Energy sub metering"))

with(dset, lines(DateTime, Sub_metering_1, col = "black"))
with(dset, lines(DateTime, Sub_metering_2, col = "red"))
with(dset, lines(DateTime, Sub_metering_3, col = "blue"))

box()
axis(1, labels = c("Thu", "Fri", "Sat"), at = c(0,1440,2880))
axis(2)

legend("topright", 
       lty = 1, 
       col = c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       pt.cex=1, 
       cex=0.64)

dev.copy(png, file = "plot3.png") ; dev.off()

