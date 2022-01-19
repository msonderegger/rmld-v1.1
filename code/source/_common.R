## from Ch 3:
t_test_ci<- function(test, digits=1){
  paste('[',round(test$conf.int[1], digits = digits), ', ', round(test$conf.int[2], digits=digits), ']', sep='')
}


## pPrefix means 'add on p = / p < part'
## example: to print an in-text p-value, formatP(p)
## to print in a regression table without 'p =/<', use pPrefix=FALSE
formatP <- function(p, sig_fig=2, cutoff = 0.001, pPrefix = TRUE){
  if(pPrefix && p>cutoff){
    paste("$p = ",signif(p, digits=sig_fig), "$", sep='')
  } else if(pPrefix && p<=cutoff){
    paste("$p < ", cutoff,  "$", sep='')
  } else if(!pPrefix && p>cutoff){
    signif(p, digits=sig_fig)
  } else{
    paste("$< ", cutoff,  "$", sep='')
  }

}


## for printing tables, where one column is maybe p-val
##
## example: to print for a standard regression table:
## printWrapper(pCol='p.value')
printWrapper <- function(x, pCol=NA, ...){
  
  if(!is.na(pCol)){
    formatP <- Vectorize(formatP)
    x[[pCol]] <- formatP(x[[pCol]], pPrefix=FALSE)
  }
  x %>%  
    xtable() %>% 
    print(only.contents=TRUE, 
          include.rownames=FALSE, 
          include.colnames=FALSE,
          booktabs=TRUE, 
          sanitize.text.function=function(x){x}, ## lets p-value get printed correctly
          ...)
}


slrCoeffReport <- function(mod, coeff_name, sig_fig=2, include.ci=FALSE){
  tab <- mod %>% tidy(conf.int=TRUE) %>% filter(term==coeff_name)
  str <- paste("$\\hat{\\beta} =",
        signif(tab$estimate, sig_fig),
        "$, $SE(\\hat{\\beta}) =",
        format(signif(tab$std.error, sig_fig), scientific=F),
        "$, $t(", mod$df.residual,
        ")=", signif(tab$statistic, sig_fig),
        '$, ',
        formatP(tab$p.value),
        sep='')
  if(include.ci){
    str <- paste(str, ", 95\\% CI $[",
        signif(tab$conf.low, sig_fig),
        ", ",
        signif(tab$conf.high, sig_fig),
        "]$",
        sep='')
  }
  return(str)
}

logitRegCoeffReport <- function(mod, coeff_name, sig_fig=2, include.SE= TRUE, include.ci=FALSE){
  tab <- mod %>% tidy(conf.int=TRUE) %>% filter(term==coeff_name)
  str <- paste("$\\hat{\\beta} =",
               signif(tab$estimate, sig_fig),
               ifelse(include.SE, paste("$, $SE(\\hat{\\beta}) =",
               format(signif(tab$std.error, sig_fig), scientific=F),
               "$, $z=", sep=''
               ), "$, $z="),
               signif(tab$statistic, sig_fig),
               '$, ',
               formatP(tab$p.value),
               sep='')
  if(include.ci){
    str <- paste(str, ", 95\\% CI $[",
                 signif(tab$conf.low, sig_fig),
                 ", ",
                 signif(tab$conf.high, sig_fig),
                 "]$",
                 sep='')
  }
  return(str)
}

## for model comparison by chi-squared test (e.g. lmer, logistic regression)
lrTestReport <- function(mod1, mod2, sig_fig=2, refit=TRUE){
  
  modTypes <- c("lmerMod", 'glmerMod') 
  if(class(mod1)[1]%in% modTypes && class(mod2)[1]%in% modTypes){
    lrTest <- anova(mod1, mod2, test='Chisq', refit=refit)
    
    paste("$\\chi^2(", 
      signif(lrTest$Df[2], sig_fig), 
      ")=", 
      signif(lrTest$Chisq[2], sig_fig),
      '$, ', 
      formatP(lrTest$`Pr(>Chisq)`[2]),
      sep='')
    
  } else{
    lrTest <- anova(mod1, mod2, test='Chisq')
    
  paste("$\\chi^2(", 
        signif(lrTest$Df[2], sig_fig), 
        ")=", 
        signif(lrTest$Deviance[2], sig_fig),
        '$, ', 
        formatP(lrTest$`Pr(>Chi)`[2]),
        sep='')
  }
}



## for model comparison by F test (e.g. linear regression)
fTestReport <- function(mod1, mod2, sig_fig=2){
  aov_comp <- anova(mod1, mod2, test='F')
  paste("$F(", 
        signif(aov_comp$Res.Df[2], sig_fig), 
        ", ",
        aov_comp$Df[2],
        ")=", 
        signif(aov_comp$F[2], sig_fig),
        '$, ', 
        formatP(aov_comp$`Pr(>F)`[2]),
        sep='')
}

## return nicely formatted confidence interval from a model 
## tried so far: lm

printable_ci <- function(mod, coeff_name, sig_fig=2){
  tab <- tidy(mod, conf.int = TRUE) %>% 
    select(term, conf.low, conf.high) %>%
    filter(term==coeff_name)
  
  str <- paste("[",
               signif(tab$conf.low, sig_fig),
               ", ",
               signif(tab$conf.high, sig_fig),
               "]",
               sep='')
  
  return(str)
}

extractRanefEst <- function(mod, group, term){
  temp <- tidy(mod) %>% filter(effect=='ran_pars' & str_detect(group, paste("^", !!group, sep='')) & term==!!term)
  return(temp[['estimate']])     
}

extractFixefEst <- function(mod, term){
  temp <- tidy(mod) %>% filter(effect=='fixed' & term==!!term)
  return(temp[['estimate']])
}
