#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        titlePanel("Compound Interest Calculator"),
        sidebarLayout(
            sidebarPanel(
                helpText("The App helps you determine how much your money can 
                    grow using the power of compound interest"),
        
                br(),
                numericInput("Initial_Invesment_Amount",
                            label = h5("Enter the Initial Investment Amount (in $)"),
                            value = 1000),
                br(),
                numericInput("est_int",
                            label = h5("Estimated Interest Rate (in %)"),
                            value = 4),
                
                br(),
                sliderInput("time",
                            label = h5("Length of Time in year"),
                            min = 0, max = 50, value =10),
                br(),
                
            ),
            
            mainPanel(
                p(strong("The Final Amount ($):")),
                textOutput("final_amt")
            ),
        )
    )
)
