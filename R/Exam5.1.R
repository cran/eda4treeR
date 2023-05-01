#' @title    Example 5.1 from Experimental Design and Analysis for Tree Improvement
#' @name     Exam5.1
#' @description Exam5.1 presents the height of 27 seedlots from 4 sites.
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
#'    \code{\link{DataExam5.1}}
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
#' data(DataExam5.1)
#'
#' # Pg.68
#' fm5.4 <- lm(formula = Ht ~ Site*SeedLot, data = DataExam5.1)
#'
#' # Pg. 73
#' anova(fm5.4)
#' # Pg. 73
#' emmeans(object = fm5.4, specs = ~ Site)
#' emmeans(object = fm5.4, specs = ~ SeedLot)
#'
#' ANOVAfm5.4 <- anova(fm5.4)
#'
#' ANOVAfm5.4[4, 1:3] <- c(208, 208*1040, 1040)
#' ANOVAfm5.4[3, 4]   <- ANOVAfm5.4[3, 3]/ANOVAfm5.4[4, 3]
#' ANOVAfm5.4[3, 5]   <- pf(
#'                             q = ANOVAfm5.4[3, 4]
#'                         , df1 = ANOVAfm5.4[3, 1]
#'                         , df2 = ANOVAfm5.4[4, 1]
#'                         , lower.tail = FALSE
#'                         )
#' # Pg. 73
#' ANOVAfm5.4
#'
#' # Pg. 80
#' DataExam5.1 %>%
#'   filter(SeedLot %in% c("13653", "13871")) %>%
#'   ggplot(
#'     data = .
#'   , mapping = aes(x = SiteMean, y = Ht, color = SeedLot, shape = SeedLot)
#'   ) +
#'   geom_point() +
#'   geom_smooth(method = lm, se = FALSE, fullrange = TRUE)+
#'   theme_classic() +
#'   labs(
#'       x = "SiteMean"
#'     , y = "SeedLot Mean"
#'     )
#'
#'
#'
#' Tab5.10 <-
#'   DataExam5.1 %>%
#'       summarise(Mean = mean(Ht), .by = SeedLot) %>%
#'     left_join(
#'       DataExam5.1 %>%
#'         nest_by(SeedLot) %>%
#'         mutate(fm1 = list(lm(Ht ~ SiteMean, data = data))) %>%
#'         summarise(Slope = coef(fm1)[2])
#'     , by = "SeedLot"
#'       )
#'
#' # Pg. 81
#' Tab5.10
#'
#' ggplot(data = Tab5.10, mapping = aes(x = Mean, y = Slope))+
#'  geom_point(size = 2) +
#'  theme_bw() +
#'  labs(
#'      x = "SeedLot Mean"
#'    , y = "Regression Coefficient"
#'    )
#'
#' DevSS1 <-
#'         DataExam5.1 %>%
#'         nest_by(SeedLot) %>%
#'         mutate(fm1 = list(lm(Ht ~ SiteMean, data = data))) %>%
#'         summarise(SSE = anova(fm1)[2, 2]) %>%
#'         ungroup() %>%
#'         summarise(Dev = sum(SSE)) %>%
#'         as.numeric()
#'
#' ANOVAfm5.4[2, 2]
#'
#' length(levels(DataExam5.1$SeedLot))
#'
#' ANOVAfm5.4.1 <-
#'   rbind(
#'      ANOVAfm5.4[1:3, ]
#'    , c(
#'         ANOVAfm5.4[2, 1]
#'       , ANOVAfm5.4[3, 2] - DevSS1
#'       , (ANOVAfm5.4[3, 2] - DevSS1)/ANOVAfm5.4[2, 1]
#'       , NA
#'       , NA
#'       )
#'    , c(
#'         ANOVAfm5.4[3, 1]-ANOVAfm5.4[2, 1]
#'       , DevSS1
#'       , DevSS1/(ANOVAfm5.4[3, 1]-ANOVAfm5.4[2, 1])
#'       , DevSS1/(ANOVAfm5.4[3, 1]-ANOVAfm5.4[2, 1])/ANOVAfm5.4[4, 3]
#'       , pf(
#'               q = DevSS1/(ANOVAfm5.4[3, 1]-ANOVAfm5.4[2, 1])/ANOVAfm5.4[4, 3]
#'           , df1 = ANOVAfm5.4[3, 1]-ANOVAfm5.4[2, 1]
#'           , df2 = ANOVAfm5.4[4, 1]
#'           , lower.tail = FALSE
#'           )
#'       )
#'    , ANOVAfm5.4[4, ]
#'   )
#' rownames(ANOVAfm5.4.1) <-
#'   c("Site", "SeedLot", "Site:SeedLot", "  regressions", "  deviations", "Residuals")
#' # Pg. 82
#' ANOVAfm5.4.1
#'
NULL
