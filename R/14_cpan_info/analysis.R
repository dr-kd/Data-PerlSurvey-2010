load("14_cpan_info.RData")
data$num_cpan_modules <- ordered(data$num_cpan_modules, levels=c(1:4), labels=c("None","1-5","6-20","21+"))
data$num_cpan_modules_handed_over <- ordered(data$num_cpan_modules_handed_over, levels=c(1:4), labels=c("None","1-5","6-20","21+"))

png("modules.png")
par(las=2)
plot(data[1],main="Number of CPAN Modules")
dev.off()
png("handover.png")
par(las=2)
plot(data[2],main="Number of CPAN Modules Handed Over")
dev.off()


library(R2HTML)
HTMLStart(".", 'index', HTMLframe=FALSE, Title="Cpan Modules Maintained", autobrowse=FALSE);
HTML.title("CPAN modules maintained / handed over to others", HR=1)
HTMLInsertGraph("modules.png")
HTMLInsertGraph("handover.png")
HTMLStop()



