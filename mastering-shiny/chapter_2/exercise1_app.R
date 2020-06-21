
library(shiny)

ui <- fluidPage(
  textInput("name", "What is your name?"),
  textOutput("greeting"),
  
  numericInput("age", "How old are you?", value=0),
  plotOutput("mortgage")
)

server <- function(input, output, session){
  output$greeting <- renderText({
    paste("Hello", input$name)
  })
  output$mortgage <- renderPlot({
    hist(rnorm(1000))
    }, res = input$age)
}

shinyApp(ui, server)