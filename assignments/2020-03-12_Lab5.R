# Clean up the working environment
rm(list = ls())
### Install and load packages ####

if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}

# Check for updates
tidyverse_update()

ParisObservatoryData <- read_csv("assignments/ParisObservatoryData.csv")

View(ParisObservatoryData)

summary_Obliquity <- ParisObservatoryData %>%
  summarise(mean_Obliquity = mean(Obliquity),
            median_Obliquity = median(Obliquity),
            IQR_Obliquity = IQR(Obliquity),
            sd_Obliquity = sd(Obliquity),
            var_Obliquity = var(Obliquity))
View(summary_Obliquity)

# names(ParisObservatoryData)
# class("Obliquity")
# two-sided

# t.test(ParisObservatoryData[Obliquity])
# rlang::last_error()`    
# 
# help("t.test")

# HIRA, you need the first argument to be the equivalent of 
# range_shift$elevationalRangeShift instead of "Obliquity".

# In the example below, the data is called range_shift and the variable of interest
# is called elevationalRangeShift.  The $ sign can be read as "within the dataset
# range_shift, call the variable named elevationalRangeShift"

# t.test(range_shift$elevationalRangeShift, 
#        alternative = "two.sided", mu = 0, conf.level = 0.95)

t.test("Obliquity", mu = 0, alternative = "two.sided", conf.level = 0.95)


# View(t.test_Obliquity)
# 
# t.test("Obliquity", y = NULL,
#        alternative = c("two.sided"),
#        mu = 0, paired = FALSE, var.equal = FALSE,
#        conf.level = 0.95).
# View(t.test_Obliquity)

t.test(ParisObservatoryData$Obliquity, 
        alternative = "two.sided", mu = 0, conf.level = 0.95)
    
HeartAttack <- read_csv("datasets/demos/HeartAttack_short.csv")

View(HeartAttack)

ggplot(HeartAttack) +
  geom_histogram(aes(cholest), binwidth = 10)+
  facet_wrap(~group)

summary_cholest <- HeartAttack %>%
  summarise(mean_cholest = mean(cholest),
            median_cholest = median(cholest),
            IQR_cholest = IQR(cholest),
            sd_cholest = sd(cholest),
            var_cholest = var(cholest))

View(summary_cholest)

ratio <- (max(HeartAttack$cholest))/(min(HeartAttack$cholest))

View(ratio)

heart <- read_csv("datasets/demos/HeartAttack_short.csv", col_types = cols(group = col_character()))

#two sample 2-sided t-test
t.test(HeartAttack$cholest~HeartAttack$group,data = HeartAttack, var.equal = TRUE, alternative = "two.sided" , conf.level = 0.95)

read_csv("datasets/quinn/chpt3/furness.csv")
View("datasets/quinn/chpt3/furness.csv")

wilcox.test(furness$METRATE~furness$SEX,data = furness, var.equal = TRUE, alternative = "two.sided" , conf.level = 0.95)

read_csv("datasets/quinn/chpt3/elgar.csv")
View(elgar.csv)

ratio <- (max(elgar$HORIZDIM))/(min(elgar$HORIZLIG))
View(ratio)

#Paired t-test, first check if symmetrical using boxplot


ggplot(data = elgar)+
  geom_boxplot(aes(x = HORIZLIG, y = HORIZDIM), notch = TRUE)+
  stat_summary(aes(x = HORIZLIG, y = HORIZDIM), 
               fun.y=mean, 
               colour="darkred", 
               geom="point", 
               shape=18, 
               size=3)

t.test(elgar$HORIZDIM, 
       alternative = "two.sided", mu = 0, conf.level = 0.95)

t.test(elgar$HORIZLIG,
      elgar$HORIZDIM,
       paired=TRUE,
       conf.level=0.95)



