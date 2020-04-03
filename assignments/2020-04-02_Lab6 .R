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

##Chapter 13 problem number 20 

#a) two methods that would be appropriate to test whether there was a difference in mean skin colour between the groups
#- 
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

t.test(chap13q20SalmonColor$skinColor~SockeyeSalmonData$Species,data = SockeyeSalmonData, var.equal = TRUE, alternative = "two.sided" , conf.level = 0.95)

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

# Boxplots of log + 1 transformed Salmon skin colour grouped by species
ggplot(data = chap13q20SalmonColor)+
  geom_boxplot(aes(x = species, y = log1Salmon), notch = TRUE)+
  stat_summary(aes(x = species, y = log1Salmon), 
               fun.y=mean, 
               colour="darkred", 
               geom="point", 
               shape=18, 
               size=3)

ratio <-(max(summ_log1Salmon$sd_log1Salmon))/(min(summ_log1Salmon$sd_log1Salmon))

View(ratio)
# The log transformation does not seem to have 

##Chapter 13 problem number 25 

library(readxl)
RainforestBiomass <- read_excel("RainforestBiomass.xlsx")
View(RainforestBiomass)

install.packages(c("tibble", "xml2"))




