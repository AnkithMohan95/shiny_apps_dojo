
library(shiny)
library(vroom)
library(tidyverse)

ui <- fluidPage(
  fluidRow(
    column(6,
           selectInput("code", "Product", setNames(products$prod_code, products$title))
           )
  ),
  fluidRow(
    column(4, tableOutput("diag")),
    column(4, tableOutput("body_part")),
    column(4, tableOutput("location"))
  ),
  fluidRow(
    column(12, plotOutput("age_sex"))
  )
)

server <- function(input, output, session){
  injuries <- vroom::vroom("C:/Users/Ankith/Documents/GitHub/shiny_apps_dojo/mastering-shiny/chapter_5/injuries.tsv.gz")
  products <- vroom::vroom("C:/Users/Ankith/Documents/GitHub/shiny_apps_dojo/mastering-shiny/chapter_5/products.tsv")
  population <- vroom::vroom("C:/Users/Ankith/Documents/GitHub/shiny_apps_dojo/mastering-shiny/chapter_5/population.tsv")
  
  selected <- reactive(injuries %>% filter(prod_code == input$prod_code))
  
  output$diag <- renderTable(
    selected() %>% count(diag, wt = weight, sort = TRUE)
  )
  
  output$body_part <- renderTable(
    selected() %>% count(body_part, wt = weight, sort = TRUE)
  )
  
  output$location <- renderTable(
    selected() %>% count(location, wt = weight, sort = TRUE)
  )
  
  summary <- reactive({
    selected() %>%
      count(age, sex, wt = weight) %>%
      left_join(population, by = c("age", "sex")) %>%
      mutate(rate = n / population * 1e4)
  })
  
  output$age_sex <- renderPlot({
    summary() %>%
      ggplot(aes(age, n, color=sex)) + 
      geom_line() + 
      labs(y = "Estimated number of injuries")
  }, res = 96)
}

shinyApp(ui = ui, server = server)