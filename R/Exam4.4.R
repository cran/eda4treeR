#' @title    Example 4.4 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam4.4
#' @description Exam4.4 presents the height means for 4 seedlots under factorial arrangement for two 
#'              levels of Fertilizer and two levels of Irrigation.
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
#'    \code{\link{DataExam4.4}}
#'
#'
#' @import tidyverse
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#'
#' @examples
#' data(DataExam4.4)
#' library(tidyverse)
#' library(ggplot2)
#' library(dae)
#'
#'fm4.6    <- aov(
#'       formula     = Height~Rep+Irrig*Ferti*SeedDLot+Error(Rep/Irrig:Ferti)
#'     , data        = DataExam4.4
#'     #, subset
#'     #, weights
#'     #, na.action
#'     , method      = "qr"
#'     , model       = TRUE
#'     , x           = FALSE
#'     , y           = FALSE
#'     , qr          = TRUE
#'     , singular.ok = TRUE
#'     , contrasts   = NULL
#'     )
#'  summary(fm4.6)
#'
#'     DataExam4.4 %>%
#'       dplyr::group_by(Irrig) %>%
#'       dplyr::summarize(Mean=mean(Height))
#'
#'     DataExam4.4 %>%
#'       dplyr::group_by(Ferti) %>%
#'       dplyr::summarize(Mean=mean(Height))
#'
#'     DataExam4.4 %>%
#'       dplyr::group_by(SeedDLot) %>%
#'       dplyr::summarize(Mean=mean(Height))
#'
#'     DataExam4.4 %>%
#'       dplyr::group_by(Irrig,Ferti) %>%
#'       dplyr::summarize(Mean=mean(Height))
#'
#'     DataExam4.4 %>%
#'       dplyr::group_by(Irrig,SeedDLot) %>%
#'       dplyr::summarize(Mean=mean(Height))
#'
#'     DataExam4.4 %>%
#'       dplyr::group_by(Ferti,SeedDLot) %>%
#'       dplyr::summarize(Mean=mean(Height))
#'
#'     DataExam4.4 %>%
#'       dplyr::group_by(Irrig,Ferti,SeedDLot) %>%
#'       dplyr::summarize(Mean=mean(Height))
#'RESFIT <- data.frame(residualvalue=residuals(fm4.6),fittedvalue=fitted.values(fm4.6))
#'ggplot(RESFIT,aes(x=fittedvalue,y=residualvalue))+
#'  geom_point(size=2)+
#'  labs(x="Residual vs Fitted Values",y="")+
#'  theme_bw()
NULL

