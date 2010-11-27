load("03_education.RData")
qual.labels <- c("School","Technical\nCollege","Bachelors","Masters\nor PhD")
data$highest_qual <-  factor(data$highest_qual,levels=c(1:4),labels=qual.labels)
major_freq <- read.csv("freq.csv")
png("qual.png")
par(las=2)
plot(data$highest_qual)
dev.off()
png("majors.png")
par(las=2)
barplot(sort(major_freq$Percent,decreasing=T),names.arg=major_freq$Subject[order],cex.names=0.8)
dev.off()

library(R2HTML);
HTMLStart(".", "index", HTMLframe=FALSE, Title="Education", autobrowse=FALSE);
HTML.title("Education", HR=1)
HTML.title("Highest qualification", HR=2)
HTMLInsertGraph("qual.png")
# post school training
HTML.title("College Major", HR=2)
HTMLInsertGraph("majors.png")

