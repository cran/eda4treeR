#' @title    Example 2.2 from Experimental Design and Analysis for Tree Improvement
#' @name     Exam2.2
#' @description Exam2.2 is used to  compare two seed lots by using ANOVA under RCB Design.
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
#'    \code{\link{DataExam2.2}}
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
#' data(DataExam2.2)
#'
#' # Pg. 24
#'fmtab2.5 <- lm(formula  = dbh ~ Blk + SeedLot, data = DataExam2.2)
#'
#' # Pg. 26
#' anova(fmtab2.5)
#' supernova(fmtab2.5, type = 1)
#'
#' # Pg. 26
#' emmeans(object = fmtab2.5, specs = ~ SeedLot)
#' emmip(object = fmtab2.5, formula = ~ SeedLot) +
#'   theme_classic()
#'
NULL
