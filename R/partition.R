## Partition data files up into managable chunks for first analysis
perl.survey <- read.csv("../data/all_data_countries_cleaned.csv")

split.data <- function (dir, start, end) {
           dir.create(dir);
           setwd(dir);
           data <- perl.survey[start:end];
           write.csv(data, paste(dir,".csv",sep=""));
           save(data,file=paste(dir,".RData",sep=""));
           setwd('../');
}

split.data("01_demographic",3,4);
split.data("02_countries", 5,6);
split.data("03_education",7,17);
split.data("04_perl_education",18,20);
split.data("05_work_info",21,60);
split.data("06_programming_experience",61,66);
split.data("07_perl_info",67,73);
split.data("08_os_info",74,179);
split.data("09_windows_perl",180,184);
split.data("10_language_info",185,190);
split.data("11_editor_info",191,278);
split.data("12_community_involvement",279,284);
split.data("13_perl_media",285,293);
split.data("14_cpan_info",294,295);
split.data("15_code_involvement_info",295,301);
split.data("16_opinions",302,318);
split.data("17_opinions_words",319,321);
split.data("18_important_cpan_modules",325,329);
split.data("19_cpan_workflow",330,333);
split.data("20_x_platform",334,335);
split.data("21_perl_cert",322,324);
