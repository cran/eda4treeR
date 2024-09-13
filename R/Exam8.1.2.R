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
#'          \item E.R. Williams, C.E. Harwood and A.C. Matheson (2023). \emph{Experimental Design and Analysis for Tree Improvement}.
#'                CSIRO Publishing (\href{https://www.publish.csiro.au/book/3145/}{https://www.publish.csiro.au/book/3145/}).
#'              }
#'
#' @seealso
#'    \code{\link{DataExam8.1}}
#'
#' @importFrom car Anova
#' @import dae
#' @import dplyr
#' @importFrom emmeans emmeans emmip
#' @import ggplot2
#' @importFrom lmerTest lmer
#' @importFrom magrittr %>%
#' @import predictmeans
#' @importFrom stats lm anova model.tables
#'
#' @examples
#' library(car)
#' library(dae)
#' library(dplyr)
#' library(emmeans)
#' library(ggplot2)
#' library(lmerTest)
#' library(magrittr)
#' library(predictmeans)
#'
#' data(DataExam8.1)
#'
#' # Pg. 167
#' fm8.11 <-
#'   aov(
#'        formula = dbh ~ country + country:prov
#'      , data    = DataExam8.1
#'       )
#'
#'   b <- anova(fm8.11)
#'   Res <- length(b[["Sum Sq"]])
#'   df  <- 119
#'   MSS <- 0.1951
#'
#'   b[["Df"]][Res] <- df
#'   b[["Sum Sq"]][Res] <- MSS*df
#'   b[["Mean Sq"]][Res] <- b[["Sum Sq"]][Res]/b[["Df"]][Res]
#'
#'   b[["F value"]][1:Res-1] <-
#'             b[["Mean Sq"]][1:Res-1]/b[["Mean Sq"]][Res]
#'
#'   b[["Pr(>F)"]][Res-1] <-
#'      df(
#'        b[["F value"]][Res-1]
#'      , b[["Df"]][Res-1]
#'      , b[["Df"]][Res]
#'      )
#'   b
#'
#'  emmeans(fm8.11, specs = "country")
NULL
