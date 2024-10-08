#' @title    Example 8.1.1 from Experimental Design and Analysis for Tree Improvement
#' @name     Exam8.1.1
#' @description Exam8.1.1 presents the Mixed Effects Analysis of Diameter at breast height (Dbh) of 60 SeedLots
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
#' # Pg. 155
#' fm8.8 <-
#'  lmerTest::lmer(
#'      formula = dbh ~ 1 + repl + col + prov +
#'                      (1|repl:row) + (1|repl:col)
#'    , data   = DataExam8.1
#'    , REML   = TRUE
#'    )
#'
#' # Pg. 157
#' \dontrun{
#' varcomp(fm8.8)
#' }
#'
#' anova(fm8.8)
#' anova(fm8.8, ddf = "Kenward-Roger")
#'
#' predictmeans(model = fm8.8, modelterm = "repl")
#' predictmeans(model = fm8.8, modelterm = "col")
#' predictmeans(model = fm8.8, modelterm = "prov")
#'
#'  # Pg. 161
#'   RCB1 <-
#'         aov(dbh ~ prov + repl, data = DataExam8.1)
#'   RCB  <-
#'         emmeans(RCB1,  specs = "prov") %>%
#'         as_tibble()
#'
#'   Mixed <-
#'           emmeans(fm8.8, specs = "prov") %>%
#'           as_tibble()
#'
#'   table8.9 <-
#'       left_join(
#'          x      = RCB
#'        , y      = Mixed
#'        , by     = "prov"
#'        , suffix = c(".RCBD", ".Mixed")
#'        )
#'   print(table8.9)
NULL
