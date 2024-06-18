#' @details
#'
#' To get a presentation of the *biodb* package and get started with it, please
#' see the "biodb" vignette. 
#' ```
#' vignette('biodb', package='biodb')
#' ```
#'
#' @seealso \link{BiodbMain}, \link{BiodbConfig}, \link{BiodbFactory},
#' \link{BiodbDbsInfo}, \link{BiodbEntryFields}.
#'
#' @import withr
#' @import Rcpp
#' @import sched
#' @importFrom Rcpp evalCpp
#' @useDynLib biodb, .registration=TRUE
"_PACKAGE"

# For retro-compatibility
BiodbUrl <- sched::URL
BiodbRequest <- sched::Request
BiodbRequestScheduler <- sched::Scheduler
BiodbRequestSchedulerRule <- sched::Rule

NULL
