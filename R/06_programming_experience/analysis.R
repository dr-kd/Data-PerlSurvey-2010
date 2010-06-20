load("06_programming_experience.RData")
data$programming_computers_for <- ordered(data$programming_computers_for,levels=c(1:6),labels=c("less than 1 year","1 to 3 years","4 to 6 years","7 to 10 years","11 to 20 years","20 or more years"))

data$programming_perl_for <- ordered(data$programming_perl_for,levels=c(1:6),labels=c("less than 1 year","1 to 3 years","4 to 6 years","7 to 10 years","11 to 20 years","20 or more years"))

data$work_proportion_programming_software_projects <- ordered(data$work_proportion_programming_software_projects,levels=c(1:5),labels=c("very little","less than a third","a third to a half","a half to two-thirds","more than two thirds"))

data$work_proportion_programming_software_projects_not_writing_code <- ordered(data$work_proportion_programming_software_projects_not_writing_code,levels=c(1:5),labels=c("very little","less than a third","a third to a half","a half to two-thirds","more than two thirds"))

data$time_percentage_programming_perl <- ordered(data$time_percentage_programming_perl,levels=c(1:5),labels=c("very little","less than a third","a third to a half","a half to two-thirds","more than two thirds"))

data$programming_in_spare_time <- ordered(data$programming_in_spare_time,levels=c(1:6),labels=c("Never","Occasionally","A little","Frequently","Very often","Most of my spare time"))

pdf("experience.pdf")

par(mfrow=c(2,3),las=2)
plot(data[1],main="Time programming computers",cex.names=0.6,cex.title=0.8,horiz=TRUE)
plot(data[2],main="Time programming perl",cex.names=0.6,cex.title=0.8,horiz=TRUE)
plot(data[3],main="Time spent programming",cex.names=0.6,cex.title=0.8,horiz=TRUE)
plot(data[5],main="Time not on code",cex.names=0.6,cex.title=0.8,horiz=TRUE)
plot(data[4],main="Time  programming perl",cex.names=0.6,cex.title=0.8,horiz=TRUE)
plot(data[5],main="Spare time programming",cex.names=0.6,cex.title=0.8,horiz=TRUE)
dev.off()
