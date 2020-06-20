
library(shiny)

ui <- fluidPage(
  # Exercise 1
  textInput("name", "", placeholder = "Your name"),
  
  # Exercise 2
  sliderInput("delivery", 
                 "When should we deliver?", 
                 min = as.Date("2019-08-09", "%Y-%m-%d"), 
                 max = as.Date("2019-08-16", "%Y-%m-%d"),
                 value = as.Date("2019-08-10", "%Y-%m-%d")),
  
  # Exercise 4
  sliderInput("nums", "Select a number", min = 0, max = 100, value = 5, step = 5, animate = TRUE),
  
  # Exercise 5
  numericInput("number", "Select a value", min = 0, max = 1000, value = 150, step = 50)
)

server <- function(input, output, session){}

shinyApp(ui = ui, server = server)
