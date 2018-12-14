library(readxl)

round1 <- read_excel(path = "data-raw/stdEntry.xlsx", sheet = 1)
round1 <- data.frame("round" = 1, round1)

round2 <- read_excel(path = "data-raw/stdEntry.xlsx", sheet = 2)
round2 <- data.frame("round" = 2, round2)

liberiaStdData <- data.frame(rbind(round1, round2))

usethis::use_data(liberiaStdData, overwrite = TRUE)
