
library(shiny)

ui <- fluidPage(
  sliderInput("x", label="If x is", min=1, max=50, value=30),
  "then x times 5 is",
  textOutput("x5")
)

server <- function(input, output, session){
  output$x5 <- renderText({
    input$x*5
  })
}

shinyApp(ui, server)