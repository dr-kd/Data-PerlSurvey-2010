load("20_x_platform.RData")
png("x-platform.png")
plot(ordered(data$running_perl_program_across_mult_platforms_easy))
dev.off()
