media <- read.csv("media.csv")
pdf("media.pdf")
par(las=2)
barplot(media$Count,names.arg=media$Source,cex.names=0.7)
dev.off()



