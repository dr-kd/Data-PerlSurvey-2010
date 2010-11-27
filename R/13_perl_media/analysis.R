load("13_perl_media.RData")
source("../utils.R")
names(data) <- c("Planet Perl", "Perlsphere", "Ironman", "Planet Six", "Planet Parrot", "blogs.perl.org", "use.perl.org", "reddit/perl", "Other")
report <- category.matrix(data, "", strip.dots = FALSE);

png("news.png")
par(las=2)
barplot(report[,1], names.arg=rownames(report),cex.names=0.8)
dev.off()

library(R2HTML)
HTMLStart(".", 'index', HTMLframe=FALSE, Title="Perl News Sources", autobrowse=FALSE);
HTML.title("Perl News Sources", HR=1)
HTMLInsertGraph("news.png")
HTMLStop()



