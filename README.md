# DHSC Colours R package

Install using devtools:

```devtools::install_github("https://github.com/DataS-DHSC/DHSC_colours")```

# Overview

The function ```dhsc_colours()``` will return a named list of the approved
colours. Each individual colour can also be called by it's helper function.
For example: ```dhsc_dark_blue()```.

There are also some colour scales which you can ```+``` on to a ggplot object 
to recolour it with DHSC colours e.g.:

```
library(ggplot2)
library(DHSCcolours)

ggplot(iris, aes(x=Species,y=Sepal.Length, colour=Species, fill=Species))+
  geom_boxplot()+
  scale_colour_dhsc_d(aesthetics = c("fill","colour")) # from DHSCcolours package
```


