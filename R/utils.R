
## usage : my.report(table(x,y)) for crosstab percentages rounded to 2 dec places.
library(prettyR)

my.report <- function(my.table) {
    return (round( my.table/sum(my.table) * 100, 2))
}
