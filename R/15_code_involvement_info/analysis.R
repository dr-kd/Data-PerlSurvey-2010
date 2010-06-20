load("15_code_involvement_info.RData")
data <- data[2:7] # fix typo in subset assignment

  data$provided_bug_report_for_perl_interpreter  <- ordered(data$provided_bug_report_for_perl_interpreter, levels=c(1:4),labels=c("Never","Once","Occasionally","Frequently"))
  data$provided_code_to_fix_bug_perl_interpreter <- ordered(data$provided_code_to_fix_bug_perl_interpreter, levels=c(1:4),labels=c("Never","Once","Occasionally","Frequently"))
  data$provided_code_to_add_feature_to_perl_interpreter <- ordered(data$provided_code_to_add_feature_to_perl_interpreter, levels=c(1:4),labels=c("Never","Once","Occasionally","Frequently"))
  data$provided_bug_report_for_CPAN_module <- ordered(data$provided_bug_report_for_CPAN_module, levels=c(1:4),labels=c("Never","Once","Occasionally","Frequently"))
  data$provided_code_to_fix_bug_CPAN_module <- ordered(data$provided_code_to_fix_bug_CPAN_module , levels=c(1:4),labels=c("Never","Once","Occasionally","Frequently"))
  data$provided_code_to_add_feature_to_CPAN_module  <- ordered(data$provided_code_to_add_feature_to_CPAN_module , levels=c(1:4),labels=c("Never","Once","Occasionally","Frequently"))

pdf("code.pdf")
par(mfrow=c(2,3),las=2);
plot(data[1],main="perlbug report",cex.names=0.8);
plot(data[2],main="perlbug code",cex.names=0.8);
plot(data[3],main="perlfeature code",cex.names=0.8);
plot(data[4],main="cpan bug report",cex.names=0.8);
plot(data[5],main="cpan bug code",cex.names=0.8);
plot(data[6],main="cpan code feature",cex.names=0.8);
dev.off()
