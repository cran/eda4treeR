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
#' data(DataExam4.4)
#'
#' # Pg. 58
#' fm4.6    <-
#'   aov(
#'       formula     = Height ~ Rep + Irrig*Ferti*SeedDLot +
#'                              Error(Rep/Irrig:Ferti)
#'     , data        = DataExam4.4
#'     )
#'
#' # Pg. 61
#'  summary(fm4.6)
#'
#' # Pg. 61
#' model.tables(x = fm4.6, type = "means")
#'
#' # Pg. 61
#' emmeans(object = fm4.6, specs = ~ Irrig)
#' emmip(object = fm4.6, formula  = ~ Irrig) +
#'     theme_classic()
#'
NULL

