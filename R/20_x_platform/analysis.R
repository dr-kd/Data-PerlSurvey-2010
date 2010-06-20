load("20_x_platform.RData")
pdf("x.pdf")
plot(ordered(data$running_perl_program_across_mult_platforms_easy))
dev.off()
