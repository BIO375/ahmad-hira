### Install and load packages ####
# The following commands will install these packages if they are not already installed, 
# and then load them!

if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}


SagebrushCrickets <- read_csv("datasets/abd/chapter13/chap13e5SagebrushCrickets.csv")
ggplot(SagebrushCrickets) +
  geom_histogram(aes(timeToMating), binwidth = 2)+
  facet_wrap(~feedingStatus)

##Corrections to Part II of Exam 1 

#Summary Statistics


Polyploid <- read_csv("datasets/demos/polyploid.csv") 
View(Polyploid)
summ_length <- Polyploid %>%
  group_by(ploidy) %>%
  summarise(mean_length = mean(length),
            median_length = median(length),
            IQR_length = IQR(length),
            sd_length = sd(length),
            var_length = var(length))
View(summ_length)

Polyploid <- read_csv("datasets/demos/polyploid.csv")
ggplot(data = Polyploid)+
  geom_boxplot(aes(x = ploidy, y = length), notch = TRUE)+
  stat_summary(aes(x = ploidy, y = length), 
               fun.y=mean, 
               colour="darkred", 
               geom="point", 
                )
  




# The reason this failed is because you call the data SagebrushCrickets in line 12 
# but then call it chap13e5SagebrushCrickets in line 13