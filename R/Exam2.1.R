#' @title    Example 2.1 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam2.1
#' @description Exam2.1 is used to  compare two seed lots by using single factor ANOVA.
#' @author
#' \enumerate{
#'          \item  Muhammad Yaseen (\email{myaseen208@@gmail.com})
#'          \item  Sami Ullah (\email{samiullahuos@@gmail.com})
#'          }
#'
#' @references
#' \enumerate{
#'          \item Williams, E.R., Matheson, A.C. and Harwood, C.E. (2002).\emph{Experimental Design and Analysis for Tree Improvement}.
#'                CSIRO Publishing.
#'              }
#'
#' @seealso
#'    \code{\link{DataExam2.1}}
#'
#' @import tidyverse
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#'
#' @examples
#' data(DataExam2.1)
#' library(tidyverse)

#' fmtab2.3  <-
#'   lm(
#'   formula     = dbh ~ SeedLot
#' , data        = DataExam2.1
#' # , subset
#' # , weights
#' # , na.action
#' , method      = "qr"
#' , model       = TRUE
#' , x           = FALSE
#' , y           = FALSE
#' , qr          = TRUE
#' , singular.ok = TRUE
#' , contrasts   = NULL
#' )
#'
#' anova(fmtab2.3)
#'
#' DataExam2.1 %>%
#'   dplyr::group_by(SeedLot) %>%
#'   dplyr::summarize(Mean = mean(dbh), SD = sd(dbh))
NULL
