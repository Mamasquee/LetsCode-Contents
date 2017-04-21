library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    x    <- faithful[,2]  # Old Faithful Geyser data
    bins <- seq(min(x), max(x), length.out = input$bin1s + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'green', border = 'grey')
  })
  
  output$distPlot2 <- renderPlot({
    x <- faithful[,1]
    bins <- seq(min(x), max(x), length.out = input$bin2s + 1)
    hist(x, breaks = bins, col = 'yellow', border = 'grey')    
  })

})


