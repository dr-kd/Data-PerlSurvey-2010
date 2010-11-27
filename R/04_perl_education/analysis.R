load("04_perl_education.RData")
data$formally_taught_perl <- ordered(data$formally_taught_perl,levels=c(1:5),labels=c("None","Almost none","A little","Quite a bit","A lot"))
data$formally_taught_other_os_language <- ordered(data$formally_taught_other_os_language,levels=c(1:5),labels=c("None","Almost none","A little","Quite a bit","A lot"))

png("education1.png")
par(las=2)
plot(data$formally_taught_perl,main="Formally taught perl",cex.names=0.8)
dev.off()
png("education2.png")
plot(data$formally_taught_other_os_language,main="Formally taught other",cex.names=0.8)
dev.off()

# other languages
other_lang <- read.csv("lang_counts.csv",header=F)
png("other.png")
par(las=2)
barplot(other_lang$V1,names.arg=other_lang$V2,cex.names=0.8)
dev.off()

library(R2HTML);
HTMLStart(".", 'index', HTMLframe=FALSE, Title="Language Education", autobrowse=FALSE);
HTML.title("Perl Education", HR=1)
HTML.title("Were you formally taught any Perl?", HR=2)
HTMLInsertGraph("education1.png")

HTML.title("Other Language Education", HR=1)
HTML.title("Were you formally taught any Other dynamic languages?", HR=2)
HTMLInsertGraph("education2.png")

