#install.packages("tidyverse")
if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}
tidyverse_update()
data01 <- read_csv("datasets/abd/chapter12/chap12e3HornedLizards.csv")
data01 <- data01 %>% slice(-105)

##summary stats

View(data01)
data01 <- read_csv("datasets/abd/chapter12/chap12e3HornedLizards.csv") 
summ_squamosalHornLength <- data01 %>%
  group_by(Survival) %>%
  summarise(mean_squamosalHornLength = mean(squamosalHornLength),
            median_squamosalHornLength = median(squamosalHornLength),
            IQR_squamosalHornLength = IQR(squamosalHornLength),
            sd_squamosalHornLength = sd(squamosalHornLength),
            var_squamosalHornLength = var(squamosalHornLength))
View(summ_squamosalHornLength)
