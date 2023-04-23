#' @title    Example 8.1 from Experimental Design and Analysis for Tree Improvement
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
#' @importFrom supernova supernova
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
#' library(supernova)
#'
#' data(DataExam8.1)
#'
#' # Pg. 141
#' fm8.4 <-
#'   aov(
#'     formula = dbh ~ inoc + repl + Error(repl/inoc) + inoc*country*prov
#'   , data    = DataExam8.1
#'      )
#'
#' # Pg. 150
#' summary(fm8.4)
#'
#' # Pg. 150
#' model.tables(x = fm8.4, type = "means", se   = FALSE)
#'
#' RESFit <-
#'     data.frame(
#'      fittedvalue    = fitted.aovlist(fm8.4)
#'     , residualvalue = proj(fm8.4)$Within[,"Residuals"]
#'     )
#'
#' ggplot(RESFit,aes(x=fittedvalue,y=residualvalue))+
#' geom_point(size=2)+
#' labs(x="Residuals vs Fitted Values", y="")+
#' theme_bw()
#'
#' # Pg. 153
#' fm8.6 <-
#'  aov(
#'    formula      = dbh ~ inoc + repl + col + repl/row + repl/col +
#'                         prov + inoc/prov
#'  , data         = DataExam8.1
#'  )
#' summary(fm8.6)
NULL
