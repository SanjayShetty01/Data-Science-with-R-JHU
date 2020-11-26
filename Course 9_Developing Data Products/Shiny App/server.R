#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output){
    
    
        f <- reactive({
        p <- input$Initial_Invesment_Amount
        r <- input$est_int
        t <- input$time
        (p*((1+(r/100))^t))
    })
    
    
        output$final_amt <- renderText({
                            f()
    })
})



