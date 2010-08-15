load("12_community_involvement.RData")

data$perl_mongers_mailing_lists_subscribe_to <- ordered(data$perl_mongers_mailing_lists_subscribe_to, levels=c(1:4), labels=c("0","1","2-5","5+"))

data$technical_perl_mailing_lists_subscribe_to <- ordered(data$technical_perl_mailing_lists_subscribe_to, levels=c(1:4), labels=c("0","1","2-5","5+"))

data$technical_not_perl_mailing_lists_subscribe_to <- ordered(data$technical_not_perl_mailing_lists_subscribe_to,levels=c(1:4),labels=c("0","1","2-5","5+"))
                                                              
data$local_perl_mongers_group <- factor(data$local_perl_mongers_group,levels=c(1:4),labels=c("Yes","No","inactive","Don't\nKnow"))

data$attend_local_perl_mongers_group_meetings <- ordered(data$attend_local_perl_mongers_group_meetings,levels=c(1:6),labels=c("Never/\nNA","Used to","Once\na year","> Once\na year","Ususally","Every\nmeeting"))

data$have_attended_perl_related_conference <- ordered(data$have_attended_perl_related_conference,levels=c(1:5),labels=c("Never","Once\nor twice","Infrequently","Occasionally","As often\nas I can"))

# plots

png("mongers_lists.png")
plot(data[1],main="Number of perl mongers lists subscribed to")
dev.off()

png("perl_lists.png")
plot(data[2],main="Number of perl technical mailing lists subscribed to")
dev.off()

png("tech_lists.png")
plot(data[3],main="Number of other technical lists subscribed to")
dev.off()

png("pm_exists.png")
plot(data[4],main="Do you have a local perlmongers group")
dev.off()

png("pm_attend.png")
plot(data[5],main="Do you attend a local perlmongers group")
dev.off()

png("conf.png")
plot(data[6],main="How often do you attend Perl-related conferences?",cex.names=0.85)
dev.off()

library(R2HTML)
HTMLStart(".", 'index', HTMLframe=FALSE, Title="Community Involvement", autobrowse=FALSE);
HTML.title("Community Involvement", HR=1)
HTMLInsertGraph("mongers_lists.png")
HTMLInsertGraph("perl_lists.png")
HTMLInsertGraph("tech_lists.png")
HTMLInsertGraph("pm_exists.png")
HTMLInsertGraph("pm_attend.png")
HTMLInsertGraph("conf.png")
HTMLStop()
