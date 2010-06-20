load("12_community_involvement.RData")

data$perl_mongers_mailing_lists_subscribe_to <- ordered(data$perl_mongers_mailing_lists_subscribe_to, levels=c(1:4), labels=c("0","1","2-5","5+"))

data$technical_perl_mailing_lists_subscribe_to <- ordered(data$technical_perl_mailing_lists_subscribe_to, levels=c(1:4), labels=c("0","1","2-5","5+"))

data$technical_not_perl_mailing_lists_subscribe_to <- ordered(data$technical_not_perl_mailing_lists_subscribe_to,levels=c(1:4),labels=c("0","1","2-5","5+"))
                                                              
data$local_perl_mongers_group <- factor(data$local_perl_mongers_group,levels=c(1:4),labels=c("Yes","No","inactive","Don't Know"))

data$attend_local_perl_mongers_group_meetings <- ordered(data$attend_local_perl_mongers_group_meetings,levels=c(1:6),labels=c("Never/Not applicable","used to","Once a year","More than once a year","Ususally","Almost every meeting"))

data$have_attended_perl_related_conference <- ordered(data$have_attended_perl_related_conference,levels=c(1:5),labels=c("Never","Once or twice","Infrequently","Occasionally","As often as I can"))

# correlation matrix
write.csv(round(cor(data,use="pairwise.complete.obs",method="spearman"),2),file="correlation_matrix.csv")

# plots

pdf("community.pdf")
par(mfrow=c(2,3),las=2)
plot(data[1],main="PM Lists",cex.names=0.8)
plot(data[2],main="Perl Tech Lists",cex.names=0.8)
plot(data[3],main="Other Tech Lists",cex.names=0.8)
plot(data[4],main="Local PM group",cex.names=0.8)
plot(data[4],main="PM attendance",cex.names=0.8)
plot(data[6],main="Perl conference attendance",cex.names=0.8)
dev.off()
