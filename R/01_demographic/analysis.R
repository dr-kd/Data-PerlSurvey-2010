load("01_demographic.RData")
data$age_group <- factor(data$age_group,levels=c(1:6),labels=c("Under 20","20-24","25-29","30-39","40-49","50+"))
data$gender <- factor(data$gender,levels=c(1:3),labels=c("Male","Female","Other"))
library(Hmisc);
describe(data$gender)
describe(data$age_group)
