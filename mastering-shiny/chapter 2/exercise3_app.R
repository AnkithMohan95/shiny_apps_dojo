
library(shiny)

ui <- fluidPage(
  sliderInput("x", "If x is", min=1, max=50, value=30),
  sliderInput("y", "and y is", min=1, max=50, value=30),
  "then, x multiplied by y is",
  textOutput("xy")
)

server <- function(input, output, session){
  output$xy <- renderText({
    input$x * input$y
  })
}

shinyApp(ui, server)