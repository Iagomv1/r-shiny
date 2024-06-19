library(shiny)
data(airquality)

# Define UI for app that draws histograms ----
ui <- navbarPage(
  
  # App title ----
  title = "Second App",
  
  # First tab panel for Ozone histogram
  tabPanel("Ozone",
           sidebarLayout(
             sidebarPanel(
               sliderInput(inputId = "bins_ozone",
                           label = "Number of bins:",
                           min = 1,
                           max = 50,
                           value = 30,
                           step = 1)
             ),
             mainPanel(
               plotOutput(outputId = "distPlotOzone")
             )
           )
  ),
  
  # Second tab panel for Wind histogram
  tabPanel("Wind",
           sidebarLayout(
             sidebarPanel(
               sliderInput(inputId = "bins_wind",
                           label = "Number of bins:",
                           min = 1,
                           max = 50,
                           value = 30,
                           step = 1)
             ),
             mainPanel(
               plotOutput(outputId = "distPlotWind")
             )
           )
  )
)

# Define server logic required to draw histograms ----
server <- function(input, output) {
  
  # Render histogram for Ozone
  output$distPlotOzone <- renderPlot({
    x <- airquality$Ozone
    x <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins_ozone + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "black",
         xlab = "Ozone level",
         main = "Histogram of Ozone level")
  })
  
  # Render histogram for Wind
  output$distPlotWind <- renderPlot({
    x <- airquality$Wind
    x <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins_wind + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "black",
         xlab = "Wind speed",
         main = "Histogram of Wind speed")
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
