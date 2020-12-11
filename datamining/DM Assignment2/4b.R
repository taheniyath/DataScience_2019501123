setwd("E:\\DataScience_2019501123\\datamining\\DM Assignment2")
which.nonnumeric <- function (column) {
  which(is.na(suppressWarnings(as.numeric(as.character(column)))))
}

for (name in names(data)) {
  c <- data[[name]]
  r <- which.nonnumeric(c)
  v <- c[r]
  msg <- ''
  if (length(v)) {
    msg <- sprintf("data$%s is qualitative (%s[%d] == '%s')", name, name, r, as.character(v))
  } else {
    msg <- sprintf("data$%s is quantitive (all rows are numeric)", name)
  }
  print(msg)
}
