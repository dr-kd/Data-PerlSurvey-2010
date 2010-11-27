load("02_countries.RData")
# top 30 countries


library(R2HTML)

HTMLStart(".","index",HTMLframe=FALSE, Title="Country of Birth and Residence",autobrowse=FALSE)


HTML.title("Perl Survey 2010", HR=1)

HTML.title("Country of birth by country of origin", HR=2);

paste("Programmer mobility is of some interest, so here we look at the top 30 countries of birth (the table column) by the top 30 countries of origin")

xtab <- table(data$birth_country, data$resident_country)
xtab <- xtab[,rev(order(colSums(xtab)))]
xtab <- xtab[rev(order(rowSums(xtab))),]
HTML(xtab[1:30,1:15])

HTMLStop();
