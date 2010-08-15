load("11_editor_info.RData")
source("../utils.R")
main <- category.matrix(data[1:44], "^text_editor_", strip.dots=TRUE)
occasional <- category.matrix(data[45:88], "^text_editor_occasional_", strip.dots=TRUE)

names(main)[1] <- "Count main text editor"
names(main)[2] <- "Percent main text editor"
names(occasional)[1] <- "Count occasional text editor"
names(occasional)[2] <- "Percent occasional text editor"

all.editors <- merge(main,occasional,by="row.names")
rownames(all.editors) <- all.editors$Row.names
all.editors$Row.names <- NULL
all.editors <- all.editors[order(all.editors[,2], decreasing=TRUE),]
library(R2HTML)
HTMLStart(".", 'index', HTMLframe=FALSE, Title="Text Editors Used", autobrowse=FALSE);
HTML.title("Text Editors Used - usual and occasional", HR=1)
HTML(all.editors)
HTMLStop()

         
                     
