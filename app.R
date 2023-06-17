library(shiny)
source("mythic-calculator.R")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("DF S2 Mythic Calculator"),

        # Show a plot of the generated distribution
        mainPanel(
            numericInput("d1.tyr", "Dungeon 1 Tyrannical", 15, min = 2, max = 26, step = 1),
            numericInput("d1.tyr.bonus", "Dungeon 1 Tyrannical Time Bonus (Percentage under/over timer)", 0),
            numericInput("d1.fort", "Dungeon 1 Fortified ", 15, min = 2, max = 26, step = 1),
            numericInput("d1.fort.bonus", "Dungeon 1 Fortified Time Bonus (Percentage under/over timer)", 0),
            textOutput("mythicRatingOut")
        )
    
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$mythicRatingOut <- renderText({mythicRating()})
    
    mythicRating <- reactive({
        sumMythicRatings(calcScore(input$d1.tyr, input$d1.tyr.bonus), calcScore(input$d1.fort, input$d1.fort.bonus))
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
