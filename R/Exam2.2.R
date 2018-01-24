#' @title    Example 2.2 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam2.2
#' @description Exam2.2 is used to  compare two seed lots by using ANOVA under RCB Design.
#' @author
#' \enumerate{
#'          \item  Muhammad Yaseen (\email{myaseen208@@gmail.com})
#'          \item  Sami Ullah (\email{samiullahuos@@gmail.com})
#'          }
#'
#' @references
#' \enumerate{
#'        \item Williams, E.R.; Matheson, A.C.; Harwood, C.E. (2002).\emph{Experimental design and analysis for tree improvement}.
#'              CSIRO Publishing.
#'              }
#'
#' @seealso
#'    \code{\link{DataExam2.2}}
#'
#' @import tidyverse
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#'
#' @examples
#' library(tidyverse)
#' data(DataExam2.2)
#' fmtab2.5  <-
#'  lm(
#'   formula       = dbh~Blk+SeedLot
#'   , data        = DataExam2.2
#'   # , subset
#'   # , weights
#'   # , na.action
#'   , method      = "qr"
#'   , model       = TRUE
#'   , x           = FALSE
#'   , y           = FALSE
#'   , qr          = TRUE
#'   , singular.ok = TRUE
#'   , contrasts   = NULL
#' )
#'
#' anova(fmtab2.5)
#'
#' DataExam2.2 %>%
#'   dplyr::group_by(SeedLot) %>%
#'   dplyr::summarize(Mean=mean(dbh),sd=sd(dbh))
#'
NULL
