#' @title    Example 3.1.1 from Experimental Design and Analysis for Tree Improvement
#' @name     Exam3.1.1
#' @description Exam3.1.1 is part of data from Australian Centre for Agricultural Research (ACIAR)
#'              in Queensland, Australia (Experiment 309).
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
#'    \code{\link{DataExam3.1.1}}
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
#' data(DataExam3.1.1)
#'
#' # Pg. 36
#' fm3.8 <-
#'       lm(
#'          formula = ht ~ repl + seedlot
#'        , data    = DataExam3.1.1
#'        )
#'
#' # Pg. 40
#' anova(fm3.8)
#'
#' # Pg. 40
#' emmeans(object = fm3.8, specs  = ~seedlot)
#' emmip(object = fm3.8, formula  = ~seedlot) +
#'  theme_classic()
#'
NULL
