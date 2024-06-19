# Load R packages
library(shiny)
library(shinythemes)


# Define UI
ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage("Chunking Names",
                           tabPanel("Name",
                                    sidebarPanel(
                                      tags$h3("Input:"),
                                      textInput("txt1", "First Name:", ""),
                                      textInput("txt2", "Last Name:", ""),
                                      
                                    ), # sidebarPanel
                                    mainPanel(
                                      h1("Full Name"),
                                      
                                      h4("Answer"),
                                      verbatimTextOutput("txtout"),
                                      
                                    ) # mainPanel
                                    
                           ), # Navbar 1, tabPanel
                           tabPanel("Navbar 2", "This panel is intentionally left blank"),
                           tabPanel("Navbar 3", "This panel is intentionally left blank")
                           
                ) # navbarPage
) # fluidPage


# Define server function  
server <- function(input, output) {
  
  output$txtout <- renderText({
    paste( input$txt1, input$txt2, sep = " " )
  })
} # server


# Create Shiny object
shinyApp(ui = ui, server = server)