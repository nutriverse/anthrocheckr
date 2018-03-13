
library(tidyr)

x <- read.csv("data-raw/standardisation.csv")
#x <- x[3:12, ]
x <- subset(x, select = c(-X, -X.1))

y <- NULL

temp <- x[ , 1:6]
names(temp)   <- c("weight1", "weight2", "height1", "height2", "muac1", "muac2")
y <- rbind(y, temp)

temp <- x[ , 7:12]
names(temp)  <- c("weight1", "weight2", "height1", "height2", "muac1", "muac2")
y <- rbind(y, temp)

temp <- x[ , 13:18]
names(temp) <- c("weight1", "weight2", "height1", "height2", "muac1", "muac2")
y <- rbind(y, temp)

temp <- x[ , 19:24]
names(temp) <- c("weight1", "weight2", "height1", "height2", "muac1", "muac2")
y <- rbind(y, temp)

temp <- x[ , 25:30]
names(temp) <- c("weight1", "weight2", "height1", "height2", "muac1", "muac2")
y <- rbind(y, temp)

temp <- x[ , 31:36]
names(temp) <- c("weight1", "weight2", "height1", "height2", "muac1", "muac2")
y <- rbind(y, temp)

temp <- x[ , 37:42]
names(temp) <- c("weight1", "weight2", "height1", "height2", "muac1", "muac2")
y <- rbind(y, temp)

temp <- x[ , 43:48]
names(temp) <- c("weight1", "weight2", "height1", "height2", "muac1", "muac2")
y <- rbind(y, temp)

temp <- x[ , 49:54]
names(temp) <- c("weight1", "weight2", "height1", "height2", "muac1", "muac2")
y <- rbind(y, temp)

temp <- x[ , 55:60]
names(temp) <- c("weight1", "weight2", "height1", "height2", "muac1", "muac2")
y <- rbind(y, temp)

temp <- x[ , 61:66]
names(temp) <- c("weight1", "weight2", "height1", "height2", "muac1", "muac2")
y <- rbind(y, temp)

row.names(y) <- 1:nrow(y)

observer <- c(rep(0, 10), rep(1, 10), rep(2, 10), rep(3, 10), rep(4, 10), rep(5, 10), rep(6, 10), rep(7, 10), rep(8, 10), rep(9, 10), rep(10, 10))
subject <- rep(1:10, 11)

smartStd <- data.frame(subject, observer, y)

devtools::use_data(smartStd, overwrite = TRUE)

#
# Convert to long format
#
#smartStd <- gather(data = y, key = "measure_type", value = "measure_value", weight1:muac2)




