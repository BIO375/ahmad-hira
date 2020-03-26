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

HeartAttack <- read_csv("datasets/demos/HeartAttack_short.csv")

View(HeartAttack)

ggplot(HeartAttack) +
  geom_histogram(aes(cholest), binwidth = 10)+
  facet_wrap(~group)

