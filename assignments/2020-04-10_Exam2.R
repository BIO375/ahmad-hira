# Clean up the working environment
rm(list = ls())
### Install and load packages ####

if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}

##Question 17 
library(readr)
baker <- read_csv("datasets/demos/baker.csv")
View(baker)

##paired t test 
ggplot(baker) +
  geom_boxplot(aes(x = "", y = (diff= After-Before)))

t.test(baker$After, baker$Before, 
       alternative = "two.sided", paired = TRUE, conf.level = 0.95)

##Question 18 

install.packages("abd", repos="http://R-Forge.R-project.org")
library("abd")

algae <- AlgaeCO2

View(algae)

# Check for normality 

summ_algae <- AlgaeCO2 %>%
  group_by(treatment) %>%
  summarise(mean = mean(growthrate),
            sd = sd(growthrate),
            n = n(),
            se = sd/sqrt(n()))

ggplot(algae) +
  geom_histogram(aes(growthrate), binwidth = 0.3)+
  facet_wrap(~treatment)

ggplot(algae) +
  geom_boxplot(aes(x = treatment, y = growthrate))

ratio <-(max(summ_algae$sd))/(min(summ_algae$sd))

#two sample t test 

t.test(growthrate ~ treatment, data = algae,
       var.equal = TRUE, 
       alternative = "two.sided", 
       conf.level = 0.95)


### 10/10: Code does not break ###
