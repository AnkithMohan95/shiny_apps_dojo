
library(shiny)

ui <- fluidPage(
  dataTableOutput("table")
)

server <- function(input, output, session){
  output$table <- renderDataTable(mtcars, 
                                  options = list(pageLength=5, 
                                                 paging=F, 
                                                 searching=F)
                                  )
}

shinyApp(ui, server)