perl.survey <- read.csv("../data/all_data.csv");
perl.survey$num_cpan_modules <- ordered(perl.survey$num_cpan_modules)
summary(perl.survey$num_cpan_modules)
sum(summary(perl.survey$num_cpan_modules)[2:4]) # non-cpan contributors
sum(summary(perl.survey$num_cpan_modules)[1]) # cpan contributors


