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



