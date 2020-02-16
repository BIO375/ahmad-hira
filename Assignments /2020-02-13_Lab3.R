### Lab 3. Data manipulation and graphing

# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

### Install and load packages ####
# The following commands will install these packages if they are not already installed, 
# and then load them!

if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}

lovett <- read_csv("datasets/quinn/chpt2/lovett.csv")

summ_root <- lovett %>%
  summarise(mean_SO4 = mean(SO4),
            median_SO4 = median(SO4),
            IQR_SO4 = IQR(SO4),
            sd_SO4 = sd(SO4),
            var_SO4 = var(SO4))
ggplot(lovett)+
  geom_histogram(aes(SO4), binwidth = 1)

ggplot(lovett)+
  geom_boxplot(aes(x ="" , y = SO4), notch = FALSE, varwidth = TRUE)
ggplot(lovett)+
  geom_histogram(aes(SO4MOD), binwidth = 2)
ggplot(lovett)+
  geom_boxplot(aes(x = "", y=SO4MOD), noth = TRUE, varwidth = TRUE)
# Plot boxplots of SO4 and Modified SO4 using the code below.  
# You do not need to write any new code for this part!

# The code below modifies the dataset so it only contains SO4 and Modified SO4
# using select{dplyr}, and is oriented in long form using gather{tidyr}
lovett_tidy <- lovett %>%
  select(contains("SO4"))%>%
  gather(key = "type", value = "measurement", SO4, SO4MOD)

# The code below plots the two variables as boxplots, zooming in on the
# 40-75 range where most of the values are found (coord_cartesian).  The red 
# dots indicate the means (stat_summary).
ggplot(data = lovett_tidy)+
  geom_boxplot(aes(x = type, y = measurement))+
  coord_cartesian(ylim = c(40, 75))+
  stat_summary(aes(x = type, y = measurement), fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3)            
sanchez <- read_csv("datasets/demos/sanchez.csv")

View(sanchez)

summ_BEETLE96 <- sanchez %>%
  group_by(COLTYPE) %>%
  summarise(mean_BEETLE96 = mean(BEETLE96),
            median_BEETLE96 = median(BEETLE96),
            IQR_BEETLE96 = IQR(BEETLE96),
            sd_BEETLE96 = sd(BEETLE96),
            var_BEETLE96 = var(BEETLE96))
sanchez <- mutate(sanchez, log(x+1) = log(x+1)(BEETLE96))


sanchez <- mutate(sanchez, logbeetle = log(BEETLE96+1))
     
ggplot(sanchez)+
  geom_histogram(aes(BEETLE96), binwidth = 2)
ggplot(sanchez)+
  geom_histogram(aes(logbeetle), binwidth = 2)
ggplot(sanchez)+
  geom_histogram(aes(COLTYPE), binwidth = 2)
