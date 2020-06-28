# global reference to scipy (will be initialized in .onLoad)
pyform <- NULL
ReturnSeries <- NULL

.onLoad <- function(libname, pkgname) {
  # use superassignment to update global reference to scipy
  pyform <<- reticulate::import("pyform", delay_load = TRUE)
  ReturnSeries <<- pyform$returnseries$ReturnSeries
}
