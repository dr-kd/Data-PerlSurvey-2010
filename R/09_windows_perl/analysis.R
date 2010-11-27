load("09_windows_perl.RData")
source("../utils.R")
data$win_os_perl_distro_best <- factor(data$win_os_perl_distro_best,levels=c(1:4),labels=c("Strawberry","ActiveState","Cygwin","Other"))
version <- data[1:4]

png("version.png")
par(las=2)
plot(data$win_os_perl_distro_best,cex.names=0.7,main="Best Windows distro")
dev.off()

library(R2HTML)
HTMLStart(".", 'index', HTMLframe=FALSE, Title="Perl on Windows", autobrowse=FALSE);
HTML.title("Perl on Windows", HR=1)
HTMLInsertGraph("version.png")
HTML.title("Windows Perl Distributions Used", HR=2);
HTML(category.matrix(version, "^win_os_perl_distro_", strip.dots=TRUE))
HTMLStop()
