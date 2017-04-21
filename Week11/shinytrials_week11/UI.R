library(shiny)

#Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Hello Shiny!"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bin1s",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      sliderInput("bin2s",
                  "Number of bins:",
                  min = 1,
                  max = 30,
                  value = 15)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      plotOutput("distPlot2")
    )
  )
)
)
