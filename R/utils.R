my.report <- function(my.table) {
    return (round( my.table/sum(my.table) * 100, 2))
}

category.count <- function(s) {
  is   <- length(s[s[1] == 1])
  isnt <- length(s[s[1] == 0])
  tot = is+isnt
  perc = round(is/tot*100,2)
  return(c(is, perc))
}

category.names <- function(s, txt, strip.dots=FALSE) {
  s.n <- names(s)
  for (n in 1:length(s.n)) {
    s.n[n] <- sub(txt, "", s.n[n])
    if (strip.dots == TRUE) {
      s.n[n]<- gsub("(_|\\.)+", " ", s.n[n])
    }
  }
  return(s.n)
}

category.matrix <- function(data, txt, strip.dots=FALSE) {
  N <- length(data)
  sec <- data.frame(Count=integer(N), percent=numeric(N))
  for (x in c(1:N)) {
    r <- category.count(data[x])
    sec[x,] <- r[1:2]
  }
  rownames(sec) <- category.names(data,txt,strip.dots=strip.dots)
  sec <- sec[order(sec[,2], decreasing=TRUE),]
  return(sec)
}

round.up.hundred <- function(x) {
  y = x + 100
  z = y %% 100
  y = y -z
  return(y)
}

is.not.na <- function(x) !is.na(x)

full.mean <- function(x) {
  x.idx <- which(is.not.na(x))
  if (length(x.idx) > 0) {
   return( mean(x[x.idx]) )
  }
  else {
    return ( NA )
  }
}

