#' @title    Example 6.2 from Experimental Design and Analysis for Tree Improvement
#' @name     Exam6.2
#' @description Exam 6.2 Dbh mean, Dbh varince and number of trees per plot from 3 provinces("PNG","Sabah","Queensland") with 4 replications of 48 families.
#'
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
#'    \code{\link{DataExam6.2}}
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
#' data(DataExam6.2)
#'
#' DataExam6.2.1 <-
#'     DataExam6.2 %>%
#'     filter(Province == "PNG")
#'
#' # Pg. 94
#' fm6.3 <-
#'      lm(
#'           formula = Dbh.mean ~ Replication + Family
#'         , data    = DataExam6.2.1
#'        )
#'
#' b    <- anova(fm6.3)
#'
#'
#' HM      <- function(x){length(x)/sum(1/x)}
#' w       <- HM(DataExam6.2.1$Dbh.count)
#' S2      <- b[["Mean Sq"]][length(b[["Mean Sq"]])]
#' Sigma2t <- mean(DataExam6.2.1$Dbh.variance)
#' sigma2m <- S2-(Sigma2t/w)
#'
#' fm6.3.1 <-
#'   lmer(
#'       formula = Dbh.mean ~ 1 + Replication + (1|Family)
#'     , data    = DataExam6.2.1
#'     , REML    = TRUE
#'     )
#'
#' # Pg. 104
#' # summary(fm6.3.1)
#' varcomp(fm6.3.1)
#' sigma2f <- 0.2584
#' h2 <- (sigma2f/(0.3))/(Sigma2t + sigma2m + sigma2f)
#' cbind(hmean = w, Sigma2t, sigma2m, sigma2f, h2)
#'
#' fm6.4 <-
#'   lm(
#'       formula = Dbh.mean ~ Replication+Family
#'      , data   = DataExam6.2
#'      )
#'
#' b    <- anova(fm6.4)
#' HM      <- function(x){length(x)/sum(1/x)}
#' w       <- HM(DataExam6.2$Dbh.count)
#' S2      <- b[["Mean Sq"]][length(b[["Mean Sq"]])]
#' Sigma2t <- mean(DataExam6.2$Dbh.variance)
#' sigma2m <- S2-(Sigma2t/w)
#'
#' fm6.4.1 <-
#'  lmer(
#'    formula = Dbh.mean ~ 1 + Replication + Province + (1|Family)
#'  , data    = DataExam6.2
#'  , REML    = TRUE
#'     )
#'
#' # Pg. 107
#' varcomp(fm6.4.1)
#' sigma2f <- 0.3514
#' h2 <- (sigma2f/(0.3))/(Sigma2t+sigma2m+sigma2f)
#' cbind(hmean = w, Sigma2t, sigma2m, sigma2f, h2)
#'
#' fm6.7.1 <-
#'  lmer(
#'    formula = Dbh.mean ~ 1+Replication+(1|Family)
#'  , data    = DataExam6.2.1
#'  , REML = TRUE
#'  )
#'
#' # Pg. 116
#' varcomp(fm6.7.1)
#' sigma2f[1] <- 0.2584
#'
#' fm6.7.2<-
#'  lmer(
#'    formula = Ht.mean ~ 1 + Replication + (1|Family)
#'  , data    = DataExam6.2.1
#'  , REML    = TRUE
#'    )
#'
#' # Pg. 116
#' varcomp(fm6.7.2)
#' sigma2f[2] <- 0.2711
#'
#' fm6.7.3 <-
#'  lmer(
#'    formula = Sum.means ~ 1 + Replication + (1|Family)
#'  , data    = DataExam6.2.1
#'  , REML    = TRUE
#'  , control = lmerControl()
#'  )
#'
#' # Pg. 116
#' varcomp(fm6.7.3)
#' sigma2f[3] <- 0.873
#' sigma2xy   <- 0.5*(sigma2f[3]-sigma2f[1]-sigma2f[2])
#' GenCorr <- sigma2xy/sqrt(sigma2f[1]*sigma2f[2])
#' cbind(
#'      S2x = sigma2f[1]
#'    , S2y = sigma2f[2]
#'    , S2.x.plus.y = sigma2f[3]
#'    , GenCorr
#'    )
NULL
