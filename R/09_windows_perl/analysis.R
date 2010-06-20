load("09_windows_perl.RData")
data$win_os_perl_distro_best <- factor(data$win_os_perl_distro_best,levels=c(1:4),labels=c("Strawberry Perl","ActiveState Perl","Cygwin Perl","Other"))
version <- read.csv("version.csv")

pdf("version.pdf")
par(las=2,mfrow=c(1,2))
plot(data$win_os_perl_distro_best,cex.names=0.7,main="Best Windows distro")
barplot(version$Count,names.arg=version$Distribution,cex.names=0.7,main="Used Windows distro")
dev.off()


