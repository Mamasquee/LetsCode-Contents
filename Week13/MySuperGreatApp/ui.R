#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(leaflet)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", 
             tabName = "dashboard", 
             icon = icon("dashboard")),
    menuItem("Tables", 
             icon = icon("table"), 
             tabName = "tables",
             badgeLabel = "cool", 
             badgeColor = "yellow"),
    menuItem("Super cool", 
             icon = icon("table"), 
             tabName = "Bloublou",
             badgeLabel = "new", 
             badgeColor = "green")
  )
)
  

dashboardtab.row1 <- fluidRow(
  # box 1
  box(
    title = "Histogram", 
    status = "danger", 
    solidHeader = TRUE,
    collapsible = TRUE,
    plotOutput("plot1", height=250)
  ),
  # box 2
  box(
    title= "Histogram parameters",
    solidHeader = TRUE,
    "Box content here", br(), "More box content",
    sliderInput("bins", "Nb of bins:", 1, 100, 50),
    textInput("text", "Text input:", value = "Hello"),
    numericInput("Latitude", "lat", min= 2, max= 4, step= 0.1, value= 48.85),
    numericInput("Longitude", "lng", min= 2, max= 4, step= 0.1, value= 2.35)
  )
)

dashboardtab.row2 <- fluidRow(
  # A static valueBox
  valueBox(10 * 2, 
           "New Orders", 
           icon = icon("thumbs-up", lib = "glyphicon"), 
           color="yellow"),
  
  valueBox(10 * 5, 
           "New things", 
           icon = icon("thumbs-down", lib = "glyphicon"), 
           color="aqua")
)


body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard",
            h2("Dashboard tab content"),
            dashboardtab.row1,
            dashboardtab.row2
    ),
    
    tabItem(tabName = "tables",
            h2("Ma super carte"),
            box(
              title= "Ma super carte",
              leafletOutput("carte")
              )
    ),
    
    tabItem(tabName = "Bloublou",
            h2("Blou blou tab content"),
            
            box(title= 'Texte',
                verbatimTextOutput("outText")
            )
    )
  ) 
)  


# Define UI for application that draws a histogram
shinyUI(
  dashboardPage(skin = "purple",
                dashboardHeader(title = "Simple dashboard"),
                sidebar,
                body)
)
