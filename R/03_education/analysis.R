data$highest_qual <-  factor(data$highest_qual,levels=c(1:4),labels=c("School","Technical College","Bachelors","Masters / PhD"))
library(Hmisc);
pdf("qual.pdf")
describe(data$highest_qual)
plot(data$highest_qual)

# post school training
freq(sapply(data[2:11],ordered))


major_freq <- read.csv("freq.csv")
barplot(sort(major_freq$Percent,decreasing=T),names.arg=major_freq$Subject[order])
pdf("majors.pdf")
par(las=2)
barplot(sort(major_freq$Percent,decreasing=T),names.arg=major_freq$Subject[order],cex.names=0.6)
dev.off()
