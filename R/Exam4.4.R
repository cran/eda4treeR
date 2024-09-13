#' @title    Example 4.4 from Experimental Design and Analysis for Tree Improvement
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
#'          \item E.R. Williams, C.E. Harwood and A.C. Matheson (2023). \emph{Experimental Design and Analysis for Tree Improvement}.
#'                CSIRO Publishing (\href{https://www.publish.csiro.au/book/3145/}{https://www.publish.csiro.au/book/3145/}).
#'              }
#'
#'
#' @seealso
#'    \code{\link{DataExam4.4}}
#'
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
#' data(DataExam4.4)
#'
#' # Pg. 58
#' fm4.6    <-
#'   aov(
#'       formula = height ~ repl + irrig*fert*seedlot +
#'                          Error(repl/irrig:fert)
#'     , data    = DataExam4.4
#'     )
#'
#' # Pg. 61
#'  summary(fm4.6)
#'
#' # Pg. 61
#' model.tables(x = fm4.6, type = "means")
#'
#' # Pg. 61
#' emmeans(object = fm4.6, specs = ~ irrig)
#' emmip(object = fm4.6, formula  = ~ irrig) +
#'     theme_classic()
#'
NULL

