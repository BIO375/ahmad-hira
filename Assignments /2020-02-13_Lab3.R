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
lovett

