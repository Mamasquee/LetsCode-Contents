# get open Paris data on street lights

library(RCurl)

# the name of the proxy and the port number shall be hiden in Global.R
options(RCurlOptions = list(proxy= "proxy-fr.trading-lb.gdfsuez.net",
                            proxyport= 8080))

# to put into Global.R
url <- "https://opendata.paris.fr/explore/dataset/eclairage-public/download/?format=csv&timezone=Europe/Berlin&use_labels_for_header=true"

x <- getURL(url, .opts = list(ssl.verifypeer = FALSE))
  
out <- read.csv2(textConnection(x), stringsAsFactors = F)


