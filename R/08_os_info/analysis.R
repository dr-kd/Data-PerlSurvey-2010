load('08_os_info.RData')
source("../utils.R")

dev <- category.matrix(data[1:53], "^os_used_programming_development_", strip.dots=TRUE)
deploy <- category.matrix(data[54:106], "^os_completed_projects_deployed_", strip.dots=TRUE)

names(dev)[1] <- "Count development OS"
names(dev)[2] <- "Percent development OS"
names(deploy)[2] <- "Percent deployment OS"
names(deploy)[1] <- "Count deployment OS"

all.os <- merge(dev,deploy,by="row.names")
rownames(all.os) <- all.os$Row.names
all.os$Row.names <- NULL
all.os <- all.os[order(all.os[,2], decreasing=TRUE),]
library(R2HTML)
HTMLStart(".", 'index', HTMLframe=FALSE, Title="Operating Systems", autobrowse=FALSE);
HTML.title("Operating Systems", HR=1)
HTML(all.os)



