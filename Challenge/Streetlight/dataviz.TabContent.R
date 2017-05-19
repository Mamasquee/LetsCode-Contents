require(shiny)
require(shinydashboard)

dataviz.TabContent <- tabItem(
  tabName = "dataviz",
  h2("Data Visualisation tab content")
)
#ui.r :
#fluidrow 1:  mathilde
#fluidrow 2: Fabrice
#create box, render leaflet, input nr max of lights (cf bin histo), renderleaflet. 
#doc : shiny leaflet.

#server.r : output$..