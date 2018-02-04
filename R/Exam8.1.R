#' @title    Example 8.1 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam8.1
#' @description Exam8.1 presents the Diameter at breast height (Dbh) of 60 SeedLots
#'              under layout of row column design with 6 rows and 10 columns in 18 
#'              countries and 59 provinces of 18 selected countries.
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
#'    \code{\link{DataExam8.1}}
#'
#' @import tidyverse
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom stats lm anova
#'
#' @examples
#' data(DataExam8.1)
#' library(tidyverse)
#' library(ggplot2)
#'
#'fm8.4 <- aov(formula      = 
#'         Dbh ~ Inoc+Replication+Error(Replication/Inoc)+Inoc*Country*Province
#'         ,data         = DataExam8.1
#'        #, subset   
#'        #, weights  
#'        #, na.action 
#'         , method      = "qr"
#'         , model       = TRUE
#'         , x           = FALSE
#'         , y           = FALSE
#'         , qr          = TRUE
#'         , singular.ok = TRUE
#'         , contrasts   = NULL
#'        )
#' summary(fm8.4)
#' DataExam8.1 %>% 
#' dplyr:: group_by(Inoc) %>%
#' dplyr:: summarize(Mean=mean(Dbh))
#' 
#' DataExam8.1 %>%
#'  dplyr::group_by(Country)%>%
#'  dplyr::summarize(Mean=mean(Dbh))
#' 
#' DataExam8.1 %>%
#' dplyr::group_by(Country,Province)%>%
#' dplyr::summarize(Mean=mean(Dbh))
#' library(dae)
#' RESFit<-data.frame(fittedvalue=fitted.aovlist(fm8.4),residualvalue=proj(fm8.4)$Within[,"Residuals"])
#' library(ggplot2)
#' ggplot(RESFit,aes(x=fittedvalue,y=residualvalue))+
#' geom_point(size=2)+
#' labs(x="Residuals vs Fitted Values", y="")+
#' theme_bw()
#' 
#' fm8.6 <- aov(formula      = 
#' Dbh ~ Inoc+Replication+Column+Replication/Row+Replication/Column+Province+Inoc/Province
#' ,data         = DataExam8.1
#' #, subset   
#' #, weights  
#' #, na.action 
#' , method      = "qr"
#' , model       = TRUE
#' , x           = FALSE
#' , y           = FALSE
#' , qr          = TRUE
#' , singular.ok = TRUE
#' , contrasts   = NULL
#' )
#' summary(fm8.6)
NULL
