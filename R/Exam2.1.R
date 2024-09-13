#' @title    Example 2.1 from Experimental Design and Analysis for Tree Improvement
#' @name     Exam2.1
#' @description Exam2.1 is used to  compare two seed lots by using single factor ANOVA.
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
#'    \code{\link{DataExam2.1}}
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
#' data(DataExam2.1)
#' # Pg. 22
#' fmtab2.3  <- lm(formula = dbh ~ seedlot, data = DataExam2.1)
#' # Pg. 23
#' anova(fmtab2.3)
#'
#' # Pg. 23
#' emmeans(object = fmtab2.3, specs = ~ seedlot)
#' emmip(object = fmtab2.3, formula = ~ seedlot) +
#'   theme_classic()
#'
NULL
