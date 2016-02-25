# https://yankev.shinyapps.io/Rapp4/
library(shiny)
library(plotly)
library(dplyr)

ui <- fluidPage(
  fluidRow(plotlyOutput("plot")),
  fluidRow(column(6,plotlyOutput("plot2")),
  column(6,plotlyOutput("plot_remove")))
)

server <- function(input, output, session) {

  output$plot <- renderPlotly({
    plot_ly(mtcars, x = mpg, y = wt, mode = "markers") %>%
      layout(dragmode =  "select", title = "Original Plot", font=list(size=10))
  })
  
  output$plot2 <- renderPlotly({
    d <- event_data("plotly_selected")
    plot_ly(x = d$x, y = d$y, mode = "markers", marker=list(color="red")) %>% 
      layout(xaxis=list(title="mpg"), yaxis = list(title="wt"), title="Plot Selected Values", font=list(size=10))
  })
  
  output$plot_remove <- renderPlotly({
    d <- event_data("plotly_selected")
    mt_f <- filter(mtcars, !(mtcars$mpg %in% d$x), !(mtcars$wt %in% d$y))
    plot_ly(mt_f, x = mpg, y = wt, mode = "markers", marker=list(color="pink")) %>%
      layout(title="Remove Selected Values", font=list(size=10))
  })  
  
}

shinyApp(ui, server, options = list(display.mode = "showcase"))
