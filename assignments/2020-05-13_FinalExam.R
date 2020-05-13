# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()


library("ggfortify")

library("broom")


# Load tidyverse
library("tidyverse")
# Check for updates
tidyverse_update()

library(readr)
insulation <- read_csv("datasets/demos/insulation.csv")
View(insulation)

# Check for the assumption of bivariate normality using a basic scatter 
# plot

ggplot(data = insulation) +
  geom_point(mapping = aes(x = leanness, y = heat_loss ))

# For a fancier scatter plot using more options see the commands here.
ggplot(data = insulation) +
  geom_point(mapping = aes(x = leanness, y = heat_loss),
             colour = "firebrick", size = 2)+
  theme_bw()+
  labs( x = "leanness", y = "heat_loss")

##Last way to check for bivariate normality is to see whether x and y separately are normally distributed.  The
# sample size here is 12, so start with a histogram.
ggplot(data = insulation)+
  geom_histogram(aes(leanness), binwidth = 0.6)
ggplot(data = insulation)+
  geom_histogram(aes(heat_loss), binwidth = .01)

# There seems to be some skew in both x and y, doublecheck
ggplot(data = insulation)+
  geom_boxplot(aes("", heat_loss))
ggplot(data = insulation)+
  geom_boxplot(aes("", leanness))
##heat_loss looks good but leanness has uneven whisker length 
ggplot(data = insulation)+
  geom_qq(aes(sample = heat_loss))
ggplot(data = insulation)+
  geom_qq(aes(sample = leanness))

## both s shaped q-q plots so these variables are not great in terms of their normality, particularly leanness has skew in terms of whisker length and both have s shaped q-q plots. The sample size is very small so the histograms are not great indicators at depicting normality. 
## Use non parametric spearman's rank correlation 
insulationCor <- cor.test(~ leanness + heat_loss, data = insulation,
                     method = "pearson")
insulationCor

r <- insulationCor$estimate
r
### Spearman's rank correlation ####

insulationSpear <-cor.test(~ leanness + heat_loss, data = insulation,
                      method = "spearman")
insulationSpear


### Linear Regression ####
# # Based on an example on pg.541 of ABD, researchers were interested in
# the relationship between lion age and proportion of black on the lion 
# nose. 

insulation <- read_csv("datasets/demos/insulation.csv")

# The assumptions for a linear regression are difficult to test directly,
# so we mostly diagnose departures using residuals plots.  In order
# to plot residuals, however, we first need to fit a model!

modelinsulation04 <- lm(heat_loss ~ leanness, data = insulation)

# Autoplot gives you a residual by predicted plot in the upper left panel
autoplot(modelinsulation04, smooth.colour = NA)

# You will get the warning message:
# Removed 32 rows containing missing values (geom_path)
# That is because of the smooth.colour = NA argument, which I use because
# otherwise there is a distracting line

# I personally like to see residual by x plot.  To do that, we need
# to add columns to the original data, lion, for the residuals, etc.  To
# do this, we have multiple options.

# Option 1. Use the function augment.

insulation_plus <- augment(modelinsulation04)
ggplot(data = insulation)+
  geom_point(aes(x = leanness, y= heat_loss))

# Option 2.  Use the function resid() right in the plotting command
ggplot(data = insulation)+
  geom_point(aes(x = leanness, y = resid(modelinsulation04)))

# Option 3.  Use mutate() to add a residuals column to the original data
insulation <- insulation %>%
  mutate(heat_loss = resid(modelinsulation04)
ggplot(data = insulation) +
  geom_point(aes(x = leanness, y = heat_loss))

# So taking all the plots together, the normal Q-Q of the residuals looks
# like the residuals are normal, which is good
# Residuals vs. fitted (fitted is the same thing as predicted),
# Some fan shape, except for the highest fitted value.  Residuals vs.
# x?  Not good at all.  

# For the sake of learning, let's just see what happens if we proceed
# with the linear regression

# So what are the actual statistical results???
summary(modelinsulation04)

# The p-value of interest is found in the row "ageInYears", the intercept
# and slope are found under the column header "Estimate".

# Older lions have significantly higher proportion of black on their noses
# (Linear regression: proportionBlack = 0.0697 + 0.0586(ageInYears);
# df = 1, 30, F=49.75, P<0.0001), and lion age explained more than 60%
# of the variabiity in nose blackness (R2 = 0.6238).

# For a linear regression, we usually want to add a regression line to 
# our plot and often we also want to give an idea about how confident we
# are in our estimate of that regression line.  To do this, we generate
# what are known as confidence bands.  The narrower the band, the more
# confident we are in our estimate of the line.  I

# We create confidence bands by adding in a layer 
# geom_smooth(method = "lm", level=0.95).

ggplot(data = insulation, aes(x = heat_loss, y = leanness)) +
  geom_point() +
  geom_smooth(method = "lm", level=0.95) +
  theme_bw()+
  labs( x = "leanness", y = "heat_loss")


### Linear Regression with transformation ####
# # Based on an example on pg.562 of ABD, researchers were interested in
# the relationship floral tube length of an iris and the number of
# pollen grains deposited by their pollinators.

insulation <- read_csv("datasets/demos/insulation.csv")

# Examine the data, including the residuals
modelinsulation08 <- lm(heat_loss ~ leanness, data = insulation)
autoplot(modelinsulation08, smooth.colour = NA)

ggplot(data = insulation)+
  geom_point(aes(x = leanness, y= resid(modelinsulation08)))

# So all the diagnostic plots are not bad--the residual the normal Q-Q  is definitely linear,
# and the residual by x plot is not fan shaped. So we do not need to transform 
iris <- iris %>%
  mutate(sqrt_grains = sqrt(grainsDeposited))
model03<-lm(sqrt_grains ~ tubeLengthMm, data = iris)
ggplot(data = iris)+
  geom_point(aes(x = tubeLengthMm, y= resid(model03)))

# That is much better.  Now we can look at the statistical results!
summary(model03)

# Irises with longer tubes have significantly greater number of pollen 
# grains deposited by long-proboscid flies(Linear regression: 
# sqrt(grainsDeposited) = 2.083 + 0.1450(tubeLengthMm);
# df = 1, 72, F=26.88, P<0.0001), and flower tube length explained 
# more than 25% of the variation in square root transformed grain number
# (R2 = 0.2719).

































