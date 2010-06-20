load("04_perl_education.RData")
data$formally_taught_perl <- ordered(data$formally_taught_perl,levels=c(1:5),labels=c("None","Almost none","A little","Quite a bit","A lot"))
data$formally_taught_other_os_language <- ordered(data$formally_taught_other_os_language,levels=c(1:5),labels=c("None","Almost none","A little","Quite a bit","A lot"))

pdf("education.pdf")
par(mfrow=c(1,2))
par(las=2)
plot(data$formally_taught_perl,main="Formally taught perl",cex.names=0.8)
plot(data$formally_taught_other_os_language,main="Formally taught other",cex.names=0.8)
dev.off()

# other languages
other_lang <- read.csv("lang_counts.csv",header=F)
pdf("other.pdf")
par(las=2)
barplot(other_lang$V1,names.arg=other_lang$V2,cex.names=0.8)
dev.off()

# other education stuff we do with shell
# 880  4274 respondents answered this question. 1383 languages mentioned.  148 unique languages (aprox).  Those with > 10 mentions:

 219 python
 199 php
 118 java
  94 lisp
  79 scheme
  68 c
  51 c++
  43 javascript
  42 bash
  40 prolog
  39 ruby
  32 pascal
  27 shell
  23 haskell
  22 smalltalk
  21 awk
  20 tcl
  17 fortran
  12 basic
  11 ml          
