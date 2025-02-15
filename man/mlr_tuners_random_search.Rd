% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TunerRandomSearch.R
\name{mlr_tuners_random_search}
\alias{mlr_tuners_random_search}
\alias{TunerRandomSearch}
\title{Hyperparameter Tuning with Random Search}
\source{
Bergstra J, Bengio Y (2012).
\dQuote{Random Search for Hyper-Parameter Optimization.}
\emph{Journal of Machine Learning Research}, \bold{13}(10), 281--305.
\url{https://jmlr.csail.mit.edu/papers/v13/bergstra12a.html}.
}
\description{
Subclass for random search tuning.

The random points are sampled by \code{\link[paradox:generate_design_random]{paradox::generate_design_random()}}.
}
\section{Dictionary}{

This \link{Tuner} can be instantiated via the \link[mlr3misc:Dictionary]{dictionary}
\link{mlr_tuners} or with the associated sugar function \code{\link[=tnr]{tnr()}}:\preformatted{TunerRandomSearch$new()
mlr_tuners$get("random_search")
tnr("random_search")
}
}

\section{Parallelization}{

In order to support general termination criteria and parallelization, we
evaluate points in a batch-fashion of size \code{batch_size}. Larger batches mean
we can parallelize more, smaller batches imply a more fine-grained checking
of termination criteria. A batch contains of \code{batch_size} times \code{resampling$iters} jobs.
E.g., if you set a batch size of 10 points and do a 5-fold cross validation, you can
utilize up to 50 cores.

Parallelization is supported via package \CRANpkg{future} (see \code{\link[mlr3:benchmark]{mlr3::benchmark()}}'s
section on parallelization for more details).
}

\section{Logging}{

All \link{Tuner}s use a logger (as implemented in \CRANpkg{lgr}) from package
\CRANpkg{bbotk}.
Use \code{lgr::get_logger("bbotk")} to access and control the logger.
}

\section{Parameters}{


\describe{
\item{\code{batch_size}}{\code{integer(1)}\cr
Maximum number of points to try in a batch.}
}

}

\section{Progress Bars}{


\verb{$optimize()} supports progress bars via the package \href{https://CRAN.R-project.org/package=progressr}{\pkg{progressr}}
combined with a \link[bbotk]{Terminator}. Simply wrap the function in
\code{progressr::with_progress()} to enable them. We recommend to use package
\href{https://CRAN.R-project.org/package=progress}{\pkg{progress}} as backend; enable with \code{progressr::handlers("progress")}.

}

\examples{
# retrieve task
task = tsk("pima")

# load learner and set search space
learner = lrn("classif.rpart", cp = to_tune(1e-04, 1e-1, logscale = TRUE))

# hyperparameter tuning on the pima indians diabetes data set
instance = tune(
  method = "random_search",
  task = task,
  learner = learner,
  resampling = rsmp("holdout"),
  measure = msr("classif.ce"),
  term_evals = 10
)

# best performing hyperparameter configuration
instance$result

# all evaluated hyperparameter configuration
as.data.table(instance$archive)

# fit final model on complete data set
learner$param_set$values = instance$result_learner_param_vals
learner$train(task)
}
\seealso{
Package \CRANpkg{mlr3hyperband} for hyperband tuning.

Other Tuner: 
\code{\link{mlr_tuners_cmaes}},
\code{\link{mlr_tuners_design_points}},
\code{\link{mlr_tuners_gensa}},
\code{\link{mlr_tuners_grid_search}},
\code{\link{mlr_tuners_irace}},
\code{\link{mlr_tuners_nloptr}}
}
\concept{Tuner}
\section{Super classes}{
\code{\link[mlr3tuning:Tuner]{mlr3tuning::Tuner}} -> \code{\link[mlr3tuning:TunerFromOptimizer]{mlr3tuning::TunerFromOptimizer}} -> \code{TunerRandomSearch}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{TunerRandomSearch$new()}}
\item \href{#method-clone}{\code{TunerRandomSearch$clone()}}
}
}
\if{html}{
\out{<details open ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="mlr3tuning" data-topic="Tuner" data-id="format">}\href{../../mlr3tuning/html/Tuner.html#method-format}{\code{mlr3tuning::Tuner$format()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="mlr3tuning" data-topic="Tuner" data-id="print">}\href{../../mlr3tuning/html/Tuner.html#method-print}{\code{mlr3tuning::Tuner$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="mlr3tuning" data-topic="TunerFromOptimizer" data-id="optimize">}\href{../../mlr3tuning/html/TunerFromOptimizer.html#method-optimize}{\code{mlr3tuning::TunerFromOptimizer$optimize()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Creates a new instance of this \link[R6:R6Class]{R6} class.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TunerRandomSearch$new()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{TunerRandomSearch$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
