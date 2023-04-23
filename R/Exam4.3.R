#' @title    Example 4.3 from Experimental Design and Analysis for Tree Improvement
#' @name     Exam4.3
#' @description Exam4.3 presents the germination count data for 4 Pre-Treatments and 6 Seedlots.
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
#'    \code{\link{DataExam4.3}}
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
#'  # Pg. 50
#'  fm4.2    <-
#'    aov(
#'        formula = Percent ~ Repl + Contcomp + SeedLot +
#'                            Treat/Contcomp + Contcomp /SeedLot +
#'                            Treat/ Contcomp/SeedLot
#'       , data   = DataExam4.3
#'      )
#'
#'  # Pg. 54
#'  anova(fm4.2)
#'
#'  # Pg. 54
#'  model.tables(x = fm4.2, type = "means")
#'
#'  emmeans(object = fm4.2, specs = ~ Contcomp)
#'  emmeans(object = fm4.2, specs = ~ SeedLot)
#'  emmeans(object = fm4.2, specs = ~ Contcomp + Treat)
#'  emmeans(object = fm4.2, specs = ~ Contcomp + SeedLot)
#'  emmeans(object = fm4.2, specs = ~ Contcomp + Treat + SeedLot)
#'
#'  DataExam4.3 %>%
#'    dplyr::group_by(Treat, Contcomp, SeedLot) %>%
#'    dplyr::summarize(Mean=mean(Percent))
#'    RESFIT <- data.frame(residualvalue=residuals(fm4.2),fittedvalue=fitted.values(fm4.2))
#'    ggplot(mapping = aes(x = fitted.values(fm4.2), y = residuals(fm4.2)))+
#'    geom_point(size = 2)+
#'    labs(
#'        x = "Fitted Values"
#'      , y = "Residuals"
#'      ) +
#'      theme_classic()
#'
NULL
