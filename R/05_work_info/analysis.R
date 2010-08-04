load("05_work_info.RData")
source("../utils.R")



data$approx_annual_income <- ordered(data$approx_annual_income,levels=c(1:5),labels=c("$0-\n$30,000","$30,000-\n$60,000","$60,000-\n$90,000","$90,000-\n$120,000","$120,000+"))

png("income.png")
par(las=2)
plot(data$approx_annual_income)
sec <- category.matrix(data[2:40]);
library(R2HTML);

HTMLStart(".", 'index', HTMLframe=FALSE, Title="Age, Income and Industry Sector", autobrowse=FALSE);
HTML.title("Age, Income and Industry Sector", HR=1)
HTML.title("Income", HR=2)
HTMLInsertGraph("income.png")
HTML.title("Industry Sector", HR=2)
HTML(sec,row.names=TRUE)
