load("06_programming_experience.RData")
data$programming_computers_for <- ordered(data$programming_computers_for,levels=c(1:6),labels=c("< 1","1 - 3","4 - 6","7 - 10","11 - 20","> 20"))

data$programming_perl_for <- ordered(data$programming_perl_for,levels=c(1:6),labels=c("< 1","1 - 3","4 - 6","7 - 10","11 - 20","> 20"))

data$work_proportion_programming_software_projects <- ordered(data$work_proportion_programming_software_projects,levels=c(1:5),labels=c("~ 0","< ⅓","⅓ - ½","½ - ⅔","> ⅔"))

data$work_proportion_programming_software_projects_not_writing_code <- ordered(data$work_proportion_programming_software_projects_not_writing_code,levels=c(1:5),labels=c("~ 0","< ⅓","⅓ - ½","½ - ⅔","> ⅔"))

data$time_percentage_programming_perl <- ordered(data$time_percentage_programming_perl,levels=c(1:5),labels=c("~ 0","< ⅓","⅓ - ½","½ - ⅔","> ⅔"))

data$programming_in_spare_time <- ordered(data$programming_in_spare_time,levels=c(1:6),labels=c("Never","Occasionally","A little","Frequently","Very often","Most"))


library(R2HTML)
png("experience1.png")
par(las=2)
plot(data[1],main="Years spent programming computers",cex.names=0.75,cex.title=0.8,horiz=TRUE)
dev.off()
png("experience2.png")
par(las=2)
plot(data[2],main="Years spent programming perl",cex.names=0.75,cex.title=0.8,horiz=TRUE)
dev.off()

png("experience3.png")
par(las=2)
plot(data[3],main="Time at work spent programming",cex.names=1.2,cex.title=0.8,horiz=TRUE)
dev.off()

png("experience4.png")
par(las=2)
plot(data[4],main="Time at work spent not on code",cex.names=1.2,cex.title=0.8,horiz=TRUE)
dev.off()

png("experience5.png")
par(las=2)
plot(data[5],main="Time spent programming perl",cex.names=1.2,cex.title=0.8,horiz=TRUE)
dev.off()

png("experience6.png")
par(las=2)
plot(data[6],main="Spare time spent programming",cex.names=0.65,cex.title=0.8,horiz=TRUE)
dev.off()

HTMLStart(".", 'index', HTMLframe=FALSE, Title="Programming Experience", autobrowse=FALSE);

HTML.title("Programming Experience", HR=1);
HTMLInsertGraph("experience1.png")
HTMLInsertGraph("experience2.png")
HTMLInsertGraph("experience3.png")
HTMLInsertGraph("experience4.png")
HTMLInsertGraph("experience5.png")
HTMLInsertGraph("experience6.png")

HTMLStop()
