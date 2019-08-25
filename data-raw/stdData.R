library(readxl)

sheet1 <- read_excel(path = "data-raw/stdEntryForm.xlsx", sheet = 1)
sheet2 <- read_excel(path = "data-raw/stdEntryForm.xlsx", sheet = 2)

temp <- merge(sheet1, sheet2, by = c("eid", "cid"))

xx <- tidyr::gather(sheet1, key = measure_type, value = measure_value, weight:muac)
yy <- tidyr::gather(sheet2, key = measure_type, value = measure_value, weight:muac)

dataStdLong <- data.frame(rbind(xx, yy))

xx <- anthrocheckr::summary_measure(x = dataStdLong$measure_value,
                              index = dataStdLong[ , c("eid", "cid", "measure_type")])

xx_height <- anthrocheckr::summary_measure(x = dataStdLong$measure_value[dataStdLong$measure_type == "height"],
                                           index = dataStdLong[dataStdLong$measure_type == "height", c("eid", "cid")])

xx_height_all <- anthrocheckr::summary_measure(x = dataStdLong$measure_value[dataStdLong$measure_type == "height"],
                                               index = dataStdLong[dataStdLong$measure_type == "height", c("cid")])

biasHeight <- data.frame(matrix(nrow = nrow(xx_height[[1]]), ncol = nrow(xx_height_all)))

for(i in 1:ncol(xx_height[[1]])) {
  biasHeight[ , i] <- xx_height[[1]][ , i] / xx_height_all$mean[i]
}


yy <- anthrocheckr::summary_measure(x = dataStdLong$measure_value, index = dataStdLong[ , c("cid", "measure_type")])


