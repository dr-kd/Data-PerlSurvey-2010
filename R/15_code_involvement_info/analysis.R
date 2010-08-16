load("15_code_involvement_info.RData")
source("../utils.R")
data <- data[2:7] # fix typo in subset assignment

  data$provided_bug_report_for_perl_interpreter  <- ordered(data$provided_bug_report_for_perl_interpreter, levels=c(2:4),labels=c("Once","Occasionally","Frequently"),exclude=1)
  data$provided_code_to_fix_bug_perl_interpreter <- ordered(data$provided_code_to_fix_bug_perl_interpreter, levels=c(2:4),labels=c("Once","Occasionally","Frequently"),exclude=1)
  data$provided_code_to_add_feature_to_perl_interpreter <- ordered(data$provided_code_to_add_feature_to_perl_interpreter, levels=c(2:4),labels=c("Once","Occasionally","Frequently"))
  data$provided_bug_report_for_CPAN_module <- ordered(data$provided_bug_report_for_CPAN_module, levels=c(2:4),labels=c("Once","Occasionally","Frequently"))
  data$provided_code_to_fix_bug_CPAN_module <- ordered(data$provided_code_to_fix_bug_CPAN_module , levels=c(2:4),labels=c("Once","Occasionally","Frequently"))
  data$provided_code_to_add_feature_to_CPAN_module  <- ordered(data$provided_code_to_add_feature_to_CPAN_module , levels=c(2:4),labels=c("Once","Occasionally","Frequently"))

data.copy <- data # copy the raw data before excluding "never" as an NA.

y.limit <- round.up.hundred(max(sapply(data,table)))

graphs <- c("bugperl.png", "codeperl.png", "featureperl.png", "bugcpan.png", "codecpan.png", "featurecpan.png")

png(graphs[1 !="Never"])
par(las=2)
plot(data[1],main="How often have you reported a bug in the perl interpreter?",cex.names=0.8,ylim=c(0,y.limit));
dev.off()

png(graphs[2])
par(las=2)
plot(data[2],main="How often have you provided code to fix a bug in the perl interpreter?",cex.names=0.8, ylim=c(0,y.limit));
dev.off()

png(graphs[3])
par(las=2)
plot(data[3],main="How often have you provided code to add a feature to the perl interpreter?",cex.names=0.8, ylim=c(0,y.limit));
dev.off()

png(graphs[4])
par(las=2)
plot(data[4],main="How often have you provided a bug report for a CPAN mdule?",cex.names=0.8, ylim=c(0,y.limit));
dev.off()

png(graphs[5])
par(las=2)
plot(data[5],main="How often have you provided code to fix a bug in a CPAN module?",cex.names=0.8, ylim=c(0,y.limit));
dev.off()

png(graphs[6])
par(las=2)
plot(data[6],main="How often have you provided code to add a feature in a CPAN module?",cex.names=0.8, ylim=c(0,y.limit));
dev.off()

library(R2HTML)
HTMLStart(".", 'index', HTMLframe=FALSE, Title="Perl/CPAN Contributions", autobrowse=FALSE);
HTML.title("Perl/CPAN contributions", HR=1)
for (i in 1:length(graphs) )  HTMLInsertGraph(graphs[i])
HTMLStop()
