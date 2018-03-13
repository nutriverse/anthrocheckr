library(pdftools)
library(stringr)

ulijaszek <- pdf_text(pdf = "data-raw/ulijaszek.pdf")

temp <- str_split(string = ulijaszek[3], pattern = "\n")[[1]][8:17]

x <- str_replace_all(temp, pattern = "⋅", replacement = ".")

x <- str_split(x, pattern = " ", simplify = TRUE)

y <- NULL

for(i in 1:nrow(x)) {
  z <- x[i,][x[i, ] != ""]
  y <- rbind(y, as.numeric(z))
}

stature <- data.frame(y)

names(stature) <- c("subject", "m1", "m2", "m3", "m4", "f1", "f2", "diff")

devtools::use_data(stature, overwrite = TRUE)
