#' @title    Example 8.2 from Experimental Design and Analysis for Tree Improvement
#' @name     Exam8.2
#' @description Exam8.2 presents the Diameter at breast height (Dbh) of 60 SeedLots
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
#'    \code{\link{DataExam8.2}}
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
#' data(DataExam8.2)
#'
#' # Pg.
#' fm8.2  <-
#'   lmer(
#'     formula = dbhmean ~ Repl + Column + Contcompf + Contcompf:Standard +
#'               (1|Repl:Row ) + (1|Repl:Column ) + (1|Contcompv:Clone)
#'   , data    = DataExam8.2
#'     )
#'\dontrun{
#' varcomp(fm8.2)
#' }
#' anova(fm8.2)
#' Anova(fm8.2, type = "II", test.statistic = "Chisq")
#'
#' predictmeans(model = fm8.2, modelterm = "Repl")
#' predictmeans(model = fm8.2, modelterm = "Column")
#' library(emmeans)
#' emmeans(object = fm8.2, specs = ~Contcompf|Standard)
#'
NULL
