library(png)
library(RJSONIO)
library(rgdal)
library(RgoogleMaps)
air<-read .csv="" csv="" hadoop="" p="" sers="">london<-getmap center="c(51.51,-0.116), </p">               zoom =10, destfile = "London.png",maptype = "mobile")

PlotOnStaticMap(london,lat = air$lat, lon = air$long,
                cex= air$big ,pch=19,col=as.character(air$color))
