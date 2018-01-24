#' @title    Example 3.1.1 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam3.1.1
#' @description Exam3.1.1 is part of data from Australian Centre for Agricultural Research (ACIAR) 
#'              in Queensland, Australia (Experiment 309).
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
#'    \code{\link{DataExam3.1.1}}
#'
#' @import tidyverse
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#'
#' @examples
#'
#' library(tidyverse)
#' data(DataExam3.1.1)
#'
#'fm3.8   <-     lm(
#'    formula     = Mean~Repl+SeedLot
#'  , data        = DataExam3.1.1
#'  #, subset
#'  #, weights
#'  #, na.action
#'  , method      = "qr"
#'  , model       = TRUE
#'  , x           = FALSE
#'  , y           = FALSE
#'  , qr          = TRUE
#'  , singular.ok = TRUE
#'  , contrasts   = NULL
#'   )
#' anova(fm3.8)
#' DataExam3.1.1 %>%
#'  dplyr::group_by(SeedLot) %>%
#'  dplyr::summarize(Mean=mean(Mean))
NULL
