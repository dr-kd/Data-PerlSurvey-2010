load("19_cpan_workflow.RData")
pdf("cpan.pdf")
par(mfrow=c(2,2))
plot(ordered(data$install_CPAN_always_test_run),main="always run tests")
plot(ordered(data$freq_force_install_CPAN_mods_after_test_fail),main="force install")
plot(ordered(data$try_to_understand_why_tests_fail_before_force_install), main="understand fail")
plot(ordered(data$report_test_fails_thru_approp_channels), main="report fails")

dev.off()
