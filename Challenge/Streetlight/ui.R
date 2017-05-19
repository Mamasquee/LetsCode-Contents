

library(shiny)
library(shinydashboard)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Data Visualisation", 
             tabName = "dataviz", 
             icon = icon("dashboard")
             ),
    
    menuItem("Raw Data", 
             icon = icon("table"), 
             tabName = "rawdata"
             ),
    
    menuItem("Power Prices", 
             icon = icon("table"), 
             tabName = "powerprice"
             ),
   
     menuItem("Cost Estimate", 
             icon = icon("table"), 
             tabName = "costestimate"
    )
  )
)

source('dataviz.TabContent.R')
source('rawdata.TabContent.R')
source('costestimate.TabContent.R')
source('powerprice.TabContent.R')

body <- dashboardBody(
  tabItems(
    dataviz.TabContent,
    rawdata.TabContent,
    powerprice.TabContent,
    costestimate.TabContent
  ) 
)  




  
  
# Define UI for StreetLight
shinyUI(
  dashboardPage(skin = "blue",
                dashboardHeader(title = "Streetlight"),
                sidebar,
                body)
)



