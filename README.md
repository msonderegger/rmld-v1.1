# Regression Modeling for Linguistic Data book: v. 1.0

This repository contains the public version of _Regression Modeling for Linguistic Data_, a book under contract with MIT Press.   RMLD is an intermediate book on statistical analysis for language scientists.  This version (1.0) should be very similar to the published book.  **This repository is a clone of the book's [OSF site](https://osf.io/pnumg/)**, which sometimes gets flagged as spam.

Please cite the current version (v. 1.0) if you use this book. Comments on content or typos are welcome (morgan.sonderegger@gmail.com).  Please see license info (below).

**Contents**:

* rmld_v1.0.pdf : The full book
* ch10_appendix.html : Chapter 10 online-only appendix.


*Data* folder: datasets analyzed in the book (CSVs)

*Code* folder:
* `source`: source code for each chapter (Rnw/Rmd files)---only needed to compile the book.
* `R`: code files showing all R commands used in each chapter, including for making plots (R)
* The code file for each chapter is just all the R code in each Rnw/Rmd file, extracted.

-----

## Overview

The book introduces applied regression analysis for language scientists, using R and (mainly) tidyverse functionality. It aims to provide both conceptual understanding and practical skills through extensive examples with different kinds of linguistic data.  The primary differences from existing texts on quantitative analysis of linguistic data (e.g. Baayen, Winter, Gries, Levshina, K. Johnson) are that we focus on regression analysis, and do not start from scratch. The book assumes you have familiarity with basic statistical analysis (e.g. t-tests, ANOVAs), R, and math, but it aims to be readable regardless.


Current chapters:

* **Chapter 1: Preliminaries**
* **Chapter 2: Statistical Inference I**
    * Point and interval estimation
    * Hypothesis testing
* **Chapter 3: Statistical Inference II**
    * Effect size
    * Power
    * Type I/II and M/S errors
    * Pseudoreplication
* **Chapter 4: Linear Regression I**
    * Simple linear regression
    * Multiple linear regression
    * Interactions I
    * Reporting
* **Chapter 5: Linear Regression II**
    * Model assumptions and validation
    * Transformations
    * Collinearity
    * Over and under-fitting
    * Model comparison and variable selection
* **Chapter 6: Categorical data analysis and logistic regression**
    * Categorical data analysis: background
    * Logistic regression
    * Visualization of model predictions
    * Model validation and reporting
* **Chapter 7: Practical regression topics**
    * Contrast coding
    * Omnibus and post-hoc tests
    * Interactions II
    * Nonlinear effects
* **Chapter 8: Linear mixed-effects models**
    * Fixed and random effects
    * Crossed random effects, random slopes
    * Hypothesis testing
    * Random-effect correlations
    * Model predictions
    * Model validation and reporting
* **Chapter 9: Mixed-effects models 2: logistic regression**
    * Mixed-effects logistic regression
    * Model summarization and validation
    * Nonlinear and factor effects for MEMs
    * Variable importance for MEMs
* **Chapter 10: Mixed-effects models 3: practical and advanced topics**
    * Model convergence
    * Singular models
    * Model selection
    * Prediction/uncertainty for individual levels
* **Online appendix to Chapter 10**


## License

**Draft** (PDF): [CC BY NC ND 4.0 license](https://creativecommons.org/licenses/by-nc-nd/4.0/)---you are free to share it, but not modify it or use it for commercial purposes. This license covers all PDF files, and all non-R code portions of Rnw files.

**Code**: Code portions of the Rnw files, as well as the Rmd and HTML files, are under a [CC BY SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) license---you are free to share and adapt (with some conditions).

**Datasets**: 
* `diatones_rmld.csv `: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) license---you are free to share and adapt (with credit given).
* `french_cdi_24.csv`: dataset derived from [Wordbank](http://wordbank.stanford.edu/faq); CC BY 4.0 license.
* `givenness_rmld.csv`: see [OSF project](https://osf.io/r4j2w/).
* `neutralization_rmld.csv`: see [OSF project](https://osf.io/e4g5t/).
* `turkish_if0_rmld.csv`: CC BY 4.0 license.
* `transitions_rmld.csv`: see  [OSF project](https://osf.io/dve6h/).
* `vot_rmld.csv`: CC BY 4.0 license.
