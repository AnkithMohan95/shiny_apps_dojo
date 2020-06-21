
library(shiny)

ui <- splitLayout(
  plotOutput("left_plot"),
  plotOutput("right_plot")
)

server <- function(input, output, session){
  output$left_plot <- renderPlot(plot(1:5), res = 96)
  output$right_plot <- renderPlot(plot(6:10), res = 96)
}

shinyApp(ui, server)
