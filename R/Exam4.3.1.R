#' @title    Example 4.3.1 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam4.3.1
#' @description Exam4.3.1 presents the germination count data for 4 Pre-Treatments and 6 Seedlots.
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
#'    \code{\link{DataExam4.3.1}}
#'
#' @import tidyverse
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#'
#' @examples
#' data(DataExam4.3.1)
#' library(tidyverse)
#' library(ggplot2)
#'fm4.4    <- aov(
#'  formula     = Percent~Replication+Pretreatment*SeedLot
#'  , data      = DataExam4.3.1
#'   #, subset
#'   #, weights
#'   #, na.action
#'  , method      = "qr"
#'  , model       = TRUE
#'  , x           = FALSE
#'  , y           = FALSE
#'  , qr          = TRUE
#'  , singular.ok = TRUE
#'  , contrasts   = NULL
#'  )
#'  anova(fm4.4)
#'
#'  DataExam4.3.1 %>%
#'    dplyr::group_by(Pretreatment) %>%
#'    dplyr::summarize(Mean=mean(Percent))
#'
#'  DataExam4.3.1 %>%
#'      dplyr::group_by(SeedLot) %>%
#'      dplyr::summarize(Mean=mean(Percent))
#'
#'  DataExam4.3.1 %>%
#'      dplyr::group_by(Pretreatment,SeedLot) %>%
#'      dplyr::summarize(Mean=mean(Percent))
#'
#'
NULL
