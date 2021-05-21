# DHSC Colours R package

Install using devtools:

```devtools::install_github("https://github.com/DataS-DHSC/DHSC_colours")```

# Overview

The function ```dhsc_colours()``` will return a named list of the approved
colours. Each individual colour can also be called by it's helper function.
For example: ```dhsc_dark_blue()```.

There are also some colour scales which you can ```+``` on to a ggplot object 
to recolour it with DHSC colours e.g.:

Furthermore, installing this package will install the template for a DHSC
branded powerpoint in rmarkdown. Accessed from within rstudio via:
*File > New File > R Markdown > From Template > DHSC Powerpoint*

```
#Barplot with 3 bars with a discrete X axis filled with DHSC colours
sim_series(3)%>%
  ggplot(aes(x=X, y=Z, fill=X))+
  geom_col()+
  DHSCcolours::scale_fill_dhsc_d()+
  theme_dhsc()+
  ggtitle("scale_fill_dhsc_d")

#Barplot with 25 bars with a discrete X axis filled with DHSC colours
sim_series(25)%>%
  ggplot(aes(x=X, y=Z, fill=X))+
  geom_col()+
  DHSCcolours::scale_fill_dhsc_d()+
  theme_dhsc()+
  ggtitle("scale_fill_dhsc_d")
  
#Barplot with 25 bars with a continuous X axis with DHSC primary green - purple fill
sim_series(25)%>%
  ggplot(aes(x=Y, y=Z, fill=Z))+
  geom_col()+
  scale_fill_dhsc_c()+
  theme_dhsc()+
  ggtitle("scale_fill_dhsc_c")

#Barplot with 25 bars with a continuous X axis with red green fill
sim_series(25)%>%
  ggplot(aes(x=Y, y=Z, fill=Z))+
  geom_col()+
  scale_fill_dhsc_red_green_c()+
  theme_dhsc()+
  ggtitle("scale_fill_dhsc_red_green_c")

#Barplot with 25 bars with a continuous X axis with blue green fill
sim_series(25)%>%
  ggplot(aes(x=Y, y=Z, fill=Z))+
  geom_col()+
  scale_fill_dhsc_blue_green_c() +
  theme_dhsc()+
  ggtitle("scale_fill_dhsc_blue_green_c")

#Barplot with 25 bars with a continuous X axis with blue yellow fill
sim_series(25)%>%
  ggplot(aes(x=Y, y=Z, fill=Z))+
  geom_col()+
  scale_fill_dhsc_blue_yellow_c() +
  theme_dhsc()+
  ggtitle("scale_fill_dhsc_blue_yellow_c")

```


