load("14_cpan_info.RData")
data$num_cpan_modules <- ordered(data$num_cpan_modules, levels=c(1:4), labels=c("None","1 - 5","6 - 20","21+"))
data$num_cpan_modules_handed_over <- ordered(data$num_cpan_modules_handed_over, levels=c(1:4), labels=c("None","1 - 5","6 - 20","21+"))

pdf("cpan.pdf")
par(mfrow=c(1,2),las=2)
plot(data[1],main="Number of CPAN modules")
plot(data[2],main="Modules handover")
dev.off()


# number of cpan modules
  None  1 - 5 6 - 20    21+ 
 78.60  15.85   4.02   2.11 

# number of cpan modules handed over

  None  1 - 5 6 - 20    21+ 
 91.35   6.95   1.04   0.66 
