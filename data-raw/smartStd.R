
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
# Convert to long format with first measurements and second measurements on spearate columns
#
xx <- subset(smartStd, select = c(-weight2, -height2, -muac2))
names(xx) <- c("subject", "observer", "weight", "height", "muac")
xx <- gather(xx, key = "measure_type", value = "measure_value1", weight:muac)

yy <- subset(smartStd, select = c(-weight1, -height1, -muac1))
names(yy) <- c("subject", "observer", "weight", "height", "muac")
yy <- gather(yy, key = "measure_type", value = "measure_value2", weight:muac)

zz <- merge(xx, yy, sort = FALSE)

zz <- gather(zz, key = "measure_round", value = "measure_value", measure_value1:measure_value2)

zz$measure_round <- ifelse(zz$measure_round == "measure_value1", 1, 2)

smartStdLong <- zz

devtools::use_data(smartStdLong, overwrite = TRUE)




