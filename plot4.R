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

par(mfcol = c(2,2)) # split device in 2 cols and 2 rows
par(mar=c(4.5,5,3,1)) # set margins (bottom, left, top, right)
par(cex=0.5) # set font size

# - - - Graph: Global_active_power ~ Datetime
with(dset, 
     plot(Global_active_power ~ DateTime, 
     axes = FALSE, 
     ylab = "Global Active Power", 
     xlab = ""))

with(dset, lines(DateTime, Global_active_power))

axis(2)
axis(1, labels = c("Thu", "Fri", "Sat"), at = c(0,1440,2880))
box()

# - - - Graph: Sub_metering ~ Datetime
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
       pt.cex = 1,
       bty = "n")

# - - - Graph: Voltage ~ Datetime
with(dset, 
     plot(Voltage ~ DateTime, 
     axes = FALSE, 
     ylab = "Voltage", 
     xlab = "Datetime"))

with(dset, lines(DateTime, Voltage))

axis(2)
axis(1, labels = c("Thu", "Fri", "Sat"), at = c(0,1440,2880))
box()

# - - - Graph: Global_reactive_power ~ Datetime
with(dset, 
     plot(Global_reactive_power ~ DateTime, 
     axes = FALSE, 
     ylab = "Global_reactive_power", 
     xlab = "Datetime"))

with(dset, lines(DateTime, Global_reactive_power))

axis(2)
axis(1, labels = c("Thu", "Fri", "Sat"), at = c(0,1440,2880))
box()

dev.copy(png, file = "plot4.png") ; dev.off()
