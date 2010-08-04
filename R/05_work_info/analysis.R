load("05_work_info.RData")

sector.count <- function(s) {
  is   <- length(s[s[1] == 1])
  isnt <- length(s[s[1] == 0])
  tot = is+isnt
  perc = round(is/tot*100,2)
  return(c(is, perc))
}
sec.names <- function(s) {
  s.n <- names(s)
  for (n in 1:length(s.n)) {
    s.n[n] <- sub("^work_industries_", "", s.n[n])
    s.n[n]<- gsub("_|\\.", " ", s.n[n])
    }
  return(s.n)
}

sec.matrix <- function(data) {
  N <- length(data)
  sec <- data.frame(Count=integer(N), percent=numeric(N))
  for (x in c(1:N)) {
    r <- sector.count(data[x])
    sec[x,] <- r[1:2]
  }
  rownames(sec) <- sec.names(data)
  sec <- sec[order(sec[,2], decreasing=TRUE),]
  return(sec)
}



data$approx_annual_income <- ordered(data$approx_annual_income,levels=c(1:5),labels=c("$0-\n$30,000","$30,000-\n$60,000","$60,000-\n$90,000","$90,000-\n$120,000","$120,000+"))

png("income.png")
par(las=2)
plot(data$approx_annual_income)
sec <- sec.matrix(data[2:40]);
library(R2HTML);

HTMLStart(".", 'index', HTMLframe=FALSE, Title="Age, Income and Industry Sector", autobrowse=FALSE);
HTML.title("Age, Income and Industry Sector", HR=1)
HTML.title("Income", HR=2)
HTMLInsertGraph("income.png")
HTML.title("Industry Sector", HR=2)
HTML(sec,row.names=TRUE)
