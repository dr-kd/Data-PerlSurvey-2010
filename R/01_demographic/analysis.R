completions <- read.csv("../../data/all_data.csv")$completed;
attempts <- length(completions);
completed <- length(completions[!is.na(completions)]);
percent <- round(completed/attempts*100, 2);
rm(completions);
load("01_demographic.RData")
source("../utils.R")

data$age_group <- factor(data$age_group,levels=c(1:6),labels=c("Under 20","20-24","25-29","30-39","40-49","50+"))
data$gender <- factor(data$gender,levels=c(1:3),labels=c("Male","Female","Other"))

library(R2HTML)

HTMLStart(".","index",HTMLframe=FALSE, Title="Basic Demographics",autobrowse=FALSE)

HTML.title("Perl Survey 2010", HR=1)

HTML.title("Response Rate", HR=2)



HTMLli( c(
          paste("Total number of responses: ", attempts),
          paste("Total number of completions: ", completed),
          paste("Percent completed: ", percent , "%", sep=" ")
          )
       )

HTML.title("Gender", HR=2)


HTML.title("Counts", HR=3)

table(data$gender)

HTML.title("Percent", HR=3)

my.report(table(data$gender))

HTML.title("Age by Gender", HR=2)

HTML.title("Counts", HR=3)

table(data$gender,data$age)

HTML.title("Percent", HR=3)

my.report(table(data$gender, data$age))

HTMLStop()
