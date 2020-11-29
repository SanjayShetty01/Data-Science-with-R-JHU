#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

#source code
source("Predict Word.R")

# Define UI for application 
ui <- fluidPage(
    
    # Application title
    titlePanel("Text Prediction model"),
    
    sidebarLayout(
        sidebarPanel(
            h2("How to use:"),
            h6("1. Enter a word/phrase in the box"),
            h6("2. The prediction with the highest frequency is returned first"),
            h2("Take Note:"),
            h4("1. Only English language is supported"),
            br(),
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            p(textInput(inputId = "phrase",label= "Write text below", value = ""),
              h3("Top prediction:"),
              verbatimTextOutput("prediction"),
              h3("Similar predictions:"),
              verbatimTextOutput("predictions")
            )
        )
    )
)

# Define Server for application 
server <- function(input, output) {
    
    output$prediction <- renderText({
        nextWord(input$phrase)[1]
    })
    
    output$predictions <- renderText({
        nextWord(input$phrase)[-1]
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)