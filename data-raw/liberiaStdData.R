library(readxl)

round1 <- read_excel(path = "data-raw/stdEntry.xlsx", sheet = 1)
names(round1) <- c("eid", "cid", "round", "weight", "height", "muac", "oedema")

round2 <- read_excel(path = "data-raw/stdEntry.xlsx", sheet = 2)
names(round1) <- c("eid", "cid", "round", "weight", "height", "muac", "oedema")

liberiaStdData <- data.frame(rbind(round1, round2))

usethis::use_data(liberiaStdData, overwrite = TRUE)
