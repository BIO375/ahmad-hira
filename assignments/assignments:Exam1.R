### Install and load packages ####
# The following commands will install these packages if they are not already installed, 
# and then load them!

if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}

SagebrushCrickets <- read_csv("datasets/abd/chapter13chap13e5SagebrushCrickets.csv")
ggplot(chap13e5SagebrushCrickets) +
  geom_histogram(aes(timeToMating), binwidth = 2)+
  facet_wrap(~feedingStatus)

# The reason this failed is because you call the data SagebrushCrickets in line 12 
# but then call it chap13e5SagebrushCrickets in line 13