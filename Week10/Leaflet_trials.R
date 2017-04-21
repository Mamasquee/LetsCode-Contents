library(httr)
set_config(
  use_proxy(url = 'proxy-fr.trading-lb.gdfsuez.net',port=8080)
)

library(RCurl)
options(RCurlOptions = list(proxy= 'http://proxy-fr.trading-lb.gdfsuez.net',
                            proxyport= 8080))


devtools::install_github('rstudio/leaflet')


library(leaflet)



m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
m  # Print the map

sessionInfo()