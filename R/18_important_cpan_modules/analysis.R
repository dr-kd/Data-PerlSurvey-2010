load("18_important_cpan_modules.RData")
for (i in 1:5) data[,i] <- tolower(data[,i])


for (i in 1:length(modules[,1])) data <- replace(data, data==toString(data[i,1]), toString(data[i,2]))

# data <- replace(data, data=="rubh", "ruby")
data <- replace(data, data =="", NA)
data <- replace(data, data=="-", NA)
data <- replace(data, data=="NA", NA)

library(dummies)

l1 <- dummy.data.frame(as.data.frame(data$CPAN_1))
l2 <- dummy.data.frame(as.data.frame(data$CPAN_2))
l3 <- dummy.data.frame(as.data.frame(data$CPAN_3))
l4 <- dummy.data.frame(as.data.frame(data$CPAN_4))
l5 <- dummy.data.frame(as.data.frame(data$CPAN_5))
names(l1) <- sub("^data.CPAN_.","",names(l1))
names(l2) <- sub("^data.CPAN_.","",names(l2))
names(l3) <- sub("^data.CPAN_.","",names(l3))
names(l4) <- sub("^data.CPAN_.","",names(l4))
names(l5) <- sub("^data.CPAN_.","",names(l5))

l1 <- replace(l1,l1==1,1)
l2 <- replace(l2,l2==1,2)
l3 <- replace(l3,l3==1,3)
l4 <- replace(l4,l4==1,4)
l5 <- replace(l5,l5==1,5)

modules.list <- unique(names(c(l1,l2,l3,l4,l5)))

cases <- rep(0,length(l1[,1]))

# standardise the columns for each dataframe
for ( i in 1:length(modules.list) ) {
  if ( length (l1[[modules.list[i]]]) == 0 ) {
    l1[[modules.list[i]]] <- cases
  }
  if ( length (l2[[modules.list[i]]]) == 0 ) {
    l2[[modules.list[i]]] <- cases
  }
  if ( length (l3[[modules.list[i]]]) == 0 ) {
    l3[[modules.list[i]]] <- cases
  }
  if ( length (l4[[modules.list[i]]]) == 0 ) {
    l4[[modules.list[i]]] <- cases
  }
  if ( length (l5[[modules.list[i]]]) == 0 ) {
    l5[[modules.list[i]]] <- cases
  }
}


# obscure way of calling this to force vars to be returned in the correct
# order.  we should really use an exception here to check if the length and
# names of each vector are the same.

all.modules <- l1[names(l1)] +l2[names(l1)] +l3[names(l1)] +l4[names(l1)] + l5[names(l1)]

# all.modules <- replace(all.langs,all.langs==0,NA)
# THIS IS THE DATA FRAME TO USE TO DO ANALYSIS BY OTHER SECTIONS!!!


for (i in 1:length(names(all.modules)) ) all.modules[,i] <- factor(all.modules[,i],levels=c(1:6) )

modules.summary <- sapply(all.modules, summary)


report.rows = dim(modules.summary)[2]



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
  this.lang <- names(modules.summary[1,])[i]
  this.counts <- modules.summary[,i]

  this.counts[8] <- sum(this.counts[1:6])
  this.counts[9] <- round(this.counts[8]/sum(this.counts[1:7]) * 100,2)
  this.counts[10] <- round(sum(this.counts[1:6]*c(1:6))/sum(this.counts[1:6]),2)
  report.df[i,] <- this.counts
  rownames(report.df[1,]) <- this.lang
}

rownames(report.df) <- names(modules.summary[1,])

# now we can get the count of number of modules used per person
howmanylang <- function(x) length(which(x > 0))
all.modules$mod.count <- apply(all.modules,1,howmanylang)
all.modules$mod.count[which(all.modules$mod.count == 0)] <- NA


## so finally report.df has spat out all the language rankings etc :)
library(R2HTML)
HTMLStart(".", 'index', HTMLframe=FALSE, Title="CPAN Module info", autobrowse=FALSE);
HTML.title("CPAN module  info", HR=2)
HTML.title("Number of modules reported",HR=2)
HTML(table(all.modules$mod.count))
HTML.title("Other Modules Used", HR=2)
HTML(report.df[order(report.df[,8],decreasing=TRUE),])

HTMLStop()
