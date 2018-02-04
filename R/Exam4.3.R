#' @title    Example 4.3 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam4.3
#' @description Exam4.3 presents the germination count data for 4 Pre-Treatments and 6 Seedlots.
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
#'    \code{\link{DataExam4.3}}
#'
#' @import tidyverse
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#'
#' @examples
#' data(DataExam4.3)
#' library(tidyverse)
#' library(ggplot2)
#'fm4.2    <- aov(
#'  formula     = Percent~Replication +Contcomp + SeedLot + Pretreatment/Contcomp+
#'                Contcomp /SeedLot + Pretreatment/ Contcomp/SeedLot
#'  , data      = DataExam4.3
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
#'  anova(fm4.2)
#'
#'  DataExam4.3 %>%
#'    dplyr::group_by(Contcomp) %>%
#'    dplyr::summarize(Mean=mean(Percent),n=length(Percent))

#'  DataExam4.3 %>%
#'    dplyr::group_by(Contcomp,Pretreatment) %>%
#'    dplyr::summarize(Mean=mean(Percent),n=length(Percent))

#'  DataExam4.3 %>%
#'    dplyr::group_by(SeedLot) %>%
#'    dplyr::summarize(Mean=mean(Percent))

#'  DataExam4.3 %>%
#'    dplyr::group_by(Contcomp,SeedLot) %>%
#'    dplyr::summarize(Mean=mean(Percent))

#'  DataExam4.3 %>%
#'    dplyr::group_by(Pretreatment,Contcomp,SeedLot) %>%
#'    dplyr::summarize(Mean=mean(Percent))
#'    RESFIT <- data.frame(residualvalue=residuals(fm4.2),fittedvalue=fitted.values(fm4.2))
#'    ggplot(RESFIT,aes(x=fittedvalue,y=residualvalue))+
#'      geom_point(size=2)+
#'      labs(x="Residual vs Fitted Values",y="")+
#'      theme_bw()
#'
#'
#'      fm4.4 <- aov(
#'      formula = Percent~Replication+Pretreatment*SeedLot
#'      , data     = DataExam4.3
#'      , subset   = Contcomp=="Treated"
#'      #, weights
#'      #, na.action
#'      , method = "qr"
#'      , model = TRUE
#'      , x = FALSE
#'      , y = FALSE
#'      , qr = TRUE
#'      , singular.ok = TRUE
#'      , contrasts = NULL
#'      )
#'      anova(fm4.4)
#'      DataExam4.3%>%group_by(Pretreatment)%>%summarize(Mean=mean(Percent))
#'      DataExam4.3%>%group_by(SeedLot)%>%summarize(Mean=mean(Percent))
#'      DataExam4.3%>%group_by(Pretreatment,SeedLot)%>%summarize(Mean=mean(Percent))
#'

NULL
