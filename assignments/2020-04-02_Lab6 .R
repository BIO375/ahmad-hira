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

install.packages("lubridate")

###Chapter 13 problem number 20 

#a) two methods that would be appropriate to test whether there was a difference in mean skin colour between the groups
#- Welch's t test 
#- Two sample t test 

#b) use a transformation to test whether there is a difference in the means of these two groups skin colours 
library(readr)
chap13q20SalmonColor <- read_csv("datasets/abd/chapter13/chap13q20SalmonColor.csv")
View(chap13q20SalmonColor)

summ_skinColor <- chap13q20SalmonColor %>%
  group_by(species) %>% 
  summarise(mean_skinColor = mean(skinColor),
            sd_skinColor = sd(skinColor),
            n_skinColor = n())

View(summ_skinColor)

##ratio of Smax/Smin 
ratio <-(max(summ_skinColor$sd_skinColor))/(min(summ_skinColor$sd_skinColor))

View(ratio)

##Boxplot to check homoscedascity because ratio>3 

ggplot(chap13q20SalmonColor) +
  geom_boxplot(aes(x = species, y = skinColor))

#The ratio I calculated was greater than 3 at 4.297 which indicated the two groups are not homogenous,I created a boxplot for the two groups and the Kokannee species has equal whisker length and median is close to the mean. The sockeye species also has equal whisker legnths, median close to mean but it has an outlier as well.  

#Overall, it looks pretty normal but the S ratio was above 3 which means I cannot assume normality so I will perform a transformation to the data

## do log transformation to salmon colour data 

chap13q20SalmonColor <- chap13q20SalmonColor %>%
  mutate(log1Salmon = log(skinColor + 1))

chap13q20SalmonColor_summary02 <- chap13q20SalmonColor %>%
  group_by(species) %>%
  summarise(n_log1Salmon = n(),
            mean_log1Salmon = mean(log1Salmon),
            median_log1beetle = median(log1Salmon),
            sd_log1Salmon = sd(log1Salmon),
            IQR_log1Salmon = IQR(log1Salmon),
            var_log1Salmon = var(log1Salmon),
            se_log1Salmon = sd(log1Salmon)/sqrt(n()))

View(chap13q20SalmonColor_summary02)

# Boxplots of log + 1 transformed Salmon skin colour grouped by species
ggplot(data = chap13q20SalmonColor)+
  geom_boxplot(aes(x = species, y = log1Salmon), notch = TRUE)+
  stat_summary(aes(x = species, y = log1Salmon), 
               fun.y=mean, 
               colour="darkred", 
               geom="point", 
               shape=18, 
               size=3)

ratio <-(max(chap13q20SalmonColor_summary02$sd_log1Salmon))/(min(chap13q20SalmonColor_summary02$sd_log1Salmon))

View(ratio)
# The log transformation brought down the SMax/Smin ratio to 3.23 instead of 4.29 so I decided to conduct a 2 sample t test 

t.test(chap13q20SalmonColor$log1Salmon~chap13q20SalmonColor$species,data = chap13q20SalmonColor, var.equal = TRUE, alternative = "two.sided" , conf.level = 0.95)

# The p-value has decreased which means transformation has increased the significance of the data..... 

###Chapter 13 problem number 25 

library(readr)
chap13q25Clearcuts <- read_csv("datasets/abd/chapter13/chap13q25Clearcuts.csv")
View(chap13q25Clearcuts)

summ_chap13q25Clearcuts <- chap13q25Clearcuts %>%
  summarise(mean_biomassChange = mean(biomassChange),
            sd_biomassChange = sd(biomassChange),
            n_biomassChange = n())
View(summ_chap13q25Clearcuts)

##ratio of Smax/Smin 
ratio <-(max(summ_chap13q25Clearcuts$sd_biomassChange))/(min(summ_chap13q25Clearcuts$sd_biomassChange))
View(ratio)

##ratio is less than 3 so I will look at normality of histograms and boxplot 

ggplot(data = chap13q25Clearcuts)+
  geom_boxplot(aes(x = biomassChange, y = biomassChange), notch = TRUE)+
  stat_summary(aes(x = biomassChange, y = biomassChange), 
               fun= mean, 
               colour="darkred", 
               geom="point", 
               shape=18, 
               size=3)
ggplot(chap13q25Clearcuts) +
  geom_histogram(aes(biomassChange), binwidth = 1)

## the histogram shows a bit of left skew however overall and I will assume normalcy and conduct a one sample t-test 

t.test(chap13q25Clearcuts, alternative = "two.sided", mu = 0, conf.level = 0.95)

### CHAPTER 13 PROBLEM 26

library(readr)
chap13q26ZebraFinchBeaks <- read_csv("datasets/abd/chapter13/chap13q26ZebraFinchBeaks.csv")
View(chap13q26ZebraFinchBeaks)

summ_chap13q26ZebraFinchBeaks <- chap13q26ZebraFinchBeaks %>%
  summarise(mean_preference = mean(preference),
            sd_preference = sd(preference),
            n_preference = n())
View(summ_chap13q26ZebraFinchBeaks)

##ratio of Smax/Smin 
ratio <-(max(summ_chap13q26ZebraFinchBeaks$sd_preference))/(min(summ_chap13q26ZebraFinchBeaks$sd_preference))
View(ratio)

#ratio is less than 3 so check boxplot for normality 

ggplot(data = chap13q26ZebraFinchBeaks)+
  geom_boxplot(aes(preference), notch = FALSE)+
  stat_summary(aes(x= 1-15, y = preference), 
               fun= mean, 
               colour="darkred", 
               geom="point", 
               shape=18, 
               size=3)
#boxplot whisker length is not equal and there is a significant outlier, median and mean are close. The assumptions of normality are not met and sample size is pretty small, so I will try a transformation to the data. 

chap13q26ZebraFinchBeaks <- chap13q26ZebraFinchBeaks %>%
  mutate(log1FinchBeaks = log(preference + 1))

chap13q26ZebraFinchBeaks_summary02 <- chap13q26ZebraFinchBeaks %>%
  summarise(n_log1FinchBeaks= n(),
            mean_log1FinchBeaks = mean(log1FinchBeaks),
            median_log1FinchBeaks = median(log1FinchBeaks),
            sd_log1FinchBeaks = sd(log1FinchBeaks),
            IQR_log1FinchBeaks = IQR(log1FinchBeaks),
            var_log1FinchBeaks = var(log1FinchBeaks),
            se_log1FinchBeaks = sd(log1FinchBeaks)/sqrt(n()))
View(chap13q26ZebraFinchBeaks_summary02)

##transformed ratio of smax/smin 

ratio <-(max(chap13q26ZebraFinchBeaks_summary02$sd_log1FinchBeaks))/(min(chap13q26ZebraFinchBeaks_summary02$sd_log1FinchBeaks))
View(ratio <-(max(chap13q26ZebraFinchBeaks_summary02$sd_log1FinchBeaks))/(min(chap13q26ZebraFinchBeaks_summary02$sd_log1FinchBeaks)))


##transformed boxplot 

ggplot(data = chap13q26ZebraFinchBeaks)+
  geom_boxplot(aes(log1FinchBeaks), notch = FALSE)+
  stat_summary(aes(x= 1-20, y = log1FinchBeaks), 
               fun= mean, 
               colour="darkred", 
               geom="point", 
               shape=18, 
               size=3)

## whisker lengths are equal after transformation and mean and median are exact so I will go ahead and perform a one sample t test because we are comparing the mean of a single group

t.test(chap13q26ZebraFinchBeaks, alternative = "two.sided", mu = 0, conf.level = 0.95)

##P is less than 0.05 which means there is a significant difference between the females preference for carotenoid supplemented males 

### Review number 16 on page 421 

library(readr)
chap03q22ZebraFishBoldness <- read_csv("datasets/abd/chapter03/chap03q22ZebraFishBoldness.csv")
View(chap03q22ZebraFishBoldness)

## test for normality before conducting t test 

ggplot(chap03q22ZebraFishBoldness) +
  geom_boxplot(aes(x = genotype, y = secondsAggressiveActivity))

##whisker length isn't equal for either genotype but median and mean are close, check histograms 

ggplot(chap03q22ZebraFishBoldness) +
  geom_histogram(aes(secondsAggressiveActivity), binwidth = 10)+
  facet_wrap(~genotype)

summ_chap03q22ZebraFishBoldness <- chap03q22ZebraFishBoldness %>%
  summarise(mean_secondsAggresiveActivity = mean(secondsAggressiveActivity),
            sd_secondsAggressiveActivity = sd(secondsAggressiveActivity),
            n_secondsAggressiveActivity = n())

View(summ_chap03q22ZebraFishBoldness)

## histogram is bimodal rather than unimodal so I will check smax/smin ratio 

ratio <-(max(summ_chap03q22ZebraFishBoldness$sd_secondsAggressiveActivity))/(min(summ_chap03q22ZebraFishBoldness$sd_secondsAggressiveActivity))
View(ratio)

# ratio is less than 3 and sample size is not super large so I will conduct a non-parametric version of the t-test and do a mann Whitney U t test 

wilcox.test(secondsAggressiveActivity ~ genotype,
            data = chap03q22ZebraFishBoldness, alternative = "two.sided", conf.level = 0.95)

t.test(chap03q22ZebraFishBoldness$secondsAggressiveActivity~chap03q22ZebraFishBoldness$genotype,data = chap03q22ZebraFishBoldness, alternative = "two.sided" , conf.level = 0.95)



















