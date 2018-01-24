#' @title    Data for Example 3.1 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam3.1
#' @description Exam3.1 is part of data from Australian Centre for Agricultural Research (ACIAR) 
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
#'    \code{\link{DataExam3.1}}
#'
#' @import tidyverse
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#'
#' @examples
#' data(DataExam3.1)
#' library(tidyverse)
#'
#' fmtab3.3     <- lm(
#'    formula     = Ht~Repl*SeedLot
#'  , data        = DataExam3.1
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
#'  anova(fmtab3.3)
#' DataExam3.1 %>%
#'  dplyr::group_by(SeedLot) %>%
#'  dplyr::summarize(Mean=mean(Ht),SD=sd(Ht))
#'  RESFIT <- data.frame(residualvalue=residuals(fmtab3.3),fittedvalue=fitted.values(fmtab3.3))
#' library(ggplot2)
#' ggplot(RESFIT,aes(x=fittedvalue,y=residualvalue))+
#'  geom_point(size=2)+
#'  labs(x="Residual vs Fitted Values",y="")+
#'  theme_bw()
NULL
