library(tidyverse)

### Install and load packages ####

if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}

# Check for updates
tidyverse_update()
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
                                 
                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = displ, y = hwy)) + 
                                   facet_grid(. ~ cyl)
                                 
                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = drv, y = cyl))
                                 
                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = displ, y = hwy)) +
                                   facet_grid(drv ~ .)
                                 
                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = displ, y = hwy)) +
                                   facet_grid(. ~ cyl)
                                 
                                 ggplot(data = mpg) + 
                                   geom_point(mapping = aes(x = displ, y = hwy)) + 
                                   facet_wrap(~ class, nrow = 2)
                                 
                                View(?facet_wrap)
                                
                                ggplot(data = mpg) + 
                                  geom_point(mapping = aes(x = displ, y = hwy))
                                
                                ggplot(data = mpg) + 
                                  geom_smooth(mapping = aes(x = displ, y = hwy))
                                
                                ggplot(data = mpg) + 
                                  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
                                
                                ggplot(data = mpg) +
                                  geom_smooth(mapping = aes(x = displ, y = hwy))
                                
                                ggplot(data = mpg) + 
                                
                            geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = class))
                                ggplot(data = mpg) +
                                  geom_smooth(mapping = aes(x = displ, y = hwy))
                                
                                ggplot(data = mpg) +
                                  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))
                                
                                
                                ggplot(data = mpg) +
                                  geom_smooth(
                                    mapping = aes(x = displ, y = hwy, color = drv),
                                    show.legend = FALSE
                                  )
                                
                                
                                ggplot(data = mpg) + 
                                  geom_point(mapping = aes(x = displ, y = hwy)) +
                                  geom_smooth(mapping = aes(x = displ, y = hwy))
                                
                                
                                ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
                                  geom_point() + 
                                  geom_smooth()
                                
                                ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
                                  geom_point(mapping = aes(color = class)) + 
                                  geom_smooth()
                                
                                ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
                                  geom_point(mapping = aes(color = class)) + 
                                  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
        ,                        
                                ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
                                  geom_point() + 
                                  geom_smooth(se = FALSE),
                                              show.legend = FALSE
                                ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
                                  geom_point() +
                                  geom_smooth(se=FALSE),
                                    mapping = aes(x = displ, y = hwy, color = drv),
                                    show.legend = FALSE
                                  )
        ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
          geom_point() + 
          geom_smooth()
        
        ggplot() + 
          geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
          geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
        
        ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
          geom_point(mapping = aes(color = drv)) + 
          geom_smooth()
        
        ggplot(data = mpg) + 
          geom_point(mapping= aes(color = drv)) +
          geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv,))
        
        ggplot(data = mpg) + 
          geom_point(data = mpg, mapping= aes(x= displ, y = hwy, color=drv))+
          geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
        
        ggplot(data = diamonds) + 
          geom_bar(mapping = aes(x = cut))
        
        ggplot(data = diamonds) + 
          stat_count(mapping = aes(x = cut))
        
        demo <- tribble(
          ~cut,         ~freq,
          "Fair",       1610,
          "Good",       4906,
          "Very Good",  12082,
          "Premium",    13791,
          "Ideal",      21551
        )
        
        ggplot(data = demo) +
          geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
        
        ggplot(data = diamonds) + 
          geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))
        
        ggplot(data = diamonds) + 
          stat_summary(
            mapping = aes(x = cut, y = depth),
            fun.ymin = min,
            fun.ymax = max,
            fun.y = median
          )
        
        ggplot(data = diamonds) + 
          geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))
        
        ggplot(data = diamonds) + 
    
          geom_col(mapping = aes(x = cut, y = depth, group = 1))
        
        ggplot(data = diamonds) + 
          stat_smooth()
            mapping = aes(x = cut, y = depth),
            fun.ymin = min,
            fun.ymax = max,
            fun.y = median
            
            ggplot(data = diamonds) + 
              geom_bar(mapping = aes(x = cut, y = ..prop..))
            
            ggplot(data = diamonds) + 
              geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))
        
            ggplot(data = diamonds) + 
              geom_bar(mapping = aes(x = cut, y = ..prop..)) 
            
            ggplot(data = diamonds) + 
              geom_bar(mapping = aes(x = cut, colour = cut))
            
            ggplot(data = diamonds) + 
              geom_bar(mapping = aes(x = cut, fill = cut))
            
            ggplot(data = diamonds) + 
              geom_bar(mapping = aes(x = cut, fill = clarity))
            
            ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + 
              geom_bar(alpha = 1/5, position = "identity")
            
            ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
              geom_bar(fill = NA, position = "identity")
            
            ggplot(data = diamonds) + 
              geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")
            
            ggplot(data = diamonds) + 
              geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
            
            ggplot(data = mpg) + 
              geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")
            
            ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
              geom_point(mapping = aes(x= displ, y = hwy), position = "jitter")
            
            ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
              geom_point(mapping = aes(x= displ, y = hwy), position = "count")
            ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
              geom_boxplot()            
            
            ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
              geom_boxplot() +
              coord_flip()
            
            ggplot(data = mpg) + 
              geom_jitter(mapping = aes(x = displ, y = hwy), position = "jitter")
            
            ggplot(data = mpg) + 
              geom_count(mapping = aes(x = displ, y = hwy), position = "jitter")
            
            ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
              geom_point(mapping = aes(x= displ, y = hwy), position = "count")
            ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
              geom_boxplot() 
            
            nz <- map_data("nz")
            
            ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
              geom_boxplot() +
              coord_flip()
            
            nz <- map_data("nz")
            
            ggplot(nz, aes(long, lat, group = group)) +
              geom_polygon(fill = "white", colour = "black")
            
            ggplot(nz, aes(long, lat, group = group)) +
              geom_polygon(fill = "white", colour = "black") +
              coord_quickmap()
            
            
   read_csv <- map_data("nz")   
   
   
   nz <- map_data("nz")
   
   ggplot(nz, aes(long, lat, group = group)) +
     geom_polygon(fill = "white", colour = "black")
   
   ggplot(nz, aes(long, lat, group = group)) +
     geom_polygon(fill = "white", colour = "black") +
     coord_quickmap()
   
   ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
     geom_point() + 
     geom_abline() +
     coord_fixed()
   
  
            