library(tidyverse)
View(ggplot2::mpg)
(ggplot2::mpg)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = <mpg>) + 
  <GEOM_FUNCTION>(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg)

ggplot(data = mpg) + 
  GEOM_FUNCTION>(mapping = aes(MAPPINGS))

ggplot(data = mpg)
View(ggplot2::mpg)
ggplot(data = mpg)+
  geom_boxplot(aes(x = model, y = hwy), notch = TRUE)+
  
  ggplot(data = mpg) + 
  geom_point>(mapping = aes(x= model, y = hwy))
Read(?mpg)
ggplot(data = mpg) + 
  geom_point(mpg)(aes(x= hwy, y = cyl))

ggplot(data = mpg) + 
  geom_point(mpg)(mapping = aes( ggplot(data = mpg)


                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = displ, y = hwy, color = class))
                                 
                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = displ, y = hwy, size = class))
 
                                
                                 # Left
                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
                                 
                                 # Right
                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = displ, y = hwy, shape = class))
                                 
                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))                                 
                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = displ, y = hwy)) + 
                                   facet_wrap(~ class, nrow = 2)
                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = displ, y = hwy)) + 
                                   facet_grid(drv ~ cyl)
                                 