  #### EXAM 3 #### 

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

library(readr)
caffeine <- read_csv("datasets/demos/caffeine.csv")
View(caffeine)

summ_caffeine <- caffeine %>%
  group_by(group) %>% 
  summarise(mean_half_life = mean(half_life),
            sd_half_life = sd(half_life),
            median_half_life= median(half_life),
            n_samples = n())
#checks for normality
ggplot(caffeine) +
  geom_histogram(aes(half_life), binwidth = 1.5)+
  facet_wrap(~group)
ggplot(caffeine)+
  geom_qq(aes(sample = half_life, color = group))
ggplot(caffeine) +
  geom_boxplot(aes(x = group, y = half_life))

# It is important to read in the predictor as a factor
# In the case of this dataset, the parasite names have a space so I recoded
# the factor levels using the function fct_recode()
caffeine<- caffeine%>%
  mutate(group = fct_recode(group, male = "male",
                              norm_prog = "norm_prog",
                              high_prog = "high_prog"))
                              
##mean and median match, whiskers have a skew and there are two outliers but overall seems like a normal distribution so not going to transform data

#####Constructing ANOVA#####
caffeinemodel <- lm(half_life~group, data = caffeine)

summ_caffeine <- caffeine %>%
  group_by(group) %>% 
  summarise(mean_half_life = mean(half_life),
            sd_half_life = sd(half_life),
            n_half_life = n())
ratio_half_life <-(max(summ_caffeine$sd_half_life))/(min(summ_caffeine$sd_half_life))

autoplot(caffeinemodel)

#ratio is less than 3 

anova(caffeinemodel)



#planned comparision

summary(caffeinemodel)

View(caffeinemodel)

planned <- glht(caffeinemodel, linfct = 
                  mcp(group = c("male - norm_prog = 0",
                                  "norm_prog - high_prog = 0",
                                  "male - high_prog = 0")))
confint(planned)
summary(planned)














summary(planned)