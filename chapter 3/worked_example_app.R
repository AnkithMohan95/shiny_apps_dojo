
library(shiny)

animals <- c("dog", "cat", "mouse", "bird", "other", "I hate animals")

ui <- fluidPage(
  # 3.2.2  
  textInput("name", "What's your name?"),
  passwordInput("password", "What's your password?"),
  textAreaInput("story", "Tell me about yourself", rows=3),
  
  # 3.2.3
  numericInput("num", "Number one", value=0, min=0, max=100),
  
  # 3.2.4
  dateInput("date", "When were you born?"),
  dateRangeInput("holiday", "When do you want to go on vacation next?"),
  
  # 3.2.5
  selectInput("state", "What's your favorite state?", state.name, multiple = TRUE),
  radioButtons("animal", "What's your favorite animal?", animals),
  radioButtons("emotion", "How are you feeling right now?",
               choiceNames = list(icon("angry"),
                                  icon("smile"),
                                  icon("sad-tear")),
               choiceValues = list("angry", "happy", "sad")
               ),
  checkboxInput("cleanup", "Clean up?", value = TRUE),
  checkboxInput("shutdown", "Shutdown?"),
  checkboxGroupInput("animal", "What animals do you like?", animals),
  
  # 3.2.6
  fileInput("upload", NULL),
  
  # 3.2.7
  fluidRow(
    actionButton("click", "Click me!", class="btn-danger"),
    actionButton("drink", "Drink me!", icon=icon("cocktail"), class="btn-lg btn-success")
  ),
  actionButton("eat", "Eat me!", icon=icon("food"), class="btn-block")
)

server <- function(input, output, session){}

shinyApp(ui = ui, server = server)