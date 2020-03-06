### 3.1 Introduction ####

#install.packages("tidyverse")
library("tidyverse")
if(!require(nycflights13)){install.packages("nycflights13")}
if(!require(gapminder)){install.packages("gapminder")}
if(!require(Lahman)){install.packages("Lahman")}
tidyverse_update()

### 3.2. Intro ####

mpg
?mpg
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
?geom_point
# ggplot template
# ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy))

### 3.3. Aesthetic mappings ####
#scatterplot for continuous variable by colour and shape 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = cty, shape = cty))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class, stroke = .5, size = cty, color = class))

### 3.5.  Facets ####
## facet_grid including colour and size 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class, stroke = .75, color = class)) +
  facet_grid(drv ~ .)

### 3.6.  Geometric objects ####
##line graph including shape, colour, with smooth mapping
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)
              
               ggplot(data = mpg) +
                geom_point(mapping = aes(x = displ, y = hwy, shape = class, stroke = .5, color = drv)) +
                 geom_smooth(mapping = aes(x = displ, y = hwy, group = drv,))
               
 ### 3.7. Statistical transformations ####
               #bar graph sorted with colour comparing class of vehicles to count
          
               ggplot(data = mpg) + 
                 geom_bar(mapping = aes(x = class, fill=class))
               
               ggplot(data = mpg) + 
                 geom_bar(mapping = aes(x = drv, fill = class))
               
               
##Boxplot utilizing point and colour for manufacturer
               
                ggplot(data = mpg, mapping = aes(x = drv) +
                 geom_boxplot(aes(color=manufacturer,))
                 
               ##MAP with cool colour 
               
               ggplot(nz, aes(long, lat, group = group)) +
                 geom_polygon(fill = "turquoise", colour = "white") +
                 coord_quickmap()
              
               ##random shiz with bar graphs
               ggplot(data = mpg)+
                 geom_bar(mapping = aes(x=class, fill = class))+
                 coord_flip()
               
               ggplot(data = mpg)+
                 geom_bar(mapping = aes(x=class, fill = class))+
                 coord_polar()
               
               
library(swirl)
install_course("Statistical_Inference")
swirl()
                 
               
                
                
    
