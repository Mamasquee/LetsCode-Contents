
#download needed libraries
library(readr)
library(dplyr)
library(ggplot2) 
library(leaflet)

#set working directories
setwd('./GitHub/Contents/Challenge/Streetlight')
getwd()
filename <- './data/eclairage-public.csv'
file.exists(filename)

#read file 
df <-read_delim(filename, delim= ";", col_names = TRUE)
str(df)

#select data I need in the file
df.raw <- df %>% 
  select(OBJECTID,
         geo_point_2d,
         `Libellé du régime`,
         `Puissance nominale de la lampe (W)`,
         `Puissance consommée de la lampe avec app ferro (W)`,
         `Puissance consommée de la lampe avec app. électronique (W)`,
         `Libellé de la lampe`
  ) %>%
  rename(puissance.nom=`Puissance nominale de la lampe (W)`,
         puissance.conso.e=`Puissance consommée de la lampe avec app. électronique (W)`,
         puissance.conso.f= `Puissance consommée de la lampe avec app ferro (W)`) %>%
  mutate(puissance.conso = ifelse(puissance.conso.e > puissance.conso.f,
                                  puissance.conso.e,
                                  puissance.conso.f)) %>%
  as.data.frame

# filter temporarily on xxx first lines for testing purpose
df.filtered <- df.raw[1:100000,]

#remove white spaces
#split Geo coordinates (1 column) into lat and longitude (2 colums separated by comma).
#as.numeric(trimws(strsplit(df.filtered$geo_point_2d, split=",", fixed=T)))

#set temporary matrix for data split (not working)
lng.lat.matrix <- matrix(
  as.numeric(
  trimws(
    unlist(strsplit(df.filtered$geo_point_2d, split=",", fixed=T))
    )
  ), ncol=2, byrow = T)

#rename columns
df.filtered$long <- lng.lat.matrix[,2]
df.filtered$lat <- lng.lat.matrix[,1]
#names(df.filtered) <- c('Id','Long','Lat','Regime')


#show data in a map
m <- leaflet(data = df.filtered %>%
               mutate(PopUpContent = paste0("<b>Id:</b> ", OBJECTID, "<br>", 
                                           "<b>Type: </b>", `Libellé de la lampe`,"<br>",
                                           "<b>Puissance: </b>", puissance.conso, "W"))
             ) %>% 
  addTiles() %>%
  setView(lat = 48.85, lng= 2.25, zoom =11) %>%
  addMarkers(lng= ~long, lat= ~lat, 
             popup = ~as.character(PopUpContent),
             clusterOptions = markerClusterOptions())
m


