#### Lab 8: 1-way ANOVA, continued #### 
# For this lab you will use the datasets described in Chapter 15 of your book 
# but you will answer the slightly modified questions that I provide below

# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

# Install package ggfortify, *note* only do install.packages ONCE
# ggfortify is a package that works with ggplot2 to make nice plots
# install.packages("ggfortify")
library("ggfortify")
# multcomp is used for contrasts and multiple comparisons
# install.packages("multcomp")
library("multcomp")
# nlme is used for random effects ANOVA
# install.packages("nlme")
library("nlme")

# Load tidyverse
library("tidyverse")
# Check for updates
tidyverse_update()



#### Problem 15-23 ####
# Complete parts a and c only

a) this is a planned comparision 
c) 

library(readr)
chap15q23LodgepolePineCones <- read_csv("datasets/abd/chapter15/chap15q23LodgepolePineCones.csv")
View(chap15q23LodgepolePineCones)


ggplot(chap15q23LodgepolePineCones, aes(x = habitat, y = conemass))+
  geom_boxplot() +
  theme_bw() +
  coord_flip()
ggplot(chap15q23LodgepolePineCones) +
  geom_histogram(aes(conemass), binwidth = 1.5)+
  facet_wrap(~habitat)
ggplot(chap15q23LodgepolePineCones)+
  geom_qq(aes(sample = conemass, color = habitat))

# It is important to read in the predictor as a factor
# In the case of this dataset, the parasite names have a space so I recoded
# the factor levels using the function fct_recode()
chap15q23LodgepolePineCones<- chap15q23LodgepolePineCones%>%
  mutate(habitat = fct_recode(habitat, island.absent = "island.absent",
                              island.present = "island.present",
                               mainland.present = "mainland.present"
  ))
##Construct ANOVA 

modelPine <- lm(conemass~habitat, data = chap15q23LodgepolePineCones)
# You alread have a good idea about normality, based on the preliminary plots in 
# Step 1.  After the model is fitted we can check the residuals too.
# I prefer to compare the ratio of standard deviations at this point in my code,
# but you could have done it earlier if you please.

summ_conemass <- chap15q23LodgepolePineCones %>%
  group_by(habitat) %>% 
  summarise(mean_conemass = mean(conemass),
            sd_conemass = sd(conemass),
            n_conemass = n())
ratio <-(max(summ_conemass$sd_conemass))/(min(summ_conemass$sd_conemass))

# The function autoplot will give you a residuals by predicte plot, which is 
# called "Residuals vs. Fitted" here.  It also gives you a Q-Q plot of the RESIDUALS.

autoplot(modelPine)

### Interpret results 

# Use the function anova() to answer our first research question: is there an effect
# of parasite treatment on Daphnia growth rate?

anova(modelPine)
# To address the second question, which parasites are different from the control, we
# can choose among approaches.

# Start with a summary of the model results
summary(modelPine)


# Planned comparisons

planned <- glht(modelPine, linfct = 
                  mcp(habitat = c("island.absent - island.present = 0",
                                   "island.absent - mainland.present = 0",
                                   "island.present - mainland.present = 0")))
confint(planned)
summary(planned)

## The results depict that there is a significant difference between the means of the island.absent and mainland.present groups as well as the island.present and mainland.present groups. 





#### Problem 15-26 ####
# Use the data to perform the correct test.  Please show code for all steps in your process.

library(readr)
chap15q26MalariaFungusVenom <- read_csv("datasets/abd/chapter15/chap15q26MalariaFungusVenom.csv")
View(chap15q26MalariaFungusVenom)

ggplot(chap15q26MalariaFungusVenom, aes(x = treatmentGroup, y = logSporozoiteNumbers))+
  geom_boxplot() +
  theme_bw() +
  coord_flip()
ggplot(chap15q26MalariaFungusVenom) +
  geom_histogram(aes(logSporozoiteNumbers), binwidth = 1)+
  facet_wrap(~treatmentGroup)
ggplot(chap15q26MalariaFungusVenom)+
  geom_qq(aes(sample = logSporozoiteNumbers, color = treatmentGroup))

## a) the pattern suggested is that the control group has the highest number of infectious cells of malaria on average, 
# whereas, the scorpine treatment group seems to have the lowest average number of infectious cells of malaria between all three groups. 

# B) I think the best test for this data is an unplanned comparison and use of the Tukey-Kramer method after determining that the null of no differences between any of the groups has been rejected.  


chap15q26MalariaFungusVenom<- chap15q26MalariaFungusVenom%>%
  mutate(treatmentGroup = fct_recode(treatmentGroup, Control = "Control",
                              WT = "WT",
                              Scorpine = "Scorpine"
  ))

##Construct ANOVA 

modelMalaria <- lm(logSporozoiteNumbers~treatmentGroup, data = chap15q26MalariaFungusVenom)

summ_logSporozoiteNumbers <- chap15q26MalariaFungusVenom %>%
  group_by(treatmentGroup) %>% 
  summarise(mean_logSporozoiteNumbers = mean(logSporozoiteNumbers),
            sd_logSporozoiteNumbers = sd(logSporozoiteNumbers),
            n_logSporozoiteNumbers = n())
ratio <-(max(summ_logSporozoiteNumbers$sd_logSporozoiteNumbers))/(min(summ_logSporozoiteNumbers$sd_logSporozoiteNumbers))

# The function autoplot will give you a residuals by predicte plot, which is 
# called "Residuals vs. Fitted" here.  It also gives you a Q-Q plot of the RESIDUALS.

autoplot(modelMalaria)

### Interpret results 


anova(modelMalaria)

# Start with a summary of the model results
summary(modelMalaria)


# Unplanned comparisons
# The key things you need to specify here are the model name and the factor name

tukey <- glht(modelMalaria, linfct = mcp(treatmentGroup = "Tukey"))
summary(tukey)

# The tukey-kramer test shows that there is a significant difference between the Scorpine- Control group and the Wild Type-Scorpine group which means the null hypothesis is false. 

### Problem 15-30 and/or 15-31 (same data in both problems) ####
# Use the data to perform the correct test.  Please show code for all steps in your process.

#a) 
library(readr)
chap15q30FiddlerCrabFans <- read_csv("datasets/abd/chapter15/chap15q30FiddlerCrabFans.csv")
View(chap15q30FiddlerCrabFans)


ggplot(chap15q30FiddlerCrabFans, aes(x = crabType, y = bodyTemperature))+
  geom_boxplot() +
  theme_bw() +
  coord_flip()
ggplot(chap15q30FiddlerCrabFans) +
  geom_histogram(aes(bodyTemperature), binwidth = 0.1)+
  facet_wrap(~crabType)
ggplot(chap15q30FiddlerCrabFans)+
  geom_qq(aes(sample = bodyTemperature, color = crabType))


summ_bodyTemperature <- chap15q30FiddlerCrabFans %>%
  group_by(crabType) %>% 
  summarise(mean_bodyTemperature = mean(bodyTemperature),
            sd_bodyTemperature = sd(bodyTemperature),
            n_bodyTemperature = n())
ratio <-(max(summ_bodyTemperature$sd_bodyTemperature))/(min(summ_bodyTemperature$sd_bodyTemperature))

#assumptions of normality are not met, boxplots whisker length is pretty unequal and there are multiple outliers, a bit of left skew in the histograms, and a strange looking q-q plot. 

#try to transform the data 

chap15q30FiddlerCrabFans <- chap15q30FiddlerCrabFans %>%
  mutate(log1crab = log(bodyTemperature + 1))

summ_log1crab <- chap15q30FiddlerCrabFans %>%
  group_by(crabType) %>% 
  summarise(mean_log1crab = mean(log1crab),
            sd_log1crab = sd(log1crab),
            n_log1crab = n())

##Graphs of transformed crab data 
ggplot(chap15q30FiddlerCrabFans) +
  geom_histogram(aes(log1crab), binwidth = 0.1)+
  facet_wrap(~crabType)

ggplot(data = chap15q30FiddlerCrabFans)+
  geom_boxplot(aes(x = crabType, y = log1crab), notch = TRUE)+
  stat_summary(aes(x = crabType, y = log1crab), 
               fun.y=mean, 
               colour="darkred", 
               geom="point", 
               shape=18, 
               size=3)
ratio <-(max(summ_log1crab$sd_log1crab))/(min(summ_log1crab$sd_log1crab))

# It is important to read in the predictor as a factor
# In the case of this dataset, the parasite names have a space so I recoded
# the factor levels using the function fct_recode()


chap15q30FiddlerCrabFans <- chap15q30FiddlerCrabFans %>%
  mutate(crabType = fct_recode(crabType, intact = "intact male",
                               maleminor = "male minor removed",
                               malemajor = "male major removed"
  ))

##Construct ANOVA 

modeltransformedcrab <- lm(log1crab~crabType, data = chap15q30FiddlerCrabFans)

# The function autoplot will give you a residuals by predicte plot, which is 
# called "Residuals vs. Fitted" here.  It also gives you a Q-Q plot of the RESIDUALS.

autoplot(modeltransformedcrab)

### Interpret results for transformed crabs 


anova(modeltransformedcrab)

#There are significant differences between the body temperatures of the various crab types as indicated by p<0.001 in the ANOVA results 


# Start with a summary of the model results for transformed crabs
summary(modeltransformedcrab)


# Planned comparisons between three groups


planned <- glht(modeltransformedcrab, linfct = 
                  mcp(crabType = c("intact male - male major removed = 0",
                                  "male minor removed - intact male = 0",
                                  "male major removed - male minor removed = 0")))



confint(planned)
summary(planned)




