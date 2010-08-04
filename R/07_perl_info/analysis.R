load("07_perl_info.RData")
source("../utils.R")
data$version_of_perl_used_most_frequently <- ordered(data$version_of_perl_used_most_frequently, levels=c(1:6),labels=c("<=5.4","5.5005","5.6.x","5.8.x","5.10.x","5.12"))
version <- category.matrix(data[1:6], "^versions_of_perl_commonly_used_")
png("freq.png")
plot( data$version_of_perl_used_most_frequently)
dev.off()

library(R2HTML)
HTMLStart(".", 'index', HTMLframe=FALSE, Title="Perl Versions", autobrowse=FALSE);
HTML.title("Perl Versions", HR=1)
HTML.title("Version of perl most frequently used", HR=2)
HTMLInsertGraph("freq.png")

HTML.title("Versions of perl commonly used ", HR=2)
HTML(version,row.names=TRUE)
