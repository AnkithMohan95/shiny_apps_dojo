
library(shiny)

ui <- fluidPage(
  # 3.2.2  
  textInput("name", "What's your name?"),
  passwordInput("password", "What's your password?"),
  textAreaInput("story", "Tell me about yourself", rows=3),
  
  # 3.2.3
  numericInput("num", "Number one", value=0, min=0, max=100),
  
)