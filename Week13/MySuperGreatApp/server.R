#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$plot1 <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
  output$outText <- renderText({
    paste(input$Longitude,input$Latitude)
  })
  
  output$carte <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = as.numeric(input$Longitude), 
              lat = as.numeric(input$Latitude), 
              zoom= 11)
  })
  
})
