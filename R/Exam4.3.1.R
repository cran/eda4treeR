#' @title    Example 4.3.1 from Experimental Design and Analysis for Tree Improvement
#' @name     Exam4.3.1
#' @description Exam4.3.1 presents the germination count data for 4 Pre-Treatments and 6 Seedlots.
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
#'    \code{\link{DataExam4.3.1}}
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
#' data(DataExam4.3)
#'
#' # Pg. 57
#' fm4.4    <-
#'   aov(
#'       formula     = Percent ~ Repl + Treat*SeedLot
#'     , data        = DataExam4.3 %>%
#'                     filter(Treat != "control")
#'      )
#'
#'  # Pg. 57
#'  anova(fm4.4)
#'  model.tables(x = fm4.4, type = "means", se = TRUE)
#'
#'  emmeans(object = fm4.4, specs = ~ Treat)
#'  emmeans(object = fm4.4, specs = ~ SeedLot)
#'  emmeans(object = fm4.4, specs = ~ Treat * SeedLot)
NULL
