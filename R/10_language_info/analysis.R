load("10_language_info.RData")
for (i in 1:5) data[,i] <- tolower(data[,i])

# languages <- sort(unique(unlist(c(sapply(data[1:5],levels)),use.names=FALSE)))
# write.csv(languages,file="lang.csv")
#  some manual processing to normalise the languages list a bit
languages <- read.csv(file="lang.csv")


for (i in 1:length(languages[,1])) data <- replace(data, data==toString(languages[i,1]), toString(languages[i,2]))
data <- replace(data, data=="rubh", "ruby")

## check we've normalised well
## languages <- sort(unique(unlist(c(sapply(data[1:5],levels)),use.names=FALSE)))
## write.csv(languages,file="lang2.csv")

data <- replace(data, data =="", NA)
data <- replace(data, data=="-", NA)
data <- replace(data, data=="NA", NA)

library(dummies)

l1 <- dummy.data.frame(as.data.frame(data$language_1))
l2 <- dummy.data.frame(as.data.frame(data$language_2))
l3 <- dummy.data.frame(as.data.frame(data$language_3))
l4 <- dummy.data.frame(as.data.frame(data$language_4))
l5 <- dummy.data.frame(as.data.frame(data$language_5))
names(l1) <- sub("^data.language_.","",names(l1))
names(l2) <- sub("^data.language_.","",names(l2))
names(l3) <- sub("^data.language_.","",names(l3))
names(l4) <- sub("^data.language_.","",names(l4))
names(l5) <- sub("^data.language_.","",names(l5))

l1 <- replace(l1,l1==1,1)
l2 <- replace(l2,l2==1,2)
l3 <- replace(l3,l3==1,3)
l4 <- replace(l4,l4==1,4)
l5 <- replace(l5,l5==1,5)

languages.list <- unique(names(c(l1,l2,l3,l4,l5)))

cases <- rep(0,length(l1[,1]))

# standardise the columns for each dataframe
for ( i in 1:length(languages.list) ) {
  if ( length (l1[[languages.list[i]]]) == 0 ) {
    l1[[languages.list[i]]] <- cases
  }
  if ( length (l2[[languages.list[i]]]) == 0 ) {
    l2[[languages.list[i]]] <- cases
  }
  if ( length (l3[[languages.list[i]]]) == 0 ) {
    l3[[languages.list[i]]] <- cases
  }
  if ( length (l4[[languages.list[i]]]) == 0 ) {
    l4[[languages.list[i]]] <- cases
  }
  if ( length (l5[[languages.list[i]]]) == 0 ) {
    l5[[languages.list[i]]] <- cases
  }
}


# obscure way of calling this to force vars to be returned in the correct
# order.  we should really use an exception here to check if the length and
# names of each vector are the same.

all.langs <- l1[names(l1)] +l2[names(l1)] +l3[names(l1)] +l4[names(l1)] + l5[names(l1)]

perl <- data$where_perl_belongs_in_list

insert.perl.order <- function(row.idx) {
  x <- all.langs[row.idx,]
  y <- perl[row.idx]
  change.logical <- which(x >= y);
  all.langs[row.idx,change.logical] <- x[change.logical]+1
}

all.langs$perl <- perl

# all.langs <- replace(all.langs,all.langs==0,NA)
# THIS IS THE DATA FRAME TO USE TO DO ANALYSIS BY OTHER SECTIONS!!!



for (i in 1:length(names(all.langs)) ) all.langs[,i] <- factor(all.langs[,i],levels=c(1:6) )

sapply(all.langs,summary)

lang.summary <- sapply(all.langs, summary)


report.rows = dim(lang.summary)[2]



report.df <- data.frame('Most used'=integer(),
                        'Second most'=integer(),
                        'Third most'=integer(),
                        'Fourth most'=integer(),
                        'Fifth most'=integer(),
                        'Sixth most'=integer(),
                        'Non-users'=integer(),
                        'Total-users'=integer(),
                        'Percent users'=numeric(),
                        'Mean Rank'=numeric()
                        )
for ( i in 1:report.rows ) {
  this.lang <- names(lang.summary[1,])[i]
  this.counts <- lang.summary[,i]

  # UGLY and possibly FRAGILE hack to remove non-perl users from counts
  this.counts[7] <- this.counts[7] - lang.summary[7,dim(lang.summary)[2]]

  this.counts[8] <- sum(this.counts[1:6])
  this.counts[9] <- round(this.counts[8]/sum(this.counts[1:7]) * 100,2)
  this.counts[10] <- round(sum(this.counts[1:6]*c(1:6))/sum(this.counts[1:6]),2)
  report.df[i,] <- this.counts
  rownames(report.df[1,]) <- this.lang
}

rownames(report.df) <- names(lang.summary[1,])

# now we can get the count of number of languages used per person
howmanylang <- function(x) length(which(x > 0))
all.langs$lang.count <- apply(all.langs,1,howmanylang)
all.langs$lang.count[which(all.langs$lang.count == 0)] <- NA


## so finally report.df has spat out all the language rankings etc :)
library(R2HTML)
HTMLStart(".", 'index', HTMLframe=FALSE, Title="Programming language info", autobrowse=FALSE);
HTML.title("Programming language info", HR=2)
HTML.title("Number of languages reported",HR=2)
HTML(table(all.langs$lang.count))
HTML.title("Other Languages Used", HR=2)
HTML(report.df[order(report.df[,8],decreasing=TRUE),])

HTMLStop()
