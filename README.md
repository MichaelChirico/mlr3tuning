# mlr3tuning

[![Build Status Linux](https://travis-ci.org/mlr-org/mlr3tuning.svg?branch=master)](https://travis-ci.org/mlr-org/mlr3tuning) [![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental) [![CRAN](https://www.r-pkg.org/badges/version/mlr3tuning)](https://cran.r-project.org/package=mlr3tuning) [![Coverage Status](https://coveralls.io/repos/github/mlr-org/mlr3tuning/badge.svg?branch=master)](https://coveralls.io/github/mlr-org/mlr3tuning?branch=master)

Extends the [mlr3](https://mlr3.mlr-org.com) package with tuning.

## Installation

```r
devtools::install_github("mlr-org/mlr3tuning")
```



## Functionality

### Implemented Tuning Strategies

-   Random Search: `TunerRandomSearch`
-   Grid Search: `TunerGridSearch`
-   Generalized Simulated Annealing: `TunerGenSA`

### Implemented Stopping Criteria

-   After a pre-defined number of evaluations: `TerminatorEvaluations`
-   After a defined runtime has expired: `TerminatorRuntime`
-   After a threshold of a performance measure is exceeded: `TerminatorPerformance`


## Vignettes

-   Introduction to Tuner: `tuning-02-tuner`
