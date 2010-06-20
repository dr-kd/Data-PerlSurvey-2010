load("07_perl_info.RData")
data$version_of_perl_used_most_frequently <- ordered(data$version_of_perl_used_most_frequently, levels=c(1:6),labels=c("<=5.4","5.5005","5.6.x","5.8.x","5.10.x","5.12"))
pdf("freq.pdf")
plot( data$version_of_perl_used_most_frequently)
dev.off()

library(Hmisc)
describe(sapply(data[1:6],ordered))

# 5.4 (113, 2%) 
# 5.0005 (142, 3%) 
# 5.6 (548, 11%) 
# 5.8 (2756, 57%) 
# 5.10 (2728, 56%) 
# 5.12 (628, 13%) 

