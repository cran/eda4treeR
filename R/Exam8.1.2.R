#' @title    Example 8.1.2 from Experimental Design & Analysis for Tree Improvement
#' @name     Exam8.1.2
#' @description Exam8.1.2 presents the Analysis of Nested Seedlot Structure of Diameter at breast height (Dbh) of 60 SeedLots
#'              under layout of row column design with 6 rows and 10 columns in 18
#'              countries and 59 provinces of 18 selected countries given in Example 8.1.
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
#' @import emmeans
#' @import pbkrtest
#' @import lme4
#'
#' @examples
#' data(DataExam8.1)
#' library(tidyverse)
#' library(emmeans)
#'   fm8.11 <- aov(formula      =
#'   Dbh~Country*Province
#'   ,data         = DataExam8.1
#'   #, subset
#'   #, weights
#'   #, na.action
#'   , method      = "qr"
#'   , model       = TRUE
#'   , x           = FALSE
#'   , y           = FALSE
#'   , qr          = TRUE
#'   , singular.ok = TRUE
#'   , contrasts   = NULL
#'   )
#'   b<-anova(fm8.11)
#'      Res                     <- length(b[["Sum Sq"]])
#'      df                      <- 119
#'      MSS                     <- 0.1951
#'      b[["Df"]][Res]          <- df
#'      b[["Sum Sq"]][Res]      <- MSS*df
#'      b[["Mean Sq"]][Res]     <- b[["Sum Sq"]][Res]/b[["Df"]][Res]
#'      b[["F value"]][1:Res-1] <- b[["Mean Sq"]][1:Res-1]/b[["Mean Sq"]][Res]
#'      b[["Pr(>F)"]][Res-1]     <- df(b[["F value"]][Res-1],b[["Df"]][Res-1],b[["Df"]][Res])
#'      b
#'   library(emmeans)
#'   emmeans::emmeans(fm8.11,specs = "Country")
NULL
