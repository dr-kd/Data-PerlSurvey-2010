load("16_opinions.RData")
source("../utils.R")
data[data==1] = NA
data <- data-1
data.clean<- na.omit(data)
f2=factanal(data.clean,2,rotation="varimax")
load = loadings(f2)


# in this instance we see that the two factor solution gives clear work and self variables.
me <- data[c(1,3,4,5,10,11,12,13,14,15,16,17)]
work <- data[c(2,6,7,8,9)]

data$me.score <- apply(me,1,full.mean)
data$work.score <- apply(work,1,full.mean)
library(RColorBrewer)

counts <- table(floor(data$me.score),floor(data$work.score))
counts.perc <- counts/sum(counts)*100


png("me-v-work.png")
mosaicplot(counts.perc,col=brewer.pal(5,"Set3"),xlab="Own Attitude", ylab="Employer attitude")
dev.off()

me.labels <- c("Perl is a cutting edge language",
               "Perl is a good_language for a startup",
               "Perl is easy to maintain",
               "Perl scales well",
               "Perl is a good first programming language",
               "Perl is a good tool for beginners",
               "Perl is a good tool for early career programmers",
               "Perl is a good tool for experienced programmers",
               "Perl is a good tool for system administrators",
               "Perl is a good tool for network engineers",
               "Perl is a good tool for embedded systems programmers",
               "Perl is a good tool for applications programmers")
work.labels <- c("Perl is encouraged at my workplace",
                 "My employer encourages perl for new projects",
                 "My employer viewes perl as a cutting edge language",
                 "My employer views perl as easy to maintain",
                 "My employer thinks that perl scales well")
png("me.png")
par(las=2)
boxplot(me, names=c(1:length(me.labels)),cex.axis=0.75,horizontal=TRUE, main="Own attitudes towards perl")
dev.off()
png("work.png")
par(las=2)
boxplot(work, names=c(1:length(work.labels)),cex.axis=0.75,horizontal=TRUE, main="Employer attitudes towards perl")
dev.off()

library(R2HTML)
HTMLStart(".", 'index', HTMLframe=FALSE, Title="My versus work attitudes to Perl", autobrowse=FALSE);
HTML.title("Own attitudes towards Perl",HR=2)
HTMLInsertGraph("me.png")
HTML.title("Legend", HR=3)
HTML("<ol>")
HTMLli(me.labels)
HTML("</ol>")
HTML.title("Employer attitudes towards Perl",HR=2)
HTMLInsertGraph("work.png")
HTML("<ol>")
HTMLli(work.labels)
HTML("</ol>")
HTML.title("My versus employer attitudes to Perl", HR=2)
HTMLInsertGraph("me-v-work.png")

HTMLStop()
